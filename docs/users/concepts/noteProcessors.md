# NoteProcessors

NoteProcessors are a powerful tool for manipulating notes. Each type of
NoteProcessor serves a different purpose to adjust values for pfields.
They can be used to apply musical effects to a group of notes; some
possible uses include humanizing rhythm, added crescendo/decrescendo,
reassigning notes to different instruments, applying time curves, and
transposition of material.

NoteProcessors can be applied on a per-SoundObject basis. They can also
be applied to an entire Layer to affect all SoundObjects in that layer,
as well as applied to a LayerGroup or to the entire Score.

You can add NoteProcessors to SoundObjects by using the SoundObject
Properties window. You can add them to Layers the support them by using
the "N" button the layer's header panel. To apply them to a LayerGroup
or Score, right click the Root Score in the Score Bar and use the popup
menus to choose which item you'd like to apply NoteProcessors to.

NoteProcessors are applied after the notes of a SoundObject, Layer,
LayerGroup, or Score are generated and before time behavior is applied.
Processing starts with the first NoteProcessor in the chain and the
results of that are passed down the chain.
