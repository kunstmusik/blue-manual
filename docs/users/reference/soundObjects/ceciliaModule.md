# CeciliaModule

Accepts NoteProcessors: no, Supports TimeBehavior: no

<div class="note">

<div class="title">

Note

</div>

This SoundObject is unfinished and not enabled for normal use. This
information is left here for the future if the module is ever finished
and reenabled.

</div>

The CeciliaModule is a soundObject that is meant to be compatible with
modules for the program Cecilia
(http://www.sourceforge.net/projects/cecilia), created by Alexandre
Burton and Jean Piche. The CeciliaModule is not as fully featured as
Cecilia itself as some features found in Cecilia do not make sense
within the context of Blue.

One major advantage of the CeciliaModule is the ability to have as
manyinstances of a module on the timeline as one likes, all without one
worrying about variable name clashes or other issues. Blue automatically
parses and renumbers instruments, ftables, and score statements so that
they do not interfere with other instances of the same module.

Cecilia modules require at least one modification before they are able
to run in Blue, and also must adhere to a few more constraints of
design.

**Appending “ftable” in Instrument Definitions.**

Instruments are required to append the word “ftable” before any number
that is meant to be an ftable. For example:

``` 
        instr 1

        aout oscil 10000, 440, 1

        out aout, aout endin
      
```

would have to become:

``` 
        instr 1

        aout oscil 10000, 440, ftable1

        out aout, aout endin
      
```

The purpose of this is so that Blue will know what ftable references
will need to be updated when Blue reassigns ftable numbers.
