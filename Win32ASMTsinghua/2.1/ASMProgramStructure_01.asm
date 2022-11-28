.386                                ;1. 选择的处理器
.model      flat,stdcall            ;2. 存储模型，平展（flat）模型，stdcall为函数调用方式
option      casemap:none            ;3. 指明标识符大小写敏感
include         kernel32.inc        ;4. 要引用的头文件
includelib      kernel32.lib        ;   要引用的头文件
includelib      msvcrt.lib          ;   要引用的头文件
printf PROTO C:ptr sbyte,:vararg    ;C语言printf函数原型声明
.data                               ;5. 数据段
fmt     BYTE    '%s',13,10,0        ;   定义格式字符串变量fmt，值为"%s\n"
s       BYTE    'WIN32汇编',0       ;   定义输出字符串变量s，值为"WIN32汇编"
.code                               ;6. 代码段
start:                              ;7. 定义标号start
invoke  printf,ADDR fmt,ADDR s      ;8. 编写代码，调用printf函数按fmt格式输出字符串s的值
invoke  ExitProcess,0               ;9. 退出进程，返回值为0
end     start                       ;10.指明程序入口点start