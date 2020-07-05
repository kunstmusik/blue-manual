# Scripting

The blue music composition environment entails the use of timelines on
which SoundObjects are placed. these SoundObjects are basically lists of
notes, grouped as a single perceived object. These can be as simple as a
single note, or a group of notes one might handle as a "motive", the
"bassline for the A phrase", "the results of an predetermined matrix of
sounds and silences through 28 flippings of coins", or "the stochastic
group motion of migrating birds mapped to 17 instruments that produce
variable timbres", etc. but underneath it all, regardless of what
SoundObject you use, ultimately the SoundObject will produce notes in
which blue will add to the running score and output to a .CSD file.

Seen this way, blue represents a sort of visual note-generator
scheduling system. when blue was earlier on in it's development, I
realized that in creating blue, I created a simple generic temporal
framwork which would allow people to create score generators and only
worry about generating those scores, while easily adding them to the
framework of blue which would allow the manipulation and scheduling of
those score generators without the original authors having to worry
about developing that aspect of it. as my imagination began to wander, I
saw that things like cmask, mother, cybil, and other scoring languages
that have been built over time for csound could be used in the way
they've always been used, but that they could easily be integrated into
blue.

for myself, the SoundObjects I've built have offered me the ability to
separate my concerns: as the author of blue, I concern myself with
finding new ways to organize and manipulate SoundObjects, and as a
SoundObject author, I concern myself just with making objects that
generate notes, leaving the scheduling of that SoundObject to the
framework.

But, not everyone programs in Java, and there are also scripts and
script libraries to be used in other languages already made.

Having seen that the SoundObject system and temporal framework of blue
was a pretty open architecture, I decided at the time to explore the
possibilities of using script within blue by creating the Python
SoundObject so that i could use maurizio umberto puxeddu's Python pmask
library within blue. what that allowed was for the ability to write
Python scripts within blue, blue executing and bringing back in the
generated notes from the Python script and integrating that with the
other notes of the native Java SoundObjects.

After successfully developing and proving the possibility to myself, I
continued on to build other SoundObjects as user's requested or as I
desired for my own compositional explorations.

One day, some time back, a user suggested that I build a generic
external SoundObject that would let you write any script within blue,
provide a commandline to be used, and have blue write the script to a
temporary file, run the commandline on it, and bring the generated notes
back into blue. busy at the time, I later did build that SoundObject,
and it opened up a world of possibilities.

With the new external SoundObject, it became possible to write script in
any language within blue. this means one could use not only scripting
languages like perl, Python, shell scripts, batch files, JavaScript,
wscript, etc., but also run specially created text input for score
generators like CMask, nGen, etc. (note: cmask does not currently work
within blue, as it is unable to print to stdout; more on this and
possible ways around it later). It also meant that other people's work
on score generating libraries and scripts, regardless of language, now
had the ability to be reused within blue.

As blue has developed the past couple of years, from its initial goals
of embedding timelines within timelines, to its current state as a
generic temporal framework and all-around composition environment, I've
always developed with the mindset of keeping this as open and generic as
possible, to build a tool that could grow as I knew I'd always be
exploring new things in composition. These days, the inclusion of these
two SoundObjects, the external SoundObject and the Python SoundObject,
are now becoming part of my everyday use as I work with blue, allowing
me to explore ideas rapidly, creating objects and functions which follow
the models of my musical work, and which also serve as possible
prototypes to new SoundObjects which I may later decide to create in
Java and add to blue.

From my own experience, I'd highly recommend to anyone that they learn a
little bit about scripting and how to use it to achieve their musical
goals, as I've found the experience highly liberating and musically
rewarding .

## Why Use Scripting?

For some, the use of scripting or programming may never be a factor in
how they go about creating their music, as the tools they have already
are enough. But for some, it may be easier to go about expressing their
needs musically by use of script. and for others, there just might not
be anything available to do what one wants to do.

Within blue, there are many ways to go about expressing and designing
your musical work. Included with blue are the built in SoundObjects
which can take in standard csound scores. Together with the use of the
noteProcessors in blue, already there are the tools to write standard
csound scores, move them in time, and manipulate those scores by adding
or multiplying pfields by user given values(to achieve things like
scaling amplitudes or transposing notes) or retrograde notes.

However, lets say you might find scripting in your prefered language to
be easier to achieve your goals, or you want to use a scoring language
other than csound's standard score format, or someone has advertised a
new set of scripts or libraries to use. you could do all of this within
blue.

