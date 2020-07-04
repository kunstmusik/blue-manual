# Python Processor

Parameters: code

Allows user to write python code to process NoteList. The code is run
using Jython, the Java implementation of Python that is included with
Blue. Users using the PythonProcessor should be aware of Jython's
implementation details: most classes and modules from CPython are
included, users can not import modules with native libraries, and users
can use any Java class that exists in the classpath.

When Blue generates notes from a SoundObject, the SoundObject first
generates its Notes as a NoteList, then NoteProcessors are called one at
a time to process that NoteList in place. For the PythonProcessor,
before any of the user-written code is run, the generated NoteList is
first added and defined in the memory space as "noteList". From there,
the script for the PythonProcessor should treat noteList as the list of
Note objects that have been generated. The NoteList and Note objects are
the very same and have the same methods and properties as those in the
Java code, so one must work with them the same way as one would in Java.

The following code shows an example of the Python Processor. The code
first imports the random module, then for every note in the noteList it
creates a random space variable between the values of -1 and 1, then
assigns that to pfield 7 of the note. (This example code is used in the
blue/examples/noteProcessors/pythonProcessor.blue and can be run within
Blue to hear the example).

    import random
    
    for i in noteList:
      newVal = str((2 * random.random()) - 1)
      i.setPField(newVal, 7)
