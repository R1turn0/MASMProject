; asm�ļ�ע�͸�ʽΪ�ֺ�
; �������ģʽ
.386
.model          flat,stdcall
option          casemap     :none

; ������Ҫͷ�ļ�������ÿ��win32��������Ҫ�����⼸��
include         windows.inc
include         user32.inc
includelib      user32.lib
include         kernel32.inc
includelib      kernel32.lib

; ָ���Ի���ID����IDҪ��rc�ļ��е�IDֵ��ͬ
; �����ϣ�asm�ļ���rc�ļ��еĿؼ���ͨ��IDֵ�����ģ��ؼ���������Ҫ��rc�ļ���ͬ������Ϊ�˷���һ��ȡһ����
; ���������ص���equ 1���в���DLG_HELLOWORLD����ν������Ϊ���׿�����ѡ����rc�ļ�����һ��
DLG_HELLOWORLD  equ     1

; ���ݶ�
.data?
hInstance       dd      ?

; �����
.code
; �Ի��������
_ProcDlgHelloworld proc uses ebx edi esi hWnd,wMsg,wParam,lParam
    mov     eax,wMsg
    .if eax == WM_CLOSE
        invoke      EndDialog,hWnd,NULL
    .elseif eax == WM_INITDIALOG
        ;invoke     LoadIcon,hInstance,ICO_MAIN
        ;invoke     SendMessage,hWnd,WM_SETICON,ICON_BIG,eax
    .elseif eax == WM_COMMAND
        mov     eax,wParam
        .if ax == IDOK
            invoke      EndDialog,hWnd,NULL
        .endif
    .else
        mov     eax,FALSE
        ret
    .endif
    mov     eax,TRUE
    ret
_ProcDlgHelloworld      endp

start:
    invoke      GetModuleHandle,NULL
    mov         hInstance,eax
    ; �����Ի��򣬶Ի����봦������������
    invoke      DialogBoxParam,hInstance,DLG_HELLOWORLD,NULL,offset _ProcDlgHelloworld,NULL
    invoke      ExitProcess,NULL
    ; ָ��������ڵ�Ϊstart��ʶ��
    end         start
    