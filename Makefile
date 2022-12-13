CC=nasm
CFLAGS=-f win64
LD=golink
LDFLAGS=/entry:_start /console kernel32.dll user32.dll
SOURCES=main.asm
OBJECTS=$(SOURCES:.asm=.obj)
EXECUTABLE=asm-helloworld

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) /fo $@

.asm.obj:
	$(CC) $(CFLAGS) $< -o $@
