# Program Scripts

Users are able to create scripts in Python that can interact with the
current Blue project. Some examples of ideas for scripts are:

  - Scale selected SoundObjects start and end times by user given value

  - Rename all SoundObjects on timeline by analyzing their contents

  - Analyze SoundObjects on timeline and generate an analysis report

  - Generate individual wave files for each soundObject or each layer

Because the user has complete access to the Blue object model as well as
Blue application classes, the user has a great deal of freedom to make
very customized scripts to aid in their work.

**Managing and Using Scripts**

Scripts are created and organized from the Script Library, available
from the "Script-\>Manage Script Library" menu option. A dialog appears
with a tree on the left and a script editor on the right. To create a
script or script category, right click on a folder node on the tree and
select the appropriate option. To edit the names of either of these,
double-click the name on the tree. Clicking on a script node will
populate the editor on the right. Here you can add a short description
(used as the tool tip text for the script), the code for the script, and
comments. You can also export scripts to files and import them from
files using the popup menu that appears when right-clicking on the tree.

When creating scripts, one can use the test button or ctrl-T test
shortcut to try out the script from the Script Library dialog. You can
also select SoundObjects on the timeline and then open the library to
write and test scripts using those selected SoundObjects.

After creating and managing scripts, the Script menu in the main program
frame will be updated. Under the Script menu will be a Scripts menu that
will be populated with the exact same order and structure as the items
in the Script Library. Rolling over a menu item and stopping will show
the description of that Script as a tool tip. Selecting a menu item will
execute that Script.

**Default Variables**

The following variables are pre-defined by the time your script runs and
are useful variables which you will most likely use. They are also shown
as default text on any new script for reference.

  - blueData  
    reference to the current blue project's BlueData class

  - selectedSoundObjects  
    array of soundObjects currently selected on the timeline

  - userConfigDir  
    location of the user's .blue settings directory

  - blueLibDir  
    location of blue's lib directory

  - blueProjectDir  
    directory of the current Blue project

**ScriptingUtils**

Included with Blue is a python file named ScriptingUtils.py that
contains useful utility functions.

  - alert(message)  
    Shows message to user using dialog, much like JavaScript alert
    message

  - info(message)  
    Shows message to user but uses dialog with scrollable text area.
    Useful for showing large amounts of text or text with tabbed
    formatting.

  - infoTabs(message, title)  
    Like the info function, but messages are added as tabs to a central
    tabbed pane in an information Dialog. Each call to infoTabs will add
    a new tab with the title given and the contents of the tab will be a
    scrollable textarea with the message. Tabs can be removed by right
    clicking a tab and selecting remove from the popup menu.

  - objectInfo(object)  
    Lists methods and properties for an object. This is especially
    helpful when editing a script and either not knowing or having
    forgotten the properties of an object, you can show what they are
    using this function. Information will be shown in the same manner as
    the info function.

To use the ScriptingUtils, use an import statement like this at the top
of your script:

``` 
from ScriptingUtils import *
  
```

**Example Scripts**

The following script scales the time of the selected soundObjects by
multiplying the startTime and duration of each soundObject by a value
given by the user.

``` 
from javax.swing import JOptionPane
from ScriptingUtils import *

retVal = JOptionPane.showInputDialog("Enter Time Factor for Stretch", 1.0)

try:
  val = float(retVal)
  for i in selectedSoundObjects:
    i.startTime *= val
    i.subjectiveDuration *= val
  alert("Scaled start time and duration of objects by value %f"%val)
except:
  alert("Value entered was not a floating point number")
  
```
