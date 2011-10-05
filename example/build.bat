dmd .\simpleHello.d ..\Gadu.d -I..\ -O -release -inline -nofloat -w -L ..\windows\libgadu.lib -L/SUBSYSTEM:CONSOLE
copy ..\windows\libgadu.dll .\libgadu.dll
del .\simpleHello.obj