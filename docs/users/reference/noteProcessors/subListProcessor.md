# SubList Processor

![Sublist](../../../images/Sublist.png)

Parameters: start, end

The SubListProcessor will cut out notes from the soundObject's generated
noteList. An example of it's use may be that you have a 12-tone row as
soundObject in the soundObject library, and you're using instances of it
as the basis of your work. You may only want to use notes 1-3 of the
row, so you would use the SublistProcessor with a start of 1 and an end
of 3.

The SubListProcessor will cut out notes, then translate them to start at
the start of the soundObject, and then scale them so that they take up
the duration of the soundObject. If you had a five note soundObject with
all notes have a duration of 1 second, all starting one after the other,
with the soundObject starting at 0 seconds on the timeline, and if you
used a SubListProcessor with start of 1 and end of 4, you'd end up with
four notes being generated(the first four from the original
soundObject), starting a 0 seconds on the timeline, with each notes
duration lasting 1.25 seconds, each starting one right after the other.

The following score:

```csound-sco
i1 0 2 1
i1 + . 2
i1 + . 3
i1 + . 4
```

when processed with a SubList processor with start 2 and end 3, would
result in:

```csound-sco
i1  0.0 1   2
i1  1.0 1   3
```

(The p2 and p3 times above are post-processing for a 2 second duration
soundObject with time behavior set to scale.)
