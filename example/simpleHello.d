import Gadu, std.stdio, std.conv, std.string;

version ( Windows )
{
	import std.socket; /* Windows build requires it */
}

void main()
{
    string tmp;

    write( "Enter source GG number:\n\t");
    tmp = readln();
    int sourceNumber = to!int( chomp( tmp ) );

    writef( "Enter password for %d GG number:\n\t", sourceNumber );
    string password = chomp( readln() );

	write( "Enter destination GG number:\n\t" );
	tmp = readln();
	int number = to!int( chomp( tmp ) );

	write( "Enter message to be send:\n\t" );
	string msg = readln();

	auto params = gg_login_params( sourceNumber,  toStringz( password ) );
	params.async = 0; /* Async connection doesn't work on Windows */
	params.status = GG_STATUS_INVISIBLE;

	auto session = gg_login( &params );
	if ( session )
	{
		gg_notify( session, null, 0 );

		gg_send_message( session, GG_CLASS_CHAT, number, toStringz( msg ) );
		gg_ping( session );
		gg_logoff( session );
		gg_free_session( session );

		writeln( "Message has been succefully send" );
	}
	else
	{
		writeln( "Couldn't connect to Gadu-Gadu server. Make sure you provided valid number and password" );
	}
}
