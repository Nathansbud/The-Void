import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer song;
AudioInput input;
int screen, donothing, gowest, goeast, gosouth, gonorth, lookaround, tb1, tb2, tb3, tb4;

void setup()

{

  fullScreen();
  screen=0;
  minim = new Minim(this);
  song = minim.loadFile("Princess of Helium.mp3");
  song.loop();
  tb1=30;
  tb2=30;
  tb3=1400;
  tb4=550;
}


void draw()

{

  if (screen == 1337)

  {

    background(255);
    fill(0);
    textSize(25);
    text("Hi! I'm Zack, though I tend to go by the pseudonym ''Nathansbud''. I've been enamored with coding lately, so I\ndecided to attempt a quote-on-quote text adventure. It's a work in progress! Unfortunately, since I'm still a\nbeginner (and thus, lacking knowledge of most coding-y things), this process is pretty tedious. Hopefully I finish\nbefore I die from exaustion.\n\n\nWish me luck!\n\n\n\n\n...and also hit delete because I really didn't want to code in a button. Thanks!", tb1, tb2, tb3, tb4);
  }

  if (screen == 0)

  {

    background(0);
    fill(255);
    textSize(50);
    text("Welcome to the Void", width/3 - 70, height/2);
    fill(255);
    rect(width/2 - 100, 550, 100, 30, 8);
    fill(0);
    textSize(20);
    text("Start", width/2 - 72, 573);
    fill(255);
    rect(width/2 - 100, 600, 100, 30, 8);
    fill(0);
    textSize(20);
    text("About", width/2 - 75, 623);
    fill(255);
    rect(width/2 - 100, 650, 100, 30, 8);
    fill(0);
    textSize(20);
    text("Quit", width/2 - 73, 673);
    donothing=0;
    gonorth=0;
    gosouth=0;
    gowest=0;
    goeast=0;
    lookaround=0;
  }

  if (screen == 1)

  {

    background(0);
    fill(255);
    textSize(25);
    text("You wake up in a black void. An eerie silence hangs in the air, little visible save for an almost unnoticable source of light to the west. To the north, south, and east, not much can be seen, though stumbling off in the darkness is a viable possibility nonetheless.\n\n\nWhat will you do?", tb1, tb2, tb3, tb4);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
    if (lookaround == 1)
    {

      background(0);
      fill(255);
      textSize(25);
      text("You've already looked around here. There is nothing more to see.\n\nWhat will you do?", 30, 30);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
    }
  }

  if (screen == 2)

  {


    background(4, 4, 4);
    fill(255);
    textSize(25);
    text("Heading towards the light source, you feel a worn cobblestone path beneath your feet. Thinking it a sign of good\nluck, you quicken your pace, nearly falling over yourself in your haste to be rid of the darkness.\n\nAs you near the source of light, your eyes make out the outline of a stone wall in front of you, blocking off your\npath. The light appears to be emanating from a hole in the wall, and you can hear noises coming from inside.\n\nWhat will you do?", tb1, tb2, tb3, tb4);

    buttonentercave();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 3)

  {
    background(4);
    fill(255);
    textSize(25);
    text("Entering the cave, you see three hooded figures sitting around a campfire. Evidentenly, this was the source of\nthe light. The tallest of the three looks up from the flames, before barking at the other two in a language you\ncan't understand. The three stand in unison, grabbing what appears to be a stone-tipped spear from the back of their robes. Grunting, they advance towards you at a frightening rate, the heads of their spears getting closer and closer by the second. On the ground near your foot you spot a few jagged rocks, but no other form of weaponry is in sight.\n\nWhat will you do?", tb1, tb2, tb3, tb4);
    rect(30, 550, 120, 30, 15);
    fill(0);
    textSize(20);
    text("Grab Rocks", 37, 573);   
    fill(255);
    rect(300, 550, 230, 30, 15);
    fill(0);
    textSize(20);
    text("Run Further into Cave", 310, 573);
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
    buttonlookaround();
  }

  if (screen == 4)

  {
    background(4);
    fill(255);
    textSize(25);
    text("Bending down, you grab as many rocks as you can, hurling them at the approaching figures. Unfortunately, rather\nthan slowing down, they speed up their approach, clearly angered by being hurled rocks at. A stone connects with\nthe nearest one's head, causing him to stumble backwards, but the other two are nearly an arm's length away.\nPicking up another stone is futile, and one of the figures thrusts outwards with the spear, jabbing you in the side.\n\nImmediately, searing pain travels throughout your body, and your vision clouds. Blood begins gushing out of the wound, and you have to clench your fists to stop from passing out. Even still, you fall over backwards, out cold. The men put down their spears, lifting you and moving your body over to the fireplace. Attempting to cauterize the wound, one of the figures thrusts their spear into the flames, holding the stone to the wound. The other grabs a length of cloth, tightly wrapping the wound to stop the blood flow. Who are these men? Why are they here? What do they want? What will you do?\n\n(Hint: Nothing, you're passed out)", tb1, tb2, tb3, tb4);
    rect(30, 550, 100, 30, 15);
    fill(0);
    textSize(20);
    text("Zzz? Zzz", 37, 573);   
    fill(255);
    rect(330, 550, 100, 30, 15);
    fill(0);
    textSize(20);
    text("Zzz...zzz", 340, 573);
    fill(255);
    rect(630, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Zzz! Zzz!", 635, 573);
    fill(255);
    rect(930, 550, 100, 30, 30);
    fill(0);
    textSize(20);
    text("Z...zz...", 935, 573);
    fill(255);
    buttondonothing();
  }

  if (screen == 5)

  {
    background(4);
    fill(255);
    textSize(25);
    text("Ignoring the light source to the west, you instead stumble off blindly to the east. Unable to see a thing, you put\nyour hands up for security—this proves to be a wise decision, saving your face from bashing into a tree. Thanks,\nhands! You feel your eyes beginning to adjust to the darkness, just in time to make out the figure of a four-legged\ncreature ahead of you.\n\n\nFalse alarm, just a rock. Lucky break!\n\n…can…rocks bite? Best not find out.", 30, 30);
    buttongowest(); 
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 9)

  {
    background(4);
    fill(255);
    textSize(25);
    text("Leaving your granite friend behind, you continue to the east. You know what they say, east is the least...dangerous\npath. Yes, that age-old saying, one of your favorites. Unfortunately, the least dangerous path seems to be the least\ninteresting as well, and nothing appears to be happening for the time being.\n\n\nWhat will you do?", 30, 30);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 10)

  {


    background(4);
    fill(255);
    textSize(25);
    text("You feel your eyes beginning to droop, but you shake your head and keeping walking. The further east you walk,\nthe more lost you begin to feel. A bat swoops overhead, startling you, but nothing else of interest seems to be\ngoing on. What little you can make out of your surroundings doesn't pain a very vivid picture of the landscape—the\noutline of trees, some pebbles here and there, and some rope laid out in a suspiciously trap-like manner.\n\n\n...wait, what?!", 30, 30);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 11)

  {


    background(4);
    fill(255);
    textSize(25);
    text("Making the choice to go north, you go on a walk of faith in the darkness, trusting your instincts not to lead you\nastray. Hopefully, the north will remember that you've chosen it as your path over all the others—apparently, it has\na fairly solid memory. Unlike the other paths, the northern one seems to feel more...open, in a sense, almost as if\nyou're nearing a clearing. The silence seems even quieter, in a way, ominously building up to something. But what\ncould be in this ''clearing''? Continuining onwards, you proceed with a greater sense of caution, wary of anything\nthat could happen in the open space.\n\nBut enough about that—driving any worried thoughts from your mind, you pause, catching your breath.\n\n\nWhat will you do?", 30, 30);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 12)

  {


    background(4);
    fill(255);
    textSize(25);
    text("This already boring-seeming path seems increasingly less interesting the more you walk. Fears of predators are quickly replaced by the unrelenting pain of pure boredom, even in this unknown world. If a diety was in charge of\ncreating the paths you walk along, he seriously decided to make this one as boring as possible. You contemplate a\nnap, but decide against it—that'll be reservered for when you can take the boredom no longer. Must. Keep. Walking.\nCan't...fall...a...sleep........AWAKE! You're awake, you didn't even come CLOSE to thinking of falling asleep. Instead, you fill your mind with thoughts of adventure. This certainly feels adventure-y, doesn't it? Well, maybe a part of the adventure that would be cut out of the story books, but what can you do? Sighing, you step over a rock in the\npath (sadly, the most interesting part thus far), and...\n\n...plummet? Yes, in your boredom-ridden state, you failed to notice the literal cliff you just stepped off of,\nplummeting straight to your death, thousands of feet below. Rest in pieces.", tb1, tb2, tb3, tb4);
    text("Score: 15", 620, 700);
    buttonrestart();
  }

  if (screen == 13)

  {


    background(4);
    fill(255);
    textSize(25);
    text("GoNorth3", 30, 30);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 14)

  {

    lookaround=0;
    background(4);
    fill(255);
    textSize(25);
    text("Deciding to choose one of the non-lit options, you turn and head south, hoping that won’t be the direction things turn. Though difficult to orient yourself, you make your best effort to head in a straight line such that if things do not smoothly, you can always turn back around. Unfortunately, having chosen to go south instead of west, the source of minimal light fades away until it is little but a speck in the distance. If only you had a flashlight, this expedition to the south would be made a whole lot easier. But alas, you do not, and the journey will remain shrouded in darkness. What a shame. Really, a flashlight would make the journey a LOT easier. But enough about the flashlight that unfortunately you do not have at this moment in time. Your woes put on a back-burner, you pause at what seems as good a place as any to do so. If only you had a flashlight…\n\n\nWhat will you do?", tb1, tb2, tb3, tb4);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();
  }

  if (screen == 15)

  {

    background(4);
    fill(255);
    textSize(25);
    text("Sighing, you trudge onwards, still hung up on your utter lack of a light source. Perhaps somebody left one behind earlier and you missed one entirely, too stubborn to look around. That would be a real shame, all things considered. If you would just turn around, maybe you could scower the area for firewood, or some flint and steel, or who knows, perhaps a flashlight left in the middle of the path in plain sight even. But alas, that would be foolish—clearly, you would find nothing. Your stomach grumbles, and you begin to realize that you haven't eaten in what feels like days. Hopefully you find something to eat soon, or you may actually starve to death.\n\nTo your left (east), you notice a dip in the trees, the flora seeming to thin to make way for something. Curious, you glance over, and notice that there seems to be a hole in the ground, unmarked and unconspicuous. But what could be in the hole?", tb1, tb2, tb3, tb4);
    buttongowest();
    buttongoeast();
    buttongosouth();
    buttongonorth();
    buttondonothing();
    buttonlookaround();


    if (screen == 22)

    {

      background(4);
      fill(255);
      textSize(25);
      text("buttstuff", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
    }

    if (screen == 16)

    {

      background(4);
      fill(255);
      textSize(25);
      text("Deciding that your relative safety is more valuable than investigating some unknown hole, you continue without checking it out. Instead, you continue south, sure that your legs will lead you in the right direction. Your eyes have mostly adapted to the darkness, though your vision is still very limited—so much so that your eyes nearly pass over a note in the middle of the path entirely. Hearing the sound of paper beneath your feet, however, you do a double take. There, clear as daylight beneath your foot (if crumbled a little bit from the impact) is a plain white note, scrawled on in near-illegible handwriting. Red splotches adorn the page, splattered here and there, seemingly at random. Is that...blood? Shivering, you attempt to read the note, but are unable to; while your eyes have adjusted to the darkness, it's still not enough for you to make out the wording on the letter. Sighing, you pocket the note, your desire to find a light source rekindled.\n\nWhat will you do?", tb1, tb2, tb3, tb4); 
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
      bloodstainednotehype();
    }


    if (screen == 6)

    {
      background(4);
      fill(255);
      textSize(25);
      text("You...did nothing. You remain standing in the blackness, and nothing has happened. Boredom threatens to overwhelm you.", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
    }

    if (screen == 7)

    {

      background(4);
      fill(255);
      textSize(25);
      text("Suddenly, out of nowhere...nothing happens. You continue to do nothing, not even twiddling your thumbs. Never in your life have you felt more lethargic.", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
    }

    if (screen == 8)

    { 

      background (4);
      fill(255);
      textSize(25);
      text("Suddenly, you fall over backwards, unable to lift your head off the ground. You have literally died of boredom.", tb1, tb2, tb3, tb4);
      text("Score: -1", 635, 400);
      fill(255);
      rect(630, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Restart", 645, 573);
    }

    if (screen == 80085)

    {

      background (4);
      fill(255);
      textSize(25);
      text("Zzzz, zzz zzzzzz zz z. Zzz, zz! Zzzz, zz? Z, zzz, zzzzzzz...zzz...z. Zzz. Z. Z? Z! Zzzzzzzz...\n\nZzz...zzzzzzzzzzzz...! Z. Z. Zzzzz...! Zzz zzzz z z zz zzzz zzzz zzz.", tb1, tb2, tb3, tb4);
      rect(30, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Zzz? Zzz", 37, 573);   
      fill(255);
      rect(330, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Zzz...zzz", 340, 573);
      fill(255);
      rect(630, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Zzz! Zzz!", 635, 573);
      fill(255);
      rect(930, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Z...zz...", 935, 573);
      fill(255);
      rect(1230, 550, 125, 30, 30);
      fill(0);
      textSize(20);
      text("Do Nothing", 1235, 573);
    }

    if (screen == 17)

    {

      background(4);
      fill(255);
      textSize(25);
      text("Zzz?", tb1, tb2, tb3, tb4);
      rect(30, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Wake Up", 37, 573);   
      fill(255);
      rect(330, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Wake Up", 340, 573);
      fill(255);
      rect(630, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Wake Up", 635, 573);
      fill(255);
      rect(930, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Wake Up", 935, 573);
      fill(255);
      rect(1230, 550, 125, 30, 30);
      fill(0);
      textSize(20);
      buttondonothing();
    }

    if (screen == 18)

    {

      background(4);
      fill(255);
      textSize(25);
      text("WakeUp", tb1, tb2, tb3, tb4);
      rect(30, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Text1", 37, 573);   
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
      fill(255);
      rect(1230, 550, 125, 30, 30);
      fill(0);
      textSize(20);
      text("Do Nothing", 1235, 573);
    }

    if (screen == 19)

    {

      background(0);
      fill(255);
      textSize(25);
      text("Taking a moment to acquaint yourself with your surroundings, you pause and squint your eyes. The darkness has quickly turned annoying, as anyone would agree. What little you can see is hard to make out, your path harder still. However, you can just barely see hills on the horizon, sloping upwards in contrast to the mostly flat terrain you've covered thus far—though, without any real light, there could easily be mountains all around you. The light you saw earlier was back to the west (east from your current point of view), but it has long since disappeared from view. You can't make out anything else, as it all seems to be blocked by tall, comically leafy trees. A flashlight would really go a long way.\n\nAnd just like that, you feel your foot kick up against something. Could it be...? Nope, just a rock. But wait, what's that in front of the rock? Aha! Reaching out, you feel your hand close around what appears to be a fully functioning flashlight. With working batteries. In the middle of pitch-black nowhere. Hey, best not question it.\n\nYou got: A Flashlight! Your field of vision is now far greater. What will you do?", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
      flashlighthype();
      donothing=0;
    }

    if (screen == 20)

    {

      background(50);
      fill(255);
      textSize(25);
      text("Armed with a flashlight, you decide...to do nothing. Your flashlight bathes the world around you in luminescene, and with this newfound vision, you...decide to do absolutely nothing. Instead, you choose to waste your battery life, dawdling in what you now correctly know to be a tree-filled area. Yet, not even stopping to ponder what this means for the future of your journey, you decide to literally do nothing and wait for inspiriation to strike. No—since thinking would mean doing something, you stare blankly ahead. No, you do it with your eyes closed, as staring ahead would mean you were doing something. Instead, you completely and utterly waste your time doing nothing.\n\nWhat will you do?", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
      flashlighthype();
    }

    if (screen == 21)

    {

      background(4);
      fill(255);
      textSize(25);
      text("Choosing the wisest option for your safety, you decide to give the rope trap a wide berth, continuing on in the direction you intended. The kind of people who set traps in the dark don't seem like the kind of people you want to associate with in your current defenseless state. So, quiet as a whisper, you tread east, hoping to find some way of understanding where you are and what you're meant to be doing. Much to your dismay, the trees don't seem to have mouths, and if they do, they seem to be quite tight-lipped about your current situation. Mentally cursing them out as loudly as you can, you wave your fists angrily in their general direction. Damn trees. You almost fail to notice another rope trap to your right in your anger at the trees, though luckily, you managed to take note of it before triggering it, and are able to walk off unscathed. Betrayed, you glare at the trees. This was probably their doing.\n\nWhat will you do?", tb1, tb2, tb3, tb4);
      buttongowest();
      buttongoeast();
      buttongosouth();
      buttongonorth();
      buttondonothing();
      buttonlookaround();
    }
    
  }

}

  void keyPressed()

  {

    if (key == BACKSPACE)

    {

      screen=0;
    }

    if (key == 'r' && screen >= 1)

    {  

      screen=1;
      donothing=0;
      gowest=0;
      goeast=0;
      gosouth=0;
      lookaround=0;
      gonorth=0;
    }
  }


  void mousePressed()

  {

    if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 1 && donothing == 0)

    {

      screen=6;
    }

    if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 6 && donothing == 1)

    {

      screen=7;
    }

    if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 7 && donothing == 2)

    {

      screen=8;
    }

    if (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 1 && gowest == 0)

    {

      screen=2;
    }

    if (mouseX >= 30 && mouseX <= 145 && mouseY >= 550 && mouseY <= 580 && screen == 2 && gowest == 1)

    {

      screen=3;
    }

    if (mouseX >= 30 && mouseX <= 150 && mouseY >= 550 && mouseY <= 580 && screen == 3 && gowest == 2)

    {

      screen=4;
    }

    if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 1 && goeast == 0)

    {

      screen=5;
    }

    if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 5 && goeast == 1)

    {

      screen=9;
    }

    if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 15 && goeast == 1)

    {

      screen=22;
  
    }

      if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 9 && goeast == 2)

      {

        screen=10;
      }

      if (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 10 && goeast == 3)

      {

        screen=21;
      }


      if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 1 && gonorth == 0)

      {

        screen=11;
      }

      if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 11 && gonorth == 1)

      {

        screen=12;
      }

      //  if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 12 && gonorth == 2)

      //  {

      //    screen=13;
      //  }

      if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 1)

      {

        screen=14;
      }

      if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 14 && gosouth == 1)

      {

        screen=15;
      }

      if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 15 && gosouth == 2)

      {

        screen=16;
      }

      if ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 4 && gowest == 3) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 4 && gowest == 3) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 4 && gowest == 3)||(mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 4 && gowest == 3) || (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 4 && gowest == 3))

      {

        screen=80085;
      }


      if (gowest == 5 && screen == 80085)

      {

        screen=17;
      }

      if ((mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen == 17 && gowest == 6) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 17 && gowest == 6) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 17 && gowest == 6)||(mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 17 && gowest == 6))

      {

        screen=18;
      }

      if (mouseX >= 30 && mouseX <= 165 && mouseY >= 680 && mouseY <= 710 && screen == 14 && lookaround == 0)

      {

        screen=19;
      }

      if (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 19 && lookaround == 1)

      {

        screen=20;
      }


      if ((mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 5) ||
        (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 9) ||
        (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 10) ||
        (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 15))

      {

        goeast += 1;
      }


      if (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen >= 1)

      {

        gosouth += 1;
      }


      if (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen >= 1)

      {

        gonorth += 1;
      }

      if (mouseX >= 30 && mouseX <= 130 && mouseY >= 550 && mouseY <= 580 && screen >=1)

      {

        gowest += 1;
      }

      if ((mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen==1) ||
        (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen==6) ||
        (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen==7) ||
        (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen==19))

      {

        donothing +=1;
      }

      if ((mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 4) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 80085) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 4) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 4) ||(mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 17)||(mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 17) || (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 80085) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 80085) || (mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 4) || (mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 4) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 4) ||(mouseX >= 1230 && mouseX <= 1345 && mouseY >= 550 && mouseY <= 580 && screen == 80085)||(mouseX >=930 && mouseX <=1030 && mouseY >= 550 && mouseY <= 580 && screen == 17) || (mouseX >= 330 && mouseX <= 430 && mouseY >= 550 && mouseY <= 580 && screen == 17) || (mouseX >=630 && mouseX <=730 && mouseY >= 550 && mouseY <= 580 && screen == 17))

      {

        gowest += 1;
      }

      if (mouseX >= 30 && mouseX <= 135 && mouseY >= 680 && mouseY <= 710)

      {
       
        lookaround += 1;
     
      }
      
  }


    void mouseReleased()

    {

      if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 0)

      {

        screen=1;
      }

      if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 600 && mouseY <= 630 && screen == 0)

      {

        screen=1337;
      }

      if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 650 && mouseY <= 680 && screen == 0)

      {

        exit();
      }

      if (mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 8 || mouseX >= width/2 - 100 && mouseX <= width/2 && mouseY >= 550 && mouseY <= 580 && screen == 12)

      {

        screen=1;
        donothing=0;
        gowest=0;
        goeast=0;
        gosouth=0;
        lookaround=0;
        gonorth=0;
      }
    }

    void buttongowest()

    {

      fill(255);
      rect(30, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Go West", 37, 573);
    }

    void buttongonorth()

    {

      fill(255);
      rect(930, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Go North", 935, 573);
    }

    void buttongoeast()

    {

      fill(255);
      rect(330, 550, 100, 30, 15);
      fill(0);
      textSize(20);
      text("Go East", 340, 573);
    }

    void buttongosouth()

    {

      fill(255);
      rect(630, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Go South", 635, 573);
    }

    void buttondonothing()

    {

      fill(255);
      rect(1230, 550, 125, 30, 30);
      fill(0);
      textSize(20);
      text("Do Nothing", 1235, 573);
    }

    void buttonentercave()

    {

      fill(255);
      rect(30, 550, 115, 30, 15);
      fill(0);
      textSize(20);
      text("Enter Cave", 35, 573);
    }

    void buttonlookaround()

    {

      fill(255);
      rect(30, 680, 135, 30, 15);
      fill(0);
      textSize(20);
      text("Look Around", 35, 703);
    }

    void screen1337()

    {

      background(255);
      fill(0);
      textSize(25);
      text("Hi! I'm Zack, though I tend to go by the pseudonym ''Nathansbud''. I've been enamored with coding lately, so I\ndecided to attempt a quote-on-quote text adventure. It's a work in progress! Unfortunately, since I'm still a\nbeginner (and thus, lacking knowledge of most coding-y things), this process is pretty tedious. Hopefully I finish\nbefore I die from exaustion.\n\n\nWish me luck!\n\n\n\n\n...and also hit delete because I really didn't want to code in a button. Thanks!", 30, 30);
    }

    void flashlighthype()

    {
      fill(255);
      textSize(20);
      text("Items: Flashlight", width/2 - 115, height - 50);
    }

    void bloodstainednotehype()

    {

      fill(255);
      textSize(20);
      text("Items: Stained Note", width/2 - 115, height - 50);
    }

    void buttonrestart()

    {

      fill(255);
      rect(630, 550, 100, 30, 30);
      fill(0);
      textSize(20);
      text("Restart", 645, 573);
    }