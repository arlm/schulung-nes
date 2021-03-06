NAME = calebe
EMULATOR = fceux

# Custom linker configuration file
# Use only if you don't want to place it in SRCDIR
# Default: none
CONFIG  := nes.ini

# Toolchain stuff.
COMPILE 	:= cc65
ASSEMBLE  	:= ca65
LINK      	:= cl65

# Path to the directory where object files are to be stored.
OBJDIR := obj/nes

# Path to the directory where include files are located.
INCLUDEDIR := includes

# Environment stuff.
RM = rm

ifeq ($(shell echo),)
  MKDIR = mkdir -p $1
  RMDIR = rmdir $1
  RMFILES = $(RM) -f $1
else
  MKDIR = mkdir $(subst /,\,$1)
  RMDIR = rmdir $(subst /,\,$1)
  RMFILES = $(if $1,del /f $(subst /,\,$1))
endif

run: $(NAME).nes
	$(EMULATOR) --nogui $(NAME).nes

# Additional C compiler flags and options.
# Default: none
CFLAGS  = -t nes -g --debug-info  -I . -I data/ -I lib/ -I includes/ -I data/backgrounds

# Additional assembler flags and options.
# Default: none
ASFLAGS = -t nes -g --debug-info  -I . -I data/music/ -I lib/

# Additional linker flags and options.
# Default: none
LDFLAGS = -t nes -C $(CONFIG) -Wl --dbgfile,$(NAME).dbg

REMOVES += $(NAME).dbg

# Program ROM file name (game code goes here).
PROGRAM = $(NAME).nes

# Set SOURCES to something like 'src/foo.c src/bar.s'.
SOURCES := 
SOURCES += src/$(NAME).c
SOURCES += src/title.c
SOURCES += src/level.c
SOURCES += src/credits.c
SOURCES += src/reset.s

# Set INCLUDES to something like 'src/foo.h src/bar.h'.
INCLUDES := 
INCLUDES += includes/data.h65
INCLUDES += includes/externals.h65

# Path(s) to additional libraries required for linking the program
# Use only if you don't want to place copies of the libraries in SRCDIR
# Default: none
LIBS    :=

# Set OBJECTS to something like 'obj/foo.o obj/bar.o'.
OBJECTS := $(addsuffix .o,$(basename $(addprefix $(OBJDIR)/,$(notdir $(SOURCES)))))

# Set HEADERS to something like 'obj/foo.h obj/bar.h'.
HEADERS := $(addsuffix .h,$(basename $(addprefix $(INCLUDEDIR)/,$(notdir $(INCLUDES)))))

# Set ASMOBJS to something like 'obj/foo.o obj/bar.o'.
ASMOBJS := $(OBJECTS:.o=.s)

# Set DEPENDS to something like 'obj/foo.d obj/bar.d'.
DEPENDS := $(OBJECTS:.o=.d)

.SUFFIXES:
.PHONY: all clean
	
all: $(OBJDIR) $(PROGRAM)

vpath %h65 $(foreach h,$(INCLUDES),$(dir $h))

$(INCLUDEDIR)/%.h: %.h65
	sed -i.bak 's/bss - name/bss-name/g' $<
	rm $<.bak
	cp $< $(addsuffix .h,$(basename $(addprefix $(INCLUDEDIR)/,$(notdir $<))))

# CPTODO: Disabled for now because of Windows crap paths
#-include $(DEPENDS)

# The remaining targets.
$(OBJDIR): $(HEADERS)
	$(call MKDIR,$(OBJDIR))

vpath %c $(foreach c,$(SOURCES),$(dir $c))

$(OBJDIR)/%.o: %.c
	sed -i.bak 's/bss - name/bss-name/g' $<
	rm $<.bak
	$(COMPILE) -Oi $(CFLAGS) -o $(@:.o=.s) $< --add-source
	$(ASSEMBLE) $(ASFLAGS) -o $@ $(@:.o=.s)

vpath %c65 $(foreach c65,$(SOURCES),$(dir $c65))

$(OBJDIR)/%.o: %.c65
	sed -i 's/bss - name/bss-name/g' $<
	$(COMPILE) -Oi $(CFLAGS) -o $(@:.o=.s) $< --add-source
	$(ASSEMBLE) $(ASFLAGS) -o $@ $(@:.o=.s)

vpath %a $(foreach a,$(SOURCES),$(dir $a))

$(OBJDIR)/%.o: %.a
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

vpath %asm $(foreach asm,$(SOURCES),$(dir $asm))

$(OBJDIR)/%.o: %.inc
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

vpath %asm $(foreach asm,$(SOURCES),$(dir $asm))

$(OBJDIR)/%.o: %.asm
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

vpath %a65 $(foreach a65,$(SOURCES),$(dir $a65))

$(OBJDIR)/%.o: %.a65
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

vpath %s $(foreach s,$(SOURCES),$(dir $s))

$(OBJDIR)/%.o: %.s
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

vpath %s65 $(foreach s65,$(SOURCES),$(dir $s65))

$(OBJDIR)/%.o: %.s65
	$(ASSEMBLE) $(ASFLAGS) -o $@ $<

$(PROGRAM): $(HEADERS) $(CONFIG) $(OBJECTS) $(LIBS)
	$(LINK) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@ 

### START USER-SUPPLIED CUSTOM RULES SECTION



### END USER-SUPPLIED CUSTOM RULES SECTION

clean:
	-$(call RMFILES,$(OBJECTS))
	-$(call RMFILES,$(ASMOBJS))
	-$(call RMFILES,$(DEPENDS))
	-$(call RMFILES,$(REMOVES))
	-$(call RMFILES,$(PROGRAM))
	rm -f ./$(NAME).nes	
