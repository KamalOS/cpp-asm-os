#include "types.h"
#include "gdt.h"

// write printf, bcs this is running outside regular OS
void printf(char* str)
{
	uint16_t* VideoMemory = (uint16_t*)0xb8000;
	
	for (int i=0; str[i] != '\0'; ++i) {
		// short is 2 bytes
		// char is 1 byte
		VideoMemory[i] = (VideoMemory[i] & 0xFF00 /*keeping color info*/ ) | /*combine with*/ str[i];
	}
	
}

typedef void (*constructor)();
extern "C" constructor start_ctors;
extern "C" constructor end_ctors;
extern "C" void callConstructors()
{
	for (constructor* i = &start_ctors; i != &end_ctors; ++i) {
		(*i)();
	}
}

extern "C" void kernelMain(void* multiboot_structure, uint32_t magicnumber)
{
	printf("Welcome to MiniOS");

	GlobalDescriptorTable gdt;
	
	while (1);
}