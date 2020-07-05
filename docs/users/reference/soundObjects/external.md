# External SoundObject

## Introduction

Accepts NoteProcessors: no

Allows you to write script within Blue and execute an external program
on that script, bringing in generated notes back into Blue. There is a
field for 'command line' as well as a text area for your script. When
this soundObject is called for generating it's notes, it will write the
text within the text area into a temp file and then use the
user-supplied 'command line' to execute on that temp file.

When Blue runs the commandline, it defaults to appending the temp file's
name to the end of the commandline. For example, if you wrote a perl
script in the text area and used a commandline of "perl", then when Blue
runs the command, it would be something like "perl
/the/path/to/the/tempFile". If you need to explicitly put the name of
the temp file somewhere else in the command line than the end, you can
use "$infile" in your commandline. For example, if you needed something
like "myCommand somefileName -w -d --some-other-flags" and had to have
it in that order, you could type "myCommand $infile -w -d
--some-other-flags" and Blue will replace that $infile with the temp
file's name instead of appending it to the end.

When designing your scripts that you will be using with external
programs, you should either set commandline flags to the program or
script your script in a way that it will write out to stdout(to the
screen), as that is what Blue will capture and bring in as notes.

A second method for the external object was created for bringing in
score data after running the commandline as some programs (i.e. Cmask)
do not have any possible way to write directly to stdout. The process is
to use "$outfile" in the commandline to pass in a filename to the
program. That $outfile will be the name of a temp file that the external
program will write score data into. After the program is finished, Blue
will open up that temp file, read in the score data, and then remove the
temp file. So, if your program needed a commandline of something like
"myProgram -i inputfilename -o outputfilename" and no options for
writing to screen, then you could use a commandline of "myProgram -i
$infile -o $outfile".

There is a test button that you may use to check to see that Blue
properly brings in the generated notes.

##  Example Command Lines

This is a list of commandlines to use when using other programs with
Blue and any notes that may concern other programs when being used with
Blue. These commandlines assume that the programs being called are on
the system path. If not on the path, please append the full path to the
program before the program name.

  - CMask  
    Homepage: <http://www.bartetzki.de/en/software.html> for the Linux,
    Windows and old Mac builds,
    <http://www.anthonykozar.net/ports/cmask/> for OSX Author: Andre
    Bartetzki
    
    Comandline to use:
    
        cmask $infile $outfile

  - nGen  
    Homepage: <http://mikelkuehn.com/index.php/ng> Author: Mikel Kuehn
    
    Comandline to use:
    
        ngen $infile $outfile

  - AthenaCL  
    Homepage: <http://www.flexatone.org/athena.html> Author: Christopher
    Ariza
    
    Comandline to use:
    
        python athenaPipe.py $infile

Examples of the External SoundObject, as well as athenaPipe.py, can be
found in the blue/examples/soundObjects folder.
