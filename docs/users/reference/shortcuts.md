# Shortcuts

## General Shortcuts

| Shortcuts    | Description                                                           |
| ------------ | --------------------------------------------------------------------- |
| ctrl-1       | brings the score tab into focus                                       |
| ctrl-2       | brings the orchestra tab into focus                                   |
| ctrl-3       | brings the tables tab into focus                                      |
| ctrl-4       | brings the globals tab into focus                                     |
| ctrl-5       | brings the project properties tab into focus                          |
| ctrl-6       | brings the soundfile tab into focus                                   |
| alt-right    | brings the next manager tab into focus                                |
| alt-left     | brings the previous manager tab into focus                            |
| F9           | start/stop a render (equivalent to pressing the render/stop button)   |
| ctrl-g       | generate a CSD file                                                   |
| ctrl-shift-g | generate a CSD to screen (for previewing)                             |
| ctrl-o       | open a work file                                                      |
| ctrl-s       | save work file (must use "Save as" from file menu if a new work file) |
| ctrl-w       | close the current work file                                           |
| alt-F4       | close Blue                                                            |

## Rendering

| Shortcuts     | Description                                                                                                   |
| ------------- | ------------------------------------------------------------------------------------------------------------- |
| F9            | Render project using project's real-time render options                                                       |
| shift-F9      | Render to Disk and Play using project's disk render options and playing with Blue's builtin sound file player |
| ctrl-shift-F9 | Render to Disk using project's disk render options                                                            |
| spacebar      | Render project using project's real-time render options when Score is in focus                                |


## Score Timeline

| Shortcuts         | Description                                                                                                                                                                                                     |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| spacebar          | Render project using project's real-time render options |
| ctrl-c            | copy selected soundObject(s)                                                                                                                                                                                    |
| ctrl-x            | cut selected soundObject(s)                                                                                                                                                                                     |
| ctrl-d            | duplicate selected soundObject(s) and place directly after originals                                                                                                                                            |
| ctrl-r            | the repeat selected SoundObjects by copying and placing one after the other n number of times where n is a number value entered by the user (user is prompted with a dialog to enter number of times to repeat) |
| ctrl-click        | paste soundObject(s) from buffer where clicked                                                                                                                                                                  |
| shift-click       | on timeline, paste soundObjects from buffer as a PolyObject where clicked, if only one sound object is in the buffer it will be pasted as the type it is and not a PolyObject                                   |
| shift-click       | when selecting soundObjects, adds soundObject to selected if not currently selected and vice-versa                                                                                                              |
| double-click      | if selecting on timeline, select all soundObjects on layer where mouse clicked                                                                                                                                  |
| ctrl-t            | show quick time dialog                                                                                                                                                                                          |
| right click       | pops up a popup menu for adding soundObjects and other tasks                                                                                                                                                    |
| left click + drag | creates a selection marquee for selecting multiple soundObjects (when Score mode)                                                                                                                               |
| 1                 | switch to Score mode                                                                                                                                                                                            |
| 2                 | switch to Single Line mode                                                                                                                                                                                      |
| 3                 | switch to Mult Line mode                                                                                                                                                                                        |
| left              | nudge selected soundObjects one pixel to the left                                                                                                                                                               |
| right             | nudge selected soundObject one pixel to the right                                                                                                                                                               |
| shift-left        | nudge selected soundObjects ten pixels to the left                                                                                                                                                              |
| shift-right       | nudge selected soundObjects ten pixels to the right                                                                                                                                                             |
| up                | move selected soundObjects up one layer                                                                                                                                                                         |
| down              | move selected soundObjects down one layer                                                                                                                                                                       |
| ctrl-left         | decrease horizontal zoom                                                                                                                                                                                        |
| ctrl-right        | incrase horizontal zoom                                                                                                                                                                                         |

##  Orchestra Manager


| Shortcuts       | Description                                                                           |
| --------------- | ------------------------------------------------------------------------------------- |
| ctrl-left click | if on the column header of the instruments table, will enable/disable all instruments |


## In a text box

| Shortcuts    | Description                                                                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| right click  | pops up a popup menu that contains entries for opcodes as well as user-defined entries from the code repository                                     |
| ctrl-space   | brings up a dialog that shows all possible opcode matches for the current word being typed in (code completion)                                     |
| shift-F1     | if cursor is within a word that is an opcode, attempts to look up manual entry for that opcode                                                      |
| shift-F2     | if cursor is within a word that is an opcode, attempts to find a manual example CSD for that opcode and if found opens a dialog showing the example |
| ctrl-;       | comment out line or selected lines (prepends ";" to every line)                                                                                     |
| ctrl-shift-; | uncomment out line or selected lines (removes ";" at beginning of every line if found)                                                              |

## Editing GenericScore, PythonObject, JavaScriptObject


| Shortcuts | Description                                                                                           |
| --------- | ----------------------------------------------------------------------------------------------------- |
| ctrl-T    | when the text area is focused, ctrl-T runs test on the soundObject (same as pressing the test button) |

