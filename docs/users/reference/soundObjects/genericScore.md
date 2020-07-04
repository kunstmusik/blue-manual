GenericScore {#genericScore}
============

Accepts NoteProcessors: yes

Contains a block of Csound score text. The objective time within the
GenericScore starts at time 0, and notes within the genericScore are
written relative to 0. The start time of the GenericScore object within
the timeline will translate the score text's time, and the
SoundObject's time behavior will determine how the notes are processed
relative to the GenericScore's duration. For example, for the following
score:

    i1 0 1 2 3 4 5
    i1 1 1 2 3 4 5
    i1 2 1 2 3 4 5
      

If this SoundObject is moved to start at time 2.0 with duration 6.0, the
generated score will be:

    i1 2 2 2 3 4 5
    i1 4 2 2 3 4 5
    i1 6 2 2 3 4 5
      

::: {.note}
::: {.title}
Note
:::

Score blocks support only a subset of the Csound Score Syntax. Using
"+" in p2 and "." in pfields, as well as "\<" and "\>" is
supported.
:::