In my case, I was recently modeling an object system that represented a
musical model that hasn't been used much in current electronic music
programs. I enjoy using the blue environment, but this was a case where
I needed to do some work by programming, and the existing tools didn't
exist in blue. The process was pretty experimental and the use of
compiled languages like Java would have been slower than using a
scripting language, as the prototypes for the object model I was
building were changing rapidly. What ended up happening is that I worked
in Python within blue using the Python SoundObject, developing my core
objects, and was then able to rapidly experiment with composing with
these objects by using other Python SoundObjects which used my core
class definitions, moving them around visually and listening to how the
musical output. I could have done all of this outside of blue, strictly
using script, but the visual element and the ease of quickly copying
blocks of Python script and moving them around, made experimentation
much quicker and more apparent to me. A great benefit out of all of this
is now I have a prototype which I can then perhaps use to program
SoundObjects for blue in Java, maybe adding a GUI to the object to
control parameters, making the process of using the SoundObjects that
much easier.

The total process of prototyping and experimenting was a great
experience, as I felt that each part of the process functioned to help
me best express what I was going after. I used script to quickly create
the objects I wanted to use to model the musical model I had in mind,
and then used blue to experiment with those scripts to hear the sounds
they could produce.

Finally, it lead to strong candidates for objects which I could go on to
build in a more generic fashion for everyone to else to use in blue,
adding to the compositional possibilities.

In the past, I've also built simple functions to do a very specific
task, like "add a value to all p4's of all notes". Something like this
could be the case where you have a simple task that might be monotonous
and you could probably achieve your goal much more quickly by a little
script. (For example, I want to generate a test file for my orchestra
and all it has are notes lasting two seconds duration, whose start times
are every three seconds; something like this could be done in maybe 6-10
lines of script, regardless of the size of the orchestra.)

Those are some of my reasons for the use of script for musical work, and
I'm sure others have their own reasons. In the end, it's up to you to
evaluate your situation and see if it will aid in your work or not.

## Scripting and blue

Every once in a while someone releases a new program for score
generation, a utility they've decided to make for their own benefit that
they've graciously shared with the community. Often, these musical tools
are exclusive in their use, meaning they're good for their use, but are
difficult to integrate with other work.

For example: say you're working on a piece and want to use an external
score generator to generate a score to add to your piece. now, in
experimenting, you might have to:

1.  Create your csound score

2.  Create your input file for the external score generator in another
    file

3.  Run the score generator

4.  Copy the generated score into your csound score file

5.  Repeat process as you experiment

Now imagine that process to the nth degree if you decide to use multiple
external programs\!

However, with blue, you can do all of that in one environment. You could
write your standard csound scores as well as your input to your chosen
score generator within blue, press the play button and then have blue do
the work of going out to compile the score generator material and bring
it back in, integrate it with your csound score, and output a single
unified score file. You get the benefit of using the visual timeline to
move your generated score blocks around in time, as well as only having
to concentrate on the score input to the score generator, leaving all of
the tedious work to blue to handle.

Or, say you're working on a score generating library in a scripting
language. Now that you've finished it, you want to start working with
it. but say you want to also do standard csound scores along with your
scripts; having to do the two in the single scripting environment might
not be optimal, as you would constantly have to use "print()" functions
or use note objects, when it might just be easier to write "i1 0 1 2 3 4
5" and work with that for some of your work, and use your libraries for
others. In this case, blue can handle that in that you can call your
libraries you've developed and script the parts you want to script
within blue, as well handle all of the standard csound score type work.

