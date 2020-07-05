# Rendering

## Introduction

Blue offers a number of ways to render a project, each method useful for
different purposes you may have. The following section explains the ways
which Blue is able to render a .blue project file as well as possible
use-case scenarios to guide you on how that feature may be useful.

## Render Methods

### Render in Real-time

Rendering in uses the project's Real-Time render settings to render the
project in realtime to the users soundcard. This is the most common
rendering one will likely use. To use this, you can press the play
button at the top of the window, use the "Project-\>Render/Stop Project"
menu option, or use the F9 shortcut key.

### Generate CSD to Screen 

Blue's general method of communicating with Csound is by generating a
CSD file and calling Csound to run it. For debugging purposes, it is
often useful to see if what you think you are doing inside Blue is
matching the generated CSD file. You can generate the CSD to screen by
using the "Project-\>Generate CSD to Screen" menu option, or by using
the ctrl-shift-g shortcut.


### Generate CSD to Disk 

If you'd like to generate a CSD from the current project to a file, you
can do so by using the "Project-\>Generate CSD to File" menu option, or
by using the ctrl-g shortcut.

### Render to Disk

The Render to Disk option will use the project's Disk Render Options
from its project properties to generate a soundfile on disk (format of
file depends on how user configures commandline options). I've found
this useful for rendering a wav to disk and converting to MP3 to listen
to on the go so I can review my current work. To render to disk, you can
do so by using the "File-\>Render to Disk" menu option or use the
ctrl-shift-F9 shortcut.

### Render to Disk and Play

The Render to Disk and play option will use the project's Disk Render
Options from its project properties to generate a soundfile on disk and
after finishing, play the generated file using Blue's soundfile player,
located in the SoundFile manager tab. This feature is useful if you're
working on a piece that has processing demands beyond what your computer
is capable of in realtime, so you can have it render to disk first and
then play, which will give very smooth playback. It is also useful if
you render in realtime with lower quality settings but use higher
quality settings for final project output, as you can occasionally test
what the output would be like using this feature. To use this option,
you can use the "File-\>Render to Disk and Play" menu option or use the
ctrl-F9 shortcut.

### Render to Disk and Open

The Render to Disk and Open option will use the project's Disk Render
Options from its project properties to generate a soundfile on disk and
after finishing, open the generated file using the configured command
with the program options. This command may differ from the external
command to use with "Render to Disk and Play". To use this option, you
can use the "File-\>Render to Disk and Open" menu option.
