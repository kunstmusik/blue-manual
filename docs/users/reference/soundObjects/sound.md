# Sound SoundObject

Accepts NoteProcessors: no

The Sound SoundObject allows one to develop solitary sounds by using
Csound Orchestra code and graphical user interfaces. It uses the same
GUI and coding system as found in [BlueSynthBuilder](../../instruments/blueSynthBuilder).

Sound SoundObjects will generate an instrument as well as i-statement
with the duration of the SoundObject. Sound SoundObjects can route
signals to mixer sub-channels and master out by using the blueMixerOut
pseudo-opcode, same as in BlueSynthBuilder. Multiple copies of the same
Sound can be placed in the Score timeline.

The Sound SoundObject also has a special Automation panel that allows
automating the controls. The automation is always scaled to the duration
of the SoundObject and effectively encapsulates the automation changes
with the object. Users can automate any widget that is allowed by
BlueSynthBuilder.
