all:
	nasm -f elf64 -F dwarf calculate.asm -o calculate.o
	nasm -f elf64 -F dwarf get_valid_num.asm -o get_valid_num.o
	nasm -f elf64 -F dwarf  print.asm -o print.o
	nasm -f elf64 -F dwarf  print_rax.asm -o print_rax.o
	gcc -ggdb -c main.c -o main.o
	gcc -g3 main.o calculate.o get_valid_num.o print.o print_rax.o -o main -no-pie -fno-pie
	./main
