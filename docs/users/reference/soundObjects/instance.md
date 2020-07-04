Instance 
========

Accepts NoteProcessors: yes

A SoundObject that points to a SoundObject in the SoundObject library.
The content of the SoundObject is not editable except by editing the
SoundObject in the library to which the instance is pointing to. If
editing the SoundObject in the library, all instances that point to that
SoundObject will be changed.

When clicking on an Instance object to edit it, the SoundObject from the
library will show its editor instead in the SoundObject edit area, but
it will be clearly marked that the user is currently editing a library
SoundObject and not an individual SoundObject.

The instance object is very useful if your work entails using many
variations of single source of material. For example, you can take a
SoundObject that represents a drum pattern, then make many Instances of
that pattern and add them to your project. If you want to later change
the base pattern, it will update everywhere that there are Instance
objects pointing to it.

Another example, if you have a SoundObject that represents a motive or
melodic fragment, you can put it into the SoundObject library, then make
10 instances of it, adding noteProcessors to do things like transpose or
get the retrograde, etc. Later, if you decide you want to change the
base material, you'd only have to edit it once within the library. All
Instance objects pointing to the changed object will be updated and will
maintain all of their transformations and relationships that were added
via NoteProcessors.

If you later decide that you want to work with the original material
where you have an Instance and want to break the link, replacing the
instance with a copy of the original to modify, you can convert the
Instance object to a GenericScore. To do this, you can use one of two
methods:

-   Right-click the Instance object and choose "Convert to Generic
    Score"
-   Go the SoundObject Library, select the original and use "Copy",
    then select the Instance object and use "Replace with SoundObject
    in Buffer"
