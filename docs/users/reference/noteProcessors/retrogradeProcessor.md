# Retrograde Processor

Parameters: none

Reverses all the generated notes in time. The following score:

    i1 0 2 1
    i1 + . 2
    i1 + . 3
    i1 + . 4

If processed with a RetrogradeProcessor would result in:

    i1  1.5 0.5 1
    i1  1.0 0.5 2
    i1  0.5 0.5 3
    i1  0.0 0.5 4

which if re-sorted by start time would result in:

    i1  0.0 0.5 4
    i1  0.5 0.5 3
    i1  1.0 0.5 2
    i1  1.5 0.5 1

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)
