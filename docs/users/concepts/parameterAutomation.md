# Parameter Automation

## Introduction

Blue allows for a few ways to enter in values to automate parameters
over time. The parameters that can be automated are those in
BlueSynthBuilder Instruments, Mixer Effects, Mixer Sends, and Mixer
Volumes. The following sections will describe how to use Parameter
Automation and technical details in how this all works within the
context of Blue and Csound.

## Available Parameters

Besides the Volume sliders in the mixer and level amount on mixer sends,
the following GUI Parameters are automatable when found in
BlueSynthBuilder instruments and Mixer Effects:

  - Knob

  - HSlider

  - HSliderBank

  - VSlider

  - VSliderBank

  - XYController

  - Dropdown

  - Checkbox

  - Line Object

  - Value (hidden)

## Assigning Parameters

Automations for Parameters are assignable to SoundObject LayerGroup
Layers that exist in the root Score by selecting from the popup menu
that appears when selecting the "A" button on a SoundLayer's panel (on
the left of the timeline). The menu shows what Parameters are available
to use from Instruments and the Mixer. Those with normal color text are
Parameters which are not currently automated, those in green are ones
currently automated in that SoundLayer, and those in orange are ones
which are currently automated on a different SoundLayer. Selecting
normal color text will enable automation for that parameter on the
SoundLayer, while selecting a green colored text one will disable
automation for that parameter, and selecting an orange one will move it
from the layer it is currently on to the one being worked with.

## Score Timeline Modes

The Score timeline has three different modes:

Score  
:   This is the primary mode for adding and editing SoundObjects.
    Parameter Automations will be drawn but are not editable in this
    mode.

Single Line  
:   This is the primary mode for editing line points for Parameter
    Automations. The user is able to edit a single line at a time per
    SoundLayer, and can enter and remove points, modify points by
    dragging them, as well as selecting a region and move the the points
    by dragging the region. While dragging the region, the region will
    show that data will overwrite the area dragged to. This overwriting
    will not be committed however until the user releases the mouse
    button.

Multi Line  
:   This is the mode for selecting and moving line points for all
    Parameter Automations on a single or multiple SoundLayers. The use
    can click and drag to create a selection region, then click within
    the selection region to move all points from all lines within the
    region. While dragging the region, the region will show that data
    will overwrite the area dragged to. This overwriting will not be
    committed however until the user releases the mouse button.

## Editing Automations

To edit line values in a Parameter Automation, first switch to Single
Line mode. Then, for the desired SoundLayer, select which of the
assigned parameters to edit. This can be done either by using the
SoundLayer Edit Panel's Parameter selector (found on the second row
below the row with mute, solo, etc.; only shown when SoundLayer size is
greater than 1), or by right-clicking the SoundLayer in the main area
and selecting from the popup menu (the actively editable Parameter
Automation will be disabled from the popup menu).

Once a parameter is selected, the user can change the color of the line
by using the color box next to the parameter selector panel on the
SoundLayer Edit Panel. To add new points, use the mouse and mouse over
to where you would like to add a point and press the left mouse button.
After pressing, the point will be added, and the user can drag to modify
the just entered point. Releasing the button will complete the addition
of the line point. To edit an existing point, mouse over a point until
it is highlighted in red, then press the left mouse button, drag, and
release when finished. To remove an existing point, mouse over a point
until it is highlighted and press the right mouse button.

To manipulate data for a single automation, use shift-drag to select a
region of the automation data. Once selected you can ctrl-c to copy and
ctrl-click to paste that data. You can also drag the selection to move
the region or drag at the edges to scale the automation data. ctrl-z may
be used to undo the above changes.

For finer control over the line points, right-click on the parameter
line panel when not over an existing line point. A popup menu will
appear and select "Edit Line Points". A dialog showing a table of line
points with time values in one column and parameter values in a second
column. The user can then enter in values by text entry.

For changes of automation data for an entire layer or set of layers, use
multi-line mode. This will alow you to select, copy/paste, drag, and
resize automation data. If shift is used when making a selection, it
will also select underlying ScoreObjects. This will allow you to move
both automation and ScoreObject data together. If you the selected
region completely contains ScoreObjects (i.e., no part of any selected
ScoreObjects extend outside of the region) you can also scale the
automation and ScoreObject data together.

