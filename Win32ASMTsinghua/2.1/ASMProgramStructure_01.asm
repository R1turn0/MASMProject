.386                                ;1. ѡ��Ĵ�����
.model      flat,stdcall            ;2. �洢ģ�ͣ�ƽչ��flat��ģ�ͣ�stdcallΪ�������÷�ʽ
option      casemap:none            ;3. ָ����ʶ����Сд����
include         kernel32.inc        ;4. Ҫ���õ�ͷ�ļ�
includelib      kernel32.lib        ;   Ҫ���õ�ͷ�ļ�
includelib      msvcrt.lib          ;   Ҫ���õ�ͷ�ļ�
printf PROTO C:ptr sbyte,:vararg    ;C����printf����ԭ������
.data                               ;5. ���ݶ�
fmt     BYTE    '%s',13,10,0        ;   �����ʽ�ַ�������fmt��ֵΪ"%s\n"
s       BYTE    'WIN32���',0       ;   ��������ַ�������s��ֵΪ"WIN32���"
.code                               ;6. �����
start:                              ;7. ������start
invoke  printf,ADDR fmt,ADDR s      ;8. ��д���룬����printf������fmt��ʽ����ַ���s��ֵ
invoke  ExitProcess,0               ;9. �˳����̣�����ֵΪ0
end     start                       ;10.ָ��������ڵ�start