by Michael Bechard, 2005

## Introduction

PolyObjects are, in my opinion, one of the most powerful tools in blue.
They provide encapsulation of any grouping of SoundObjects, any way you
like, into one logical SoundObject. Once encapsulated, the rest of
blue's powerful features (namely NoteProcessors) can be leveraged
against the PolyObject, and that is when one really begins to realize
the benefits of using PolyObjects.

## Basic

### Explanation

To repeat what is stated in the reference documentation, a PolyObject
can be seen as a container of other SoundObjects. It contains its own
series of SoundLayers, just like the main score, and, like the main
score, one can add as many SoundLayers and SoundObjects as one likes to
a PolyObject.

Think of the main score as a big box that holds sounds. Now, we can put
whatever sounds we want in the box, but we can also put smaller boxes
inside the main box; these smaller boxes are our PolyObjects. We can put
sounds inside the smaller boxes, just like we can in the big box, and we
can arrange them in the same manner too. When we put sound A in the
upper-right corner of a smaller box, it will stay in that corner no
matter where we move our box inside of the bigger box. However, it is
the position and arrangement of the sounds themselves relative to the
main score that is important and is, ultimately, the reason to use
PolyObjects. With sound A in the upper-right corner of our small box,
its relative position in the main box will be dependent on the smaller
box's position in the big box. Keep in mind, too, that we can put boxes
inside of boxes inside of boxes, as many layers as we like. And when you
realize that you can change the sounds inside of any box by applying a
NoteProcessor to it (like making the box metal instead of cardboard),
you begin to see the power of using PolyObjects.

### Usage

The way it works is, you create a PolyObject in a SoundLayer like you
would any other SoundObject; by right-clicking on the SoundLayer and
selecting "Add New PolyObject;" it should be at the very top. After
doing this, the PolyObject is empty and will not generate any notes in
its current state. You have to double-click on it in order to edit the
contents of the PolyObject. Once you're editing the empty PolyObject,
the score editor looks a lot like it does when you're editing an empty
blue score. That's because the main score is just one big container for
notes, like PolyObjects (in fact, in the code, the main score IS a
PolyObject).

You can see which container you are currently editing by looking at the
buttons just underneath the tabs for "score," "orchestra," etc. When
you're editing the main score, there will only be one button there
called "root;" you're editing the root container. When you're editing a
PolyObject called "Group A," you'll see two buttons; "root" and "Group
A." Pressing any of these buttons will change the view to edit that
container.

Once a PolyObject has been created, you can add and arrange SoundObject
on it just like you do in the main score. Each PolyObject is going to
have its own Snap and Time Display settings too, so you may want to set
those accordingly. Add SoundLayers just as you would in the main score
too.

After you've added all of the notes you wish to the PolyObject, click on
the "root" button and feel free to move the PolyObject around in the
main score, just as you would any other SoundObject. Add NoteProcessors
too, or alter the Time Behavior; these changes, in turn, will be applied
to the contents of the PolyObject.

## Advanced

Before tackling some of the more advanced concepts of PolyObjects, a
couple of clarifications must be made. When this document refers to
editing the actual PolyObject, that means editing it as a SoundObject
(moving it around on the timeline, stretching it, editing its
properties, etc.). This is very different from editing the contents of
said PolyObject. The distinction will be made in this section whenever
applicable.

### Time

PolyObjects can have their Time Behavior changed like any other
SoundObject when one is editing the actual PolyObject. This is very
important to keep in mind, because your sounds within the PolyObject may
span 10 beats, but if you leave the Time Behavior settings for the
PolyObject to the default (Scale), they may in actuality span only two
beats, depending on the size of your PolyObject. One can test this with
the Test button: shrink a PolyObject that has the Scale Time Behavior
and the notes within it will shrink as well.

#### No Special Time Behavior

There are a couple of easy ways to make sure that the sounds you place
in a PolyObject remain to scale in the parent container, or the root
score. One method is to right-click on the PolyObject itself and click
"Set Subjective Time to Objective Time." This will change the length of
the PolyObject to be equal to the beat at the end of the last
SoundObject within it. In other words, it will expand or contract to the
actual total length of all of the notes within it. The other method is
to change the Time Behavior of the PolyObject to None. Blue will not do
any processing of the length of the notes within the PolyObject; they'll
just be played exactly the way they are in the PolyObject.

