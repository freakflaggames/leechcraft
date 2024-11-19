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

// DEBUG mode adds a few shortcuts - remember to set to false in release!
VAR DEBUG = false
VAR marinDEBUG = false
VAR palomaDEBUG = false
{DEBUG:
	IN DEBUG MODE!
	* [Beginning]	-> start
    * [Day One] -> day_one
    * [Marin] ->DEBUG_marin
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
* [Prepare to harvest mandragora.] -> END


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
* [Prepare to harvest mandragora.] -> END

-
-> END
