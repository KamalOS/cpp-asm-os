ENTRY(loader) /* loader position in loader.s is the entry point of resulting bin file */
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

SECTIONS /* collect sections from different .o files and combine them to new sections */
{
	. = 0x0100000;
	
	.text : /* new text section wich contains text sections of other files */
	{
		*(.multiboot) /* from loader.s (object file) */
		*(.text*)
		*(.rodata) /* probably from Cpp */
	}
	
	.data :
	{
		start_ctors = .; /* for construction of global objects (vars) */
		KEEP(*( .init_array ));
		KEEP(*(SORT_BY_INIT_PRIORITY( .init_array.* )));
		end_ctors = .;
		
		*(.data) /* data sections from .o files */
	}
	
	.bss :
	{
		*(.bss) /* loader.s */
	}
	
	/* left symbols */
	/DISCARD/ :
	{
		*(.fini_array*)
		*(.comment)
	}
}