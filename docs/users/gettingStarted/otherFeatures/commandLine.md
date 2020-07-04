Command Line Options for Blue {#commandLine}
=============================

To view the options that Blue has from the commandline, type \"blue
\--help\". After that, you should see information printed to the
console. Some of these flags are used by the Netbeans Platform that Blue
is built upon. The following are ones Blue uses itself:

      -c, --compile <arg>       
      -o, --output <arg>

The flags above allow for commandline compilation of a .blue project
into a CSD. Both flags must be set to work. An example of usage is:

    blue -csomeFile.blue -ooutput.csd

This will use somefile.blue and produce output.csd. The generated CSD
will use the Disk Render settings for the project. Using the commandline
option for compiling .blue projects is useful for automating builds of
projects using a build system like Make, Rake, Ant, or other tool.
