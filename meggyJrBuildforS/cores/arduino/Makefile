CC=avr-gcc
CXX=avr-g++
CPPFLAGS=  -Os -w -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -DATDUIUNO=18 -I/usr/local/avr-libc/avr/include -I.
CFLAGS=
CXXFLAGS= -fno-exceptions

LIBOBJECTFILES= pins_arduino.o WInterrupts.o wiring.o wiring_analog.o wiring_digital.o wiring_pulse.o wiring_shift.o HardwareSerial.o Print.o Tone.o WMath.o

core.a: $(LIBOBJECTFILES)
	avr-ar rcs core.a $(LIBOBJECTFILES)

.c.o :
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $<

.cpp.o:
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $<

$(LIBOBJECTFILES): WProgram.h

.PHONY:clean
clean:
	-$(RM) -r $(LIBOBJECTFILES) core.a
