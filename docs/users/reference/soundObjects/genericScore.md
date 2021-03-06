# GenericScore

Accepts NoteProcessors: yes

![Generic](../../../images/Generic.png)

Contains a block of Csound score text. The objective time within the
GenericScore starts at time 0, and notes within the genericScore are
written relative to 0. The start time of the GenericScore object within
the timeline will translate the score text's time, and the SoundObject's
time behavior will determine how the notes are processed relative to the
GenericScore's duration. For example, for the following score:

```csound-sco 
i1 0 1 2 3 4 5
i1 1 1 2 3 4 5
i1 2 1 2 3 4 5
```

If this SoundObject is moved to start at time 2.0 with duration 6.0, the
generated score will be:

```csound-sco
i1 2 2 2 3 4 5
i1 4 2 2 3 4 5
i1 6 2 2 3 4 5
```

!!! note
    Score blocks support only a subset of the Csound Score Syntax. Using "+"
    in p2 and "." in pfields, as well as "<" and "\>" is supported.

The option Set Subjective Time to Objective Time (right click on Object) 
adjusts the duration of the object to match the duration of the contents. 
So if score was 4 beats total, you had dragged the box to make it 8 beats, 
you could use that option of subjective time to objective time to bring it 
back to 4 beats.
