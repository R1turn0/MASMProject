.386                                ;1. ѡ��Ĵ�����
.model      flat,stdcall            ;2. �洢ģ�ͣ�ƽչ��flat��ģ�ͣ�stdcallΪ�������÷�ʽ
option      casemap:none            ;3. ָ����ʶ����Сд����
include         kernel32.inc        ;4. Ҫ���õ�ͷ�ļ�
includelib      kernel32.lib        ;   Ҫ���õ�ͷ�ļ�
includelib      msvcrt.lib          ;   Ҫ���õ�ͷ�ļ�

EXTRN   printf:NEAR                 ; ֻ��ͨ��callָ�����printf����������ʹ��invoke

.data                               ;5. ���ݶ�
fmt     BYTE    '%s', 13, 10, 0     ;   �����ʽ�ַ�������fmt��ֵΪ"%s\n"
s       BYTE    'WIN32���', 0      ;   ��������ַ�������s��ֵΪ"WIN32���"
.code                               ;6. �����
start:                              ;7. ������start  

push    OFFSET s                    ; OFFSET��ʾȡ��ַ����s�ĵ�ַ��ջ
push    OFFSET fmt                  ; fmt�ĵ�ַ��ջ
call    printf                      ; ����C���Ե�printf����
add     esp, 8                      ; ����C���Եĺ������˴���Ҫ�ظ�ջָ��

invoke  ExitProcess, 0              ;9. �˳����̣�����ֵΪ0
end     start                       ;10.ָ��������ڵ�start
