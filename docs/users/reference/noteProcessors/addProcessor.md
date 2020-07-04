# Add Processor

Parameters: pfield, value

The AddProcessor takes two parameters, one for pfield (positive integer
\> 0) and one for value (any number). When applied, it will add the
user-defined value to the set pfield for all notes.

For example, if you have a SoundObject with notes for an instrument that
uses p4 as its amplitude. If you have values for p4 within the range of
78 and 82, such as the following score:

``` 
i1 0 2 78
i1 + . 80
i1 + . 81
i1 + . 82
  
```

If an AddProcessor is used that was set to 4.4 for value 4 for pfield,
your notes afterwards would be moved to the range of 82.4 to 86.4:

``` 
i1  0.0 0.5 82.4
i1  0.5 0.5 84.4
i1  1.0 0.5 85.4
i1  1.5 0.5 86.4
  
```

(The p2 and p3 times above are post-processing for a 2 second duration
SoundObject with time behavior set to scale.)