There are advantages and disadvantages to each method. The first is good
because it allows one to see the actual length of the PolyObject within
the main score, but you have to remember to click "Set Subjective Time
to Objective Time" each and every time you make a change to the
PolyObject's contents. If you set the Time Behavior to None, the length
of the PolyObject may appear to be two beats, but it may actually be ten
or 20 or whatever; you don't know until you edit the contents of that
PolyObject. However, with a Time Behavior of None, you can edit the
contents of the PolyObject frequently and drastically without having to
worry if your changes will be accurately represented in the CSD
rendering. A good way to work may be to set a new PolyObject's Time
Behavior to None and edit the contents of it as much as you like. Then,
when it sounds satisfactory, you can click "Set Subjective Time to
Objective Time" on it, so that you may edit the rest of the score while
having an accurate picture of the actual length of the PolyObject. Keep
in mind that you may use the "Set Subjective Time to Objective Time"
feature on any SoundObject with any Time Behavior setting.

####  Repeat/Looping Time Behavior

One can lay down a series of sounds in a PolyObject and setup the
PolyObject to loop them. The Time Behavior of the PolyObject itself
needs to be set to Repeat, and the notes will loop for as long as the
PolyObject's length. When the PolyObject's contents actually start
looping in relationship to each other is determined by the Repeat Point;
one can edit the Repeat settings in the property box of any SoundObject.
The Repeat Point specifies the beat at which the group of notes will
begin after the previous note group begins. If the Use Repeat Point is
not checked, the next note group will begin immediately after the
previous note group's last note ends.

An example would be a PolyObject whose contents are three one-beat notes
played back-to-back:

    i1 0.0 1.0 3 4 5
    i2 1.0 1.0 3 4 5
    i3 2.0 1.0 3 4 5

If one set the Time Behavior to Repeat without using a Repeat Point and
stretched the length of the actual PolyObject to six beats, six one-beat
notes would play back-to-back, like this:

    i1 0.0 1.0 3 4 5
    i2 1.0 1.0 3 4 5
    i3 2.0 1.0 3 4 5
    i1 3.0 1.0 3 4 5
    i2 4.0 1.0 3 4 5
    i3 5.0 1.0 3 4 5

However, if one were to change the PolyObject to use Repeat Points and
set the repeat point to 2.5, this would be the result:

    i1 0.0 1.0 3 4 5
    i2 1.0 1.0 3 4 5
    i3 2.0 1.0 3 4 5
    i1 2.5 1.0 3 4 5
    i2 3.5 1.0 3 4 5
    i3 4.5 1.0 3 4 5
    i1 5.0 1.0 3 4 5

Note that there are more notes being played this time. Why? Because with
a Time Behavior of Repeat, blue will try to fit as many notes that it
can into the PolyObject using the repeat settings given, without
violating the order and length of the PolyObject's note arrangement.
With the previous example, blue played the second group of three notes
at beat 2.5, and realized it could squeeze in a partial third loop. This
third loop begins at beat five, since that is equivalent to beat 2.5 in
the second loop, which is our Repeat Point. It inserted the first note
there and realized it couldn't fit any more notes, since the next note
would begin at beat six and play until beat seven; that's longer than
the length of our PolyObject, which is six.

### NoteProcessors and PolyObjects

NoteProcessors are great when used in conjunction with PolyObjects. They
can be very powerful, but you have to be careful of a few gotcha's.

#### P-fields and PolyObjects

One thing to be aware of with PolyObjects and NoteProcessors are
p-fields. The user must make sure that the p-field(s) that is being
operated on by the Note Processor(s) is the same for all sounds within
the PolyObject. If one has a lot of typical notes in a PolyObject where
p4 equals the pitch, and one errant note where p4 equals phase, for
instance, things could get disastrous if one tries to apply a
PchAddProcessor to the whole PolyObject. Please refer to the Best
Practices section for more information.

####  Time Behavior and NoteProcessors

Everything that is to follow in this section can be summed up in one
important fact: NoteProcessors get applied to SoundObjects before the
Time Behavior does. What this means is, if you have a PolyObject with
Repeat Time Behavior and set it up to loop twice, and have a
LineAddProcessor on that same PolyObject, you will have a group of notes
looped twice with the LineAddProcessor behavior applied twice; that is,
applied individually to each looped group of notes.

So, to borrow from the example in Repeat/Looping Time Behavior, our
group of three notes with no NoteProcessor and no Repeat Point would
render like this:

    i1 0.0 1.0 3 4 5
    i2 1.0 1.0 3 4 5
    i3 2.0 1.0 3 4 5
    i1 3.0 1.0 3 4 5
    i2 4.0 1.0 3 4 5
    i3 5.0 1.0 3 4 5

If I add a LineAddProcessor to p-field four, starting from zero and
going to two, here's what the result would look like:

    i1 0.0 1.0 3.0 4 5
    i2 1.0 1.0 4.0 4 5
    i3 2.0 1.0 5.0 4 5
    i1 3.0 1.0 3.0 4 5
    i2 4.0 1.0 4.0 4 5
    i3 5.0 1.0 5.0 4 5

