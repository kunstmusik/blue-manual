# Tuning Processor

Parameters: pfield, baseFrequency, scalaFile

Converts Blue PCH notation to frequency according to scale values in a
Scala scale file. The scale will default to 12TET wheen TuningProcessor
is initially created. The file selector for choosing a Scala .scl file
will default to user's .blue directory, under the scl subdirectory. It
is advised that users download the 3000+ scale archive from the Scala
website at: http://www.huygens-fokker.org/scala/ and place them in the
.blue/scl directory or whever they find convenient.

Base frequency determines what 8.00 should be set to, defaulting to
middle-C below A440 (same as in Scala). Input for the noteProcessor
should be:

    oct.scaleDegree

where oct is equal to octave, and scale degree equal to what degree of
the scale to use. The output will be frequency values, so instruments
should be set to accept values as frequency.

  - Fractional scaleDegree's are not supported.

  - For the scaleDegree, the Blue PCH does not work exactly like Csound
    pch notation. In Csound pch, "8.01" would be different than "8.1",
    while for the Tuning processor, there is no difference. The tuning
    processor takes everything from the right side of the decimal and
    converts that to an integer to figure out the scale degree.

  - If you enter in a scale degree higher than the number degrees in the
    scale, it will be converted as if the octave is raised. For example,
    in a 19 tone scale, an input of "8.21" would get converted to "9.1".
