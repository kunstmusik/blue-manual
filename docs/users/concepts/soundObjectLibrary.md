# SoundObject Library

## Introduction

The SoundObject Library is a place to store SoundObjects either
project-wide or program-wide. The project-wide library can be used to
store a SoundObject that you may want to user later but it also enables
Instance SoundObjects to be made. Instances of SoundObjects point to the
SoundObject in the library and when the instance generates its score, it
will call the SoundObject in the library to first generate score and
then apply its own properties and NoteProcessors to the generated score.
Updating a SoundObject in the library will then update all instances of
that SoundObject. This feature is useful to represent the idea of a
motive, with instances of the motive allowing to have transformations by
use of NoteProcessors.

The program-wide library (called "User SoundObject Library" in the
interface) allows one to build up a catalog of reusable SoundObjects.
SoundObjects such as Sound and ObjectBuilder allow users to build highly
configurable sound and score generators that have a high degree of
reusability. The program-wide library is also where SoundObjects are
exported from and imported to with BlueShare.

## Usage

The general pattern of usage for the project-wide SoundObject Library
entails:

1.  Add SoundObject to the Library. This is done by selecting a
    SoundObject, right-clicking the SoundObject to open up the popup
    menu and selecting "Add to SoundObject Library".

2.  After doing this, your SoundObject will have been added to the
    library and the SoundObject on the timeline will have been replaced
    with an Instance SoundObject which will be pointing to the
    SoundObject now in the library.

3.  At this point, the user can now take advantage of the library by
    making copies of the instance object on the timeline and pasting in
    more instances. These instances can be placed anywhere, have
    different durations and time behaviors, as well as have their own
    individual NoteProcessors. This allows expressing ideas such as
    "This is an instance of the primary motive (SoundObject in the
    library) but transposed up a major 3rd, retrograded, and inverted",
    or an idea like "I've got drum pattern A in the library and I have
    instances of it here and here and ...".
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    When copying and pasting Instance SoundObjects, they are all
    pointing to the SoundObject in the library.
    
    </div>

4.  You can also then make instances of SoundObjects in the library by
    opening up the SoundObject Library dialog (available from the Window
    menu or by using the F4 shortcut key). There you have the following
    options:
    
      - Copy  
        This makes a copy of the selected SoundObject and puts it in the
        buffer. This is a copy of the original SoundObject and not an
        Instance. After copying to the buffer, you can paste as normal
        on the timeline.
    
      - Copy Instance  
        This makes a Instance of the selected SoundObject and puts it in
        the buffer. This Instance will point to the original
        SoundObject. After copying to the buffer, you can paste as
        normal on the timeline.
    
      - Remove  
        This will remove the selected SoundObject from the library.

5.  You can also then edit the SoundObject in the library from within
    the SoundObject Library dialog by selecting the SoundObject in the
    list. The editor for the SoundObject will appear below.
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    Editing the SoundObject in the library will affect all instances of
    that SoundObject.
    
    </div>

The general pattern of usage for the program-wide SoundObject Library
entails:

1.  Add SoundObject to the Library. This is done by selecting a
    SoundObject on the timeline, right-clicking the SoundObject to open
    up the popup menu and selecting "Copy".

2.  After copying an object, open up the SoundObject library window and
    go to the User SoundObject Library. Right-click a folder node in the
    library tree and choose "Paste" to add a copy of the object to the
    library.

3.  You can use the context popup menu to create new folders, or
    double-click a node to rename the node.