This may be the desired effect, and it may not. In order to apply a
NoteProcessor after the Time Behavior has been applied, take the
following steps:

1.  Apply the Time Behavior to you PolyObject, with no NoteProcessor on
    it.

2.  Right-click on the PolyObject and select "Convert to PolyObject."
    What this will do is embed your PolyObject in yet another
    PolyObject.

3.  Edit the Properties of the new PolyObject and apply the
    NoteProcessor to it.

If one applies the previous steps to the example cited above, the
rendered notes look like this:

    i1 0.0 1.0 3.0 4 5
    i2 1.0 1.0 3.4 4 5
    i3 2.0 1.0 3.8 4 5
    i1 3.0 1.0 4.2 4 5
    i2 4.0 1.0 4.6 4 5
    i3 5.0 1.0 5.0 4 5

One thing the user will have to keep in mind, though; when referring to
beats, those beats will be applicable to the notes as they are after the
Time Behavior change. So, in the previous example, in order to get those
results, one has to change the ending beat in the LineAddProcessor to
five instead of two, because five is the beat at which the last note
plays in the looped sequence.

### Multi-layered Polyobjects

As mentioned previously, PolyObjects can contain other PolyObjects. The
thing to remember when doing this is that each PolyObject's settings,
NoteProcessor's, etc. are local to itself. For blue, the notes generated
from a PolyObject SoundObject are the same as the ones generated from a
GenericScore or any other type of SoundObject, and can be manipulated in
the same way.

## Best Practices

### Separate notes with dissimilar behavior into their own PolyObjects

Let's say you're making a PolyObject with lots of regular notes whose p4
field represents the pitch. At some point you also want to insert a note
that affects something a bit more irregular, like the phase of the other
notes, and its p4 field represents, say, the amount of variance in the
phase. It would be prudent to separate that irregular note away from the
notes in this PolyObject in order to keep your expectations about the
p-field of the PolyObject as a whole consistent. Without the irregular
note, you can safely say that p4 of PolyObject X (or whatever its
called) represents the pitch of all of the notes it contains. However,
with that extra note in it, p4 has no consistent meaning in PolyObject
X, and you can't safely apply NoteProcessors to it that affect that
p-field.

### Group co-reliant notes together into PolyObjects

Co-reliant notes, in this case, would be notes that rely on each other
to make their sound. For instance, if you had a group of notes that fed
their output to a zak channel, then another note to process and play
that channel's sound, those notes would be co-reliant. The reason to do
this is to try to make each SoundObject in the main score independent so
that one can move, remove, and edit each of them without worrying about
affecting other notes. The PolyObjects, effectively, begin to represent
one atomic sound in your score, making it easier to experiment with.

Doing this also allows one to reliably freeze PolyObjects. If one tried
to freeze a PolyObject that did nothing but write its output to a zak
channel, the resulting sound file would be dead silence, and the score
would never work (since a frozen sound does nothing but read and play a
sound file).

### Wait, what about separating dissimilar notes?

That's still possible with co-reliant but dissimilar notes. What one
would do, to use the example in the previous section, is make a
PolyObject that contained the instrument processing the zak channel
output and another embedded PolyObject. The embedded PolyObject would
then contain all of the actual notes writing to the zak channel. Now
what you can do is apply all kinds of NoteProcessors to the embedded
PolyObject, then freeze or do whatever to the parent PolyObject in a
reliable fashion.


###  Try to group logical phrases in your music into PolyObjects

It's much easier on the user as a composer to arrange the notes this
way. This enables one to see opportunites for reuse of certain musical
phrases, and implement that repetition easily by adding said PolyObjects
to the SoundObject Library and copying instances wherever they're
needed.

###  Try to keep the length of the PolyObject representational of its actual length

This only really applies if the Time Behavior being used is None,
otherwise a PolyObject's length is always going to represent accurately
its length in the composition. Remember to use "Set Subjective Time to
Objective Time" as needed.

## Debugging

When things don't work out the way you expected them too (and they
won't), a great tool to use to help track down the problem is the "Test"
button. This button renders the i-statements that any given SoundObject
will generate, and it comes in very useful with PolyObjects. So, if
you've got a PolyObject that won't render when you Test it, drill down
into it and test its constituent notes, Testing and drilling down into
its sub-PolyObjects as well. You'll eventually find the cause. Examine
NoteProcessors and the Time Behaviors of each SoundObject; these can be
common culprits with sound problems too.

If one follows the best practice "Group co-reliant notes together into
PolyObjects," this also makes it easier to debug problems. You can
isolate PolyObjects in the main score easily by soloing that SoundLayer,
etc. (since they won't rely on other SoundObjects for their sound) and
investigate the problem that way; many times, you'll find that the
problem stems from the PolyObject not being as independent as you'd
thought.
