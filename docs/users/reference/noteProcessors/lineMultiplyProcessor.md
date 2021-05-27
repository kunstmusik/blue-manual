# LineMultiply Processor

![Line Mult](../../../images/LineMultiply.png)

Parameters: pfield, LineMultiply String

The LineMultiply Processor multiplies values in a user-defined pfield.
This noteProcessor differs from the Multiply Processor in that the value
muliplied by is variable over time. The LineMultiply String is a set of
beat/value pairs that are like the breakpoints on curve. The following
score:

```csound-sco 
i1 0 2 80
i1 + . 80
i1 + . 80
i1 + . 80
```

If processed with a LineMultiple Processor with LineMultiplyString set
to "0 0 6 2" and pfield set to 4, would result in:


```csound-sco 
i1  0.0 0.5 0.0
i1  0.5 0.5 53.333336
i1  1.0 0.5 106.66667
i1  1.5 0.5 160.0
```

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)

The LineMultiplyString can be interpreted to mean: start at beat 0 with
value 0, and by beat 6, arrive at value 2. For each note, the
LineMultiplyString will find the note's beat and compare against the
LineMultiplyString to see how much should be multiplied. The user should
be careful to remember that SoundObjects do not apply scaling of score
until after processing with noteProcessors. Therefore, the beat values
given in the LineMultiplyString were to be applied against the beat
values of the original score.

!!! note
Line Multiplying is done over the objective duration of the Object, so 
the length of the Object as if Time Behavior would have been set to None.

