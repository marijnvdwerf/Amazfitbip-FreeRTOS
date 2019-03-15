# Instructions: 
# 1) add a rule for your board to the bottom of this file
# 2) profit!

LFLAGS_STM32=$(LFLAGS) $(SRCFILES) -T $(LDSCRIPT)

# STM32F0 starts up with HSI at 8Mhz
STM32F0_CFLAGS=$(M0_FLAGS) -DSTM32F0 -DLITTLE_BIT=100000 $(LFLAGS_STM32) -lopencm3_stm32f0
# STM32F1 starts up with HSI at 8Mhz
STM32F1_CFLAGS=$(M3_FLAGS) -DSTM32F1 -DLITTLE_BIT=200000 $(LFLAGS_STM32) -lopencm3_stm32f1
# STM32F2 starts up with HSI at 16MHz
STM32F2_CFLAGS=$(M3_FLAGS) -DSTM32F2 -DLITTLE_BIT=400000 $(LFLAGS_STM32) -lopencm3_stm32f2
# STM32F3 starts up with HSI at 8MHz
STM32F3_CFLAGS=$(M4FH_FLAGS) -DSTM32F3 -DLITTLE_BIT=400000 $(LFLAGS_STM32) -lopencm3_stm32f3
# STM32F4 starts up with HSI at 16MHz
STM32F4_CFLAGS=$(M4FH_FLAGS) -DSTM32F4 -DLITTLE_BIT=800000 $(LFLAGS_STM32) -lopencm3_stm32f4
# STM32F7 starts up with HSI at 16MHz
STM32F7_CFLAGS=$(M7SP_FLAGS) -DSTM32F7 -DLITTLE_BIT=800000 $(LFLAGS_STM32) -lopencm3_stm32f7
# STM32L0 starts up with MSI at 2.1Mhz
STM32L0_CFLAGS=$(M0P_FLAGS) -DSTM32L0 -DLITTLE_BIT=50000 $(LFLAGS_STM32) -lopencm3_stm32l0
# STM32L1 starts up with MSI at 4MHz
STM32L1_CFLAGS=$(M3_FLAGS) -DSTM32L1 -DLITTLE_BIT=100000 $(LFLAGS_STM32) -lopencm3_stm32l1
# STM32L4 starts up with MSI at 4MHz
STM32L4_CFLAGS=$(M4FH_FLAGS) -DSTM32L4 -DLITTLE_BIT=100000 $(LFLAGS_STM32) -lopencm3_stm32l4


PLATFORM=stm32l4
BOARDS_ELF+=$(OD)/$(BINARY).elf
BOARDS_BIN+=$(OD)/$(BINARY).bin
BOARDS_HEX+=$(OD)/$(BINARY).hex
$(OD)/$(BINARY).elf: $(SRCFILES) libopencm3/lib/libopencm3_$(PLATFORM).a
	@echo "  $(5) -> Creating $(OD)/$(BINARY).elf"
	$(CC) $(STM32L4_CFLAGS) -o $(OD)/$(BINARY).elf


