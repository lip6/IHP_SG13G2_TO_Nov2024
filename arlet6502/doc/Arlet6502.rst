

==============
The Arlet 6502
==============


.. note::

   This document is not complete yet. The SPI interface is not documented
   enough. We intend to finish it as soon as we can.


The Processor
=============

Excerpt from Wikipedia, the free encyclopedia [1]_.

The   MOS  Technology   6502  (typically   pronounced  "sixty-five-oh-two"   or
"six-five-oh-two") is an 8-bit microprocessor that was designed by a small team
led by Chuck Peddle for MOS Technology.  The design team had formerly worked at
Motorola on  the Motorola 6800 project;  the 6502 is essentially  a simplified,
less expensive and faster version of that design.

Home video  game consoles  and home  computers of the  1970s through  the early
1990s,  such as  the  Atari 2600,  Atari 8-bit  computers,  Apple II,  Nintendo
Entertainment System, Commodore  64, Atari Lynx, BBC Micro and  others, use the
6502 or variations of the basic design. Soon after the 6502's introduction, MOS
Technology was purchased outright by  Commodore International, who continued to
sell the microprocessor and licenses to  other manufacturers. In the early days
of the 6502, it was second-sourced by Rockwell and Synertek, and later licensed
to other companies.


The RTL Implementation
======================

This version is  from Arlet Ottens, <arlet@c-scape.nl>, not  all 6502 interface
signals are supported.


The Chip's Interface
====================

Due  to the  very small  size  available in  this  MPW (2mm  square, seal  ring
included), allowing  only 8  I/O pads per  side, we had  to further  reduce the
number of I/O signals by using a SPI [2]_ bus.


Position of the I/O pads in the corona (could also be read in ``doDesign.py``) ::

    +       +-------+-------+-------+-------+-------+-------+-------+-------+       +
            |  NMI  |  VDD  | IOVDD |  clk  |  VSS  | IOVSS | reset |  RDY  |        
    +-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
    | DI(0) |                                                               |  IRQ  |
    +-------+                                                               +-------+
    | DI(1) |                                                               | DI(7) |
    +-------+                                                               +-------+
    | DO(0) |                                                               | DI(6) |
    +-------+                                                               +-------+
    | DO(1) |                                                               |  we   |
    +-------+                                                               +-------+
    | DO(2) |                                                               | lh(1) |
    +-------+                                                               +-------+
    | DO(3) |                                                               | lh(0) |
    +-------+                                                               +-------+
    | DO(4) |                                                               | DO(7) |
    +-------+                                                               +-------+
    | DO(5) |                                                               | DO(6) |
    +-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
      	    | DI(2) |  VDD  | IOVDD |  VSS  | IOVSS | DI(3) | DI(4) | DI(5) |
    +       +-------+-------+-------+-------+-------+-------+-------+-------+       +
	   


.. [1] https://en.wikipedia.org/wiki/MOS_Technology_6502
.. [2] https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
