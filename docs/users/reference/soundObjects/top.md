# Sound Objects

Sound Objects are objects on the score timeline that are primarily
responsible for generating score data.

## Common Properties

The following are properties that all SoundObjects share.

  - Name  
    Name of the Soundobject

  - Subjective Duration  
    The duration of the soundObject on the timeline (versus the duration
    of the generated score within the soundObject, which may be
    different). How the duration relates to the generated score contents
    is controlled by the "Time Behavior" property.

  - End Time  
    Read-Only property that shows the end-time of the soundObject

  - Time Behavior  
    Selects how subjective time should be used on a soundObject. Options
    are:
    
    1.  Scale - The default option, stretches generated score to last
        the duration of the soundObject
    
    2.  Repeat - repeats generated score up to the duration of the
        soundObject
    
    3.  None - Passes the score data as-is (When using Time-Behavior of
        None, width of soundObject no longer visually corresponds to
        duration of the soundObject's score.)

##  About Note Generation

Sound Objects generate notes in the following manner:

  - SoundObject generates initial notes

  - NoteProcessors are applied to the generated notes

  - Time Behavior is applied to the notes

## Partial Object Rendering

When using a render start time other than 0.0, how soundObjects
contribute notes depends on if they support partial object rendering.
Normally, notes from all soundObjects which can possibly contribute
notes to the render (taking into account render start and render end)
are gathered and then if any notes start before the render start time
they are discarded as there is no way to start in the middle of a note
and to know exactly that it sounds as it should as blue's timeline only
knows about notes and not how those instruments render.

However, there are certain cases where blue soundObjects \*can\* know
about the instrument that the notes are generated for and can therefore
do partial object rendering to start in the middle of a note. This the
is the case for those soundObjects which generate their own instruments,
such as the AudioFile SoundObject, FrozenObject, the LineObject, and the
ZakLineObject. For those soundObjects, if render is started within the
middle of one of those, you will hear audio and have control signals
generated from the correct place and time.
