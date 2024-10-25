// CHARACTER VARIABLES. We track just two, using a +/- scale
VAR trust = 0
VAR panic = 0

// INVENTORY ITEMS
VAR plagueblood = false
VAR lantern = true

// STORY STATES: these can be done using read counts of knots; or functions that collect up more complex logic; or variables

//Day One
VAR addablood = false
VAR addalives = false
VAR addaleech = false
VAR ulrich = false
VAR weaver = false
VAR paloma = false
VAR inge = false
VAR marin = false
VAR weavername = false
VAR marinbook = false
VAR marinquestions = false
VAR stealhorse = false
VAR villagewarned = false

//The Turning & Aftermath
VAR concern = 0
    //1 = SELF
    //2 = ADDA & EVERICH
    //3 = VILLAGE
VAR corpse_clues = 0
VAR bodyhidden = false
VAR bodystaged = false
VAR bodyfound = false

//Day Two
VAR villagerskilled = 0
VAR paloma_clues = 0
VAR wolf_clues = 0
VAR wolves = false
VAR marinlives = true 
VAR everichlives = true
VAR louplives = true
VAR bloodsuckerexam = 0
VAR everichfetch = false
VAR marincreek = false

//DAY THREE
VAR beastwolf = 0
    //1 = BEAST
    //2 = WOLF - SUSPICIOUS
    //3 = WOLF - CONFIDENT
VAR loupquestions = 0

//EX: what kind of clue did we pass to Hooper?
//CONST NONE = 0
//CONST STRAIGHT = 1
//CONST CHESS = 2
//CONST CROSSWORD = 3
//VAR hooperClueType = NONE

