/*

 Welcome to the Void, a text adventure by Zack Amiton. 
 
 The game has a few different paths, and is currently a work in progress.
 Unfortunately, the game is currently not finished, and likely will not be for
 a few weeks at minimum.
 
 Welcome to the Void.
 
 */

import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; 
// PImage photo;
Minim minim;
AudioPlayer song, song2;
AudioInput input; // All the information above is for the Minim library, to play songs
String screenText[] = { //Array usage to store screen text, each line marked for its respective screen—will be transferred to a text file soon.
  "Welcome to the Void", //Screen 0.1
  "Hi! I'm Zack, though I tend to go by the pseudonym ''Nathansbud.'' I've been enamored with coding lately, so I decided to attempt a quote-on-quote text adventure. It's a work in progress! Unfortunately, since I'm still VERY much a beginner (and thus, lacking knowledge of most coding-y things), this process is pretty tedious. Hopefully I finish before I die from exaustion.\n\n\nWish me luck!\n\n\n\n\n...and also hit delete because I really didn't want to code in a button. Thanks! If you ever want to go back to the beginning, just hit the respective key (delete will take you back to the intro, r to the beginning of The Void once you've hit start on the intro page).", //Screen 0.2 
  "You wake up in a black void. An eerie silence hangs in the air, little visible save for an almost unnoticable source of light to the west. To the north, south, and east, not much can be seen, though stumbling off in the darkness is a viable possibility nonetheless.\n\n\nWhat will you do?", //Screen 1.0
  "Heading towards the light source, you feel a worn cobblestone path beneath your feet. Thinking it a sign of good\nluck, you quicken your pace, nearly falling over yourself in your haste to be rid of the darkness.\n\nAs you near the source of light, your eyes make out the outline of a stone wall in front of you, blocking off your\npath. The light appears to be emanating from a hole in the wall, and you can hear noises coming from inside.\n\nWhat will you do?", //Screen 2.0
  "Weighing your current options, you decide it would be best to leave whatever is causing the light alone, and persue other options instead. So, turning back to the east, you head back to where you started. You can continue east, south, or north (none of which are lit, at least at first glance), or change your mind and head back west.\n\nWhat will you do?", //Screen 2.01
  "Entering the cave, you see three hooded figures sitting around a campfire. Evidently, this was the source of the light. The tallest of the three looks up from the flames, before barking at the other two in a language you can't understand. The three stand in unison, grabbing what appears to be a stone-tipped spear from the back of their robes. Grunting, they advance towards you at a frightening rate, the heads of their spears getting closer and closer by the second. On the ground near your foot you spot a few jagged rocks, but no other form of weaponry is in sight.\n\nWhat will you do?", //Screen 2.1
  "Fearing for your life, you make a mad dash past the three figures, choosing the rash decision to descend deeper into the cave. Startled by your sudden movements, the nearest one jabs his spear into your side, causing you to cry out in pain. And, from the looks in the other two's eyes, it doesn't seem like their thoughts are very far from their comrade's. So, ignoring the throbbing pain and outpouring of blood, you sprint as well as you can manage down into the depths of the cave, praying for safety. Instead of safety, it seems that the only thing in the depths at the present time is...more hooded people. Rats. Their conversation dies down instantly as they all whip around to glare at you. Double rats. For a few seconds, nobody moves, the air frozen in anticipation. Then, the hooded figures take note of your wounded side, and grab their own respective spears. Why does everybody in this stupid cave have to have spears? Sighing, you try and think up a plan as quickly as you can. Indeed, it seems like your friends from earlier caught wind of this, as they approach behind you, eager to help your brainstoring process. Triple. Rats.\n\nWhat will you do?", //Screen 2.11
  "Trying to figure out a way to communicate, you yell ''stop,'' but they don't seem to understand. That, or ''stop'' to them means ''go twice as fast,'' which is what they decide to do. The pointy end nearing, you wave your hands in the air, though that too appeared to have no affect on the men. Out of options, you close your eyes and put a hand out in front of you—if that doesn't work, nothing else will. Resigning yourself to your wait, you close your eyes and wait...yet, nothing happens. Worried that you've just gone numb from the excruciating pain, you open one eye, only to see the men crouching with their spears on the ground in front of them. They...stopped? Apparently your communication tactic worked. They seem fairly docile now, and two already moved back to the campfire.\n\nWhat will you do?", //Screen 2.12
  "Valuing your life over your curiosity, you hightail it out of there, not even stopping to glance back at the figures. Though you can't hear any sounds of pursuit, you continue to run as fast as your little legs can carry you, panting all the while—you're not exactly the picture of fitness, unfortunately. Short of breath, you collapse, a safe-feeling distance away from the entrance of the gave. Coincidentally, you happen to be incredibly close to where you initially started, making things very easy in terms of reorienting yourself. You can choose to go back into the cave (though the figures still inhabit it), or head out into the darkness of the south, east, and north. Either way, you need a moment to catch your breath.\n\nWhat will you do?", //Screen 2.13, placeholder
  "As you watch the men near you, you decide to do what you do best: nothing. Your eyes glaze over, and you stare blankly back at them as their spears inch closer to you. The two glance at one another, before continuing towards you. And yet, even as they are less than an arm's length away, you still remain nonchalant, doing absolutely nothing. Impressed by your lack of fear, the men nod their heads at you, dropping their weapons and returning to sit back at the fire. When your mother said that you were good for nothing as a kid, THAT must've been what she'd meant. You'd always thought your dad had been a disappointment from the way she'd said it about him, but she probably just meant that he was a master of solving problems.\n\nWhat will you do?", //Screen 2.14, placeholder
  "Bending down, you grab as many rocks as you can, hurling them at the approaching figures. Unfortunately, rather\nthan slowing down, they speed up their approach, clearly angered by being hurled rocks at. A stone connects with\nthe nearest one's head, causing him to stumble backwards, but the other two are nearly an arm's length away.\nPicking up another stone is futile, and one of the figures thrusts outwards with the spear, jabbing you in the side.\n\nImmediately, searing pain travels throughout your body, and your vision clouds. Blood begins gushing out of the wound, and you have to clench your fists to stop from passing out. Even still, you fall over backwards, out cold. The men put down their spears, lifting you try to moving your body over to the fireplace. Attempting to cauterize the wound, one of the figures thrusts their spear into the flames, holding the stone to the wound. The other grabs a length of cloth, tightly wrapping the wound to stop the blood flow. Who are these men? Why are they here? What do they want? What will you do?\n\n(Hint: Nothing, you're passed out)", //Screen 2.2
  "Zzzz, zzz zzzzzz zz z. Zzz, zz! Zzzz, zz? Z, zzz, zzzzzzz...zzz...z. Zzz. Z. Z? Z! Zzzzzzzz...\n\nZzz...zzzzzzzzzzzz...! Z. Z. Zzzzz...! Zzz zzzz z z zz zzzz zzzz zzz.", //Screen 2.3
  "Zzz?", //Screen 2.4
  "Finally coming to, you groan, your side aching in pain. It feels—fittingly so—like you've just been stabbed. Your head feels woozy from blood loss, and the your vision seems to be cloudy. The three figures from earlier sit are nowhere to be found, though the campfire they previously sat around remains burning brightly. You aren't bleeding, though moving may cause the wound to reopen. Continuing west will take you deeper into the cave, and your hear sounds belonging to unknown voices within. However, leaving the cave is a still a viable option, or you could simply choose to do nothing. Having been passed out only moments prior, you have no idea where the hooded figures went nor when they will return, but you have a sneaking suspicion it may have something to do with the noises from deeper in the cave.\n\nWhat will you do?", //Screen 2.5
  "Clenching your teeth, you manage to stagger to your feet. Your breaths are shallow, and your side protests your sudden choice to stand, but you manage to muster the strength to make your way deeper into the caves. Almost drunkenly, you leave the warmth of the campfire, shivering at the sudden loss of heat. The cavern feels cold, unnaturally so—even barring the distance from the fire, something about the caves themselves feels...off. The cave spirals downwards in a staircase-esque fashion, and strange, rhythmic noises—almost chant-like—emenate from the depths below. The hooded figures from earlier seemed fairly hostile, having stabbed you with their spears, and if the brief interaction you had with them earlier was any indication, a dark cavern full of them might be more of a curse than a blessing.\n\nWhat will you do?", //Screen 2.6
  "The narrow passageway opens into a wide cavern, lit with a strange blue glow. As you suspected, the chanting was from the hooded figures from before, though there are far more than you had intially anticipated. Rather than the three you saw earlier (lookouts, presumably), twelve identically-dressed figures stand in a circle, chanting in a strangely foreign language. Disconcertingly, their eyes seem to be glowing—the source of the blue light—and a wispy material is rising from each of their throats, congealing to form a constanly-morphing blob in the center of the room. Watching the figure...grow into existence fills you with a sense of dread, and you watch in horror as the mass begins to morph into a warped, human-like figure. The chanting subsids, instead replaced by a low-pitched moaning sound as the ethereal substance continues to rise off the figures in the circle. You stare dumbfounded, frozen in shock.\n\nWhat will you do?", //Screen 2.7
  "You snap out of your panic, just in time to realize that you need to stop whatever is happening. Gathering up all the courage you can muster, you wrap your arms around the nearest chanter, yanking him out of the circle. Instantly, his eyes stop glowing, and he falls limp into your arms. The other members still continue chanting, unaware of anything around them. As you move to pull another from the circle, they all suddenly snap upright, the blue fading from their eyes. In unison, they all fall over backwards, collapsing. Though the chanting has subsided, the damage seems to have already been done, and the blue figure suddenly stops moving. Then, deliberately, it stretches to form legs, then arms, then a humanoid face. As you watch it, it transforms from a blob to a near-perfect representaion of a human being right before your eyes. Finally, as if by magic, a sharktoothed grin stretches across its ''face,'' as it cocks its head to face you. You open your mouth to panic, but your voice catches in your throat, unable to make a noise. Testing out its newfound form, the blob-turned-human tenatively takes a step towards you, then another, grinning all the while.\n\nWhat will you do?", //Screen 2.8
  "Gritting your teeth, you do a 180º and run as fast as your little legs can carry you. Something about Blue doesn't exactly give you a vibe of friendship, so you hop to it, running back north as quickly as possible. As quick as you were, you still hear the sound of Blue running up behind you. Well, you would if his legs made sound. Without a second thought, you run out of the cave, past the now-extinguished fire, and continue to the north back to where you intially started. As close as you can figure, at least—it is still dark out, after all. Your rapid scurrying didn't seem to stop Blue's progress, unfortunately, and the constant blue light it emitted was still visible, as far away as you were (or felt you were, really—Blue could move really fast). Taking a moment to reorient yourself, you use the light to look around. To the north you can now see what seems to be a cliff (which would be quite useful to you if you had a parachute, but alas, you do not), to the east seems to be a village or something, and to the south...you can see nothing in particular. Aware of Blue's proximity to you, you try and make up your mind as quickly as possible.\n\nWhat will you do?", //Screen 2.81
  "Though your gut tells you it's a bad idea, you turn around and run back towards the cave. You tend to make a habit out of trusting your gut, but in this particular situation you believe it to be wrong. So, rushing back as quickly as you can, you manage to stop before colliding face-first with Blue, the very reason you ran from the caves in the first place. Nervously, you take a step backwards—you never should've doubted yourself. Sadly, it's late to turn back, and you regret your mistakes immediately. Blue, understanding, reaches out to give you a reassuring pat on the forehead. That, and absorb your life-force, as everything suddenly goes black.", //Screen 2.811
  "As you watch Blue move towards you, you slowly come to terms with the fact that you can't fight back against it. Instead, you drop to the ground and shut your eyes, making like a possum. That'll fool Blue—how much brain power can a blob (albeit a human-shaped one) really have? Committing to your disguise, you splay out on the stone, pretending to be one of the discarded cultists. Your left eye stays slightly ajar, observing the movements of Blue, though he seems more preoccupied with the cultists then with your sudden, violent ''death.'' Perhaps he'll forget about you? From the corner of your eye, you see the cultists slowly begin to disintegrate. Almost like a horror movie, the skin begins to peel off the bodies, then muscles, until all that's left is a pile of dust. Unable to help yourself, you vomit on the the ground, the sudden noise causing Blue's head to whip around (well, his facial features to shift to the other side of the head-shaped blob), looking down at you. While your initial plan wasn't exactly winning any awards, it was at least better than having the entirety of Blue's focus fixed on you. As you watch, you feel a rawness all over your body, doubly so from the wound in your side. Then, a searing pain, followed by blackness.", //Screen 2.82
  "Glancing around for anything you can use to your advantage, you notice a torch on next to one of the cultists. Blue is currently cutting off your path, but you choose to duck, sliding towards the thankfully still-lit torch. Blue casually turns his head around to face you—the perks of being an anthropomorphic gelatinous blob. Even still, you hold the torch out in front of you. Uncaring, Blue takes a step forwards, reaching out to tourch your forehead. Instinctively, you hold the torch above you, praying it'll do...something. The instant its hand comes into contact with the flames, it recoils, emitting a shrill, high-pitched scream. Apparently, the fire did some damage to it...who knew? The grin disappeared from Blue's face, and it reaches out again, this time intending to grab the torch. However, as your only weapon (and one that does damage to Blue to boot), you thrust it out, catching Blue in the stomach-area. Screaming even louder, it stumbles back, the fire igniting its entire body. In the blink of an eye, Blue is gone, leaving a only a small blob of blue residue behind. With Blue gone, the rest of the cave is now open to explore, and there is a path leading further down that you failed to take note of earlier.\n\nWhat will you do?", //Screen 2.83
  "Springing to action immediately, you grab a spear from one of the chanters. The blue form pauses for a minute, seeming to ponder your choice, then—if possible—grins ever wider. Seizing your opportunity to deal some damage, you jab the spear into the thing. It recoils back, wounded...or, so it seems. In reality, the thing hardly even felt the spear, and rips it out as easily as it went in. Its grin changes to a tight-lipped smile, and it hurls the spear back at you at nearly twice the speed you were able to throw it. You nearly dodge to the side, feeling the force of the sudden swivel in your still-bleeding wound. As severe as it may feel, with Blue right ahead of you, it's the least of your concerns at the present time. Grin returning, Blue lurches forwards, standing no more than two inches in front of you. Seeing how easily it disposed of the chanters and spear, you hesitate to think what it could do to you as easily as taking a breath.\n\nWhat will you do?", //Screen 2.84
  "With Blue no more than a few inches away, you feel something in your chest. Fear? No...something...different. Butterflies in your stomach—an urge to run away? No! It's something...something you can't quite explain. Something about this morphing blue blob just...you aren't sure what it is. But as you stare deeper into Blue's eyes (or, rather, where Blue's eyes would be if it had eyes), you realize what it really is that you want: you want to kiss Blue. Yes, the signs were so clear all along—your attempt to sabotage the summoning was deliberately a failure, your spear throwing an attempt to play hard to get. Now, in this moment, you have the opportunity to get what you've always wanted. You lean forward, lips puckered, and plant them on the only facial feature Blue actually has. Your kiss is long and passionate, and you hardly even feel your life-force draining away as passion overcomes your body. Well, passion and a sudden lack of existence as everything goes black.", //Screen 2.841
  "Frozen in horror, you watch as the blue abomination nears you, each moment bringing it closer and closer until you can almost reach out and touch it. A shrill, high-pitched laugh emenates from its head (or as close to what can be called one), and it waves its arms around, raising the bodies of the fainted figures off the ground. It curls its fingers, and the bodies contort and twist. Gruesomely, the skin begins to peel off the bodies, and the figure cackles, absorbing their blood and closing its fists. An eternity passes, and all that remains is dust. Then, the beast ever-so-slightly turns its head back to you, toothy grin still plastered onto what you hesitate to call a face. You cower away from the gaze, but it feels like the being is boring a hole into your soul nonetheless. Stealing a glance at it, you watch, paralyzed as it uncurls a finger, tapping it to your chest.\n\n\nAnd then everything goes black.", //Screen 2.85
  "Ignoring the light source to the west, you instead stumble off blindly to the east. Unable to see a thing, you put\nyour hands up for security—this proves to be a wise decision, saving your face from bashing into a tree. Thanks,\nhands! You feel your eyes beginning to adjust to the darkness, just in time to make out the figure of a four-legged\ncreature ahead of you.\n\n\nFalse alarm, just a rock. Lucky break!\n\n…can…rocks bite? Best not find out.", //Screen 3.0
  "Though the rock seems plain at first glance, you can't help but feel suspicious of this gigantic piece of stone. Curious, you look around the rock, trying to make a note of anything out of the ordinairy. The rock is...perfect. Imperfectly so, in a way that it should be impossible for a rock to be. Intrigued, you reach out to stroke the rock...and immediately recoil, your hand bleeding. The rock bars its apparent teeth at you, then lifts itself off the ground—God knows how—and scurries away. Turns out, rocks (or, at least, the creature mimicking the appearance and behaviors of one) CAN bite. You'll have to keep your distance from things in the future; nothing in this void is what it seems.", //Screen 3.02
  "Leaving your granite friend behind, you continue to the east. You know what they say, east is the least...dangerous\npath. Yes, that age-old saying, one of your favorites. Unfortunately, the least dangerous path seems to be the least\ninteresting as well, and nothing appears to be happening for the time being.\n\n\nWhat will you do?", //Screen 3.1
  "You feel your eyes beginning to droop, but you shake your head and keeping walking. The further east you walk,\nthe more lost you begin to feel. A bat swoops overhead, startling you, but nothing else of interest seems to be\ngoing on. What little you can make out of your surroundings doesn't pain a very vivid picture of the landscape—the\noutline of trees, some pebbles here and there, and some rope laid out in a suspiciously trap-like manner.\n\n\n...wait, what?!", //Screen 3.2   
  "Curious, you tug on the end of the rope, and instantly the rope flies up into a sack, ''catching'' the non-present prey it was intended for. Good thing you notice it when you did—whoever set that trap might be nearby. And, as if on-cue, a light immediately shines on the horizon, nearing you. Whoever set the trap wasn't too far after all, and they might not be too pleased with the sabotaging of their trap. Perhaps...you were the intended target after all. Whatever the purpose of the traps, the source of the light is getting closer every moment, and there looks to be more than one. Plus, they're coming straight from the direction you were headed. This definitely feels like bad news to you.\n\nWhat will you do?", //Screen 3.21
  "Choosing the wisest option for your safety, you decide to give the rope trap a wide berth, continuing on in the direction you intended. The kind of people who set traps in the dark don't seem like the kind of people you want to associate with in your current defenseless state. So, quiet as a whisper, you tread east, hoping to find some way of understanding where you are and what you're meant to be doing. Much to your dismay, the trees don't seem to have mouths, and if they do, they seem to be quite tight-lipped about your current situation. Mentally cursing them out as loudly as you can, you wave your fists angrily in their general direction. Damn trees. You almost fail to notice another rope trap to your right in your anger at the trees, though luckily, you managed to take note of it before triggering it, and are able to walk off unscathed. Betrayed, you glare at the trees. This was probably their doing.\n\nWhat will you do?", //Screen 3.3
  "Not concerned by the first nor the second rope trap, you continue east; no pesky traps will stop you from getting to where you want to go. You spot multiple more rope traps around your path, but ignore them completely. Even still, giving them as little thought as you are attempting to do, it's hard not to notice their increasing frequency. Along with the sudden rise in rope traps, there seems to be a noticable rise in light level. And, since it doesn't seem to be sunlight (if there even is sunlight wherever you are), the light has to be coming from somebody...or, well, something. Unsure of whether or not this equates news or bad news, you continue walking, hoping moreso for the former than the latter. However, due to your emphatic trap-ignoring mindset, the rope in the middle of your pathway goes unnoticed until you step right into the middle of it, sweeping you up into a net. Damn it. You hear yelling in the distance, and the source of light seems to be nearing you.\n\nWhat will you do?", //Screen 3.4
  "Struggling in the rope trap is getting you nowhere, and the pitter-patter of approaching footsteps has nearly reached a defeaning volume. With no form of escape from the net besides cutting yourself out, your options seem rather slim for the time being. And, seeing as the gaps in the net aren't large enough for you to attempt to squeeze through, you're probably going to be making some friends fairly soon. With the uncanny ability things have to appear right after you think of them, the oncoming stampede arrives, brandishing torches and what appears to be...bows? Whatever they are, they certainly don't look pleasant. The nearest one—their chief, from the looks of things—points at you and yells up at you in a hard to understand accent, though is speaking English nonetheless.\n\n''Who...are you? Why have you come to our lands?'' You stare back bewildered, though grateful for some human interaction. Gesturing to two men in the back, the leader steps forward, cutting you down from the net. ''Come,'' he says, nodding. What will you do?", //Screen 3.5
  "Ignoring the fact that the men were the reason you were caught in a trap in the first place, you jog after them, quickly closing the distance. The apparent chief turns his head around, acknowledging your presence, then shifts to look ahead—judging by the speed at which they reached you, it doesn't seem too far-fetched to assumed that the people live nearby. However, it may have simply been your mind playing tricks on you out of fear, as you seem to be a ways away. None of the men walk next to you, instead choosing to walk in an organized march, side-by-side in rows of three. None of the men seem to pass in front of the head of the pack, the chief—and, judging by the overall silence and unquestioning of his commands, he seems to be the leader of this group of people.\n\nAfter a few more minutes, you notice the tip of a hut on the horizon, then another, then another. Your eyes strain from the sudden light (strangely masked before), but you're thankful to be rid of the darkness nonetheless. As the men poor into the makeshift village, they disperse, breaking the army-like marching rows. The chief himself stays behind, beckoning to you as he steps into a large in front of you, by far the largest of the bunch. What will you do?", //Screen 3.6, placeholder
  "Making the choice to go north, you go on a walk of faith in the darkness, trusting your instincts not to lead you\nastray. Hopefully, the north will remember that you've chosen it as your path over all the others—apparently, it has a fairly solid memory. Unlike the other paths, the northern one seems to feel more...open, in a sense, almost as if you're nearing a clearing. The silence seems even quieter, in a way, ominously building up to something. But what could be in this ''clearing''? Continuining onwards, you proceed with a greater sense of caution, wary of anything that could happen in the open space.\n\nBut enough about that—driving any worried thoughts from your mind, you pause, catching your breath.\n\n\nWhat will you do?", //Screen 4.0
  "This already boring-seeming path seems increasingly less interesting the more you walk. Fears of predators are quickly replaced by the unrelenting pain of pure boredom, even in this unknown world. If a diety was in charge of\ncreating the paths you walk along, he seriously decided to make this one as boring as possible. You contemplate a\nnap, but decide against it—that'll be reservered for when you can take the boredom no longer. Must. Keep. Walking.\nCan't...fall...a...sleep........AWAKE! You're awake, you didn't even come CLOSE to thinking of falling asleep. Instead, you fill your mind with thoughts of adventure. This certainly feels adventure-y, doesn't it? Well, maybe a part of the adventure that would be cut out of the story books, but what can you do? Sighing, you step over a rock in the\npath (sadly, the most interesting part thus far), and...\n\n...plummet? Yes, in your boredom-ridden state, you failed to notice the literal cliff you just stepped off of, plummeting straight to your death, thousands of feet below. Rest in pieces.", //Screen 4.1
  "a", //Screen 4.2, placeholder
  "Deciding to choose one of the non-lit options, you turn and head south, hoping that won’t be the direction things turn. Though difficult to orient yourself, you make your best effort to head in a straight line such that if things do not smoothly, you can always turn back around. Unfortunately, having chosen to go south instead of west, the source of minimal light fades away until it is little but a speck in the distance. If only you had a flashlight, this expedition to the south would be made a whole lot easier. But alas, you do not, and the journey will remain shrouded in darkness. What a shame. Really, a flashlight would make the journey a LOT easier. But enough about the flashlight that unfortunately you do not have at this moment in time. Your woes put on a back-burner, you pause at what seems as good a place as any to do so. If only you had a flashlight…\n\n\nWhat will you do?", //Screen 5.0
  "Taking a moment to acquaint yourself with your surroundings, you pause and squint your eyes. The darkness has quickly turned annoying, as anyone would agree. What little you can see is hard to make out, your path harder still. However, you can just barely see hills on the horizon, sloping upwards in contrast to the mostly flat terrain you've covered thus far—though, without any real light, there could easily be mountains all around you. The light you saw earlier was back to the west (east from your current point of view), but it has long since disappeared from view. You can't make out anything else, as it all seems to be blocked by tall, comically leafy trees. A flashlight would really go a long way.\n\nAnd just like that, you feel your foot kick up against something. Could it be...? Nope, just a rock. But wait, what's that in front of the rock? Aha! Reaching out, you feel your hand close around what appears to be a fully functioning flashlight. With working batteries. In the middle of pitch-black nowhere. Hey, best not question it.\n\nYou got: A Flashlight! Your field of vision is now far greater. What will you do?", //Screen 5.01
  "Armed with a flashlight, you decide...to do nothing. Your flashlight bathes the world around you in luminescene, and with this newfound vision, you...decide to do absolutely nothing. Instead, you choose to waste your battery life, dawdling in what you now correctly know to be a tree-filled area. Yet, not even stopping to ponder what this means for the future of your journey, you decide to literally do nothing and wait for inspiriation to strike. No—since thinking would mean doing something, you stare blankly ahead. No, you do it with your eyes closed, as staring ahead would mean you were doing something. Instead, you completely and utterly waste your time doing nothing.\n\nWhat will you do?", //Screen 5.011
  "Sighing, you trudge onwards, still hung up on your utter lack of a light source. Perhaps somebody left one behind earlier and you missed one entirely, too stubborn to look around. That would be a real shame, all things considered. If you would just turn around, maybe you could scower the area for firewood, or some flint and steel, or who knows, perhaps a flashlight left in the middle of the path in plain sight even. But alas, that would be foolish—clearly, you would find nothing. Your stomach grumbles, and you begin to realize that you haven't eaten in what feels like days. Hopefully you find something to eat soon, or you may actually starve to death.\n\nTo your left (east), you notice a dip in the trees, the flora seeming to thin to make way for something. Curious, you glance over, and notice that there seems to be a hole in the ground, unmarked and unconspicuous. But what could be in the hole?", //Screen 5.1
  "Meandering off of the southern path to investigate the hole, you choose to head east rather than continue in the direction you were previously headed. Thus far, you've felt a sort of path underneath your feet, but the east path feels unexplored, giving the hole you're headed a sort of mysterious quality. Off the beaten path indeed...perhaps not what you want to be exploring unarmed and unprepared. A dimly lit, incredibly narrow passageway decends down from the top of the hole, and you have to suck in to fit. However, save for the rustling of leaves on the surface, not a noise can be heard from below, nor above, really. Much to your dismay, you're heading down into what appears to be a dungeon, no idea of what lurks underneath.\n\nWhat will you do?", //Screen 5.11
  "Reaching the bottom of your descent, you are faced with a number of options for directions to head in. Unlike the surface above, the dungeon has flickering torches on the walls, illuminating the place enough to see the paths ahead. Heading to the east (straight ahead) would take you down an unlit path (in stark contast to the rest of the dungeon, which has torches lining the walls), while the southern hallway seems to open into another room. Heading west will take you down a far mossier hallway, and though you're underground, you swear you can make out a tree.\n\nWhat will you do?", //Screen 5.12
  "Heading to the west of the dungeon, you notice a great deal of greenery on the walls. This path seems...damper, almost like a source of moisture is nearby. At any rate, this wing seems home to a great deal of greenery, and continuing to walk brings you to a room filled with plants. In the center in the room on a bed of grass sits two similary shaped mushrooms. The one on the right is blue, and the one on the right is red. Save for their strange coloration, neither mushrooms seems very unique, both being small and fairly inconspicuous. However, you have a strange desire to eat one. The path ahead is blocked, unfortunately, and your entire attention is focused on the mushrooms, with no thoughts of doing anything else (much less turning around or not eating a mushroom).\n\nWhat will you do?", //Screen 5.121  
  "You feel...weird...", //Screen 5.1211 
  "You feel...odd...", //Screen 5.1212
  "That was a very peculiar experience.", //Screen 5.1213
  "Deciding that your relative safety is more valuable than investigating some unknown hole, you continue without checking it out. Instead, you continue south, sure that your legs will lead you in the right direction. Your eyes have mostly adapted to the darkness, though your vision is still very limited—so much so that your eyes nearly pass over a note in the middle of the path entirely. Hearing the sound of paper beneath your feet, however, you do a double take. There, clear as daylight beneath your foot (if crumbled a little bit from the impact) is a plain white note, scrawled on in near-illegible handwriting. Red splotches adorn the page, splattered here and there, seemingly at random. Is that...blood? Shivering, you attempt to read the note, but are unable to; while your eyes have adjusted to the darkness, it's still not enough for you to make out the wording on the letter. Sighing, you pocket the note, your desire to find a light source rekindled.\n\nWhat will you do?", //Screen 5.2
  "You...did nothing. You remain standing in the blackness, and nothing has happened. Boredom threatens to overwhelm you.", //Screen 6.0
  "Suddenly, out of nowhere...nothing happens. You continue to do nothing, not even twiddling your thumbs. Never in your life have you felt more lethargic.", //Screen 6.1
  "Suddenly, you fall over backwards, unable to lift your head off the ground. You have literally died of boredom.", //Screen 6.2
  "Feeling that you still need to communicate with the men, you wave your hands around furiously, hoping they'll reciprocate. Instead, they remain transfixed on the flames in front of them, ignoring your pointless hand waving. Sighing, you relent, moving to sit down next to them to warm yourself at the fire. Neither seems to object to your presence (contrary to what their spear-wielding may have suggested), so you settle down in front of the heat, feeling the warmth return to your fingertips. You hear odd noises coming from deeper in the caves, but neither of the two seem pertubed in the least by the sounds. Against your better judgement, you force your ears to close themselves off to the sounds, instead focusing solely on the crackling of the hearth in front of you.\n\nWhat will you do?", //Screen 2.123
  "Pondering the idea of entering the chief's hut, you take a step forward, then pause. Do you...do you really want to enter the chief's hut right now? Moreover, do you really want to do anything right now? And then it hits you: what you want to do is flail aimlessly. Yes, the thought has stuck a cord with you, and you make yourself go limp, throwing your arms out every which way. The few passersby gaze at you shifty, questioning your choice of actions. But you pay them no mind, flailing freely. You kick legs out from under you, hitting your head on the pavement. In your seizing state, you somehow (in a miraculous feat of special snowflakery) manage to snap your neck, the life fading from your eyes. The chief peeks out of hut, looking down at you condescendingly and shaking his head. He steps forward, scooping you up in his arms, then bringing you into his hut. \n\nRest in peace, idiot.", //Screen 3.63
  "Continuing forwards, note in hand, you feel a sense of dread. The note itself not withstanding, something about the path you're walking along seems...creepy. You feel your foot brush up against something, and kick it, hearing a crack as the object—whatever it was—goes sailing through the air. However, its not long before you feel something else, which you bend over to inspect. It feels rounded, almost egg-like on the back, though it dips forwards. You feel two holes in the front, and the shape plateaus downwards, though the texture is anything but smooth. Taking a closer look at it, you realize that what you're holding is anything but inconspicious: in your hands, clear as day, you're holding a human skull. Fighting back a scream, you throw the skull as hard as you can manage, hearing a cracking noise as it reaches the ground in the distance. Shuddering, you and make sense of the fact that you've just found a skull (and, that there are seemingly many more).\n\nWhat will you do?", //Screen 5.3
  "Not wanting to keep the man waiting, you hastily step into his hut (more of a teepee, really). Inside, torches adorn the walls, and what seems to be a line of skulls sits in the corner—how they got there, you don't feel like asking. Gesturing to a spot on the ground, the man nods his head at you. Then, in a raspy voice, he says, ''Sit.'' Not wanting to offend, you sit down, eager to milk him for information. As the only person you've met thus far, you don't exactly want to get on his bad side. The man seems fairly quiet, though, preferring to communicate through actions rather than words. Grabbing a mug of sorts, he hands you a cup of warm tea—at least, you hope its tea. He nods, taking a sip from a mug of his own. You sit in silence, sipping the drinks, neither of you saying a word to one another. Barring the traps that got you into this situation in the first place (and, well, the seemingly very human line of skulls), the man seems very docile. The room itself is devoid of weaponry, and judging by the way you've been treated so far, it doesn't seem like the man perceives you as a threat. Even still, being cautiously wary might be a good idea.\n\nWhat will you do?", //Screen 3.7
  "In a way that feels neither tacked on nor forced, you feel something bubbling inside you. Though you've only just become aware of your very self in this place, you feel...well, if you knew how you normally felt, you'd know that this was certainly out of the ordinairy. Suddenly, you freeze, unable to move (though you weren't moving in the first place), your back arching. A searing pain travels through you, and you feel unable to control your body. Then, as quickly as it came, the pain was gone, your mind filled with thoughts of...brains? All you can seem to think is brains, how delicious they are, how much you crave them. Your cognitive abilities seem to be fading away with every moment, and you almost feel like you're in a trance.\n\nThen, everything goes black. In your place, acting as what once was not-zombie, is a zombie. Truly, a marvelous plot twist to this story without a plot, that has just started from your perspective, and from any perspective, really. Inexplicably, you are a zombie, though that information would need to be explained by some unknown narrator, as you are most certainly unable to think in your present condition.", //Screen 1.1
};

