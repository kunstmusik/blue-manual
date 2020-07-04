# Multiply Processor

Parameters: value, pfield

The MultiplyProcessor works like the addProcessor, but multiplies the
given pfield by the value. The following score:

    i1 0 2 80
    i1 + . 80
    i1 + . 80
    i1 + . 80

If processed with a MultiplyProcessor with value 2 and pfield 4 would
result in:

    i1  0.0 0.5 160.0
    i1  0.5 0.5 160.0
    i1  1.0 0.5 160.0
    i1  1.5 0.5 160.0

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)