Within blue there are currently two main objects for scripting, the
Python SoundObject and the external SoundObject. The external
SoundObject runs scripts outside of blue and brings the results back
into blue, and the execution of those scripts is as fast as it would be
running the script outside of blue. With the external SoundObject, one
may also choose from a variety of scripting and score generating
languages to use. The Python SoundObject is limited to Python, and runs
Python scripts much slower than they would be for running a Python
script outside of blue using the external SoundObject. However, the
PythonObject has two main features which may influence your decision in
which to use it or not: it does not require Python to be installed on
the system as it uses Jython to interpret the script (Jython is an
all-Java implmentation of the Python interpreter; for more information
about Jython, visit http://www.jython.org ), and it does not
reinitialize the interpreter between uses.

The second point regarding the Python SoundObject may need some
explanation: by not reinitializing the interpreter between uses, all
Python SoundObjects in blue all share the same interpreter. By doing
this, you can define variables, functions, and objects in one block,
while using those variables in another block.

As an example, in my recent work with the Python SoundObject, I've set
up the first PythonObject in my blue work file to have nothing but class
definitions as well as function definitions. The second PythonObject
block only has script that sets up instances of those classes written in
the first PythonObject, and in this second block I did all of my
initialization work for these classes. Finally, throughout the rest of
the blue work file, I had PythonObjects that used the class objects I
set up in the second PythonObject. This would not be possible using the
external SoundObject, as once a script is run, all existing information
in memory for that script is lost (unless you decided to make some kind
of serialization scheme to write data to a file to be accessed by other
scripts, or perhaps were using a web server to maintain state data).

The next two sections below will explain how to use the two different
SoundObjects, and for the Python programmer, help you determine when you
might want to use one object verse the other.

## External SoundObject

The External SoundObject is a generic object that allows you to write
script within blue to be executed outside of blue and have the generated
score be brought back in. The way this is implemented, blue will read in
anything that the external program writes to stdout. for most scripting
languages, this equates to a "print()" command of some sort in your
script.

The External SoundObject's editor takes in two inputs, a script and a
commandline to run on that script. technically, when blue is in the
score generating pass and comes to an external SoundObject, the external
SoundObject writes your script to a temp file, then runs the commandline
given, either swapping “$infile” with the name of the temporary file
generated, or appending the name of the temporary file to the end of the
commandline if no “$infile” is found.

Let's say you're writing a simple perl script:

``` 
 print "i1 0 2 3 4 5\n"
```

and you for your commandline you use:

    perl

or perhaps:

    /usr/bin/perl $infile

When blue goes to generate a .CSD file and comes across your external
SoundObject, what will happen is that:

1.  Your script will get written to a temp file (for this example, let's
    say it's "/tmp/temp4253.txt")

2.  blue executes the commandline given with that temp file.
    
    1.  For the first commandline, it'll then run:
        
            perl /tmp/temp4253.txt
    
    2.  For the second commandline, it'll then run:
        
            /usr/bin/perl /tmp/temp4253.txt

3.  perl runs, and will print "i1 0 2 3 4 5\\n" to stdout

4.  blue will get that output from perl, then bring that back in,
    convert it to blue Note class.

5.  blue then will shift the note over to the start time of your
    external SoundObject, then scale the note to the duration of the
    SoundObject.

And that's it\!

**Note.**

In general, all time values for start are from time-zero within the
SoundObject. This is like taking a three notes: you know one starts at
the beginning, one starts 1 second later, and one starts 2 seconds
later. No matter where you put those three notes, the relationship of
that block of notes is the same, one at the beginning, one 2 seconds
later, etc. so it is with SoundObjects in blue. When you make a script
to generate notes, have it start at time zero and let blue do the
scaling and translation of time for the SoundObject. blue was made this
way so that no matter what you generate within the block, the generated
notes will start at the start of the SoundObject and will last the
duration of the SoundObject.

Now, any script that has a commandline that can execute on a file will
work with blue. so, as another example, let's say you want to use Python
and you're using the pmask library. You have both of these installed on
your system and you know they work fine because you've tested them
outside of blue. Now, let's say you wrote the following Python script
(which really, was written by Hans Mikelson as a an example for using
pmask, taken from the CSound Magazine):

    from pmask import *
    
        
         density = Mask(UniformRandom(), PowerSegment([(0.0,
     0.03),  (20.0, 0.5)], 3.0), PowerSegment([(0.0, 0.08), (20.0, 1.0)], 3.0))
         duration = Mask(UniformRandom(), PowerSegment([(0.0, 
     0.4), (20.0, 3.0)], 1.0), PowerSegment([(0.0, 0.8), (20.0, 5.0)], 1.0))
         frequency_mask = Mask(UniformRandom(), PowerSegment([(0.0,
      3000.0), (20.0, 90.0)], 1.0), PowerSegment([(0.0, 5000.0), (20.0, 150.0)],
      1.0))
         frequency = Quantizer(frequency_mask, LinearSegment([(0.0,
      400.0), (20.0, 50.0)]), 0.95)
    
         index = Mask(UniformRandom(), PowerSegment([(0.0,
    2.0),   (20.0, 3.0)], 1.0), PowerSegment([(0.0, 3.0), (20.0, 5.0)], 1.0))
         panorama = Range(0, 1)
        
         amplitude = Lorenz('x')
        
         ss = ScoreSection(0.0, 20.0, 1, density, duration, 
    frequency,  index, panorama, amplitude)
    
        
         print str(ss)

and you tested it outside of blue and it worked fine. Well, now you
could create an external SoundObject in blue, paste in this script, set
the commandline to "python", and now have the notes imported into blue.

Let's try a non-scripting example now and use Mark Williamson's drum
pattern scoring utility to generate a drum pattern(available at
http://www.junklight.com). Mark's utility is itself a perl script, but
it takes in a text file using a scoring language he developed.

copying in the example drum.pat file into the scripting area:

    instrument1 "i1 $now .2 2000 2.2 0"
    instrument2 "i1 $now .2 2000 2.4 1"
    instrument3 "i1 $now .1 2000 4 1"
    instrument4 "i1 $now .2 2000 1.6 0.5"
    
    instrument5 "i1 $now .1 2000 4 0"
    pattern1 1 1 1 
    pattern2 1 1
    
    pattern3 1 1 1 1
    pattern4 1 1 1 1 1 1 1 1
    pattern5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    plist1 1 2
    ilist1 3 5 
    
    bar length 1 second
    time error .01
    # poly rhythm example
    loop 5 
    
     play 1 with 1
     play 2 with 2
    
    endloop
    # straight 4/4
    
    loop 5  
     play 2 with 1
     play 3 with 3
    
    
    endloop
    
    loop 5 
     play plist 1 with 4
    
     play 4 with ilist 1 
    
     play 3 with 1
    endloop
    
    
    loop 5 
     play plist 1 with 4
     play 5 with ilist 1 
    
     play 4 with 1
    
    endloop

Having unzipped the drumscript.zip into my home direcotory, I used the
following commandline:

    perl /home/steven/drumText/drums.pl -input

I ran the test button and got... nothing\! I got alot of exceptions
printed to the console. Running the drum script outside of blue, I saw
that by default, some logging information was being printed (the name of
the infile and input). Modifying mark's perl script a bit to comment out
those two print statements, I reran the script within blue and...
success\! The generated output from mark's script successfully was
rebrought back into blue.

Score generation programs can either print out to stdout or write out to
a file. If writing out to a file, care must be taken to use the $outfile
parameter of the External SoundObject so that after the external program
finishes, blue will know to grab the file's contents back into blue.

## Python SoundObject

The Python SoundObject is a Python-only scripting SoundObject which uses
the Jython Python interpreter (more information about this all-Java
Python interpreter is available at http://www.jython.org). Jython is
included with blue, and being so, it means that if you are using the
Python SoundObject in blue, you *do not need Python installed on your
computer*. The Python SoundObject is made in such a way that it in no
way uses any Python installations you may or may not have on your
computer, but instead only uses what is a part of Jython. If you want to
add extra packages and libraries to use with the Python SoundObject, you
may copy them into the lib/PythonLib directory or in the
userhome/.blue/pythonLib folder. As an example of adding your own
library, you can see that already included with blue in the
lib/PythonLib directory is the pmask library by Maurizio Umberto Puxeddu
(currently, I do not know where this library exists anymore on the
internet; if you know where it can be downloaded from, please let me
know and I will update this part of the documentation to better give
credit to Maurizio).

So, to clarify, having a Python interpreter installed on your computer
does not in any way affect the Python SoundObject within blue; they are
two completely different entities. also, if you have a library installed
for use with your Python interpreter installed on your computer, it will
\*NOT\* be accessible to the Python SoundObject. to use it, you will
have to copy it into the lib/PythonLib directory of blue.

Note: what you could do, also, is put the individual libraries you
install in the lib/PythonLib directory as part of your PythonPATH
environment variable, such that all of the libraries will be both
accessible to your Python interpreter on your computer as well as the
one in blue. It is not recommended to put the entire PythonLib directory
as part of your PythonPath, however, as the PythonLib has many of the
same files from the standard Python installation and may cause issues
with locating standard library files. However, I find that just copying
the library twice into both the PythonLib and my standard Python
install's directory to be sufficient and easier to manage.

### Using Python with the External SoundObject versus the Python SoundObject

This has been the most often asked question since the addition of the
external SoundObject blue, and when I initially put in the external
SoundObject, I thought that the Python SoundObject would become somewhat
unnecessary.

But a week or so after the addition the of externalObject, I started
using Python alot more in conjunction with blue and found that the
Python SoundObject has a few key benefits which make me use it now
everyday.

#### The Case for Using the External SoundObject

First of all, performance of the PythonObject is not as fast as using
the standard Python interpreter with the external SoundObject. For
simple scripts, the difference in speed isn't that noticeable, but when
using something like pmask which has alot of calculations when
generating score output, the speed difference does become an issue. If
speed is an issue, then you might choose to use the external
SoundObject, if the benefits listed below aren't an issue.

Also, if you have an existing Python interpreter installed on your
computer and have libraries installed and are just simply used to your
setup, then it might be just plain easier to use your existing Python
setup rather than dealing with where things are in blue and managing
having libraries installed for both the resident Python interpreter and
blue's PythonLib.

And to add to all of that, you may be using features which are part of
the most recent Python interpeter version, and those features may not be
available as part of Jython (more information as to what Jython supports
is available at the Jython homepage, http://www.jython.org). Also, if
you're using libraries which call native code, they will not work with
Jython.

So, if the Python SoundObject is slower, if you have to manage another
set of libraries, and you might not have all of the features of standard
Python available, why use the Python SoundObject at all?

#### The Case for Using the Python SoundObject

Now, just to let you know, I use exclusively the Python SoundObject when
I'm doing Python scripts in blue. I haven't come across any of the
standard libraries I've needed that were't included with Jython, and if
it's a sign of anything, Maurizio Umberto Puxeddu's pmask library works
fine with the PythonObject.

One of the things I used to do is keep an installation of blue on a zip
disk, including my work. The nice thing about this was that I was able
to take this disk and work off it while at work on a windows machine, as
well as take it home everyday to my linux machine and start up blue
without having to do anything different. Because I used the PythonObject
at that time, I didn't have to worry at all about anything installed
within either system, as all of it was contained within blue. It's also
a reassuring thought that if I took my work to a friend's computer, be
it a macintosh, windows, or linux pc, I wouldn't have to worry about if
Python was installed on their computer.

Besides these very practical issues, the way you can go about using the
PythonObject differs very much from the usage of Python with the
externalObject.

With the externalObject, each script run is its own entity, run with a
different interpreter. This means that memory is not shared between
instances of the externalObject: variables and results of execution in
one externalObject are not accessible to another externalObject.
However, with the PythonObject, the interpreter is not reinitialized
between runs, meaning you *can* share results between one PythonObject
and the next. This can of course lead to very convoluted methods of
developing scripts within blue, which is of course not recommended, but
it does have some very pragmatic possibilities which are very useful.

In my latest work with blue, I've been using almost exclusively the
PythonObject for all of my SoundObjects in blue. I did use some sound
SoundObjects initially to draft some sounds out, converting them to
instruments in the orchestra manager later. I also used genericScore
objects for writing some test notes for my instruments which I keep
around also for experimenting, but for the piece's final output, they
are not being used.

For setting up my piece, I developed some classes to use in Python,
instantiated multiple instances of the classes set with different
parameters, and then use those instances in different PythonObjects in
blue for creating the score of my piece. Because the interpreter is not
being reinitialized between uses by the PythonObject, I'm able to use
one PythonObject to hold only definitions of functions and classes,
another PythonObject which only has my initialization scripts that makes
instances of the classes defined in the first PythonObject, and from all
other PythonObjects, I use the instances from the second PythonObject as
my generators.

to better clarify, my first PythonObject has scripts like:

    class Yo(): 
        def do(self, a,b):
            print "doing something with " + str(a) + " : " + str(b)
    
        def yoyo(self, a,b):
            print "do something with a and b which are instances of Yo()"

while my second PythonObject has script like:

``` 
 
generator1 = Yo()
generator2 = Yo()
generator3 = Yo()
```

while all other PythonObjects in my piece have a minimal amount of
script, something like:

    generator1.generateNotes(input1, input2, input3)

I find that it's a nice way to separate the concerns of each object. as
I'm currently in the middle of working on the piece, I'm finding that
first PythonObject getting a bit big, so I'm thinking i'll split that
into different PythonObjects, which I can visually see labeled on the
timeline by changing their names to something like "generator classes",
"generator utility functions", "constants", etc. and probably in the
future, as I get to finishing this piece, I'll probably take all of
these class definitions and make a library of Python code out of it and
just have it installed into my PythonLib directory. But having the way
it is now I've found to be very convenient in development as it's easy
to find all of my code.

Note: the execution order of blue is top-down per soundLayer, meaning it
will process all SoundObjects in the first soundLayer, and if it finds a
polyObject, it will go down into that and process the first soundLayer,
etc. before going on to the next SoundObject. because of the execution
order, I can put all of my PythonObjects that have nothing to do with
note generation (my class definitions, utility functions, and
intitialization scripts) in the first few soundLayers of my piece and
know that they'll always get interpreted by the jython interpreter and
left in the memory space first before trying to process the other
SoundObjects.

Note: as a warning, also because of the execution order, if you reopen
your piece and try the \[test\] button on a PythonObject that uses code
from the initial PythonObjects and find that it's not generating notes,
it's because that code has yet to be entered into the memory space of
the interpreter. either individually running all of the PythonObjects
that deal with class definitions and initialization or just pressing the
\[play/stop\] button to generate your score will get those objects
interpreted and entered into the jython interpreter's memory.

Because of this alone, I find I use the Python SoundObject more than I
do using the external SoundObject. if I was to use the external
SoundObject and wanted work an even remotely similar manner, I'd have to
come up with some strange hack to maybe write script in one external
object have the execution of that object write that script into a file
which would have to be reimported into other scripts. not a horrible
hack, but enough for me to want to avoid, especially when it's not
necessary. (though, if you're programming in a scripting language
besides Python, you would hack to work in a manner like this...)

### Usage

For the PythonObject, instead of using a print command to stdout to
bring things back into blue, you simply assign the variable

    score

to the text string of your generated notes. when the PythonObject is
done processing, blue gets whatever value is assigned to that variable
and parses it as a text score, then proceeds to do the standard
operations of scaling and translating the notes in time, then applying
any noteProcessors which may have been added to it.

Also, should you need, the variable

    blueDuration

is assigned the value of the subjective duration of the PythonObject on
the timeline.

So, within your scripts, you have access to the duration of the
SoundObject should you want to make your script use that for any purpose
you might have. one example might be that you have a score generating
function that depends on duration, maybe if it has less duration it
produces notes with louder amplitude and than if it has a longer
duration.

Let's say you're writing a simple Python script:

``` 
 score = "i1 0 2 3 4 5\n"
```

1.  the first thing blue does is clear the
    
        score
    
    variable in the interpreter and assign the variable
    
        blueDuration
    
    the value of the duration of the SoundObject on the timeline. For
    this example, it does not affect the outcome of the score generated

2.  Next, blue runs the script. in this case, the only thing that
    happens is that the
    
        score
    
    variable is being assigned the text string of a single note, along
    with a newline.

3.  At the end of the script's execution, the
    
        score
    
    variable is read. the score variable may or may not have anything
    assigned to it, but the script within the PythonObject is still run.
    this allows for the possibility of code that needs to be run but
    doesn't necessary need to generate score text at that time. (as
    mentioned above in [The Case for Using the Python Object](#the_case_for_using_the_python_soundobject))

4.  blue parses the score text, making Note objects for blue to use,
    applies scaling and translation of time to make the genreated notes
    start at the time of the PythonObject and last the subjective
    duration, then applies any noteProcessors.

And that's it\!

For the following example, I will make a very simple score generator
that produces as many notes as I give as an argument. the entire code
for the script is:

``` 
 
def generateNotes(numOfNotes):
    scoreText = ""
    
    for i in range(numOfNotes):
        scoreText += "i1 " + str(i) + " 2 3 4 5\n"
    
    return scoreText

score = generateNotes(10)
```

The function I made,

    generateNotes(numOfNotes)

, takes in the number of notes I want to generate. for the above, I
wanted it to generate 10 notes, and if I printed out the above

    generateNotes(10)

, I would have gotten the result:

``` 
 
i1 0 2 3 4 5 
i1 1 2 3 4 5
i1 2 2 3 4 5
i1 3 2 3 4 5
i1 4 2 3 4 5
i1 5 2 3 4 5
i1 6 2 3 4 5
i1 7 2 3 4 5
i1 8 2 3 4 5
i1 9 2 3 4 5
```

This text string above is returned by the

    generateNotes()

function and assigned to the

    score

variable. blue then grabs that text from the

    score

variable and parses it and the proceeds with compiling out the .CSD
file.

Note: this is a very basic example of a note generator. As you work with
Python more for score generation, you'll probably either create a slew
of text-handling classes that use lots of regular expressions or a more
object-based system that interacts amongst itself before generating
score text output. I hope to address these types of design decisions in
the near future in another tutorial which will hopefully help those new
to scripting and programming learn how to go about analyzing music goals
in terms of programming and then designing and implementing their
solutions.

## Usage Ideas

Using the external SoundObject and the Python SoundObject, besides their
general usefulness of allowing scripting in blue, may be considered
alternative methods of extending blue through script rather than
compiling Java programs. The extensibility of the system is very
open-ended, as whatever is available to Python and other languages now
becomes accesible to blue, as well as using score-generating programs
that are able to print to stdout.

So if you wanted to write a perl script that hits weather websites on
the internet, gathers data from them, and then maps that data to
different parameters of a note generating algorithm, you could build
that outside of blue, but then have the added benefit of being able to
use that within blue.

If you build a C++ program to generate scores, you're able to call it
from within blue.

Maybe even something simple like doing a text include of a text file
could be done rather easily with a few lines of Python or perl script.

Also, you can approach building scripts for tools as also being
prototypes for building fully qualified blue SoundObjects and
noteProcessors in Java, which has the added benefit of being able to
have a GUI added to it. so if you have a utility script you use often,
suggesting it to a Java programmer could lead to it's inclusion into
blue, where it could be remade in a way to have it be usable by
non-programmers as well.

## Future Enhancements

As blue has developed over time, and as the ways to use it are being
augmented with each new build, I'm always looking for new ways to make
the process of working with blue easier. My recent work with the Python
SoundObject and the External SoundObject have shown me that there's a
lot of neat things that can be done with blue, things I really didn't
account for when I first built blue, and would now love to handle. For
the future, in addition to developing more and more tools for blue
itself, it would be nice to be able to have more conventional coding
tools to aid scripters in the script work for blue. I'm aware of the
limitations for debugging and console output right now in blue, but,
then again, all of the scripting additions to blue are rather young, and
blue's development continues every day.

For immediate goals, I've written down the following as things I should
look into now:

Python test console for the PythonObject

Like the test button, but would show all output to stdout as it looks
before being processed by blue, as well as showing all output to stderr.

Language neutral script library

With the PythonLib for the Python SoundObject, it's nice to have a
portable way of keeping all of the scripts that can be used with blue
along with blue, if you happen to be carrying your work around with you.
I think that this ability would be fantastic for the external
SoundObject. already i have a method that returns the absolute path to
the lib directory of blue; with this, I think it should be possible that
before blue runs any script, it could look for a "<BLUE\_SCRIPT\_LIB\>"
constant of some sort and do a text replace to put in the absolute path
to the lib directory. that way, you could do something like:

    from <BLUE_SCRIPT_LIB>.myLibrary import *

as well as use a commandline like:

perl <BLUE\_SCRIPT\_LIB\>/myLibrary/myProgram -input $infile

Which would make the library accessible from any system. the nice thing
about something like this is that I could then include other people's
script libraries and programs as part of the blue release, or other
people may wish to advertise that their scripts are usable within blue
and have a place to install it in that is easily accessible on any blue
system. (For example, using the above convention, if I have a blue work
file that repeatedly calls a library that someone else developed, I can
put that library in my lib dir, use the convention above, and then say
if someone else wanted to run that file or if I was bringing that file
to another computer, all I'd have to do is install the library in the
lib directory and everything should work, as opposed to having to do a
find and replace on ever call to the library to change the path to where
it is on the new computer.)

Finding a text editor component thats made for programming

This would be fantastic, to find a Java text component that I can swap
in that would handle things like syntax-hilighting of different
languages, maybe has some kind of help system for syntax and references,
etc. I haven't found one I could easily use or modify yet, but hopefully
something will come along.

## Final Thoughts

As time goes on, I'm sure there will be alot of additions to blue to
help aid scripting and the use of other score generating programs within
blue. I hope this tutorial has helped to show how to use the external
SoundObject and Python SoundObject in blue, as well as helped show
what's very possible by using these SoundObjects.

If you have any comments, suggestions for improving this tutorial, or
questions, please feel free to email me at <stevenyi@gmail.com.>

Thanks and good luck\!

Steven
