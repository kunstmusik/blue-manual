Time Warp Processor {#timewarpProcessor}
===================

parameters: TimeWarpString

Warps time in the same way as Csound t-statement, but does not require
\"t\" to be used. Statements are in alternating pairs of beat number and
tempo.

From the Csound Manual:

Time and Tempo-for-that-time are given as ordered couples that define
points on a \"tempo vs. time\" graph. (The time-axis here is in beats so
is not necessarily linear.) The beat-rate of a Section can be thought of
as a movement from point to point on that graph: motion between two
points of equal height signifies constant tempo, while motion between
two points of unequal height will cause an accelarando or ritardando
accordingly. The graph can contain discontinuities: two points given
equal times but different tempi will cause an immediate tempo change.

Motion between different tempos over non-zero time is inverse linear.
That is, an accelerando between two tempos M1 and M2 proceeds by linear
interpolation of the single-beat durations from 60/M1 to 60/M2.

The first tempo given must be for beat 0.

-   Beat values for beat/tempo pairs should related to the score
    \*before\* any time behavior is applied. For example, for the
    following score:

        i1 0 1 2 3 4
        i1 1 1 3 4 5 
        i1 2 1 3 4 5 
        i1 3 1 3 4 5 

    if it is in a GenericScore SoundObject of duration 20, if you want
    the tempo to decrease in half by the last note, you would enter a
    value for the processor as \"0 60 3 30\" and not \"0 60 20 30\"

-   If you\'re using a time behavior of \"Repeat\", remember that time
    behavior is applied \*after\* noteProcessors, and the resulting
    score will be a time warped score repeated x times and \*NOT\* a
    score repeated x time and then timewarped

-   Time Warping, when used with a time behavior of \"Scale\", be aware
    that estimating the final tempo of the object may be tricky, as the
    scaling will alter the duration of notes.
