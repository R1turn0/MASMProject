# Win32汇编--MASM32 SDK

### 一、介绍
常用的32位汇编编译器有微软的MASM、Borland的TASM和NASM。

| 编译器 | 开发者 | 优点 | 缺点 |
| --- | --- | --- | --- |
| MASM | 微软 | 微软自家软件和系统兼容性好；支持invoke/.if等伪指令将汇编变得和C++差不多 | 就一个编译器，没有资源编译器和链接器，也没有头文件 |
| TASM | Borland | 支持伪指令，有资源编译器和链接器 | 没有Windows数据结构和预定义的头文件，现在官方似乎不维护了 |
| NASM | 开源 | 同时支持Windows和Linux | 不支持伪指令，没有Windows数据结构和预定义的头文件 |

不过他们各有自己的不足，一般使用基于MASM的MASM32 SDK做为开发环境；虽然叫masm32 但是直接装在64位操作系统上也是没问题的。


### 二、MASM32 SDK安装
1. 下载链接：http://www.masm32.com/download.htm
2. 安装：双击下载，选择盘符安装即可，桌面会生成MASM32 Editor链接
3. 配置环境变量
```
Masm32Dir=C:\masm32
include=%Masm32Dir%\include
lib=%Masm32Dir%\lib
Path=%Masm32Dir%\bin;%Masm32Dir%
```


### 三、开发


### 四、编译
1. 命令行手动链接\
通过ml将汇编代码编译为obj文件，再使用link链接
```
ml /c /coff *.asm
rc *.rc
link /subsystem:windows *.obj *.res
```
2. 借助VC++6.0\
**（1）直接通过vc编写资源文件**\
    在前面helloworld中我们直接手动编写资源文件（helloworld.rc），这种方式由于不是所见即所得在实际编写时为了调整位置和大小，需要反复进行修改编译运行，这是比较麻烦的。我们可以使用vc进行所见即所得的资源文件编缉。\
    不过VC++编缉.rc文件保存时会自动添加一些VC++的头文件如果继续保存为.rc文件，为了保证使用rc命令编译成.res时能找到所有文件，需要把VC++的%VC_HOME%VC98Include目录追加到第3步中的include环境变量中，把%VC_HOME%VC98Lib目录追加到第3步中的lib环境变量中；当然也可以在编缉后直接保存成编译好的.res文件，免去rc编译步骤。\
    可以建一个VC项目来编缉资源文件最后把复制出来用，也可以先编译出一个res文件然后托到vc里编缉。\
    \
**（2）借助nmake.exe来进行编译链接**\
    在前面helloworld程序中，我们通过rc、ml和link三条命令进行编译链接，每次改动都得反复敲打执行这几条命令这是比较麻烦的。
    nmake可以直接根据makefile执行rc、ml和link完成程序编译链接（makefile放于与源代码同级目录下，在makefile目录下执行nmake），如果是一个比较大的需要反复修改的程序建议使用nmake进行编译链接。操作过程如下：\
    第一步，到%VC_HOME%VC98Bin目录下把nmake.exe复制到%Masm32Dir%Bin目录下。\
    第二步，编写makefile。\
    第三步，使用nmake命令进行编译运行。


### 五、推荐书籍
《Windows环境下32位汇编语言程序设计》
