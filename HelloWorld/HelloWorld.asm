.386
.model  flat,stdcall
option  casemap:none

include     windows.inc
include     kernel32.inc
include     masm32.inc

includelib  masm32.lib
includelib  kernel32.lib

.data
    helloworld db "Hello World!",0

.code

start:
    invoke  StdOut,addr helloworld
    invoke  ExitProcess,0

end start