// DEBUG mode adds a few shortcuts - remember to set to false in release!
VAR DEBUG = false
VAR marinDEBUG = false
VAR palomaDEBUG = false
{DEBUG:
	IN DEBUG MODE!
	* [Beginning]	-> start
    * [Day One] -> day_one
    * [Marin] ->DEBUG_marin
    * [Mandragora] -> mandragora
    * [Turning] -> turning
    * [Day Two] -> DEBUG_day_two
    * [Paloma's Corpse] -> DEBUG_palomascorpse
    * [Old Leech] -> old_leech
    * [Hunter] -> hunter
- else:
	// First diversion: where do we begin?
 -> start
}

 /*--------------------------------------------------------------------------------
	RAISE / LOWER FUNCTIONS
--------------------------------------------------------------------------------*/

 === function lower(ref x)
 	~ x = x - 1

 === function raise(ref x)
 	~ x = x + 1
 	
 === DEBUG_marin
 
 *[High trust]
    ~ trust = 2
    ~ marinDEBUG = true
    -> day_one.d1_marin
*[Low trust]
    ~ trust = 0
    ~ marinDEBUG = true
    -> day_one.d1_marin
    
 === DEBUG_palomascorpse
 ~ palomaDEBUG = true
 *[Body staged]
    ~ bodystaged = true
    ~ bodyfound = true
    -> day_two.palomas_corpse
*[Panic]
    ~ bodyfound = true
    -> day_two.palomas_corpse
 === DEBUG_day_two
 *[Plague blood]
    ~ plagueblood = true
 -> day_two
 *[Body staged]
    ~ bodystaged = true
    ~ bodyfound = true
    -> day_two
*[Panic]
    ~ bodyfound = true
    -> day_two


/*--------------------------------------------------------------------------------
	S T A R T
--------------------------------------------------------------------------------*/

=== start === 
-> treat_adda



 /*--------------------------------------------------------------------------------
    T R E A T  A D D A
--------------------------------------------------------------------------------*/


=== treat_adda ===

You awaken to a pounding on your door.
EVERICH: Leech! It's my young Adda, she's ill!
    * [Answer the door.]
- Though it's before dawn, you rise and greet the worried family. The father, Everich, carries a young girl to the table and sets her down atop it. 
The work of a village's Leech is never done, it seems. You've spent your days healing the aches and pains of these people for nearly four winters now, yet new ailments seem to grow on trees out in the swampy wilderness. 
You turn your attention back to the girl, Adda. 
* [Examine your patient.]
    She lies on the table, shivering and groaning in pain.
 # IMAGE: images/subdivider.png
- (examine)
* (arms) Her arms... 
    You catch sight of a dark red bruise. Then another. 
        ** LEECH: How did she get these marks?
            The man seems surprised, then worried. 
            EVERICH: I... I don't know. She's not been 'round the other kids for a week now, she's been at home resting. Hoped this bout of illness would clear on its own...
            Unhelpful. But worth filing away for later. {not neck: -> examine | -> treatment}
* (neck) Her neck...
    She has a growth. A pustule a bit larger than a pea, angry and red. You've never seen anything quite like it before.
    You spot another, slightly larger. Fascinating. {not arms: -> examine | -> treatment}
*{arms}[Conclude your examination.]
    -> treatment
*{neck}[Conclude your examination.]
    -> treatment

 - (treatment)   
* [Concoct a treatment.]
- It's clear to see that she's suffering from a form of dyscrasia — an imbalance of the humors — but that appears to be a symptom of something greater. 
She has an excess of blood, proven by her fever, bruising, and those terrible red growths.
The pustules scare you the most. Perhaps it would be best to lance them, but the girl is already in pain and it might be best to let her body fight on its own. The common response for excessive blood is bloodletting, but this may be an uncommon situation.
* [Lance the pustules.] ->lance
* [Let her blood.] ->let
* [Soothe her pain.] ->soothe

 = lance
 # IMAGE: images/divider.png
 
~ addablood = true
~ raise (panic)
Rooting out the problem at the apparent source is the most direct route to a solution. 
You turn to the girl's father.
* LEECH: Hold her still. I'm going to drain those growths.
    After a moment, her squirming ceases. Perfect.
    You carefully slice the skin of each pustule with your scalpel. Dark blood, sick blood, pours from the cuts. It almost smells sour.
    You press a bowl to the steady flow of blood. The wounds must drain until the blood runs clean.
        ** [Wait.]
            # IMAGE: images/subdivider.png
            Everich passes you a new bowl when you ask for it. He hesitates as you hand him the bowl full of blood.
            EVERICH: Leech... what shall I do with this?
            He's completely lost. Suddenly you miss the busy clinic back in the city.
- 
*LEECH: Set it on the table there, I'll deal with it later.
    ~ plagueblood = true
    EVERICH: As you say.
    He places it among your tools and clutter, then returns to his daughter's side. -> lance_drainstaunch 
*LEECH: Dump it outside. I have no need of it. 
    You hear the door open, the splat of blood on dead leaves, then Everich returns.
    The blood is still tainted. If you don't staunch the flow soon, she may die. 
    But with this sludge in her veins, she may be dead already. -> lance_drainstaunch

- (lance_drainstaunch)
* [Continue draining the tainted blood.] 
    Draining the tainted blood is the best you can do without more information. You send the girl's father home with instructions to return at sunrise. 
    What is this illness? Surely the pustules and blood are related, but how? Questions consume your attention as the girl's blood fills a second bowl.
        **[Wait.]
            # IMAGE: images/subdivider.png
            You're startled from your thoughts by the girl's sudden convulsing. She's too pale, she's lost too much blood.
            You set the bowl aside and do your best to wrap the wounds despite her thrashing. Adda's death is neither peaceful nor painless. She passes just as the sun rises, mere moments before her father arrives.
            It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
            Once Everich leaves, you must as well. You need to gather more supplies.
            *** [Leave your home.]
* [Staunch the flow.] 
    Your supplies are running low. You make a salve using the last of your mandragora. It should keep the wounds from festering. If you're lucky, your efforts will be enough to cure this mystery ailment. You're rarely lucky.
    You send the girl's father home with instructions to return at sunrise. With your medicinals administered, all anyone can do is wait. 
        **[Wait.]
            # IMAGE: images/subdivider.png
            You pass the time combing through your books for any sort of similar ailment. You've never seen anything like this, and it seems nobody else has either. 
            The girl's condition steadily worsens, despite your best efforts. She passes just as the sun rises, mere moments before her father arrives.
            It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
            Once Everich leaves, you must as well. You need to gather more supplies.
            *** [Leave your home.]
- -> day_one

= let
# IMAGE: images/divider.png

~ raise (trust)
~ addaleech = true
The ceramic lid of the jar is cold when you lift it. The wriggling shapes inside stir when you disturb them. You pick out three, that should be sufficient. 
Leeches. Magical little creatures, to the uneducated. To you, they are medical instruments — perhaps even collaborators in your work. Bloodletting is already a great tool of the healer, but leeches provide additional benefits. Their saliva has anesthetic and anticoagulant properties and they avoid the messiness of letting blood with a blade.
The leeches latch onto the girl's arms easily, now to wait for them to work their magic.
* [Wait.]
    # IMAGE: images/subdivider.png
    ~ addalives = true
    In the meantime, you can help in your own way. You make a salve using the last of your mandragora and apply it to the pustules. Your supplies are running low, something to be solved later.
    The leeches detach when their bellies are full and you place them back in the jar as dawn arrives. Adda rests peacefully, as does Everich in a chair next to her. 
        **LEECH: Everich, will you keep an eye on her? I need to gather more supplies. She should remain stable.
            Everich wakes when you say his name and blinks at you a few times, processing what you said. A moment passes and he nods before settling back into the chair.
            ***[Leave your home.]
                -> day_one
        **[Write a note for Everich.]
                You write a note for Everich explaining your absence, then quietly leave your home. Adda should be fine while you're out and if not, Everich will come find you.
            *** [Leave your home.]
                -> day_one
        **[Prepare to leave without disturbing their rest.]
                You quietly leave your home. Adda should be fine while you're out and if not, Everich will come find you.
            *** [Leave your home.]
            -> day_one

= soothe
# IMAGE: images/divider.png

~ raise (panic)
Your supplies are running low. You make a salve using the last of your mandragora. You apply it to the pustules and get to work brewing a tea that should help with the fever.
It's not much, but you are hesitant to let her blood at this stage, whether by leech or blade. 
You send the girl's father home with instructions to return at sunrise. With your medicinals administered, all anyone can do is wait. 
*[Wait.]
    # IMAGE: images/subdivider.png
    You pass the time combing through your books for any sort of similar ailment. You've never seen anything like this, and it seems nobody else has either. 
    The girl's condition steadily worsens, despite your best efforts. The pustules on her neck burst in a gory spray and her fever is nigh unstoppable. You wrap her neck to stop the bleeding, but the illness has done its work. 
    Adda passes just as the sun rises, mere moments before her father arrives.
    It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
    Once Everich leaves, you must as well. You need to gather more supplies.
    ** [Leave your home.]
    -> day_one


 /*--------------------------------------------------------------------------------
    D A Y  O N E
--------------------------------------------------------------------------------*/


=== day_one ===
# CLEAR
# IMAGE: images/divider.png

This village rises with the dawn. The farmers have gone to work their fields and the baker has already been up for some time. 
{addalives: With Adda resting, you can afford to spend the day restocking your supplies and checking in on other villagers. | You're still troubled by the events of the morning but you need to restock your supplies, lest you be caught unprepared.}
There a few things you need: leeches, bandages, and mandragora.
Paloma, the leech collector, is probably expecting you to stop by. As is the weaver, who supplies your bandages. You must harvest the mandragora yourself, but that can only be done at night. Besides, beforehand you must stop by Paloma's and ask to borrow her horse.
Your neighbor, Ulrich, sits in his usual spot — a rickety chair just outside his door.{not addalives: There's no way he didn't hear the girl's cries of pain. The walls are too thin.} The old man makes a habit of involving himself in business that's not his own, so it's no surprise when he meets your gaze and calls out to you.
ULRICH: Leech! Come 'ere a moment! 
*LEECH: Good morning, Ulrich. -> d1_ulrich_friendly 
*LEECH: What is it, old man? -> d1_ulrich_unfriendly
*(ignored)[Ignore him.] -> d1_weaver

//MANAGE APPROVAL CHANGES OUTSIDE OF TARGET STITCH:
- (d1_ulrich_friendly)
~ raise (trust) 
-> d1_ulrich

- (d1_ulrich_unfriendly)
~ lower (trust) 
-> d1_ulrich


= d1_ulrich
~ ulrich = true
~ raise (panic)
{viaweaver:LEECH: You wanted something?}
ULRICH: I heard about that business with the girl,{addalives: I'm glad to hear she's alright| I'm sorry to hear about her passing.} Do you know what ailed her?
*LEECH: {addalives:She is suffering|She suffered} a terrible fever and some bruising. Nothing to worry yourself about. 
    ULRICH: Ah, but illness harms most especially the youngest and eldest. I've been around long enough to know that what concerns the little ones concerns me too.
    He sighs and glares at the sky. 
    ULRICH: Well, just let me know if I need to be worried about something going 'round. We're neighbors, after all.
    **LEECH: I will, Ulrich, you needn't truly worry.
        ~ lower (panic)
        He nods, pleased with your answer.
        ULRICH: Alright, then I'll save my worrying for other problems. Thank you, Leech. Good day, then.
    **LEECH: Yes, yes. If this turns out to be some apocalyptic plague I'll be sure to let you know.
        ~ lower (panic)
        His brow furrows as he searches your expression, unsatisfied with your answer.
        ULRICH: Sure. You'd best be going now. Wouldn't want to get in the way of someone so important as yourself.
    **LEECH: To be honest, I'm not quite sure what her illness {addalives:is|was}. But trust me, panicking won't do any good right now.
        He looks concerned.
        ~ raise (panic)
        ULRICH: Well. I appreciate your honesty. Even with all those books and your fancy education, it seems you don't know everything. I s'pose we'll just have to pray the girl {addalives:survives|is the only one to die of it}.
        ULRICH: Anyways, I won't bother you any longer. Good day, Leech.
*LEECH: I'm not entirely sure, but I hope to find out.
~ raise (panic)
He looks concerned.
ULRICH: Well. I appreciate your honesty. Even with all those books and your fancy education, it seems you don't know everything. I s'pose we'll just have to pray the girl {addalives:survives|is the only one to die of it}.
ULRICH: Anyways, I won't bother you any longer. Good day, Leech.
- 
* {not weaver}[Visit the weaver for bandages.] -> d1_weaver
* {not paloma && not weaver}[Visit the leech collector.] -> d1_paloma
* {not paloma && weaver}[Visit the leech collector.] -> d1_paloma


= d1_weaver
# IMAGE: images/divider.png

~ weaver = true
{ignored: You walk past the old man, paying him no mind. You need more bandages, which means visiting the weaver.}
You knock on {ignored:her|the weaver's door} door and enter when she calls for you to. Her home is neat and orderly, as it always is. 
Despite how often you visit — always to pick up the bandages she graciously supplies you with — you're not close with the blind young woman. You don't even know her name.
The bandages are neatly stacked by the door, as they always are.
*[Leave without a word.]
*LEECH: Thank you, weaver.
WEAVER: It's not a problem, Leech. 
    **LEECH: I've never asked, what is your name?
        ~ raise (trust)
        ~ weavername = true
        She's surprised by the question.
        WEAVER: Ysolde. I suppose I've never told you.
        She thinks for a moment and turns to face you, eyes landing somewhere over your shoulder.
        YSOLDE: And what about you, what's your name?
        ***[Tell her your name.]
            It's funny, you haven't used it in so long. It's almost odd to hear out loud. 
            She repeats it, as though cataloguing the syllables.
            YSOLDE: If you'd like, you can come over for a meal any time. I'd be glad to have you.
            ****LEECH: Perhaps I'll take you up on that, Ysolde.
            ****LEECH: Thank you, and the same to you.
        ***LEECH: It matters little, in this village I am just the Leech.
        ~ lower (trust)
        It was one thing to ask her name, it's another to give your own. Besides, nobody here knows it. 
        YSOLDE: I disagree, but you needn't tell it if you don't wish. I won't push you.
        YSOLDE: Well, I won't keep you from your business. Good day, Leech.
        ****LEECH: Good day.
    **[Leave.] 
-
You collect the bandages, leave a small bag of coin in its place, and exit her home. 
{not ulrich: Ulrich still seems to be trying to catch your attention.}
* (viaweaver){not ulrich}[See what Ulrich wants.] -> d1_ulrich
* {not paloma}[Visit the leech collector.] -> d1_paloma


= d1_paloma
 # IMAGE: images/divider.png
 
~ paloma = true
The Leech and leech collector in any village are like two parts of a whole. A symbiotic relationship, with each relying on the other for their livelihoods — and both relying on leeches for it all. 
You've known Paloma for years, since before her mother died and she took up the job. Paloma has hardly spoken a word since the death of her husband a few winters past, but you don't mind the quiet.
*LEECH: Hello, Paloma. It seems I'm in need of more leeches.
*[Wave to her.] You approach and wave, seeing no need to explain your presence.
-
 She holds up a finger then disappears into the house.
Paloma returns with a bucket, half-filled with water and moss. You see the dark shapes of leeches swirl in the murky water, there are around five of them. Perfect.
*LEECH: This will be perfect, thank you.
    Her eyes meet yours and she nods. 
*[Nod.] Your eyes meet hers and you give her a smile and nod. She returns the gesture.
-
*LEECH: Oh, I'll be collecting mandragora tonight. May I borrow your mare?
    ~ raise (trust)
    She nods again, unsurprised. You must go collect the herb on a regular basis, she's likely been expecting you to ask any day now.
*LEECH: I have need of your horse again.
    ~ lower (trust)
    She looks to her horse then back at you. She nods after a moment.
* [Say nothing, steal her horse when the time comes.]
    ~ stealhorse = true
-
You pay her for the leeches and return them to your home. {addalives:Adda is still resting under the watchful eye of her father. Good.} 
It's only mid-morning, you have the time to spare for more of a social visit. 
Smoke issues lazily from Inge's chimney. She's not due for a check-in regarding her pregnancy, but you could stop by regardless. Marin's home is also not far from here — you could check in on the young boy.

* {not inge}[Visit Inge.] -> d1_inge
* {not marin}[Visit Marin.] -> d1_marin


= d1_inge
# IMAGE: images/divider.png

~ inge = true
Inge answers the door quickly and with a smile on her face. She's been having no complications with her pregnancy — in fact, you came to visit her more out of friendship than medical concern. {trust > 1: Tea at her house has become a weekly event.}
INGE: So what will it be today, nettle or valerian root?

- (d1_tea_select)
*LEECH: Nettle, please.
INGE: A good choice, take a seat.
She chats with you while she prepares the tea. 
INGE: So, how have things been lately? Well, I hope?
    **LEECH: This morning was difficult, but I'd rather stick to lighter topics if you don't mind.
        ->d1_idle_chatter
    **[Tell her about Adda.] 
        -> d1_inge_conversation
*LEECH: With the day I've had? Valerian root.
INGE: Oh dear, well I can certainly lend an ear if you wish to talk about it.
    **LEECH: I'd rather not, if you don't mind.
        -> d1_idle_chatter
    **[Tell her about Adda.] 
        -> d1_inge_conversation
*LEECH: Nothing for me, thank you. I can't stay long.
    INGE: Are you sure? I promise I won't keep you all day.
    **LEECH: I'm sure, I just came to see how you were doing. 
        -> d1_leave_inge
    **LEECH: Alright, you've convinced me. 
    INGE: Lovely! What tea would you like?
    -> d1_tea_select
    
- (d1_inge_conversation)
# IMAGE: images/subdivider.png
You tell Inge about the morning's events and your {addalives:struggle|failure} to save Adda. Inge is saddened to hear of the girl's {addalives:ailment|death}, she often {addalives:watches|watched} over her while her parents {addalives:are|were} busy. 
*[Tell her about your concerns regarding the mystery illness.]
# IMAGE: images/subdivider.png
    ~ raise (panic)
    You also share your concerns about Adda's illness. You have been unable to figure out what it is so far. Perhaps it was an isolated incident, but it could be contagious.
    Inge shares your concern, but is sure that you will be able to handle whatever comes your way. What was all that training and education for, if not a situation like this?
    You leave Inge's home once the tea runs out, feeling like a weight has been lifted from your shoulders.
    -> d1_leave_inge
*[Talk about something more lighthearted.]
    LEECH: But enough sadness, let's move on to lighter topics.
    -> d1_idle_chatter

- (d1_idle_chatter) 
INGE: Of course. Besides, I can tell you about what the damned ravens have been getting up to lately.
The people of this village are slow to trust, but Inge has always been kind to you. You stay at her home as long as you can spare, sipping tea and eating bread. Though before long, it's time to return to your duties.
-> d1_leave_inge

- (d1_leave_inge)
{not marin: There's still enough time in the day to visit Marin, the young boy.}
* {not marin}[Visit Marin.] -> d1_marin
* [Prepare to harvest mandragora.] -> mandragora


= d1_marin
# IMAGE: images/divider.png

~ marin = true
You knock on the door to Marin's home, knowing that his parents are out tending the fields. A clattering and then the steady <i>thunk</i> of the boy's crutches sound from within the house.
MARIN: Just the person I was hoping to see! {trust > 1:I finished the book you lent me.|I have some questions I was hoping to ask.}
You check on Marin regularly to examine his leg. Finding the best way to manage his pain has been a long and difficult journey.
{trust > 1:Your visits with the boy are pleasant, if always longer than intended. His|Marin's} curiosity is insatiable. He seeks to understand how everything in the world functions, and you seem to be the only one able to answer his questions. 
*{trust > 1}LEECH: And you're sure you actually read it? It's only been a few days.
    MARIN: Yup. I don't have much else to do during the day.
    **LEECH: Well, stop by tomorrow and I'll give you another book.
    ~ raise (trust)
    ~ marinbook = true
    MARIN: Perfect, I was hoping you'd say that!
    **LEECH: Don't you have any friends to play with?
    MARIN: Not really. So can I borrow another book?
    ***LEECH: Sure, stop by tomorrow.
    ~ marinbook = true
    MARIN: Perfect, I was hoping you'd say that!
    ***LEECH: Not now, perhaps some other time.
    ~ lower (trust)
    MARIN: Oh, okay.
    He looks at the floor, disappointed.
*{trust < 2}LEECH: I'm in a bit of a hurry, how about you come by my house some other day?
    MARIN: Okay, does that mean you'll let me borrow a book?
    **LEECH: Of course.
    ~ raise (trust)
    ~ marinbook = true
    ~ marinquestions = true
    He smiles. You already know just what book to lend him.
    **LEECH: We'll see.
    **LEECH: Marin, we've discussed this before.
    ~ lower (trust)
    MARIN: Sorry. 
    He looks at the floor, embarrassed and disappointed. 
*{trust < 2}LEECH: I don't have time for your questions, Marin. 
    ~ lower (trust)
-
*LEECH: How's your leg?
He gives a long and detailed answer, and even suggests some possible adjustments in his medicines to try.
**[Dismiss his suggestions.]
~ lower (trust)
You dismiss his amateur suggestions and tell him what changes you'll be making to his medicines before leaving his home.
**[Discuss his treatment.]
After a lengthy conversation about the balancing of humors and the medicinal properties of mint, you bid him farewell.
- 
{trust > 2: One day, that boy may become your apprentice, but now isn't the time to worry about such things.}
{not inge: There's still enough time to visit Inge.}
* {not inge}[Visit Inge.] -> d1_inge
* [Prepare to harvest mandragora.] -> mandragora


 /*--------------------------------------------------------------------------------
    M A N D R A G O R A
--------------------------------------------------------------------------------*/


=== mandragora ===
# CLEAR
# IMAGE: images/divider.png

Mandragora is a very useful plant, if difficult to harvest. It treats pain in the abdomen like nothing else and can soothe aches in the joints. The difficulty is that it is unwieldy and dangerous when removed from the ground. 
You've encountered many methods of harvesting it, especially while you were studying in the city. Your preferred method involves by tying a rope around the plant and using a horse to pull it from the ground, allowing you to quickly collect the uprooted plant in a lidded pot to avoid accidental poisoning. 
*[Borrow Paloma's horse.]
You return to Paloma's house after dusk to borrow her horse. The old mare is mostly used to collect leeches, so she's well used to the marshy wilderness around the village.
You lead the horse through the trees to an area where you had noticed mandragora growing a few days prior. It's simple enough to find again. 
-
*[Harvest the mandragora.]

# IMAGE: images/divider.png

The process of harvesting the plant is simple. The plant is secured in the pot and you are preparing to leave when the sound of footsteps catches your attention.
A figure staggers into the clearing and then into the light of your lantern.
The walking corpse is fresh, as most you've seen aren't still bleeding. It's easy to tell that a broken neck killed this person, but you notice something else: familiar red pustules. Some have burst and are steadily bleeding dark, thick blood. 
The dead don't rest easily here. Those who die and aren't given the proper funerary rights come back as a shell of themselves. A body lacking a soul, with a rotting body and vacant eyes. It's not uncommon to encounter a walking corpse out in areas such as this — enough unfortunate souls die alone in the wilderness and are never buried. 
Paloma's mare spooks and runs off into the trees. She'll probably be able to find her way home with little trouble. 
- (attack_corpse)
*(m_shovel)[Hit the corpse with your shovel.]
    You pick up your shovel from where it rests on the ground nearby and {run:hit the corpse in the stomach to topple it before striking its head|hit the corpse in the head}. It goes down easily, and making sure it won't rise again is just as simple.

*(m_lantern)[Hit the corpse with your lantern.]
~ lantern = false
    You {run:throw|swing} your oil lantern at the corpse's head{run: from where you sit on the ground}. The glass cracks and the oil spills over its head in the same moment it's set ablaze. The corpse falls, dead once and for all. 
    Your lantern is broken, so you search in the dark for your flint, steel, and a torch. A minute later, you have light once again.
*(run)[Run.]
    You don't want to risk fighting this corpse. You run after Paloma's mare.
    Or, rather, you attempt to. 
    Your foot catches on something and you fall to the ground, narrowly managing to avoid falling on your lantern.
    The corpse looms, slowly shuffling closer.
    -> attack_corpse
-
# IMAGE: images/divider.png

You have the opportunity to properly examine the corpse now. Perhaps you could learn more about those red pustules and the illness you encountered this morning. 
The woman appears to have been in her fifties. {m_lantern:The lantern burned much of her face, but she seems unfamiliar. Her clothes are too fine for someone from around here.|She's unfamiliar and wearing fine clothing, clearly not from around here.}
- (examine_corpse)
*[The blood.]
~ raise (corpse_clues)
{addablood: Like Adda's, t|T}he blood is dark and sick. It has a sour sort of smell, distinct from any odors of decay that originate from the corpse. 
    -> examine_corpse
*[The pustules.]
~ raise (corpse_clues)
The pustules on her neck are clearly visible, but you discover more near her armpits and on her legs. Around half of them burst prior to death, if the bandages wrapped around them are any indication.
    -> examine_corpse
*(cod){corpse_clues > 0}[Cause of death.]
~ raise (corpse_clues)
You already noted the broken neck, which certainly seems to be the most immediate cause of death.
However, it's not the only thing that was killing her. She was clearly sick before she died — she shares Adda's bruising and the state of the body cannot only be attributed to a broken neck. 
    -> examine_corpse
*{cod}[Conclude your investigation.]
    -> turning
*{not cod && corpse_clues > 2}[Conclude your investigation.]
    -> turning

 /*--------------------------------------------------------------------------------
    T U R N I N G
--------------------------------------------------------------------------------*/


=== turning ===
# IMAGE: images/divider.png
*[What does it all mean?]
The odds of encountering a new, noncontagious disease twice within the same day are low. This illness can likely spread, but you don't yet know how.
Worries cloud your mind, but one rings loudest:
**[Am I infected?] Are you infected? There's no way to know yet, but you should monitor yourself carefully for symptoms. You know what to look for now.
    ~ concern = 1
**Adda and Everich.[] You need to quarantine {addalives:Adda and Everich. She's the first one in the village to be infected, and her father has been in close contact with her the entire time.|Everich. He was in close contact with Adda for the duration of her illness.} If it will spread to anyone, it'll be him.
    ~ concern = 2
**The village.[] If this spreads too quickly, you'll be overwhelmed. This disease {addalives:can be deadly. You narrowly managed to save Adda this morning.|is deadly.} Have you spread it, running around like you have today?
    ~ concern = 3
-
Your thoughts are interrupted by another sound from the trees.
*LEECH: Hello? Is anyone there?
    There is no reply. 
    You spot a pair of eyes in the dark, reflecting the light. Whatever it is, it knows you're here.
    The eyes disappear, accompanied by the quiet rustling of leaves.
    {lantern:The light of your lantern grows dimmer suddenly, then extinguishes entirely.|Suddenly, a strong gust of wind extinguishes your torch.} You are left standing in the dark.
*[Whistle for the horse.]
    You whistle, hoping the sound is the horse returning.
    You spot a pair of eyes in the dark, reflecting the light. Whatever the creature is, it's not a horse.
    The eyes disappear, accompanied by the quiet rustling of leaves.
    {lantern:The light of your lantern grows dimmer suddenly, then extinguishes entirely.|Suddenly, a strong gust of wind extinguishes your torch.} You are left standing in the dark.
*[Stay silent.]
    You stay silent, not wanting to alert whatever may be out there to your presence, but you're unwilling to put out your light.
    You spot a pair of eyes in the dark, reflecting the light. Whatever it is, it knows you're here.
The eyes disappear, accompanied by the quiet rustling of leaves.
    {lantern:The light of your lantern grows dimmer suddenly, then extinguishes entirely.|Suddenly, a strong gust of wind extinguishes your torch.} You are left standing in the dark.
*[Put out your light.]
    You put out your light as quickly and quietly as you can. 
-
You feel a presence behind you.
*LEECH: I know you're there.
    You hear a low chuckle.
*(turn)[Turn around.] 
    You turn around. In the dark, you can only faintly make out the shape of a humanoid figure, standing inches from you. 
*[Stand still.]
-
VOICE: I was hoping our paths would cross, Leech. 
The voice {not turn:comes from just over your left shoulder and} sends chills down your spine. It's a grating purr, there's some unnatural quality to it that you can't quite place. You're almost certain that the speaker is not human.
*(fight)[Fight.]
    The shovel lays just out of reach, but you still hold the unlit {lantern:lantern|torch} in your hand.
    You turn and swing it at the creature, but it easily dodges out of the way.
*LEECH: Oh, really?
    VOICE: Yes, I always love to meet a fellow parasite.
    There's amusement in its tone.
*LEECH: I don't know what you are, but please just leave me be.
    There is no response.
*[Stay silent.]
    You hope that the creature will leave you alone if you ignore it.  
- 
{not fight:You barely hear its footsteps as it circles around you — inspecting you, perhaps.} 
The creature draws close again, faster than you can process its movement. It bites the junction between neck and shoulder and embraces you with webbed hands. The pain lasts only a moment and is quickly replaced with a numbness that emanates outward from the bite.
Heat drains from your body as the blood is drawn out of you. You are dying, you are cold.
The creature pauses for a moment and looks like it's about to speak again.
*[Fight.]
    You are not in full possession of your mind when you attack the creature's neck while its distracted. 
    Perhaps it was survival instinct, perhaps some effect of its saliva — which is known to be a potent anesthetic. 
    Your teeth break its skin and warm blood floods your mouth. The blood warms your throat and stomach as you swallow it. Your pursuit of warmth blinds you to the acidic burn as it settles. 
    The creature recoils, tearing away its flesh from where it's caught beneath your teeth. Your eyes meet the soft glint of the creature's, both of you covered in the blood of the other.
    VOICE: Oh, you'll do nicely.
    The creature isn't angry — it's <i>impressed</i>.
*[Succumb.]
    You see no point in fighting. You're dead already, you've lost too much blood.
    The creature brings its wrist to its mouth, then bites down.
    VOICE: Don't worry, my friend. You won't be dying today. 
    Its hand gently pries your mouth open, and then it brings the bloodied wrist to your mouth.
    VOICE: Drink. 
    The blood warms your throat and stomach as you swallow it. Your pursuit of warmth blinds you to the acidic burn as the creature's blood settles. 
-
It releases you, and you fall to the ground unconscious.
*[Wake up.]
-> leech_collector

= leech_collector
# CLEAR
# IMAGE: images/divider.png
You are starving. There is no room for thought or feeling aside from the hunger.
Your body knows what it seeks.
*[Let it guide you.]
    # IMAGE: images/subdivider.png
    That all-encompassing <i>need</i> draws you through the wilderness. Your eyes struggle to see in the darkness, but what you can hear and smell makes up for the blindness.
    Most intoxicating of all is the smell of blood in the air and the steady drumming of a heartbeat. 
    **[Hunt.]
    # IMAGE: images/subdivider.png
    You hunt the source of the scent. As you draw close, you slow on instinct.
    You hear the blood pumping through veins and smell fear on the air. 
-
*[What is this?]
    A person, a woman.
    She's familiar. You know her, you're sure of it. But your senses focus beyond her face. The hunger persists.
        **(resist)[Resist.]
        You try to resist, to will your eyes to see and your body to stop, but you are no longer under your own control.
        **[Relent.]
*[Consume.]
-
{resist:Against your will, you|You} stalk your prey, waiting for the right moment to strike. 
{resist:The woman|Your prey} is distracted for a moment, bent down and looking at the ground. Perfect. 
You strike. Your senses tell you where the blood gathers closest to the skin, the best place to bite. 
The blood's metallic taste is secondary to its warmth in your mouth and the immediate relief you feel upon drinking it. 
*[Sate your hunger.]
-> aftermath

 /*--------------------------------------------------------------------------------
    A F T E R M A T H
--------------------------------------------------------------------------------*/


=== aftermath ===
# CLEAR
# IMAGE: images/divider.png
Your mind returns to you. You stand over a body — Paloma, the leech collector. 
Blood stains your face and clothes. Your own, that creature's, and Paloma's. 
Dawn is coming, you need to act fast. 
*[Hide her body.] ->aft_hide
*[Obscure her cause of death.] ->aft_stage
*[Panic.] -> aft_panic

= aft_hide
# IMAGE: images/subdivider.png

~ bodyhidden = true
She'll become a walking corpse within a day if you don't do something about this now. 
- (hide_body)
* [Burn the body.]
You decide to burn the body — it's the most respectful burial you can give her with so little time.
It's unpleasant business.
* [Restrain the body.]
You don't have the time to do anything more than restrain the body. 
You find a secluded spot near some fallen trees that are small enough to move. Though it's difficult, you drag a few of the heavy trunks and lay them on Paloma's corpse. 
It might be enough to keep her still, but if you want to be sure, you could drive a branch through her and into the ground.
    **[That's enough.]
        The logs are heavy enough that they would trap a living person, so you aren't terribly concerned with her escaping.
    **[Stake her to the ground.]
        Though unpleasant, it's worth the trouble to ensure she won't escape. 
* [Dismember the body.]
    Though it's gruesome, dismembering the body would be the most effective option. 
    The only issue is that you lack the proper tools, and it would take far too long to return to your home and retrieve them.
    You'll have to try something else.
    ->hide_body
-
*[Return to the village.]
    -> day_two

= aft_panic
# IMAGE: images/subdivider.png

~ bodyfound = true
Your gaze remains fixed on Paloma's unblinking eyes. 
Why was she out here? What was that hunger that took over you so completely? How could you do this? Questions and panic flood your mind.
You can't think, you can't breathe. 
*[Run.]
You run, leaving Paloma's body in the woods. 
Your feet carry you back towards the village, to your home. Perhaps this is all a nightmare — a hallucination caused by the mandragora you were supposed to harvest.  
**[Return to the village.]
-> day_two

= aft_stage
# IMAGE: images/subdivider.png

~ bodystaged = true
~ bodyfound = true
Paloma is dead, there's no way around it — so why bother trying to hide that fact? She was out in the woods alone at night, which comes with its own array of dangers. 
Just after you arrived in the village, a man went missing in the woods. Later, his body was found and brought to you. As the healer, you are the most qualified to determine a cause of death. It was determined that he had been killed by wolves.
If Paloma is found, she will likely be brought to you. Your deception needn't be perfect, but there has to be some evidence.
- (stage)
*(tear)[Tear her clothes.]
You use your knife to tear her skirt, as though wolves were nipping at her ankles as she ran.
{not scratch: -> stage | -> staged}
*(scratch)[Scratch her arms.]
You scratch her arms, as though wolves were jumping to bite at her throat. 
{not tear: -> stage | -> staged}
- (staged)
You leave her there, lying in the clearing she died in.
*[Return to the village.]
-> day_two


 /*--------------------------------------------------------------------------------
    D A Y  T W O
--------------------------------------------------------------------------------*/


=== day_two ===
# CLEAR
# IMAGE: images/divider.png

The sky begins to lighten with the pre-dawn as you approach the village. A morning mist clings to the ground and the air is filled with birdsong.
A beautiful late-summer morning, if not for the night that preceded it. You remember the mess you are covered in — dried blood and mud cover your clothes, face, and hands.
*[Clean up.]
You stop by the creek that runs near Inge's house. Everyone is still in their homes, but you clean yourself off as quietly as possible. 
The cold, clear water of the creek runs a murky reddish brown as you wash. Your efforts leave you soaked, but mostly clean. You are careful of the wound on your neck, but it seems to have healed somewhat. Odd.
*[Carry on.]
The hasn't risen yet,{not addalives: nobody will see you| and it's likely Adda is asleep}. You can clean off at home, though it may be less effective than the creek.
-
*[Go home.]
You {addalives:carefully} push open the door of your home.
Everything is as you left it, yet you have changed. You can hear the leeches you retreived from Paloma writhe in the jar. {plagueblood:The bowl of Adda's blood sits on the table. The scent makes you hungry.}{addalives:Adda sleeps soundly in the center of the room. You can hear the blood moving through her veins and smell it in the air. The scent makes you hungry.}
{not addalives && not plagueblood: What is happening to you?}
-
*{plagueblood} [Drink the blood.] -> plague_blood
*{addalives} [Consume Adda's blood.] -> kill_adda
*{addalives} [Ignore the urge.] -> bloodsucker_transition
*{plagueblood} [Ignore the urge.] -> bloodsucker_transition
*{not addalives && not plagueblood}[Examine these changes.] -> bloodsucker
=
- (bloodsucker_transition)
What has come over you? What is this hunger?
*[Examine these changes.]
-> bloodsucker


= plague_blood
The hunger is irresistible.
You pick up the bowl and drink from it, careful not to let a drop escape you. 
*[Drink.]
    The blood tastes... wrong. It tastes sour, sick — just as you smelled earlier. 
    **[Stop.]
        You stop. The blood is infected with that illness, and drinking it may infect you if you aren't already. 
    **[Continue.]
        Despite the taste, you drink until the bowl is empty.
-
What has come over you? What is this hunger?
*[Examine these changes.]
-> bloodsucker


= kill_adda
You approach Adda as quietly as you can manage. Now that you're closer, you don't just smell her blood, but the illness in it. That sour scent from the corpse that attacked you in the woods last night. 
*[Stop.]
You stop. 
    **[This is wrong.]
        The girl is your patient. You're supposed to heal her, not kill her.
    **[Her blood may be dangerous.]
        Her blood is infected, and drinking it may infect you if you aren't already. 
*[Continue.]
~ addalives = false
~ raise (villagerskilled)
~ raise (panic)
~ lower (trust)
The hunger is irresistible. You lean over her, then bite her throat and stifle her scream in one motion.
    **[Drink.]
        The blood is sour, but you drink it nonetheless. You drink until there is no more blood to be had. 
        What will you tell her father? The truth would get you killed. 
        ***[Bloodletting.]
            Bloodletting, while not exactly honest, isn't entirely incorrect. He likely won't question the wounds on her neck. 
        ***[The illness.]
            Her illness was proved fatal, there was nothing you could do. Surely he won't notice the wounds on her neck, consumed with grief as he'll be.
        ***[A monster.]
            A monster did this — the one that attacked you in the woods. It broke into your home and attacked the girl. You barely escaped with your life.
-
What has come over you? What is this hunger?
*[Examine these changes.]
-> bloodsucker


= bloodsucker
# IMAGE: images/subdivider.png
You sit on the wobbly stool in front of your desk and light a candle. You have a small mirror — a rare and expensive gift you received years ago — it will come in handy now. 
- (exam)
*[Your hands.]
    ~ raise (bloodsuckerexam)
    You look at your hands. The hands of a healer, your family always said.
    Even in the candlelight, your skin seems more grey. And as you move your hands, you notice slight webbing between your fingers.
    {bloodsuckerexam < 4: -> exam| -> pre_ponder}
*[Your neck.]
    ~ raise (bloodsuckerexam)
    You examine your reflection in the mirror. You look exhausted. 
    The bite on your neck is red and raw, more healed than it should be considering the severity of the injury.
    {bloodsuckerexam < 4: -> exam| -> pre_ponder}
*[Your mouth.]
    ~ raise (bloodsuckerexam)
    Your teeth have felt... different in your mouth since your encounter with the creature. You carefully run your tongue over your teeth and find unfamiliar shapes. 
    You pick up the mirror to examine them properly. Both your upper and lower canines are longer, sharper. Your upper incisors are pointed slightly, almost curving in towards the center. 
    You run your tongue over them again, less carefully this time. The sharp edges of your front teeth cut your tongue.
    {bloodsuckerexam < 4: -> exam| -> pre_ponder}
*[Your senses.]
    ~ raise (bloodsuckerexam)
    Your senses are the most immediately apparent change. Your hearing has also improved, though your eyesight seems to be unaffected. Your sense of smell has been greatly heightened — particularly when it comes to blood. Blood tastes different than before as well. It's no longer a repulsive iron taste, but something complex and appealing.
    Your memories of killing Paloma are scattered, but you remember a sort of sixth sense guided you to where the blood gathered closest to the surface. You close your eyes and attempt to summon the feeling. 
    It's an awareness beyond seeing, entirely dictated by temperature. The candle burns hot in your mind's eye. {addalives:Out of curiosity, you glance over in Adda's direction. You can feel the warmth of her skin and blood vessels, all made warmer with the persistent fever. You can feel where the heat — the blood — gathers.} You look down at yourself {addalives:and feel a similar thing, though your body is much cooler than hers|and can feel the warmth of your skin and blood vessels, you can feel where the heat — the blood — gathers}.
    {bloodsuckerexam < 4: -> exam| -> pre_ponder} 
*{bloodsuckerexam > 0} [Conclude your examination.]
    -> ponder
    
- (pre_ponder)
* [Conclude your examination.]
    -> ponder

- (ponder)
You don't have much experience with monsters, curses, or magic, but what's happened to you certainly seems to fall into one of those categories.
The changes to your appearance are quite subtle, and most won't notice so long as you don't smile too broadly.
You hunger for blood, that much is abundantly clear. You seem to have control over yourself now, but it may not be wise to ignore the hunger for too long — lest it become uncontrollable.
    *This is an opportunity.
        **[For power.]
            Your new abilities are a gift, one you can use to become more powerful. That creature you encountered in the woods was strong, fast, and could stalk its prey without being seen. Perhaps you will become the same, with time.
        **[To help.]
            Your senses give you the ability to quickly detect maladies in the blood. Perhaps with time, you can learn to manage your hunger — you could replace the leeches. Bloodletting could be a mutually beneficial treatment, or even a payment for your services.
    *This is horrifying.
        **[What if you hurt someone again?]
            You've already killed Paloma {villagerskilled > 0:and Adda}, how many more will die because of you? You can't abandon the village now — not with this impending plague — you must simply hope that you can avoid causing more harm than good in the future.
        **[Is there a cure?]
            There must be some cure for this condition, you will not accept being doomed to this state for the rest of your life. 
-
With the issue of your condition dealt with — or as much as can be expected at the moment — your mind turns to the mystery illness.
*[What's to be done about it?]-> plague_approaches


= plague_approaches
# CLEAR
# IMAGE: images/divider.png

This illness poses a threat to the village, but you must approach it carefully. 
The people deserve to know the danger they're in, but warning the villagers may cause them to panic and worsen the situation. If you are to tell anyone, it would be best to start with the Ealdorman — the village's leader.
* [Tell no one.]
    You decide to keep quiet. Informing the village is not worth the panic and chaos it would cause. Besides, you can quietly take precautions against spreading the illness and tell others to do the same without explaining all the dangers of the disease.
    **What precautions will you take?
        ***[Everything you can think of.]
        ~ lower (trust)
            You gather extra medicinal supplies to be prepared for an influx of patients showing the same symptoms as Adda and the corpse from the woods. It won't cure your patients, but it will help.
            You plan to tell the Ealdorman that you've heard word of a nasty influenza, and that the villagers should be careful to stay home when ill and avoid any sources of miasma. How this illness spreads is a mystery to you, but the same concepts apply to all diseases you've encountered. 
        ***[What you can do without raising suspicions.]
            ~ lower (panic)
            You are worried about causing a panic, so you will do what you can while still being subtle.
            You plan to tell the Ealdorman to tell villagers to avoid any sources of miasma. How this illness spreads is a mystery to you, but the same concepts apply to all diseases you've encountered. 
            If questioned, you can say that you heard from a colleague that miasma can cause many adverse effects for years after contact. 
            You also gather extra medicinal supplies to be prepared for an influx of patients showing the same symptoms as Adda and the corpse from the woods. It won't cure them, but it will help.
        ***[None.]
            Rather than taking precautions ahead of time — something that may prove to be a waste of effort — you plan to treat problems as they arise. There is no guarantee this illness will even spread, and you have greater things to worry about now. 
* [Inform the Ealdorman.]
    ~ villagewarned = true
    If the people of the village know about the illness, they can do more to defend themselves against it.
    You head to the Ealdorman's home. It's properly morning now, and people are going about their business as usual. You can't help but think that this may be the last normal morning the village sees for a while.
    Stanimir, the Ealdorman, is a kind man. He has a wife and child and tends to a small field of hardy crops when he's not running the village. Stanimir is the one who welcomed you to the village when you first arrived and reassured the wary villagers that you were to be trusted. {trust > 3:You count him as a friend, though you don't often have cause to visit, he and his family have been in good health.|Not that it helped much, the people of this village have never liked you much.}
        **[Knock.]
            After a moment, Stanimir opens the door. 
            STANIMIR: Ah, Leech! I'm happy to see you, what brings you? Is it that terrible news about Everich's daughter? {addalives:I heard that she's still in your care.}
                ***LEECH: Yes, actually.
                        -> stanimir_conversation
                ***LEECH: We should discuss this inside. 
                    -> stanimir_conversation

- (plague_transition)
{not bodyfound && not addalives && not marinbook: -> old_leech}
# IMAGE: images/divider.png

{bodyfound: -> palomas_corpse}
{not bodyfound && addalives: -> adda_infected}
{not bodyfound && not addalives && marinbook: -> marin_visit}

- (stanimir_conversation)
STANIMIR: Ah, well come on in.
You enter his home. He offers you a seat at his table and sits opposite you. 
STANIMIR: So, what is it that has you troubled?
*LEECH: Adda {addalives:is infected with|died of} an illness I've never encountered.
    **LEECH: It may spread faster than I can find a way to cure it. We should prepare for an epidemic.
        ~ raise (panic)
        You tell him everything you know — Adda's concerning illness {not addalives:and subsequent death}, the similarities with the unfamiliar corpse in the woods. {not addalives:He doesn't miss the fact that both people known to be infected are dead.} You tell him what precautions to take to best ensure the village's safety — or at least, what you hope will keep them safe.
        Stanimir is capable of keeping a level head in difficult times, that's the reason he's the Ealdorman in the first place. He listens carefully, and once you're done he thinks for a moment before speaking.
        STANIMIR: I understand. What would you have me tell the village?
        ***LEECH: To avoid causing a panic, we should limit who knows this. 
            STANIMIR: I don't disagree, but you do realize how quickly word travels in this place, yes? We may not be able to contain this information for long.
            You discuss who to inform and what you plan to do as people fall ill. Stanimir will arrange for a place to be set aside for quarantining and for additional medical supplies and cots to be brought to you.
            You leave Stanimir's home some time later, assured that there is a plan but still anxious that it will fall apart as the illness spreads.
                ****[Return to your home.]
                -> plague_transition
        ***LEECH: The truth.
            ~ raise (panic)
            ~ raise (trust)
            STANIMIR: Your honesty is admirable. I'll consider how best to break the news. 
            You discuss what you plan to do as people fall ill. Stanimir will arrange for a place to be set aside for quarantining and for additional medical supplies and cots to be brought to you.
            You leave Stanimir's home some time later, assured that there is a plan but still anxious that it will fall apart as the illness spreads.
                ****[Return to your home.]
                -> plague_transition

= palomas_corpse
There's a quick knock on your door sometime in the afternoon. 
*[Answer it.]
-
Isengrim, a woodsman in the village, stands outside. You don't speak with him often, but you know him well enough. He looks worried.
ISENGRIM: Leech, come quickly. Paloma... I found in the woods, dead.
*LEECH: Paloma, dead? Do you know how it happened?
    ISENGRIM: I can't say for sure, but it looks like {bodystaged:wolves|she was attacked by something big and mean}.
*LEECH: What do you want me to do about it?
    ~ lower (trust)
    ISENGRIM: Come look at her body before it's buried, as you've done in the past? See if you can make anything of the injuries. {bodystaged:I suspect it was wolves that killed her, but who knows.|I don't rightly know what sort of beast killed her.}
-
*(autopsy)LEECH: Alright, lead the way.
    -> paloma_autopsy
*LEECH: I have more important things to be doing. It was probably just wolves{bodystaged: like you said}.
    ~ lower (trust)
    He looks at you incredulously and speaks with some annoyance. 
    ISENGRIM: Really? She won't be going anywhere, so perhaps you can go take a look when there's a break in your busy schedule. 
    **LEECH: Oh fine, let's get this over with. Lead the way.
        -> paloma_autopsy
    **LEECH: Perhaps. But I doubt I'll have the time. Goodbye.
            ~ raise (panic)
            ISENGRIM: Well. S'pose I'll go bury her then, she had no family to speak of.
            He looks at you pointedly and turns to leave.
            ***[Close the door.]
                -> paloma_transition
= paloma_autopsy
# IMAGE: images/subdivider.png
The woodsman leads you to where you left Paloma's corpse last night.
ISENGRIM: Well, here she is. Terrible way to go.
    You kneel next to the body to examine it.
- (exam)
*{bodystaged}LEECH: There are scratches on her arms.
    ~ raise (paloma_clues)
    ~ raise (wolf_clues)
    You poke at the scratches you made.
    **LEECH: Four claws, like a wolf.
        Isengrim squats next to you and hums in agreement.
        -> exam
*{bodystaged}LEECH: The bottom of her skirt is torn.
    ~ raise (paloma_clues)
    ~ raise (wolf_clues)
    You examine the fabric, the perfect tearing.
    **LEECH: Looks like a wolf was chasing her, biting at her feet.
        ISENGIRM: Damn wolves...
        -> exam
*{bodystaged && paloma_clues > 1}LEECH: You can see the wound that killed her.
    ~ raise (paloma_clues)
    ~ raise (wolf_clues)
    Isengrim looks at the wound as you point at it, his eyes wide. 
    **LEECH: With the state of the bite, it's hard to tell what did it, but a wolf would be my guess. They tend to go after people out alone at night.
        ->wolf3conclusion
*{not bodystaged}LEECH: Her throat's been bitten.
    ~ raise (paloma_clues)
    **LEECH: It's hard to tell what might've done it, the bite's a mess.
        ~ raise (wolf_clues)
        ISENGRIM: Eugh, you're damn right about that.
        -> exam
    **LEECH: And it seems to be the only injured area. A normal animal wouldn't do this.
        Isengrim looks to you, concerned.
        -> exam
*{not bodystaged}LEECH: There's no blood left in her body.
    ~ raise (paloma_clues)
    **LEECH: That's normal, with an injury like this. Look at all the blood on the ground. 
        ~ raise (wolf_clues)
        Isengrim looks down and steps back a bit when he notices the blood staining the grass under his feet.
        -> exam
    **LEECH: Whatever did this wanted her blood, specifically. 
        Isengrim mutters to himself, it sounds like a prayer.
        -> exam
*{not bodystaged && paloma_clues > 1}LEECH: It's hard to say what might have done this, but my guess is...
    ~ raise (paloma_clues)
    **LEECH: Wolves. They tend to go after people out alone at night.
        ~ raise (wolf_clues)
        ~ wolves = true
        -> conclusion
    **LEECH: Something strong and smart. It might strike again, we should warn the village.
        -> beastconclusion
-(conclusion)
You stand and turn back to Isengrim, your examination completed. 
{wolf_clues > 2: -> wolf3conclusion}
{wolf_clues > 1: -> wolf2conclusion}
-(wolf2conclusion)
~ raise (panic)
~ lower (trust)
The woodsman seems suspicious of your conclusion.
ISENGRIM: Are you sure? Seems unusual for wolves to do something like this.
*LEECH: I'm sure.
    ISENGRIM: If you say so. We should be getting back, I'll return later to bury the body
    He seems dissatisfied with the answer, but unwilling to question you further.
    -> paloma_transition
*LEECH: If you were going to doubt my judgment, why waste my time and drag me out here?
    ~ lower (trust)
    ISENGRIM: You truly think a wolf did this? After what you just observed? I refuse to believe that.
    He scoffs.
    ISENGRIM: We should be getting back. I'm going to gather some people to hunt the beast. And don't worry, I'll return later to bury the body.
    -> paloma_transition
*LEECH: I suppose it could have been something else.
    ~ raise (panic)
    ISENGRIM: Like what?
    **LEECH: A bear.
        Isengrim looks at the body, perplexed by your suggestion.
        ISENGRIM: A bear? No, I've seen people killed by bears, and they don't look like this.
        He sighs, unwilling to question you further.
        ISENGRIM: We should be getting back. I'm going to gather some people to hunt the beast. And don't worry, I'll return later to bury the body.
        -> paloma_transition
    **LEECH: I'm not sure.
        ISENGRIM: Well, whatever it is, we shouldn't wait around for it to cause more trouble. I'm going to gather some people to hunt the beast. And don't worry, I'll return later to bury the body.
        -> paloma_transition
-(wolf3conclusion)
~ lower (panic)
~ raise (trust)
ISENGRIM: It's true. Thank you for confirming my suspicions, Leech. If wolves give us any more trouble, we can organize a hunt.
*LEECH: Oh, I don't know if that will be necessary.
    ~ lower (trust)
    ISENGRIM: It won't? What about when they kill again?
    ** LEECH: I suppose you're right.
        ISENGRIM: I'm glad you agree. We should be heading back now, I'll return later to bury the body.
        -> paloma_transition
    ** LEECH: It's too dangerous.
        He scoffs and looks off into the trees.
        ISENGRIM: They're just wolves — and besides, we must defend our own. We should go, I'll be back later to bury the body.
        -> paloma_transition
*LEECH: No, it's too dangerous.
    He scoffs and looks off into the trees.
    ISENGRIM: They're just wolves — and besides, we must defend our own. We should go, I'll be back later to bury the body.
    -> paloma_transition
*LEECH: Indeed.
    ~ raise (trust)
    ISENGRIM: I'm glad you agree. We should be heading back now, I'll return later to bury the body.
    -> paloma_transition
-(beastconclusion)
~ raise (panic)
~ raise (trust)
ISENGRIM: Indeed. Perhaps we should organize a hunt, kill this beast before it causes any more trouble.
*LEECH: Oh, I don't know if that will be necessary.
    ~ lower (trust)
    ISENGRIM: It won't? What about when it kills again?
    ** LEECH: I suppose you're right.
        ISENGRIM: I'm glad you agree. We should be heading back now, I'll return later to bury the body.
        -> paloma_transition
    ** LEECH: It's too dangerous.
        He scoffs and looks off into the trees.
        ISENGRIM: We must defend our own, Leech. Let's head back, I'll return later to bury the body.
        -> paloma_transition
*LEECH: No, it's too dangerous.
    He scoffs and looks off into the trees.
    ISENGRIM: Perhaps, but we must defend our own. We should go, I'll be back later to bury the body.
    -> paloma_transition
*LEECH: Indeed.
    ~ raise (trust)
    ISENGRIM: I'm glad you agree. We should be heading back now, I'll return later to bury the body.
    -> paloma_transition
    
- (paloma_transition)
{not autopsy: You step out some time later to run a quick errand.}
*{autopsy}[Return to the village.]
*{not autopsy}[Return to your home.]
-
# IMAGE: images/subdivider.png
{autopsy:You and Isengrim return to the village. You've just gotten away with murder.|You close your door and return to your work.}
A thought comes to your mind unbidden: you saw Paloma's horse when you walked by her house earlier. The old mare made it home indeed.
That must have been why Paloma was in the woods in the first place — she was looking for you.
*[Her kindness cost her dearly.]
    This was your fault, in more ways than one.  
*[A just punishment for a foolish choice.]
    This was her fault, she simply should have stayed home.
-
# IMAGE: images/divider.png
{addalives:-> adda_infected}
{not addalives && marinbook:-> marin_visit}
{not addalives && not marinbook:-> old_leech}

= adda_infected
~ addalives = false
You push open the door of your home to chaos. Adda has fallen to the floor, taking the blanket and everything you had placed on the bedside table with her. She's faring just as poorly as she was when she was brought to you yesterday, if not worse. 
*[Begin treating her as quickly as possible.]
   You get right to work, it's better not to have her father here worrying. 
*[Send someone to fetch Everich.]
    ~ everichfetch = true
    You throw open the door and shout to the nearest person you see — Conrad, the young man is carrying a pile of twigs back to his home. 
    **[LEECH: Fetch Everich, quickly — it's an emergency!]
        Conrad startles, but nods firmly before setting down the sticks and running off.
-
Once you move Adda back onto the bed, you get a better sense of the situation. Many of the pustules have burst and fill the air with the scent of blood until you wrap them. 
You know scant more about this illness than you did yesterday. Before, bloodletting seemed to help, but there is no guarantee that will be the case again. For all you know, the girl might as well be dead already. Perhaps you could ease her passing... or expedite it.
*[Let her blood.]
    ~ raise (panic)
    ~ raise (trust)
    You pull out three leeches from the jar and make the same salve that you applied to the pustules yesterday. 
    **[Wait.]
        # IMAGE: images/subdivider.png
        When that doesn't seem sufficient, you add another two leeches. Adda stirs at the sound of the ceramic lid being placed back on the jar. 
        ADDA: Wha-?
        This is the first time you've had a chance to speak with the girl since she was brought to you. 
        ***LEECH: Shhh. It's okay, {everichfetch:your father's on his way|you'll be fine.}
            {everichfetch:She seems to calm at that.|She calms somewhat, and is clearly not up to any sort of real discussion.}
            {everichfetch: ->let_everich_arrives}
            ADDA: W- where's Da? 
            Her voice catches in her throat. She wants her father here, of course.
                ****LEECH: I'll send someone for him.
        ***LEECH: Ah, finally. Can you describe the symptoms you've been experiencing?
            She looks at you confused. 
            {everichfetch: ->let_everich_arrives}
            This line of questioning will go nowhere, you drop it.
            ADDA: W- where's Da? 
            Her voice catches in her throat. She wants her father here, of course.
                ****LEECH: I'll send someone for him.
*[Consume her blood.]
    ~ raise (panic)
    ~ lower (trust)
    You approach Adda quietly, calmly. Now that you're closer, you don't just smell her blood, but the illness in it. That sour scent from the corpse that attacked you in the woods last night. 
    The hunger is irresistible. You lean over her, then bite her throat and stifle her scream in one motion.
        **[Drink.]
        The blood is sour, but you drink it nonetheless. You drink until there is no more blood to be had.
        What will you tell her father? {everichfetch:He'll be arriving any moment, after all.} The truth would get you killed. 
            ***[Bloodletting.]
                Bloodletting, while not exactly honest, isn't entirely incorrect. He likely won't question the wounds on her neck. 
                -> consume_everich_arrives
            ***[The illness.]
                Her illness was proved fatal, there was nothing you could do. Surely he won't notice the wounds on her neck, consumed with grief as he'll be.
                -> consume_everich_arrives
*[Ease her pain.]
    ~ raise (panic)
You make the same salve that you applied to the pustules yesterday and get to creating the most potent sedative you can with the supplies you have.
It's not much, but you know that you cannot treat her properly and this is kinder than subjecting her to undue pain.
    **[Wait]
        # IMAGE: images/subdivider.png
        {not everichfetch:You send someone for her father, he arrives minutes later.|Everich arrives as you wait.}
        -> ease_everich_arrives
-
- (addainfected_transition)
{not marinbook: -> old_leech}
# IMAGE: images/divider.png
{marinbook: -> marin_visit}

- (let_everich_arrives)
{not everichfetch:You send someone for her father, he arrives minutes later.|The door to your home opens a moment later as Everich arrives.}
Adda calls for him, and he quickly goes to her bedside. You explain the girl's status and what you've done to treat her. As before, now you must wait for the leeches to work their magic.
    *[Wait.]
        # IMAGE: images/subdivider.png
        Adda's condition steadily worsens, despite your best efforts. She passes hours later.
        It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
-> addainfected_transition
- (consume_everich_arrives)
{not everichfetch: You send someone for her father. It would be suspicious to wait. He arrives minutes later.|Everich arrives moments later.}
You tell Everich that you did what you could, but it wasn't enough. If only for the sake of your performance, you do your best to feel sad over the girl's death. 
It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time. It would be odd to be so callous, after all.
-> addainfected_transition
- (ease_everich_arrives)
You tell Everich that you've done all you can, and that it likely won't be enough. You busy yourself, try to give him privacy as he sobs over his daughter. 
    *[Wait.]
        # IMAGE: images/subdivider.png
        Adda passes hours later. It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
        -> addainfected_transition

= marin_visit
There's {bodyfound:another|a} knock at your door in the afternoon. 
MARIN: Leech, it's me! 
Ah yes, you told Marin he should stop by today. He'll be expecting to come in to discuss {marinquestions:those questions he had and borrow a book|that book he finished and borrow another} — perhaps it would be best to avoid inviting him in and possibly exposing him to the illness.
*LEECH: Come on in, I haven't forgotten about your book.
    ~ raise (trust)
    You hear the door open, then close. 
    # IMAGE: images/subdivider.png
    You can hear Marin's heart, smell his blood — it's jarring, but something you're slowly learning to live with. 
    -> marin_chat
*LEECH: Ah, yes! It's lovely out, how about we discuss your reading by the creek?
    ~ raise (trust)
    ~ marincreek = true
    You hear a gasp from beyond the door.
    MARIN: Perfect, I can show you the frogs I found a while ago!
    **LEECH: Just give me a moment and I'll be right out.
    -> marin_creek
*LEECH: I'm busy, go away. 
    ~ lower (trust)
    You hear him sigh through the door.
    MARIN: Oh, okay.
    He leaves, disappointed.
    -> old_leech

- (marin_creek)
You grab the book you plan to lend to Marin and meet him at the door.
# IMAGE: images/subdivider.png
You make your way to the creek, and the boy insists on showing you the frogs he mentioned before anything else. 
-> marin_chat

- (marin_chat)
{marinquestions:He asks his questions, which range in topic from medicine to math to natural philosophy.|You talk about the book — one of your old textbooks from your time at university — asking questions to see how well he absorbed it and correcting any misunderstandings.} 
You then present him with the {not marinquestions:next} book you plan on lending him.
*[A happy story, something from your youth.]
<i>Knightwine the Valorous</i>, a short book, but one you remember fondly.
Marin looks disappointed when you hand him the book.
MARIN: But... this is for babies. 
    **LEECH: You're still a kid, you know. It doesn't hurt to act like one every now and then.
        You gently shove his shoulder and he laughs a bit.
        MARIN: Fine, I'll read it. But I won't let you get away with this again! 
    **LEECH: Your brain needs a break, it could explode if it grows too fast.
        He turns to you, eyes wide. After a moment, he laughs and punches your shoulder. 
        MARIN: Hey! Don't mess with me like that. It's mean.
        He sighs.
        MARIN: Okay, fine. I'll read the baby book.
*[A textbook{not marinquestions:, more advanced than the last}.]
    He immediately starts flipping through it.
    MARIN: This is great, thank you! I'll have it done before you know it. 
    **LEECH: The point is to learn, not read quickly.
        MARIN: Yeah, yeah. I know. 
    **LEECH: Good. You're doing well, Marin. 
        He beams at you. 
            MARIN: Thanks! One day, I want to go to university like you did, so I need to be as smart as I can be. 
*[A book about illness and past plagues.]
    He immediately starts flipping through it. 
    MARIN: This is great, thank you! I'll have it done before you know it.
        **LEECH: Be sure to pay attention to this one, it'll be useful.
            MARIN: Hey! I pay attention to every book I read. 
        **LEECH: Good. You're doing well, Marin. 
            He beams at you. 
            MARIN: Thanks! One day, I want to go to university like you did, so I need to be as smart as I can be.
-
{marincreek:You leave him|He leaves} soon after that, you have a few errands to attend to and would like some time to rest and recover from all the past few days have held.
-> old_leech


 /*--------------------------------------------------------------------------------
    O L D  L E E C H
--------------------------------------------------------------------------------*/


=== old_leech ===
# CLEAR
# IMAGE: images/divider.png

There's a knock on your door that evening, just after the sun sinks beneath the horizon.
You open the door to find an unfamiliar man standing there. He's an elderly man, with piercing eyes and dark clothes. 
OLD MAN: Fine evening, is it not? I'm here to speak with the village leech, would that be you?
*LEECH: Yes, that's me.
    OLD MAN: Good, good. Allow me to introduce myself, I am Vermilius, your predecessor. 
*LEECH: Who are you?
    His eyes narrow and he gives you a sneer of a smile. 
    OLD MAN: Ah, how could I be so rude. I am Vermilius, your predecessor.
*LEECH: No, and I'm quite busy. Goodbye.
    His eyes narrow and he gives you a sneer of a smile.
    OLD MAN: Please, allow me to say my peace. I am Vermilius, your predecessor.
-
He gives a shallow and joking bow.
Odd. You don't know much about your predecessor, but you had assumed he was dead.
VERMILIUS: I have some advice I'd like to impart: mercy may be the best solution to this pest. Pestilence is chaotic, uncontrollable, and it is best to admit defeat ahead of time. 
He narrows his eyes and stares at you as though he's looking for something.
VERMILIUS: You will likely be spared its wrath, but the others will die from this plague — you stand to gain if you kill them before the plague can.
*LEECH: What are you talking about?
*LEECH: Who are you, really?
    VERMILIUS: Why, my good Leech, I am offended! I am exactly who I claim to be. And beyond that, I am someone who is offering you help. 
        **LEECH: I doubt that, somehow.
            VERMILIUS: And yet you will heed me, regardless.
        **LEECH: Alright, what do you propose?
*LEECH: What do you propose?
-
VERMILIUS: The people of this village will die, that is a fact. Would you have their deaths be for nothing? When the time comes, and death approaches, you can end their lives swiftly and with less pain than the plague would inflict. Think upon this, but I rest assured that you will see how correct I am in the days to come. 
With that, the old man turns to leave.
*LEECH: Wait, come back!
    He pays you no mind and walks off into the dark. 
*LEECH: Are you suggesting I kill my patients?
    He pays you no mind and walks off into the dark.
*[Close the door]
-
First, a mystery illness; then, a monster in the woods that made you hunger for blood; and now, this. 
*[Sleep.]-> day_three


 /*--------------------------------------------------------------------------------
    D A Y  T H R E E
--------------------------------------------------------------------------------*/


=== day_three ===
# CLEAR
# IMAGE: images/divider.png

Sleep doesn't come easily, but when it does, you are plagued by dreams of blood, death, and plague.
But when the sun rises in the morning, you rise with it. The morning is quiet and peaceful — a welcome reprieve from the growing problems lurking just out of sight.
The peace is, as always, interrupted by a knock at your door. You aren't surprised to find Everich standing outside, coughing and sporting the same pustules you saw on Adda. Throughout the day, he's joined by three more patients. They're {villagewarned:frightened|confused} and coming to you for treatment, seeking a cure that doesn't exist.
{villagewarned:You lead the infected to the abandoned house Stanimir set aside for isolating the sick.|With this many patients, you decide to take over Paloma's now-abandoned home to use as a sick ward.} 
How will you handle your patients?
*[Do everything you can to treat them.]
    You spend hours going from person to person, letting blood and applying salves. You brew teas and wrap bandages, hoping that your efforts are doing something, anything, to help. 
    Everich languishes like he's resigned himself to death. It makes sense, he's just seen his daughter die of the same illness. He knows what's coming, and how little you can do to stop or even slow it.
    What you really need is a cure. This situation is already trying and could become entirely unmanageable within days.
*[Heed Vermilius' advice, consume their blood.]
    The administration of your "mercy" must be done carefully. Townsfolk will become suspicious if those under your care immediately die of mild symptoms. You have to wait until the plague has truly taken root, until the town thinks they're dead already.
    Most of your patients are far too healthy, but Everich languishes like he's resigned himself to his fate. He's lost his fight, and is ready to accept your mercy.
    **[Consume his blood.]
        Despite your many patients, you manage to make some privacy for Everich and yourself. 
        You approach him calmly, the scent of his plague-ridden blood filling your nostrils. Your mouth waters in anticipation, the hunger stabs into your gut. 
        You lean over his unconscious body and wait until the right moment. In one motion, you bite his throat and stifle his scream. You drink until there is no more blood to be had.
        The others will be ill enough to kill by tomorrow — for now, you must wait.
        You wonder about your own susceptibility to the plague. Vermilius seemed to think you would be spared from it, but what does that old man know? It might be wise to work towards creating a cure for this illness, if only to use on yourself.
*[You can't heal them, but you can ease their passing.]
    You spend hours going from person to person, giving them teas and medicines to relieve their pain. 
    Most of your patients have mild symptoms, but Everich's are more severe. He is beyond your best attempts at relief. You have access to many toxic ingredients, but none that kill a patient quickly or kindly. 
    The best you can do for him is sedation, to dull his senses and keep him that way until the end. 
    He'll likely die sometime in the night or early tomorrow, all you can do now is wait and keep him comfortable.
    What you really need is a cure. This situation is already trying and could become entirely unmanageable within days.
-
*[Work on a cure.]
    You leave your patients and spend some time looking into a cure. Surely the answer lies before you already, you just have to find it.
    You consult your existing notes on the plague, hoping to find an answer in your hasty scribbles. What symptom holds the key to the cure?
        **[The pustules.]
            The pustules are the most apparent and odd symptom of the plague. Their reason for developing at all is unclear. They appear to be gatherings of blood, so perhaps the plague flowing through the blood and creates blockages that cause the pustules to form. 
            In that case, an anticoagulant could help prevent the blockages. {addaleech:That must be why Adda responded well to leeches when she was first brought to you.|Using leeches would likely help, their saliva has anesthetic and anticoagulant properties.} But leeches aren't a sustainable solution, an infected person would have to constantly apply leeches just to remain alive — assuming the plague doesn't bring other complications. 
        **[The fever.]
            The fever is the least odd symptom of this illness, so perhaps treating it can lead you to the root of the problem.
            Fevers are caused by an imbalance of the humors, by an excess of blood. Blood brings heat, and when there is too much, the patient exhibits a fever. 
            The most common treatment for this is bloodletting, which brings the body back into balance. 
            Applying leeches may be the most efficient method of bloodletting available to you, given the number of patients. They have the added benefit of having anesthetic and anticoagulant properties, which may also help in treating your patients. {addaleech:That's why Adda responded well to leeches when she was first brought to you.} 
            But leeches aren't a sustainable solution, an infected person would have to constantly apply leeches just to remain alive — assuming the plague doesn't bring other complications.
        **[The blood.]
            The rotten stench of infected blood that lingers in your nose. That's the key. All of the other symptoms — the fever, the bruising, and the pustules — are all caused by this disease of the blood. 
            The blood thickens, like that of a walking corpse, and creates blockages throughout the body. 
            An anticoagulant could help to thin the blood, helping to alleviate all of the symptoms. {addaleech:That must be why Adda responded well to leeches when she was first brought to you.|Using leeches would likely help, their saliva has anesthetic and anticoagulant properties.} But leeches aren't a sustainable solution, an infected person would have to constantly apply leeches just to remain alive — assuming the plague doesn't bring other complications.
        **[The bruising.]
            Bruising occurs when blood gathers and stagnates in the body. The blood of those infected with the plague is thickened and rotten by the illness, which must cause it to burst weaker blood vessels and create bruising.
            An anticoagulant could help to thin the blood, which may also help alleviate some of the other symptoms.
            {addaleech:That must be why Adda responded well to leeches when she was first brought to you.|Using leeches would likely help, their saliva has anesthetic and anticoagulant properties.} But leeches aren't a sustainable solution, an infected person would have to constantly apply leeches just to remain alive — assuming the plague doesn't bring other complications.
-
*[Continue your work.]
-> hunter


 /*--------------------------------------------------------------------------------
    H U N T E R
--------------------------------------------------------------------------------*/


=== hunter ===
# CLEAR
# IMAGE: images/divider.png

You hear a commotion outside before the knock at the door comes. Absorbed as you were in your work, you hadn't bothered investigating the disturbance. But the disturbance has come to you, it seems.
You smell blood. Clean, healthy blood. 
There's a knock at your door and you can hear people speaking outside. You look up from your work, surprised to find it's already dark outside.
CONRAD: Leech! Open up, it's an emergency!
You recognize the voice — Conrad, {everichfetch:you told him to fetch Everich yesterday while you were treating Adda|a young man that lives in the village}.
*[Open the door.]
    Conrad is there, supporting a woman you don't recognize. She's bleeding from wounds on her leg, arm, and neck. The blood is intoxicating, mouthwatering.
    CONRAD: She's an outsider, found her stumbling through town.
-
*[LEECH: Bring her in.]
    Conrad helps the woman limp her way into your home and over to the table. You and the young man help her up onto the table and you send Conrad away — he's more likely to be a hindrance than a help.
    Before he leaves, the outsider calls out to him, her voice tense with pain.
    OUTSIDER: Oi, kid, thanks for the help. 
    He stops in the door for a moment, then nods and steps out.
-
OUTSIDER: The name's Loup by the way, and you?
    *LEECH: Leech. 
        She chuckles, which quickly fades to a pained hiss.
        LOUP: Well if we're going by our occupations, then I guess you'd better call me Hunter. 
    *LEECH: Oh, I'm just the village Leech.
        She chuckles, which quickly fades to a pained hiss.
        LOUP: Well if we're going by our occupations, then I guess you'd better call me Hunter. 
    *(givename)[Tell her your name.]
        ~ raise (trust)
        You don't know what possesses you to tell the outsider your name. Perhaps your mind is scattered from the events of the past few days, perhaps it doesn't matter anyway and she'll be dead soon, or perhaps you just like her.
- 
*[Clean and examine her wounds.]
-
# IMAGE: images/subdivider.png
You clean and examine the wounds. The rote act is interrupted by your bloodthirst. Your mind wanders with the intoxicating scent of her blood so close. You can hear the outsider's heart beating in her chest and feel the warmth of the blood in her veins. 
One certain advantage to your newfound state of being is that you can immediately tell that none of her wounds hit an artery, though each came close. 
You can't help but notice the odd things Loup carries. Silvered blades and vials filled with various liquids. As you removed her jacket, you were surprised to find it lined with chainmail on the inside. 
She notices your interest.
LOUP:{not givename: Like I said,} I'm a hunter. These are just some tools of the trade.
No hunter you've known has used anything like this, there's more to this outsider than meets the eye.
*LEECH: So, how'd this happen?
    She hesitates for a moment before answering.
    LOUP: I was out hunting — or at least I thought I was. Turns out I was the one being hunted
    **LEECH: By what?
        LOUP: Didn't get a good look at it. It was dark out and the beast caught me by surprise. 
        You get the feeling that's not the whole story.
    ***LEECH: Mhm.
        You let the line of questioning go.
    ***LEECH: A wolf, perhaps?
        She shrugs.
        LOUP: Perhaps.
            ****LEECH: You think it was something else?
                She sighs and looks out your window, as though expecting to see something in the darkness outside.
                LOUP: I don't know. Maybe.
                It seems you won't be getting a straight answer out of her.
            ****{beastwolf > 1}LEECH: We've been having wolf problems lately.
                LOUP: Oh, really? Well, I might be able to help solve that problem.
                She looks down at herself and chuckles a bit.
                LOUP: I'm usually much better at my job, trust me.
            ****[Drop the subject.]
                You decide you won't be getting a straight answer out of her and let the subject go.
    ***LEECH: I doubt just any old wolf or bear could catch you off guard. What was it?
        She smirks at you, choosing to focus on the compliment and ignore the question.
        LOUP: It's true, I'm usually much better at my job than this. It's not often that my mark can pose any real challenge these days.
        ****LEECH: You didn't give me an answer.
            Her eyes narrow at you.
            LOUP: And you won't be getting one.
        ****[Drop the subject.]
            You decide you won't be getting a straight answer out of her and let the subject go.
    ***(sus)LEECH: I had a similar encounter in the woods a few nights ago.
        She looks at you, surprised. Her eyes scan you for signs of injury, but she doesn't find any — the wound on your neck has now fully healed.
        LOUP: Oh really? Looks like you've fared better than I have.
        ****LEECH: I managed to get away unscathed.
            Her eyes narrow at you.
            LOUP: Ha, you lucky bastard. 
            She doesn't question you further, but you can tell she's suspicious of you.
        ****LEECH: I heal quickly.
            Her eyes narrow at you, she scans you again for injuries. Her eyes linger on your neck.
            LOUP: Well, aren't you lucky. A healer that doesn't need much healing.
            She doesn't question you further, but you can tell she's suspicious of you.
        ****LEECH: It sure looks that way, doesn't it?
            She chuckles at the joke, but eyes narrow at you. She scans you again for injuries. Her eyes linger on your neck.
            She doesn't question you further, but you can tell she's suspicious of you.
-
# IMAGE: images/subdivider.png
You work in silence, cleaning her wounds with water and a cloth. The cuts on her leg and arm are clean and deep, made by something sharp. The wound on her neck is all too familiar. Is she like you now?
Being this close to so much blood is a constant struggle for focus. It's possible that this woman met the same creature you did in the woods — was hunting it out, even. Will she do the same to you if she realizes what you are?
You find yourself at a crossroads. Heal Loup, and she may be able to tell you more about that creature or what happened to you. But she poses a risk, she might attack you or set the village against you.
*[Heal Loup.] -> hunter_alive
*[Kill Loup.] -> hunter_dead

= hunter_alive
# IMAGE: images/subdivider.png
You prepare a salve to treat the wounds. There's a tension in the air as you work — Loup's eyes go to the silver knives resting in the pile of her belongings on the floor.
As you wrap her arm, she speaks.
LOUP: So, you're not going to try to kill me?
*LEECH: What are you talking about?
    She gives you a knowing look.
    LOUP: You can't fool me, vampyre.
    Your confusion must show on your face, because she laughs as you finish wrapping her arm.
    LOUP: You must have some questions. Ask away.
*LEECH: Of course not. Besides, I have some questions.
    You finish wrapping her arm and step back to lean against your desk. 
    LOUP: Alright, ask away, vampyre.
*LEECH: I might, if you don't answer my questions.
    She glares at you.
    LOUP: I'd like to see you try, vampyre.
    You finish wrapping her arm and she stretches it.
    LOUP: Alright, fine. Ask your questions.
    
- (loup_questions)
*(vamp)LEECH: You called me a ... vampyre?
    ~raise (loupquestions)
    LOUP: {sus:Well, you weren't exactly subtle, plus t|T}he teeth and hands are a dead giveaway. But your reaction to blood was the real tell.
    **LEECH: I think I've heard of vampyres before, as a child.
        LOUP: And now you are one, congratulations. {sus:When you met that ancient bastard the other night, you drank its blood and now you're hungry for more.|This must be a recent development for you, huh? My guess is you met the bastard that gave me this and drank some of his blood.}
        {not sus:She points to the wound on her neck.}
        -> loup_questions
    **LEECH: And what, exactly, is a vampyre?
        LOUP: Something not dissimilar to a leech and a walking corpse, I suppose. They drink blood — mostly from humans but I've heard of them going after animals too. They don't seem to age at all and become more monstrous the longer they go without blood. They're damn hard to kill, but tend to fetch a good price.
        She looks at you apologetically.
        LOUP: Sorry. I doubt anyone's put a price on your head yet, though.
        -> loup_questions
*LEECH: That creature in the woods, what was it?
    ~raise (loupquestions)
    LOUP: A vampyre, an old one. There's a big prize for killing it, offered by the Crown itself. The beast is legendary among hunters, nobody who's gone after it lived to tell the tale.
    -> loup_questions
*LEECH: Are you really a hunter?
    ~raise (loupquestions)
    LOUP: Yes, though I don't go after the standard fare. You're looking at one of the last monster hunters in the world. 
    A monster hunter, of course. They've become as uncommon as the beasts they hunt.
    -> loup_questions
*{vamp}LEECH: Is there a cure?
    LOUP: Not that I know of, sorry. Vampirism is a sort of curse, and not one that's likely to break any time soon.
    She looks genuinely sorry. It's not the news you were hoping for.
    -> loup_questions
*{loupquestions > 0}LEECH: That's all I wanted to ask.
-
LOUP: I'm glad to be of service, so long as you don't attack me and try to drink my blood. 
She laughs, then looks at the pile of her belongings again.
LOUP: I hate to ask for another favor after just you saved my life, but I don't have anywhere to rest. Could I stay here for the night?
*LEECH: Sure.
    LOUP: Excellent! I promise I won't be a bother.
    You go about tidying things up as Loup scribbles in a small notebook she pulled out of her jacket. It makes for a surprisingly peaceful evening.
*LEECH: That might not be a good idea, but maybe you could stay at Inge's.
    She gathers her belongings.
    LOUP: Mind showing me the way?
        *[Take Loup to Inge's house.]
            # IMAGE: images/subdivider.png
            You walk Loup to Inge's house and knock on the door. You can see light through the windows, so she's probably still awake. 
            Inge opens the door a few moments later. You hardly have the chance to explain the situation before Inge ushers Loup inside and offers her tea. Satisfied, you return to your home.
*LEECH: It would probably be best if you leave this village.
    She raises an eyebrow at you.
    LOUP: Are you kidding? I've got a vampyre to hunt out there, I'm not leaving until it's dead.
    She hops off the table. 
        **LEECH: There's a plague here, you could die.
            She turns to you, searching your expression to see if you're joking.
            LOUP: Damn, and you aren't even kidding. Well, thanks for the warning. I've still got a job to do.
            She gathers her belongings.
            ***LEECH: Wait, you can stay here.
                LOUP: Excellent! I promise I won't be a bother.
                You go about tidying things up as Loup scribbles in a small notebook she pulled out of her jacket. It makes for a surprisingly peaceful evening.
            ***LEECH: Goodnight.
                And with that, she leaves.
        **LEECH: Forget the vampyre, leave this place.
            LOUP: Impossible. Well, I'm off to find some ditch to sleep in. Goodnight.
            She gathers her belongings.
            ***LEECH: Wait, you can stay here.
                LOUP: Excellent! I promise I won't be a bother.
                You go about tidying things up as Loup scribbles in a small notebook she pulled out of her jacket. It makes for a surprisingly peaceful evening.
            ***LEECH: Goodnight.
                And with that, she leaves.
        **LEECH: To each their own.
            LOUP: Indeed. Well, I'm off to find some ditch to sleep in. Goodnight.
            And with that, she gathers her belongings and leaves.
-
*[Sleep.]
-> day_four

= hunter_dead
# IMAGE: images/subdivider.png
~ lower (trust)
You continue treating her as normal, to avoid arousing suspicion. There's still a tension in the air as you work — Loup's eyes go to the silver knives resting in the pile of her belongings on the floor.
You hide your scalpel in your sleeve and place yourself between Loup and her weapons. Suddenly, you drive your scalpel into the wound on her leg, using your senses to make sure you hit the artery. With your other hand, you grab her arm just where the cut is.
You don't have to resist your hunger any longer. You dive for the wound on her neck as she yells. 
*[Drink.]
    Lost as you are in the delectable taste of healthy blood, you don't notice when your hand is removed from the scalpel in Loup's leg. 
    She takes the scalpel from her leg and drives it through your cheek. 
    You reel back, blood falling out of your mouth, and Loup pushes you off and onto the floor with surprising strength.
    She dives for her daggers, but you get to her first. She's lost a lot of blood — too much, in fact.
    **[Drink.]
        Her struggling weakens and weakens until it ceases entirely, and you drink until there's not a drop left.
# IMAGE: images/subdivider.png
You clean up and quickly bury her body in the woods. 
Nobody in the village will care about this outsider's death — she came to you heavily injured, after all.
You return to your home after, exhausted and exhilarated.
-
*[Sleep.]
-> day_four

 /*--------------------------------------------------------------------------------
    D A Y  F O U R
--------------------------------------------------------------------------------*/


=== day_four ===
-> temp_END

=== temp_END ===
# IMAGE: images/divider.png

<h2>The End</h2> 
For now, at least.

*[Credits]

# IMAGE: images/subdivider.png

<h2>Credits</h2>

Leechcraft is a game written by Ainsley Sunday using Ink.

The fonts used are JSL Blackletter by Jeff Lee and Grenze by Omnibus Type.

<h3>Special Thanks</h3>

To my professors, Sam and Joyce, for keeping me on track through this (perhaps over-ambitious) project. 

To my peers and friends for your unending support and excitement about a bleak game about worms and pestilence.

This truly wouldn't have been possible without you.


-> END