## Technical Details

Blue's parameter automation system is implemented in Csound code in a
few different areas. For instruments and effects, when an Automatable
Parameter is not set for automation, it will replace its replacement key
in its ORC code with a constant value from the UI item. If the parameter
is set to allow automation, then the replacement key is replaced with a
Blue generated global k-rate signal name. Therefore, when coding
instruments and effects, the user should be careful to make sure that if
they want the parameter to be automatable that the replacement key is
placed in the code where a k-rate signal is legal to use. If the user is
not expecting to automate that value, then it would be safe to place
that replacement key wherever a constant is allowed. This is also useful
to know when migrating older BSB Instruments and Effects to be used with
the purpose of Automation.

After setting up the Instrument and Effects, Blue will then handle
compiling the automations into a way that works with Csound. Currently,
Blue will first calculate init statements from where the render start
time is and add that to the CSD to make sure that the global krate
signals will be initiated by the time any instrument could use them.
Then, Blue creates instruments for each parameter that will be
automated. The instruments are driven by score and either an instrument
for continuous data or resolution dependent data will be created. Score
is then generated for the parameter automation data that together with
the instruments generated will create the signals.

Care was taken to optimize the generated score and instruments.
Unnecessary score will not be generated if multiple points with the same
value are found as well as when there is a discontinous break in the
values. Values from the parameter automation will also correctly be
generated from render start time until render end time (if used). For
parameters with resolution, every value is a discrete jump, so the
instrument for resolution based parameters will on it's i-time run will
simply set the new value and then turn the instrument instance off to
save CPU cycles.

## Shortcuts for Automation Lines and Automation Line Points

AL = Automation Line, AL Point = the point on the Automation Line

Single Line  

| Action    | Result                                                                                                                                                                                                |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| leftclick on AL       | on active AL, create AL point at mouse pointer                                                                                                                                                                               |
| rightclick on AL point      | delete specific AL point                                                                                                                                                                                |
| rightclick in Layer   | show submenu of active AL: Select Parameter, Edit Points, Import BPF, Export BPF                                                                                                                                                           |
| Alt+leftclick on AL  | create new AL point but without disturbing the Y axis. AL does not move                                                                                                                                             |
| Ctrl+leftclick on AL Point  | move AL point up and down on same X-axis position OR Move AL point to left of right on same Y-axis position                                                                                                         |
| double-click | if selecting on timeline, select all soundObjects on layer where mouse clicked                                                                                                                              |
| create marquee (= selection window), SHIFT+drag     | marquee selects one or more adjacent AL points. All AL points in it can be moved to left or right                                                                                                                             |
| change position of AL points inside marquee      | marquee selects one or more adjacent AL points. Inside marquee, by pressing Ctrl the selected AL points can be moved to up/down (y values) |
| copy AL points inside marquee    | Ctrl+C to copy, then click with mouse pointer somewhere to deselect, then Ctrl+ (on the same Layer!) use mouse pointer where you want to paste the marquee AL points and click on that spot to paste                                                                      |
| delete AL points inside marquee      | press Delete key on keyboard                                                                                                                                                             |
| ctrl-z       | undo last action                                                                                                     |
| resize AL| leftclick and drag to select the AL Points. Hover mouse pointer over left or right side of Marquee, the cursor changes, then drag to re-scale                                                                                |                                                                                                                                                              |

Multi Line  

| Action    | Result                                                                                                                                                                                                |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| leftclick+drag      | the marquee selects all the ALs and AL points inside Marquee                                                                                                                                                                           |
| leftclick+drag     | the marquee selects everything that is inside: all ALs and AL Points                                                                                                                                                                             |
| leftclick+SHIFT+drag  | the marquee selects everything that is inside: AL points + Objects                                                                                                                                                           |
| move marquee  | leftclick and move to the left or right                                                                                                                                           |
| copy all inside marquee (Ctr+c)  | to paste, deselect, then Ctrl+click to paste at mouse pointer                                                                                                   |
| delete everything inside Marquee | press Delete key on keyboard
| ctrl-z       | undo last action                                                                                                     |
                                                                                        |

_A tutorial video on Parameter Automation can be found [here](https://www.youtube.com/watch?v=ODaL3N24_Dk)._
