###############################################################################
# COMPILER SELECT
###############################################################################
CROSS_COMPILE=avr-gcc
MICRO_CONTROLLER=atmega1280

###############################################################################
# FLAGS
###############################################################################
C_FLAGS=-Wall -g -mmcu=$(MICRO_CONTROLLER) -DF_CPU=8000000 -std=c99 -O2
LD_FLAGS=-mmcu=$(MICRO_CONTROLLER) -Wl,-Map=$(MAP_FILE)
INCLUDES=-I.

###############################################################################
# FILES
###############################################################################
ELF_FILE=wojOS.elf
MAP_FILE=wojOS.map
C_FILES=board.c

OBJ_FILES=$(C_FILES:%.c=%.o)
DEP_FILES=$(C_FILES:%.c=%.d)

###############################################################################
# TARGETS
###############################################################################
$(ELF_FILE): $(OBJ_FILES)
	$(CROSS_COMPILE) -o $@ $< $(LD_FLAGS)

%.o: %.c
	$(CROSS_COMPILE) $(C_FLAGS) $(INCLUDES) -M -o $*.d $<
	$(CROSS_COMPILE) $(C_FLAGS) $(INCLUDES) -c -o $@ $<

###############################################################################
# CLEAN
###############################################################################
clean: clean_obj clean_dep
	rm -f $(ELF_FILE) $(MAP_FILE)

clean_obj:
	rm -f $(OBJ_FILES)

clean_dep:
	rm -f $(DEP_FILES)
