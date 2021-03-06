
PLTNAME = Unknown Platform

ifeq ($(PLATFORM),CW303)
 #d4 not officially supported, by has same reg map
 MCU = atxmega128d3
 HAL = xmega
 PLTNAME = CW-Lite XMEGA
else ifeq ($(PLATFORM),FACEWHISPERER)
 MCU = atxmega128d3
 HAL = xmega
 PLTNAME = Facewhisperer
 CDEFS += -DBOARD_FACEWHISPERER
 CPPDEFS += -DBOARD_FACEWHISPERER
else
  $(error Invalid or empty PLATFORM: $(PLATFORM))
endif

ifeq ($(HAL),xmega)
 VPATH=$(HALPATH)/xmega $(HALPATH)/usbhost
 EXTRAINCDIRS += $(HALPATH)/xmega $(HALPATH)/usbhost
 HALSRC = XMEGA_AES_driver.c uart.c usart_driver.c xmega_hal.c wiring.c wiring_digital.c WInterrupts.c
 HALCPPSRC = Usb.cpp SPI.cpp HardwareSerial.cpp Print.cpp WString.cpp new.cpp
else
 $(error: Unknown HAL: $(HAL))
endif


CDEFS += -DHAL_TYPE=HAL_$(HAL) -DPLATFORM=$(PLATFORM)
CPPDEFS += -DHAL_TYPE=HAL_$(HAL) -DPLATFORM=$(PLATFORM)