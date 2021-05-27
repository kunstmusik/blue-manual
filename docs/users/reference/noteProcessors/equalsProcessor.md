# Equals Processor

![](../../../images/EqualsNoteProcessor.png)

Parameters: pfield, value

Sets user-given pField of all notes in soundObject to user-given value,
i.e. set all p4's to value "440", or set all p6's to value
"/work/audio/wav/mySample2.wav". The following score:

```csound-sco 
i1 0 2 8.00
i1 + . 8.04
i1 + . 8.07
i1 + . 9.00    
```

If used with an EqualsProcessor with value 7.00 and pfield 4, would
result in the following score:

```csound-sco 
i1  0.0 0.5 7.00
i1  0.5 0.5 7.00
i1  1.0 0.5 7.00
i1  1.5 0.5 7.00
```

(The p2 and p3 times above are post-processing for a 2 second duration
SoundObject with time behavior set to scale.)

!!! tip
    One can use this NoteProcessor to quickly try testing a score with
    another insturment. To do this, use this NoteProcessor to reassign p1.
