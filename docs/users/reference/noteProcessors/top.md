NoteProcessors 
==============

NoteProcessors are used in conjunction with soundObjects, and are used
post-generation of the soundObject's noteList. They are used to modify
values within the noteList.

NoteProcessors can be added via the soundObject property dialog. When a
soundObject is selected on the timeline, and if the soundObject supports
noteProcessors, you can add, remove, push up, or push down
noteProcessors on the property dialog.

NoteProcessors are applied after the notes of the soundObject are
generated and before time behavior is applied. Processing starts with
the first NoteProcessor in the chain and the results of that are passed
down the chain.

