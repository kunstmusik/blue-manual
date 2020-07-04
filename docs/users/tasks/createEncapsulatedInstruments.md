Create Encapsulated Instruments 
===============================

Creating a fully encapsulated instrument in Csound alone is difficult as
there are often things like ftables and User-Defined Opcodes which an
instrument depends on to function which are defined outside of the
instrument. In blue, consideration has been taken to allow users to
encapsulate required dependencies with instruments while offering
efficient generation of dependencies (i.e. reusing tables and UDO\'s
which are identical).

Best Practices Common to All Instruments
----------------------------------------

The following are techniques to use which are applicable to all
Instrument types in blue.

**FTables**

There are a few ways to handle ftable dependencies and the choice of
which way to go will depend on how optimized you would like to have
everything at runtime.

f-statements in global SCO

:   \...

ftgen in conjunction with once blocks

:   \...

ftgen in global ORC

:   \...

ftgen within instruments

:   \...

**User-Defined Opcodes**

Csound instruments often depend on User-Defined Opcodes. It is
recommended that UDO\'s that an instrument depends on be packaged with
the blue Instrument using the Instrument\'s UDO list. This allows for
the user to copy and paste instruments between projects as well as share
them on blueShare and all the required UDO\'s will be included with the
instrument. UDO generation from instruments is optimized so that if two
UDO\'s are found that functionally match (same intypes, outtypes, and
code body), the second one will not be generated. If different matching
UDO\'s are found or if two differently named but functionally equivalent
UDO\'s are found, blue will automatically handle renaming references to
the UDO\'s using unique names. By doing this, the user can be confident
that the generated code is optimized and that if there are any name
clashes that blue will automatically handle any problems for you so you
don\'t have to do it yourself.

Best Practices for BlueSynthBuilder
-----------------------------------

**Subchannels**
