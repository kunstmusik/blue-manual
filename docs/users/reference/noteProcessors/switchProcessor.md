# Switch Processor

parameters: pfield1, pfield2

A Switch Processor switches pfield1 with pfield2 for all notes in
SoundObject. It is useful in conjunction with RetrogradeProcessor when
reversing notes that have start and end values in pfields, i.e.

    ;inum start dur   start   end
    i1    0     1     8.04    8.00
    i1    1     2     8.00    8.07

with just retrograde processor becomes:

    ;inum start dur   start   end
    i1    0     2     8.00    8.07
    i1    2     1     8.04    8.00

with retrograde and switch on p4 and p5 becomes:

    ;inum start dur   start   end
    i1    0     2     8.07    8.00
    i1    2     1     8.00    8.04