float screen; // r = 70.0; // Float Screen is used to keep track of the "screens," 
int loopCount, timer, doNothing, goWest, goEast, goSouth, goNorth, zombieMode, lookAround, textBoxX = 30, textBoxY = 30, textBoxWidth = 1400, textBoxHeight = 550; // Fairly straightforward, each corrosponds to a respective directional integer, which can be increased/decreased on screen changes in order to corrospond to a certain screen without trigger two buttons at once on sequential screens. However, this system needs to be fixed. The textbox variables are, as can be seen by their naming, variables corrosponding to the textboxes on each screen—textBoxX = x coordinates, textBoxY = y coordinates, textBoxWidth and Height are width and height of the box (point at which text cuts off/goes to new line
//brainImageXPosition[] = new int[800];
boolean flashlightGet, bloodstainedNoteGet; // Variables for inventory system—may be scrapped if time doesn't permit

void setup()
{
  fullScreen();
  screen = 0.1;
  minim = new Minim(this); 
  song = minim.loadFile("Princess of Helium.mp3");
  song2 = minim.loadFile("Coffee Break.mp3"); 
  loopCount = 10000;
  song.loop(loopCount);
  timer = 0; //Timer variable for drug trip
  //  photo = loadImage("Brain.png");
}

void draw()
{
  if (screen == 0.1) //Intro Screen
  {
    background(4);
    fill(255);
    textSize(50);
    text(screenText[0], width/3 - 70, height/2);
    DrawButtons();
  }

  if (screen == 0.2) //About Screen
  {
    background(255);
    fill(0);
    textSize(25);
    text(screenText[1], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
  }

  if (screen == 1.0) //Start of Void
  {
    ScreenSetup();
    text(screenText[2], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    doNothing=0;
    goWest=0;
    goEast=0;
    goSouth=0;
    lookAround=0;
    goNorth=0;
  }
  /*if (lookAround == 1)
   {
   background(0);
   fill(255);
   textSize(25);
   text("You've already looked around here. There is nothing more to see.\n\nWhat will you do?", 30, 30);
   DrawButtons();
   }
   
   if (screen == 1.1)
   {
   zombieMode=1;
   ScreenSetup();
   text(screenText[54], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
   Button("Embrace Zombiehood", width/2 - 110, 680, 220, 30, 15);
   }
   
   if (screen == 1.2)
   {
   zombieMode=2;
   ScreenSetup();
   Button("Allow a Narrator to Take Over", width/2 - 150, 550, 300, 30, 15);
   for(int i = 0; i < 13; i++)
   {
   image(photo, brainImageXPosition[i], random(900));
   }
   }
   */
  if (screen == 2.0) //Go West path; screen >= 2.0 && screen < 3.0 are all west path
  {
    goWest=1; 
    ScreenSetup();
    text(screenText[3], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.01)
  {
    ScreenSetup();
    text(screenText[4], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    goWest=0;
    goEast=0;
    goNorth=0;
    goSouth=0;
    lookAround=0;
    doNothing=0;
  }

  if (screen == 2.1)
  {
    goWest=2;
    ScreenSetup();
    text(screenText[5], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.11)
  {

    ScreenSetup();
    text(screenText[6], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Grab Rocks", 30, 550, 120, 30, 15);
    Button("Run Further Into Cave", 300, 550, 230, 30, 15);
    Button("Attempt to Communicate", 610, 550, 255, 30, 30);
    Button("Run Away", 960, 550, 110, 30, 30);
    Button("Do Nothing", 1260, 550, 125, 30, 30);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.12)
  {
    goWest=3;
    ScreenSetup();
    text(screenText[7], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.123)
  {

    ScreenSetup();
    text(screenText[50], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    /*
    rect(30, 550, 225, 30, 15);
     fill(0);
     textSize(20); 
     text("Go Further Into Cave", 37, 573);   
     fill(255);
     rect(360, 550, 110, 30, 15);
     fill(0);
     textSize(20);
     text("Sit At Fire", 367, 573);
     fill(255);
     rect(610, 550, 270, 30, 30);
     fill(0);
     textSize(20);
     text("Try to Communicate Again", 615, 573);
     fill(255);
     rect(1000, 550, 120, 30, 30);
     fill(0);
     textSize(20);
     text("Leave Cave", 1007, 573);
     fill(255);
     rect(1260, 550, 125, 30, 30);
     fill(0);
     textSize(20);
     text("Do Nothing", 1265, 573);
     Button("Look Around", 30, 680, 135, 30, 15);
     
     */
  }

  if (screen == 2.13)
  {
    goWest=3;
    ScreenSetup();
    text(screenText[8], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.14)
  {

    ScreenSetup();
    text(screenText[9], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    rect(30, 550, 120, 30, 15);
    fill(0);
    textSize(20);
    text("Grab Rocks", 37, 573);   
    fill(255);
    rect(300, 550, 230, 30, 15);
    fill(0);
    textSize(20);
    text("Run Further Into Cave", 310, 573);
    fill(255);
    rect(610, 550, 255, 30, 30);
    fill(0);
    textSize(20);
    text("Attempt to Communicate", 615, 573);
    fill(255);
    rect(960, 550, 110, 30, 30);
    fill(0);
    textSize(20);
    text("Run Away", 965, 573);
    fill(255);
    rect(1260, 550, 125, 30, 30);
    fill(0);
    textSize(20);
    text("Do Nothing", 1265, 573);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.2)
  {
    goWest=3;
    ScreenSetup();
    text(screenText[10], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.3)
  {
    ScreenSetup();
    text(screenText[11], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.4)
  {
    goWest=6;
    ScreenSetup();
    text(screenText[12], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.5)
  {
    goWest=7;
    ScreenSetup();
    text(screenText[13], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    rect(30, 550, 115, 30, 15);
    fill(0);
    textSize(20);
    text("Go Deeper", 37, 573);   
    fill(255);
    rect(330, 550, 100, 30, 15);
    fill(0);
    textSize(20);
    text("Text2", 340, 573);
    fill(255);
    rect(630, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text3", 635, 573);
    fill(255);
    rect(930, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text4", 935, 573);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.6)
  {
    goWest=8;
    ScreenSetup();
    text(screenText[14], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    rect(30, 550, 200, 30, 15);
    fill(0);
    textSize(20);
    text("Approach Chanters", 37, 573);   
    fill(255);
    rect(330, 550, 100, 30, 15);
    fill(0);
    textSize(20);
    text("Text2", 340, 573);
    fill(255);
    rect(630, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text3", 635, 573);
    fill(255);
    rect(930, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text4", 935, 573);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.7)
  {
    goWest=9;
    ScreenSetup();
    text(screenText[15], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    rect(30, 550, 205, 30, 15);
    fill(0);
    textSize(20);
    text("Interrupt Ceremony", 37, 573);   
    fill(255);
    rect(330, 550, 100, 30, 15);
    fill(0);
    textSize(20);
    text("Text2", 340, 573);
    fill(255);
    rect(630, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text3", 635, 573);
    fill(255);
    rect(930, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Text4", 935, 573);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.8)
  {
    goWest=10;
    ScreenSetup();
    text(screenText[16], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.81)
  {
    goWest=11;
    ScreenSetup();
    text(screenText[17], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.811)
  {

    ScreenSetup();
    text(screenText[18], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.82)
  {
    ScreenSetup();
    text(screenText[19], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.83)
  {
    ScreenSetup();
    text(screenText[20], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.84)
  {
    ScreenSetup();
    text(screenText[21], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Kiss Blue", 330, 680, 105, 30, 15);
    DrawButtons();
  }

  if (screen == 2.841)
  {
    ScreenSetup();
    text(screenText[22], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 2.85)
  {

    ScreenSetup();
    text(screenText[23], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.0) //Go East path, 3.0 -> 3.999...
  {
    goEast=1;
    ScreenSetup();
    text(screenText[24], 30, 30);
    DrawButtons();
  }

  if (screen == 3.02)
  {
    goEast=1;
    ScreenSetup();
    text(screenText[25], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.1)
  {
    goEast=2;
    ScreenSetup();
    text(screenText[26], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.2)
  {
    goEast=3;
    ScreenSetup();
    text(screenText[27], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.21)
  {
    ScreenSetup();
    text(screenText[28], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.3)
  {
    goEast=4;
    ScreenSetup();
    text(screenText[29], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.4)
  {
    goEast=5;
    ScreenSetup();
    text(screenText[30], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 3.5)
  {
    goEast=6;
    ScreenSetup();
    text(screenText[31], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Run Away", 30, 550, 105, 30, 15);
    Button("Follow Men", 330, 550, 120, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 3.6)
  {
    goEast=7;
    ScreenSetup();
    text(screenText[32], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Leave Village", 30, 550, 145, 30, 15);
    Button("Enter Hut", 330, 550, 105, 30, 15);
    Button("Explore Area", 630, 550, 140, 30, 15);
    Button("Flail Aimlessly", 930, 550, 147, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 3.7)
  {
    goEast=8;
    ScreenSetup();
    text(screenText[53], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Leave Village", 30, 550, 145, 30, 15);
    Button("Enter Hut", 330, 550, 105, 30, 15);
    Button("Explore Area", 630, 550, 140, 30, 15);
    Button("Flail Aimlessly", 930, 550, 147, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 3.63)
  {
    goEast=8;
    ScreenSetup();
    text(screenText[51], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }


  if (screen == 4.0) //Go North, 4.0 -> 4.999...
  {
    goNorth=1;
    ScreenSetup();
    text(screenText[33], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 4.1)
  {
    goNorth=2;
    ScreenSetup();
    text(screenText[34], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  //  if (screen == 4.2)
  //  {
  //    background(4);
  //    fill(255);
  //    textSize(25);
  //    text(screenText[35], 30, 30);
  //    DrawButtons();
  //  }

  if (screen == 5.0) //Go South, 5.0 -> 5.999...
  {
    goSouth=1;
    lookAround=0;
    ScreenSetup();
    text(screenText[36], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 5.01)
  {
    goSouth=1; 
    lookAround=1;
    flashlightGet=true;
    ScreenSetup();
    text(screenText[37], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    Inventory();
  }

  if (screen == 5.011)
  {
    flashlightGet=true;
    ScreenSetup();
    text(screenText[38], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    Inventory();
  }

  if (screen == 5.1)
  {
    goSouth=2;
    ScreenSetup();
    text(screenText[39], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 5.11)
  {
    goSouth=3;
    ScreenSetup();
    text(screenText[40], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 5.12)
  {
    goSouth=4;
    ScreenSetup();
    text(screenText[41], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 5.121)
  {
    goSouth=5;
    ScreenSetup();
    text(screenText[42], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Eat the Blue Mushroom", 300, 550, 240, 30, 15);
    Button("Eat the Red Mushroom", 800, 550, 240, 30, 15);
  }

  if (screen == 5.1211)
  {
    goSouth=6;
    TripSongSwitch();
    ScreenSetup();
    text(screenText[43], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Stop Feeling Weird", width/2 - 100, 550, 200, 30, 15); 
    if ((millis() - timer >= 5000))
    {
      for (int i = 0; i < 100; i++)
      {
        color c = color(random(255), random(255), random(255));
        fill(c);
        ellipse(random(1400), random(900), 70, 70);
      }
    }
  }

  if (screen == 5.1212)
  {
    goSouth=6;
    TripSongSwitch();
    ScreenSetup();
    text(screenText[44], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    Button("Stop Feeling Weird", width/2 - 100, 550, 200, 30, 15);   
    if ((millis() - timer >= 5000))
    {
      for (int i = 0; i < 100; i++)
      {
        color c = color(random(255), random(255), random(255));
        fill(c);
        rect(random(1400), random(900), random(100), random(100));
      }
    }
  }

  if (screen != 5.1211 && screen != 5.1212)
  {    
    SongSwitch();
  }

  if (screen == 5.1213)
  {
    goSouth=7;
    song2.pause(); 
    ScreenSetup();
    text(screenText[45], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 5.2)
  {
    goSouth=3;
    bloodstainedNoteGet=true;
    ScreenSetup();
    text(screenText[46], textBoxX, textBoxY, textBoxWidth, textBoxHeight); 
    DrawButtons();
    Inventory();
  }

  if (screen == 5.3)
  {
    goSouth=4;
    bloodstainedNoteGet=true;
    ScreenSetup();
    text(screenText[52], textBoxX, textBoxY, textBoxWidth, textBoxHeight); 
    DrawButtons();
    Inventory();
  }

  if (screen == 6.0) //Do Nothing, 6.0 -> 6.999...
  {
    doNothing=1;
    ScreenSetup();
    text(screenText[47], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    lookAround=0;
    DrawButtons();

    if (lookAround == 1)
    {
      ScreenSetup();
      text("You've done nothing since last looking around, and have already looked around here. Your doing nothing has, well, changed nothing, and there is no new scenery to observe. Wait, no, there's a rock you didn't pick up before. Nothing suspicious about it in the least, just a rock. There, you've looked around.\n\nWhat will you do?", 30, 30);
      DrawButtons();
    }
  }

  if (screen == 6.1)
  {
    doNothing=2;
    ScreenSetup();
    text(screenText[48], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
  }

  if (screen == 6.2)
  { 
    doNothing=3;
    ScreenSetup();
    text(screenText[49], textBoxX, textBoxY, textBoxWidth, textBoxHeight);
    DrawButtons();
    if ((millis() - timer >= 5000))
    {
      {
        rect(0, 0, width, height);
      }
    }
  }

  println("Screen: " + screen, "Go West: " + goWest, "Go East: " + goEast, "Go South: "
    + goSouth, "Go North: " + goNorth, "Do Nothing: " + doNothing, "Zombie Mode: " + zombieMode, "Look Around: " + lookAround, 
    "Time: " + millis(), "Song Loop Status: " + song.isLooping()); //Prints screen number and state of variables to console for easier editing while game is open
}

void keyPressed()
{

  if (key == BACKSPACE) //Reset
  {

    screen=0.1;
  }

  if (key == 'r' && screen >= 1.0) //Reset Game
  {  
    screen=1.0;
  }
}

void mousePressed() //Used for screen changes in place of actual "buttons"—if mouseX, mouseY, screen, and variables are at a certain state, a corrosponding screen change will take place when the mouse is pressed.
{


  if (mouseX >= 330 && mouseX <= 495 && mouseY >= 680 && mouseY <= 710 && screen == 1.0)
  {
    screen=1.1;
  }

  if (mouseX >= width/2 - 110 && mouseX <= width/2 + 110 && mouseY >= 680 && mouseY <= 710 && zombieMode == 1)
  {
    screen=1.2;
  }

  if ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 1.0 && goWest == 0)||
    (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 2.01 && goWest == 0))
  {
    screen=2.0;
  }

  if (mouseX >= 30 && mouseX <= 145 && mouseY >= 550 && mouseY <= 580 && screen == 2.0 && goWest == 1)
  {
    screen=2.1;
  }

  if (mouseX >= 300 && mouseX <= 530 &&  mouseY >= 550 && mouseY <= 580 && screen == 2.1 && goWest == 2)
  {
    screen=2.11;
  }

  if (mouseX >= 610 && mouseX <= 865 &&  mouseY >= 550 && mouseY <= 580 && screen == 2.1 && goWest == 2)
  {
    screen=2.12;
  }

  if (mouseX >= 610 && mouseX <= 880 &&  mouseY >= 550 && mouseY <= 580 && screen == 2.12 && goWest == 3)
  {
    screen=2.123;
  }

  if (mouseX >= 960 && mouseX <= 1070 &&  mouseY >= 550 && mouseY <= 580 && screen == 2.1 && goWest == 2)
  {
    screen=2.13;
  }

  if (mouseX >= 1260 && mouseX <= 1385 && mouseY >= 550 && mouseY <= 580 && screen == 2.1 && goWest == 2)
  {
    screen=2.14;
  }

  if (mouseX >= 30 && mouseX <= 150 && mouseY >= 550 && mouseY <= 580 && screen == 2.1 && goWest == 2)
  {

    screen=2.2;
  }

  if ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 2.2 && goWest == 3) || 
    (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 2.2 && goWest == 3) || 
    (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 2.2 && goWest == 3) ||
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.2 && goWest == 3) || 
    (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.2 && goWest == 3))
  {
    screen=2.3;
  }

  if  ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 2.3 && goWest == 5) || 
    (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 2.3 && goWest == 5) || 
    (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 2.3 && goWest == 5)||
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.3 && goWest == 5) || 
    (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.3 && goWest == 5))
  {
    screen=2.4;
  }

  if ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 2.4 && goWest == 6) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 2.4 && goWest == 6) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 2.4 && goWest == 6)||(mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.4 && goWest == 6))
  {
    screen=2.5;
  }

  if (mouseX >= 30 && mouseX <= 145 && mouseY >= 550 && mouseY <= 580 && screen == 2.5 && goWest == 7)
  {
    screen=2.6;
  }

  if (mouseX >= 30 && mouseX <= 230 && mouseY >= 550 && mouseY <= 580 && screen == 2.6 && goWest == 8)
  {
    screen=2.7;
  }

  if (mouseX >= 30 && mouseX <= 235 && mouseY >= 550 && mouseY <= 580 && screen == 2.7 && goWest == 9)
  {
    screen=2.8;
  }

  if (mouseX >= 30 && mouseX <= 135 && mouseY >= 550 && mouseY <= 580 && screen == 2.8 && goWest == 10)
  {
    screen=2.81;
  }

  if (mouseX >= 30 && mouseX <= 135 && mouseY >= 550 && mouseY <= 580 && screen == 2.81 && goWest == 11)
  {
    screen=2.811;
  }

  if (mouseX >= 330 && mouseX <= 435 && mouseY >= 550 && mouseY <= 580 && screen == 2.8 && goWest == 10)
  {
    screen=2.82;
  }

  if (mouseX >= 630 && mouseX <= 750 && mouseY >= 550 && mouseY <= 580 && screen == 2.8 && goWest == 10)
  {
    screen=2.83;
  }

  if (mouseX >=930 && mouseX <=1050 && mouseY >= 550 && mouseY <= 580 && screen == 2.8 && goWest == 10)
  {
    screen=2.84;
  }

  if (mouseX >=330 && mouseX <=435 && mouseY >= 680 && mouseY <= 710 && screen == 2.84)
  {
    screen=2.841;
  }

  if ((mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.8) ||
    (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.84))
  {
    screen=2.85;
  }

  if ((mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 1.0 && goEast == 0) ||
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.01 && goEast == 0))
  {
    screen=3.0;
  }

  if (mouseX >= 330 && mouseX <= 465 && mouseY >= 680 && mouseY <= 710 && screen == 3.0)
  {
    screen=3.02;
  }

  if ((mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.0 && goEast == 1) ||
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.02 && goEast == 1))
  {
    screen=3.1;
  }

  if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.1 && goEast == 2)
  {
    screen=3.2;
  }

  if (mouseX >= 330 && mouseX <= 465 && mouseY >= 680 && mouseY <= 710 && screen == 3.2)
  {
    screen=3.21;
  }

  if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.2 && goEast == 3)
  {
    screen=3.3;
  }

  if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.3 && goEast == 4)
  {
    screen=3.4;
  }

  if ((mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 3.4 && goEast == 5) ||
    (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 3.4 && goEast == 5) ||
    (mouseX >= 630 && mouseX <= 730 && mouseY >= 550 && mouseY <= 580 && screen == 3.4 && goEast == 5) ||
    (mouseX >= 930 && mouseX <= 1030 && mouseY >= 550 && mouseY <= 580 && screen == 3.4 && goEast == 5))
  {
    screen=3.5;
  }


  if (mouseX >= 330 && mouseX <=450 && mouseY >= 550 && mouseY <= 580 && screen == 3.5 && goEast == 6)
  {
    screen=3.6;
  }

  if (mouseX >= 330 && mouseX <=435 && mouseY >= 550 && mouseY <= 580 && screen == 3.6 && goEast == 7)
  {
    screen=3.7;
  }

  if (mouseX >= 930 && mouseX <=1077 && mouseY >= 550 && mouseY <= 580 && screen == 3.6 && goEast == 7)
  {
    screen=3.63;
  }

  if ((mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 1.0 && goNorth == 0) ||
    (mouseX >= 930 && mouseX <= 1030 && mouseY >= 550 && mouseY <= 580 && screen == 2.01))
  {
    screen=4.0;
  }

  if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 4.0 && goNorth == 1)
  {
    screen=4.1;
  }

  //  if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 4.1 && goNorth == 2)
  //  {
  //    screen=4.2;
  //  }

  if ((mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 1.0) ||
    (mouseX >= 630 && mouseX <= 730 && mouseY >= 550 && mouseY <= 580 && screen == 2.01))
  {
    screen=5.0;
  }

  if (mouseX >= 30 && mouseX <= 165 && mouseY >= 680 && mouseY <= 710 && screen == 5.0 && lookAround == 0)
  {
    screen=5.01;
  }

  if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 5.01 && lookAround == 1)
  {
    screen=5.011;
  }

  if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 5.0 && goSouth == 1)
  {
    screen=5.1;
  }

  if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 5.1 && goSouth == 2)
  {
    screen=5.11;
  }

  if ((mouseX >=30 && mouseX <=130 && mouseY >= 550 && mouseY <= 580 && screen == 5.11 && goSouth == 3) ||
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 5.11 && goSouth == 3) ||
    (mouseX >= 630 && mouseX <= 730 && mouseY >= 550 && mouseY <= 580 && screen == 5.11 & goSouth == 3) ||
    (mouseX >= 930 && mouseX <= 1030 && mouseY >= 550 && mouseY <= 580 && screen == 5.11 & goSouth == 3))
  {
    screen=5.12;
  }

  if (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 5.12 && goSouth == 4)
  {
    screen=5.121;
  }

  if (mouseX >= 300 && mouseX <= 540 && mouseY >= 550 && mouseY <= 580 && screen == 5.121 && goSouth == 5)
  {
    screen=5.1211;
  }

  if (mouseX >= 800 && mouseX <= 1040 && mouseY >= 550 && mouseY <= 580 && screen == 5.121 && goSouth == 5)
  {
    screen=5.1212;
  }

  if ((mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= 550 && mouseY <= 580 && screen == 5.1211 && goSouth == 6) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= 550 && mouseY <= 580 && screen == 5.1212 && goSouth == 6))
  {
    screen=5.1213;
  }

  if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 5.1 && goSouth == 2)
  {
    screen=5.2;
  }

  if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 5.2 && goSouth == 3)
  {
    screen=5.3;
  }

  if ((mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 1.0 && doNothing == 0) ||
    (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.01 && doNothing == 0))
  {
    screen=6.0;
  }

  if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 6.0 && doNothing == 1)
  {
    screen=6.1;
  }

  if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 6.1 && doNothing == 2)
  {
    screen=6.2;
  }

  if ((mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 2.3) ||
    (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 2.3) || 
    (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 2.3) || 
    (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.3) || 
    (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 2.3)) 
  {
    goWest += 1;
  }

  if (mouseX >= 30 && mouseX <= 165 && mouseY >= 680 && mouseY <= 710 && screen >= 1.0)
  {
    lookAround += 1;
  }
}


void mouseReleased() // Certain buttons are in void mouseReleased due to overlapping issues not fixed by variable, though likely now just a relic of poor organization
{

  if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 0.1)
  {
    screen=1.0;
  }

  if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 600 && mouseY <= 630 && screen == 0.1)
  {
    screen=0.2;
  }

  if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 650 && mouseY <= 680 && screen == 0.1)
  {
    exit();
  }

  if ((mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 2.82) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 2.841) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 2.85) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 2.811) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 3.63) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 4.1) ||
    (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 6.2))
  {
    screen=1.0;
    doNothing=0;
    goWest=0;
    goEast=0;
    goSouth=0;
    lookAround=0;
    goNorth=0;
  }

  if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 2.0 && goWest == 1)
  {
    screen=2.01;
  }
}

void Inventory() // Custom function which shows your current inventory
{

  if (flashlightGet == true)
  {
    fill(255);
    textSize(20);
    text("Items: Flashlight", width/2 - 115, height - 50);
  }
  if (bloodstainedNoteGet == true)
  {
    fill(255);
    textSize(20);
    text("Items: Stained Note", width/2 - 115, height - 50);
  }

  if (bloodstainedNoteGet == true && flashlightGet == true)
  {
    fill(255);
    textSize(20);
    text("Items: Flashlight, Stained Note", width/2 - 200, height - 50);
  }
}


void DrawButtons() //Custom function which draws the buttons rather than relying on drawing them in each screen. 
{
  if (screen == 0.1)
  {
    Button("Start", width/2 - 100, 550, 100, 30, 15);
    Button("About", width/2 - 100, 600, 100, 30, 15);
    Button("Quit", width/2 - 100, 650, 100, 30, 15);
  }

  /*  if (screen == 1.0)
   {
   Button("Go West", 30, 550, 100, 30, 15);
   Button("Go East", 330, 550, 100, 30, 15);
   Button("Go South", 630, 550, 100, 30, 15);
   Button("Go North", 930, 550, 100, 30, 15);
   Button("Do Nothing", 1230, 550, 125, 30, 15);
   Button("Look Around", 30, 680, 135, 30, 15);
   Button("Be a Zombie...?", 330, 680, 165, 30, 15);
   }
   */

  if (screen == 2.0)
  {
    Button("Enter Cave", 30, 550, 115, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.1)
  {
    Button("Grab Rocks", 30, 550, 120, 30, 15);
    Button("Run Further Into Cave", 300, 550, 230, 30, 15);
    Button("Attempt to Communicate", 610, 550, 255, 30, 15);
    Button("Run Away", 960, 550, 110, 30, 15);
    Button("Do Nothing", 1260, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.12)
  {
    Button("Go Further Into Cave", 30, 550, 225, 30, 15);   
    Button("Sit At Fire", 360, 550, 110, 30, 15);
    Button("Try to Communicate Again", 610, 550, 270, 30, 15);
    Button("Leave Cave", 1000, 550, 120, 30, 15);
    Button("Do Nothing", 1260, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.13)
  {
    Button("Turn Around", 30, 550, 135, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if ((screen == 2.2) || (screen == 2.3))
  {
    Button("Zzz? Zzz", 30, 550, 100, 30, 15);
    Button("Zzz, zzz", 330, 550, 100, 30, 15);
    Button("Zzz.....", 630, 550, 100, 30, 15);
    Button("Z! Z! Z!", 930, 550, 100, 30, 30);
    Button("Zzz...zzz.", 1230, 550, 125, 30, 15);
  }

  if (screen == 2.4)
  {
    Button("Wake Up", 30, 550, 100, 30, 15);
    Button("Wake Up", 330, 550, 100, 30, 15);
    Button("Wake Up", 630, 550, 100, 30, 15);
    Button("Wake Up", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
  } 

  if (screen == 2.8)
  {
    Button("Run Away", 30, 550, 105, 30, 15);
    Button("Play Dead", 330, 550, 105, 30, 15);
    Button("Grab Torch", 630, 550, 120, 30, 15);
    Button("Grab Spear", 930, 550, 120, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 2.81)
  {
    Button("Turn Around", 30, 550, 135, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 3.0)
  {
    Button("Go West", 30, 550, 100, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
    Button("Inspect Rock", 330, 680, 135, 30, 15);
  }

  if (screen == 3.2)
  {
    Button("Go West", 30, 550, 100, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
    Button("Inspect Rope", 330, 680, 135, 30, 15);
  }

  if (screen == 3.4)
  {
    Button("Struggle", 30, 550, 100, 30, 15);
    Button("Struggle", 330, 550, 100, 30, 15);
    Button("Struggle", 630, 550, 100, 30, 15);
    Button("Struggle", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if (screen == 5.11)
  {
    Button("Descend", 30, 550, 100, 30, 15);
    Button("Descend", 330, 550, 100, 30, 15);
    Button("Descend", 630, 550, 100, 30, 15);
    Button("Descend", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }

  if ((screen == 3.63) || (screen == 2.82) || (screen == 2.841) ||(screen == 2.85) || (screen == 2.811) || (screen == 4.1) || (screen == 6.2))
  {
    Button("Restart", width/2 - 100, 550, 100, 30, 15);
  }

  if (screen != 0.1 && screen != 2.0 && screen != 2.4 && screen != 3.0 
    && screen != 2.85 && screen != 4.1 && screen != 6.2 && screen != 2.1 
    && screen != 2.2 && screen != 2.3 && screen != 3.2 && screen != 2.841
    && screen != 3.4 && screen != 2.811 && screen != 2.8 && screen != 2.82
    && screen != 5.11 && screen != 2.12 && screen != 3.63 && screen != 2.13
    && screen != 2.81) //&& screen != 1.0) //This is the default set of buttons—if screen != the above values, this will be the DrawButtons that shows ups
  {
    Button("Go West", 30, 550, 100, 30, 15);
    Button("Go East", 330, 550, 100, 30, 15);
    Button("Go South", 630, 550, 100, 30, 15);
    Button("Go North", 930, 550, 100, 30, 15);
    Button("Do Nothing", 1230, 550, 125, 30, 15);
    Button("Look Around", 30, 680, 135, 30, 15);
  }
}


void Button(String labelText, int posX, int posY, int buttonWidth, int buttonHeight, int buttonCurve) // Custom function Button, which allows DrawButtons to function in the first place.
{
  if (screen != 0.1)
  {
    fill(255);
    rect(posX, posY, buttonWidth, buttonHeight, buttonCurve);
    fill(0);
    textSize(20);
    text(labelText, posX + 7, posY + 23);
  }

  if (screen == 0.1)
  {
    fill(255);
    rect(posX, posY, buttonWidth, buttonHeight, buttonCurve);
    fill(0);
    textSize(20);
    text(labelText, posX + 25, posY + 23);
  }
}

void ScreenSetup() //Attempt at cutting down lines of code, Screen is the presets for background, text color, and textSize, trying to incorporate the text itself as well but not sure how with it being an array of strings (no easy way to do [x + 1] or [x - 1] due to the messiness of the layout.
{  
  background(4);
  fill(255);
  textSize(25);
}

void TripSongSwitch() //Function to switch song at 5.1211/5.1212
{
  song.rewind();
  song.pause();
  song2.play();
}

void SongSwitch()

{
  if (!song.isPlaying()) //Function to switch song back/keep it looping after 5.1211/5.1212
  {
    song2.rewind();
    song2.pause();
    song.loop(loopCount);
  }
}