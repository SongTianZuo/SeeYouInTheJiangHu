BITS 32

extern _puts
global main

segment .data
msg db "不如相忘于江湖。",0h

segment .code
main:
push ebp
mov ebp, esp
push dword msg
call _puts
mov esp, ebp
pop ebp
retn