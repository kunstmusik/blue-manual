# Introduction

Blue is a music composition environment for use with Csound. Blue
interacts with Csound by generating .CSD files, which it then feeds to
Csound for compilation. Any version of Csound that can be called by
commandline is able to be used with Blue.

One of Blue's main features is the graphical timeline of SoundObjects,
of which a special SoundObject-the polyObject-is able to group other
SoundObjects. polyObjects feature their own timeline, allowing for
timelines within timelines. SoundObjects can be anything that generates
notes, be it a block of Csound SCO, a script in python, or a graphical
object.

SoundObjects may further have noteProcessors added to them, which may do
things like "add .3 to all p4 values" or "of these notes, only generate
the first three". NoteProcessors are especially useful when used with
Instance SoundObjects from the SoundObject Library.

The SoundObject library allows for working with SoundObjects by making
instances of a SoundObject. Instances point to a SoundObject, and when
they generate notes, they use the SoundObject they are pointing to to
generate the notes for them. Instances however can have their own
properties which they will apply to the generated notes, so that they
can be of different duration and have different start times, as well as
have different noteProcessors used with them. the advante of instances
versus manually copying a SoundObject over and over again is that if you
want to change the notes for all of these SoundObjects, you'd have to
manually go and change all of them, while with instances, you'd only
have to change the one SoundObject all of the instances are pointing to.
(which also means you could make a song template file, all pointing to
empty SoundObjects, build the form of the piece, then change the
SoundObject's note material to "fill in the form".)

Other features include the orchestra manager, which allows for importing
of instruments from .CSD files, a list to manage instruments, and the
ability to selectively generate instruments when compiling .CSD files.
instruments can be either a single Csound instrument or may be a GUI
instrument.
