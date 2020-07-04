# LineAdd Processor

Parameters: pfield, LineAdd String

The LineAdd Processor adds values to a user-defined pfield. This
noteProcessor differs from the AddProcessor in that the value added is
variable over time. The LineAdd String is a set of beat/value pairs that
are like the breakpoints on curve. The following score:

    i1 0 2 80
    i1 + . 80
    i1 + . 80
    i1 + . 80

If processed with a LineAdd Processor with LineAddString set to "0 0 6
3" and pfield set to 4, would result in:

    i1  0.0 0.5 80.0
    i1  0.5 0.5 81.0
    i1  1.0 0.5 82.0
    i1  1.5 0.5 83.0

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)

The LineAddString can be interpreted to mean: start at beat 0 with value
0, and by beat 6, arrive at value 3. For each note, the LineAddString
will find the note's beat and compare against the LineAddString to see
how much should be added. The user should be careful to remember that
SoundObjects do not apply scaling of score until after processing with
noteProcessors. Therefore, the beat values given in the LineAddString
were to be applied against the beat values of the original score.
