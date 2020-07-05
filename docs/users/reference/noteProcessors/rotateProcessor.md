# Rotate Processor

parameters: noteIndex

The RotateProcessor rotates the order of the notes, making the noteIndex
the first note. For example a noteIndex of 2 means "make the second note
of the notes generated the first, shifting the first note to the end".
With a noteIndex of 3, the following score:

```csound-sco
i1 0 2 1
i1 2 2 2
i1 4 2 3
i1 5 2 4
i1 6 2 5
```

will become:

```csound-sco
i1 0 2 3
i1 2 2 4
i1 4 2 5
i1 5 2 1
i1 6 2 2
```

As the third note now becomes the first. If a negative number is given,
the number will count backwards as to what note should now become the
first note. With a noteIndex of -2 (meaning, "Second note from the
end"), the following score:

```csound-sco
i1 0 2 1
i1 2 2 2
i1 4 2 3
i1 5 2 4
i1 6 2 5
```

Will become:

```csound-sco
i1 0 2 4
i1 2 2 5
i1 4 2 1
i1 5 2 2
i1 6 2 3
```

Start times of notes are all modified such that the notes that are
pushed to the end of list will start at the end time of the last note
before it. For the above examples, the duration of the note list ast a
whole did not change at all. However, when there are overlapping notes
as in the following example, where note index of -3 was used:

```csound-sco 
i1  0   5.0 0   4   
i1  2   5.0 1   4   
i1  4   5.0 2   4   
i1  6   5.0 3   4   
i1  8   5.0 4   4   
i1  10  5.0 5   4   
i1  12  5.0 6   4   
i1  14  5.0 7   4   
i1  16  5.0 8   4   
i1  18  5.0 9   4   
```

The resultant scores duration has changed as shown below:

```csound-sco 
i1  0.0 5.0 7   4   
i1  2.0 5.0 8   4   
i1  4.0 5.0 9   4   
i1  9.0 5.0 0   4   
i1  11.0    5.0 1   4   
i1  13.0    5.0 2   4   
i1  15.0    5.0 3   4   
i1  17.0    5.0 4   4   
i1  19.0    5.0 5   4   
i1  21.0    5.0 6   4   
```

Please be aware of this behavior when using this NoteProcessor with
scores that have overlapping notes.
