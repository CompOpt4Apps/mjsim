SUBDIRS = cores/arduino
CC=avr-gcc
OBJCOPY=avr-objcopy
AVRDUDE=/usr/local/bin/avrdude
AVRCONF=cores/avrdude.conf
CXX=avr-g++
PATHINFO=-I./cores/arduino -I/usr/local/avr-libc/avr/include -I.
ARDUINODEFINES=-mmcu=atmega328p -DF_CPU=16000000L -DATDUIUNO=18
CPPFLAGS=  -Os -w -ffunction-sections -fdata-sections $(ARDUINODEFINES) $(PATHINFO)
CFLAGS=
CXXFLAGS= -fno-exceptions

.PHONY: subdirs $(SUBDIRS)
program=main
OBJ=MeggyJr.o
INCLUDEOBJ=MeggyJrInclude

meggy: hex eep

hex: elf
	$(OBJCOPY) -O ihex -R .eeprom $(program).elf $(program).hex

eep: elf
	$(OBJCOPY) -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 $(program).elf $(program).eep

elf: .subdirs  $(OBJ) mainProg
	$(CC) -Os -L/usr/local/avr-libc/avr/lib/avr5/ -mmcu=atmega328p -o $(program).elf  $(OBJ) $(program).o cores/arduino/core.a $(INCLUDEOBJ).o

mainProg: $(program).s
	echo "Making Object file from assem file------------------"
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(program).s
	echo "Making object file for MeggyJrInclude"
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -S $(INCLUDEOBJ).cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(INCLUDEOBJ).s

tags: 
	ctags -R

.subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

$(OBJ): MeggyJr.h

upload: meggy
	echo "uploading to meggy jr....................."
	$(AVRDUDE) -C $(AVRCONF) -v -v -v -v -patmega328p -cstk500v1 -P/dev/ttyUSB0 -b57600 -D -Uflash:w:$(program).hex:i


.PHONY:clean
clean:
	for dir in $(SUBDIRS); do \
        $(MAKE) -C $$dir clean; \
    done
	$(RM) -f $(program).elf $(OBJ) $(program).eep $(program).hex $(program).o $(INCLUDEOBJ).s $(INCLUDEOBJ).o
