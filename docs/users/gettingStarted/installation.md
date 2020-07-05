# Installation

## Requirements

Blue requires Java 11 or greater JVM (Java Virtual Machine) to be
installed on your system, as well as Csound. Java installations usually
come in two flavors: a JRE (Java Runtime Environment) which contains
just a JVM for running applications, and a JDK (Java Development Kit)
which contains the JVM as well as development tools. Because Blue comes
with scripting tools that use JDK features, it is recommended to install
the full JDK, and not just the JRE.

To test to see if you have a JVM installed and what version, at a
command prompt type "java -version". If you see something along the
lines of "command not found" then you need to install a Java Virtual
Machine.

If you do not have Java installed, the recommended JDK to install is
AdoptOpenJDK, available at:

<https://adoptopenjdk.net/>

On this page, look for the download link for your platform. Be sure to
choose the version of JDK that matches your CPU type and Csound version
(choose 64-bit if in doubt).

## Installing Blue

To install Blue, you should download the latest ZIP file from the Blue
releases page [here](https://github.com/kunstmusik/blue/releases). For
macOS users, download the macOS zip file which contains Blue.app. You
can double-click the Application to run, as well as copy it to your
Applications folder to install it.

For Linux and Windows users, download the appropriate zip file and unzip
it. Inside of the bin folder you will see a "blue" script for Linux or a
"blue64.exe" file for use on Windows. (A 32-bit version, "blue.exe", is
also included for those using an older version of Csound that is
compiled for 32-bit Windows.)

Note: After starting Blue, you may want to explore the example projects
and pieces found in the Blue/example folder (or right-click and explore
contents of Blue.app/example if on OSX).

### Platform Specific Notes

The section below has notes for individual platforms.

Blue uses the right mouse click often to show popup menus. If you do not
have a right mouse button, you can use ctrl-click for all "rt-clicks"
that are mentioned in this documentation.

To make use of the function key shortcuts (F1-F12), you will need to go
into System Preferences, choose Keyboard, then enable "Use all F1, F2,
etc. keys as standard function keys".

## Installing Csound

Blue is able to interact with Csound either by calling Csound like a
command-line program (classic Blue), or by directly interacting with
Csound via the Csound API. Instructions on setting up Blue for each
method is described below as well as discussion on benefits and
limitations.

### Using Blue with command-line Csound

This may be considered "classical" Blue usage and interaction with
Csound as this was the method by which Blue ran with Csound for the
first eight years in existance. The way Blue operates in this mode is by
rendering the .Blue project into a temporary CSD file on disk, then
calling Csound with that temporary CSD file in the same way as if you
were on a command-line shell and executing Csound yourself with that
file.

The benefit to this mode of Csound usage is that it is easier to switch
out your version of Csound or use multiple versions of Csound on the
same computer. It is also a little more stable than using the API in
that if Csound crashes for some reason, it won't take down Blue with it.
Also, it may be more performant to use the command-line mode. These
benefits however need to be weighed against the benefits of using the
API, which is described below.

To use the command-line version, one needs to set up the Csound
executable option for Realtime and Disk Render settings in [Program
Options](../programOptions).

### Using Blue with the Csound API

Enabling Blue to use the Csound API when rendering with Csound opens up
the ability to manipulate and edit widget values and automations in
realtime during a render, as well as the ability to use BlueLive on
Windows. Because of its enhancement to the user-experience while
rendering and composing, it is the preferred method of using Blue with
Csound. Blue should work out-of-the-box with the API if Csound is
installed using the installers provided on Github, or installed via a
package manager if on Linux.

<div class="note">

<div class="title">

Note

</div>

Blue currently only works with the API if the version of Csound used is
compiled using 64-bit doubles. (The float version is not supported when
using the API.) There are technical difficulties in supporting two
different versions of Csound API in the same build and it is not known
if or when the float build will be supported. For users interested in
using the float build of Csound with Blue, you will need to run Blue
using the command-line Csound mode.

Additionally, the architecture that Csound is compiled for must match
the architecture of the Java runtime you are using. For example, on
Windows, Csound is currently only built for x86\_64/amd64 CPU (i.e.
64-bit Windows) and not x86 (i.e. 32-bit Windows). In this case, you
will need to run Blue using a 64-bit Java Runtime. For OSX, this is not
an issue as Csound is compiled as a universal binary for both i386 and
x86\_64. On Linux, it is likely that the version of Csound you
install/compile and the Java Runtime that you install will likely be the
same, but if the API does not show as available it may be something to
check.

</div>

Blue uses the CsoundJNI Java binding for Csound. This requires that Blue
can find your installed version of Csound but is configured to do so for
standard Csound installations. If the API is not enabled when starting
Blue, the following explains how to setup the API on different
platforms.

Users using the Windows Installer for Csound should use the double
precision version from Github. (This is the default.) After installing,
the installer should setup everything such that Blue should work with
the API. If for some reason it is unable to do so, you can modify the
blue/etc/blue.conf file to tell Blue where to find the csound64.dll. For
example, if the directory where csound64.dll is located is in
c:\\myCsound, open up blue/etc/blue.conf and modify the default so that
it contains:

``` 
default_options="--branding blue -J-Xms256m -J-Xmx768m -J-Djava.library.path=c:/myCsound"
        
```

Linux users should install a doubles version of Csound. The version of
Csound found in package repositories should be one compiled for doubles.
After installing Csound, modify the blue/bin/blue file. Search for the
lines that contain "-J-Djava.library.path=/usr/lib/jni" and modify
/usr/lib/jni (the default for Debian/Ubuntu-based systems) to the
directory where libcsound64.so is located.

macOS users may use the installer for Csound from Github, install Csound
with Homebrew, or self-compile. CsoundJNI is configured to find
CsoundLib64 in all of the above scenarios for default installations.

To check if the API is enabled, open Blue and open up the Program
Options. This is available from the Blue-\>Preferences menu option on
OSX, and from the Tools-\>Options menu option Windows and Linux. In the
Blue tab, under both Disk and Realtime Render settings, there is an
option called "Render Method". If Csound 6 is availble on your system
and Blue was able to find it, it will show a "Csound 6 API" option. If
the Csound 6 Java API could be loaded, you will only have the
"Commandline Runner" option which is always available.
