Command Blocks 
==============

Introduction
------------

Command Blocks are Csound ORC code with special directions to Blue on
how to processes them. The are available to use only within the Global
Orchestra areas of Instruments (not to be confused with the global
orchestra area in the globals manager tab) and were created to help
users build fully-encapsulated instruments, such that an instrument and
all of its necessary parts could be grouped together.

::: {.note}
::: {.title}
Note
:::

This feature has largely been made unnecessary due to new Csound
programming practices that have developed since this was initially
introduced. This feature is left in Blue though to support legacy
projects.
:::

Basic Usage
-----------

To use a command block, you will need to wrap the section of orc code
that you want Blue to process with the command in the following manner:

    ;[command to use]{ 
    ...Csound Orchestra Code... 
    ;}

Available Commands
------------------

Once blocks are useful to limit how many times a block of code will be
generated in the final CSD and is more for efficiency than anything else
(so Csound doesn't define the same ftable more than it has to, for
example). An example of this:

    ;[once]{ 
    gaLeft init 0 gaRight init 0 
    ;}

In this case, if the above gaLeft and gaRight init statement, wrapped in
a once block, is used in multiple instruments, then regardless it will
be generated only once in the final CSD. So a use case for the above
would be if you have all of your instruments output to the above global
variables for extra processing by an always-on reverb, you would want to
add the above to all of the instruments and also the reverb. Then, if
you start a new project and may want to reuse a few of your instruments
as well as the reverb, you can just copy them into your new project's
orchestra and start working away, knowing your global variables will be
initialized and ready to go.

Pre blocks are useful if you need the enclosed ORC code to be generated
before any other global orc code. When Blue goes to process the project
to generate a CSD file, it normally starts of the existing global
orchestra code from the globals manager, then appends all global orc
from instruments and soundObjects to it, one after the other. By using a
pre block, the code enclosed will be pushed up to the top of the global
orchestra of the CSD (instrument 0).

The scenario which required a solution such as this was when working
with the fluidSynth opcodes. For those set of opcodes, a fluidEngine
needs to be initialized before loading of soundfonts into that engine.
The design I had wanted was to have the instrument that did the
fluidOutput also have the engine initialization. This was a problem
because the fluidOutput needed to be placed at an instrument number
higher than the fluidNote playing instruments for the output chain to
work correctly. So here was a case of an instrument that needed to have
its instrument generate later than the instruments that it depended on,
but also have its own fluidEngine initialization happen before all the
other soundFonts load in in their own global orc statements. The
solution then was to create the once block feature and allow for
targetting global orc code to be prepended to the top of the generated
global orc code.
