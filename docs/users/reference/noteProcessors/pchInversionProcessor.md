Pch Inversion Processor 
=======================

Parameters: value, pfield

This noteProcessor flips all values in designated pfield about an axis
(value). The values that are read in the given pfield will be
interpreted as Csound pch format. The following score:

    i1 0 2 8.00
    i1 + . 8.04
    i1 + . 8.07
    i1 + . 9.00

If processed with a PchInversionProcessor with value 8.06 and pfield 4
would result in:

    i1  0.0 0.5 9.0
    i1  0.5 0.5 8.08
    i1  1.0 0.5 8.05
    i1  1.5 0.5 8.0    

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)
