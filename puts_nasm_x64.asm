BITS 64

extern puts
global main

segment .data
msg db "���������ڽ�����",0h

segment .code
main:
push rbp
mov rbp, rsp
mov rcx, dword msg
call puts
mov rsp, rbp
pop rbp
retn