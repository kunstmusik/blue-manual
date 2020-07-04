PythonObject {#pythonObject}
============

Accepts NoteProcessors: yes

Allows for using of the Python programming language to generate score
data, using the Jython interpreter to interpret Python scripts. You may
add your own python classes to the library for use with \"import\"
statements by adding them to your BLUE\_HOME/pythonLib folder. Included
with Blue is Maurizio Umberto Puxeddu\'s pmask, as well as Steven Yi\'s
Orchestral Composition library, found in Blue\'s application directory
under blue/pythonLib.

After writing your script to generate notes, assign the string value of
the notes to the variable \'score\'. Blue will then read in the value
from that variable and continue processing.

    temp = ""

    for i in range(4):
      temp += "i1 %d 1 %s %s\n"%(i, "8.0" + str(i), 80)

    score = temp
        

The above example script will generate four notes at ascending half
steps. If the PythonObject is set with a start time of 0 and a duration
of 2, then it will generate the following score:

    i1  0.0 0.5 8.00    80
    i1  0.5 0.5 8.01    80
    i1  1.0 0.5 8.02    80
    i1  1.5 0.5 8.03    80
        

Blue processes soundObjects by going through each SoundLayer and
generating score for each object within each layer. This is useful to
know so that if you are using a PythonObject that has utility functions
that you later use in other PythonObjects, you should put that utility
PythonObject on the first SoundLayer closest to the top, or at least on
a layer above all others that contain PythonObjects.

Also to note, as a feature, Blue uses a single interpreter instance for
processing python code. Therefore, if one PythonObject has code
evaluated, the values from that code can be read by other objects. This
allows creating utility PythonObjects. However, one can use stale values
(or values from another project even) if one is not careful to always
assign values in the project that require being set for this particular
project.

The following variables are avaialable from Blue:

blueDuration

:   Duration of the Python SoundObject

blueProjectDir

:   The location of the current project\'s directory. Includes path
    separator at end.

There is a checkbox entitled \"Process at Start\". Selecting this option
will have the script of the PythonObject run when a .blue project is
loaded. This is useful for scripts that act as library functions, but
themselves do not generate any notes. For example, you might define a
number of score generation utility functions in one PythonObject that
has \"Process at Start\" enabled. Your other PythonObjects may then use
the functions from that PythonObject. Next time you load your project,
if that PythonObject hasn\'t been run, your other PythonObjects will not
be able to be run either. If you are rendering from the beginning of a
project, this won\'t be an issue, but if you\'re starting work in the
middle of a project, you will need to evaluate that utility PythonObject
at least once. You can either do a run from the start at least once, use
the \"Test\" button to have that evaluated, or use \"Process at Start\"
and have Blue ensure it is loaded into the python interpreter when you
load your projects.
