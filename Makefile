
CA=ca65
RM=rm -f
AFLAGS=-g

ASM_SOURCES= nethost.asm netmodem.asm

OBJECTS=$(ASM_SOURCES:.asm=.o)

BINARIES=$(ASM_SOURCES:.asm=.bin)

%.o: %.asm
	$(CA) $(AFLAGS) -o $@ $<

$(BINARIES): $(OBJECTS)
	ld65 -C nethost.cfg $(OBJECTS)
