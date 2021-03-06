# Pch Add Processor

![Pch Add](../../../images/PchAdd.png)

Parameters: pfield, value

The PchAddProcessor works like the AddProcessor, but is used with
pfields written in Csound pch notation(i.e. 8.00, 7.11, 9.03). The value
field, unlike the AddProcessor, is a whole-number, representing the
number of scale degrees in which to add to the pch value. If a
soundObject has notes where p5 is a pch value, and you the notes have
values of 8.00, 8.04, 8.07, and 9.00:

```csound-sco
i1 0 2 8.00
i1 + . 8.04
i1 + . 8.07
i1 + . 9.00
```

If a PchAddProcessor with value 7 and pfield 5 is used, after
processing, the score would result in:

```csound-sco
i1  0.0 0.5 8.07
i1  0.5 0.5 8.11
i1  1.0 0.5 9.02
i1  1.5 0.5 9.07
```

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)

If you had used a regular AddProcessor and tried to transpose 7 scale
degrees down using -.07, you would have gotten 7.93, 7.97, 8.00, and
8.97, and the first few notes would have really be equal to 14.11,
15.01, and 8.00 in pch notation. This is due to the way that Csound pch
notation works to hold the scale degree, from 0-11, in the two fields to
the right of the period.
