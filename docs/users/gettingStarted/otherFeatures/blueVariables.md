Blue Variables 
==============

Blue treats special text as special Blue variables. Below is a list of
those variables.

  Variable                      Value
  ----------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  \<TOTAL\_DUR\>                Duration of the generated score from the timeline (Available in Global SCO text area.)
  \<INSTR\_ID\>                 Replaces with instrumentId; if the instrument is a named instrument, value is quoted. Generally used when creating notes.(Available within instruments and some SoundObjects.)
  \<INSTR\_NAME\>               Replaces with instrumentId; if the instrument is a named instrument, the value is not quoted. Generally used when working with ORC code to give a variable a unique ID, i.e. "gk\_var\<INSTR\_NAME\>".(Available within instruments and some SoundObjects.)
  \<RENDER\_START\>             The start time of rendering. Does not take into account time warping of score. (Available in Global SCO text area.)
  \<RENDER\_START\_ABSOLUTE\>   The start time of rendering. Takes into account time warping of score. (Available in Global SCO text area.)
  \<PROCESSING\_START\>         The time value when always-on effects instruments need to start. Calculated as the time value of the first soundObject that is not a FrozenSoundObject or Comment. (Available in Global SCO text area.)
