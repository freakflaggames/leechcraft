//Unlocked by collecting at least one remedy, examining Adda, and talking to Everich. Triggered by interacting with Adda again.

It's clear to see that she's suffering from a form of dyscrasia — an imbalance of the humors — but that appears to be a symptom of something greater. 
She has an excess of blood, proven by her fever, bruising, and those terrible red growths.
The pustules scare you the most. {!charlatan:Perhaps it would be best to lance them, but the girl is already in pain and it might be best to let her body fight on its own. The common response for excessive blood is bloodletting, but this may be an uncommon situation.}{charlatan:This is unlike anything you're "healed" before, and you're not sure how many more times you can say it was "the Lady's will" that your patient died. But each remedy you administer is a gamble, and you're feeling lucky.}

*[Brew a tincture.]
*[Use leeches.]
*[Lance the pustules.]
*[Create a panacea.]










* [Lance the pustules.] ->lance
* [Let her blood.] ->let
* [Soothe her pain.] ->soothe

 = lance
 # IMAGE: images/divider.png
 
//~ addablood = true
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
//    ~ plagueblood = true
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
- -> END

= let
# IMAGE: images/divider.png

//~ raise (trust)
/~ addaleech = true
The ceramic lid of the jar is cold when you lift it. The wriggling shapes inside stir when you disturb them. You pick out three, that should be sufficient. 
Leeches. Magical little creatures, to the uneducated. To you, they are medical instruments — perhaps even collaborators in your work. Bloodletting is already a great tool of the healer, but leeches provide additional benefits. Their saliva has anesthetic and anticoagulant properties and they avoid the messiness of letting blood with a blade.
The leeches latch onto the girl's arms easily, now to wait for them to work their magic.
* [Wait.]
    # IMAGE: images/subdivider.png
//    ~ addalives = true
    In the meantime, you can help in your own way. You make a salve using the last of your mandragora and apply it to the pustules. Your supplies are running low, something to be solved later.
    The leeches detach when their bellies are full and you place them back in the jar as dawn arrives. Adda rests peacefully, as does Everich in a chair next to her. 
        **LEECH: Everich, will you keep an eye on her? I need to gather more supplies. She should remain stable.
            Everich wakes when you say his name and blinks at you a few times, processing what you said. A moment passes and he nods before settling back into the chair.
            ***[Leave your home.]
                -> END
        **[Write a note for Everich.]
                You write a note for Everich explaining your absence, then quietly leave your home. Adda should be fine while you're out and if not, Everich will come find you.
            *** [Leave your home.]
                -> END
        **[Prepare to leave without disturbing their rest.]
                You quietly leave your home. Adda should be fine while you're out and if not, Everich will come find you.
            *** [Leave your home.]
            -> END

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
    -> END