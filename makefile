main:
	
puts_fpc_x86: puts.pas msvcrt_x86.lib
	fpc -Twin32 -Pi386 puts.pas
	ld -mi386pe -ePUTS_$$$$_MAIN puts.o msvcrt_x86.lib -o puts_fpc_x86.exe

puts_fpc_x64: puts.pas msvcrt_x64.lib
	fpc -Twin64 -Px86_64 puts.pas
	ld -mi386pep -ePUTS_$$$$_MAIN puts.o msvcrt_x64.lib -o puts_fpc_x64.exe
	
puts_nasm_x86: puts_nasm_x86.asm msvcrt_x86.lib
	nasm -fwin32 puts_nasm_x86.asm
	ld -mi386pe -emain puts_nasm_x86.obj msvcrt_x86.lib -o puts_nasm_x86.exe

puts_nasm_x64: puts_nasm_x64.asm msvcrt_x64.lib
	nasm -fwin64 puts_nasm_x64.asm
	ld -mi386pep -emain puts_nasm_x64.obj msvcrt_x64.lib -o puts_nasm_x64.exe

puts_gcc_x86: puts.c msvcrt_x86.lib
	gcc -m32 puts.c -c -o puts_gcc_x86.o
	ld -mi386pe -e__main puts_gcc_x86.o msvcrt_x86.lib -o puts_gcc_x86.exe

puts_gcc_x64: puts.c msvcrt_x64.lib
	gcc -m64 puts.c -c -o puts_gcc_x64.o
	ld -mi386pep -e_main puts_gcc_x64.o msvcrt_x64.lib -o puts_gcc_x64.exe

msvcrt_x86.lib: msvcrt.def
	lib /MACHINE:x86 /def:msvcrt.def /out:msvcrt_x86.lib

msvcrt_x64.lib: msvcrt.def
	lib /MACHINE:x64 /def:msvcrt.def /out:msvcrt_x64.lib

bye_nim_x86: bye.nim
	nim -d:release --cpu:i386 --passc:-m32 --passl:-m32 --out:bye_nim_x86 c bye.nim

bye_nim_x64: bye.nim
	nim -d:release --cpu:amd64 --passc:-m64 --passl:-m64 --out:bye_nim_x64 c bye.nim

bye_rust: bye.rs
	rustc -o bye_rust bye.rs

bye_go: bye.go
	go build -o bye_go.exe bye.go

bye_fb_x86: bye.bas
	fbc -target win32 bye.bas -o bye_x86.exe 

bye_fb_x64: bye.bas
	fbc -target win64 bye.bas -o bye_x64.exe

bye_scala: Bye.scala
	scalac Bye.scala
	scala Bye

bye_dart: bye.dart
	dart compile exe bye.dart -o bye_dart.exe

bye_cs: bye.cs
	csc Bye.cs /out:Bye_cs.exe

bye_fpc_x86: bye.pas
	fpc -Twin32 -Pi386 -obye_fpc_x86.exe bye.pas

bye_fpc_x64: bye.pas
	fpc -Twin64 -Px86_64 -obye_fpc_x64.exe bye.pas

bye_cl_c: bye.c
	cl /Fe:bye_cl_c.exe bye.c

bye_cl_cpp: bye.cpp
	cl /Fe:bye_cl_cpp.exe bye.cpp

bye_gcc_x86: bye.c
	gcc -m32 bye.c -o bye_gcc_x86

bye_gcc_x64: bye.c
	gcc -m64 bye.c -o bye_gcc_x64

bye_g++_x86: bye.cpp
	g++ -m32 bye.c -o bye_g++_x86

bye_g++_x64: bye.cpp
	g++ -m64 bye.c -o bye_g++_x64

bye_java: bye.java
	javac -encoding utf-8 Bye.java
	java -Dencoding=utf-8 Bye

clean:
	del *.lib
	del *.o
	del *.obj
	del *.exp
	del *.dll
	del *.ppu
	del *.exe
	del *.a
	del *.class