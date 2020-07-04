Random Add Processor {#randomAddProcessor}
====================

Parameters: pfield, min, max, seedUsed, seed

The RandomAddProcessor generates a random value between min and max and
adds it to the designated pfield for all notes. A random value is
generated for each note.

The RandomAddProcessor expects either a positive or negative float value
for the min and max, and a postive integer for the pfield. The following
score:

    i1 0 2 80
    i1 + . 80
    i1 + . 80
    i1 + . 80

when processed with an RandomAddProcessor with min set to 0.0, max set
to 1.0, and pfield set to 4, resulted in the following on one pass:

    i1  0.0 0.5 80.92294
    i1  0.5 0.5 80.50539
    i1  1.0 0.5 80.112495
    i1  1.5 0.5 80.93934

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)

The above is an example of random values, and because it is random, the
results will be different on another processing pass. .

If seedUsed is set to "true", the random number generator will be
initialized using the given seed value. The seed value must be a valid
long integer value (-2\^63, 2\^63-1).

Hint: One useful way to use this noteProcessor is as a way to
"humanize" velocity or pitch values values.
