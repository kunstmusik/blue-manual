# Inversion Processor

Parameters: pfield, value

This NoteProcessor flips all values in designated pfield about an axis
(value). The following score:


```csound-sco 
i1 0 2 80
i1 + . 85
i1 + . 95
i1 + . 100
```

If processed with an InversionProcessor with value 90 and pfield 4 would
result in:

```csound-sco 
i1  0.0 0.5 100.0
i1  0.5 0.5 95.0
i1  1.0 0.5 85.0
i1  1.5 0.5 80.0    
```

(The p2 and p3 times above are post-processing for a 2 second duration
SoundObject with time behavior set to scale.)
