//Unlocked by collecting at least one remedy, examining Adda, and talking to Everich. Triggered by interacting with Adda again.

=== 10105I_TreatingAdda ===
It's clear to see that she's suffering from a form of dyscrasia — an imbalance of the humors — but that appears to be a symptom of something greater. 
She has an excess of blood, proven by her fever, bruising, and those terrible red growths.
The pustules scare you the most. {!charlatan:Perhaps it would be best to lance them, but the girl is already in pain and it might be best to let her body fight on its own. The common response for excessive blood is bloodletting, but this may be an uncommon situation.}{charlatan:This is unlike anything you're "healed" before, and you're not sure how many more times you can say it was "the Lady's will" that your patient died. But each remedy you administer is a gamble, and you're feeling lucky.}

*{remedyAddaTincture}<b>REMEDY:</b> Tincture for Fever, Pain, & Pustules -> tincture
*{remedyLeeches}<b>REMEDY:</b> Leeches -> leeches
*{remedyBloodletting}<b>REMEDY:</b> Bloodletting -> bloodletting
*{remedyUnicornPanacea}<b>REMEDY:</b> Unicorn Horn Panacea -> panacea




= tincture
~ raise(blackBile)
Your supplies are running low. You make a salve using the last of your mandragora. You apply it to the pustules and get to work brewing a tea that should help with the fever.
It's not much, but you are hesitant to let her blood at this stage, whether by leech or blade. 
You send the girl's father home with instructions to return at sunrise. With your medicinals administered, all anyone can do is wait. 
*[Wait.]
    You pass the time combing through your books for any sort of similar ailment. You've never seen anything like this, and it seems nobody else has either. 
    The girl's condition steadily worsens, despite your best efforts. The pustules on her neck burst in a gory spray and her fever is nigh unstoppable. You wrap her neck to stop the bleeding, but the illness has done its work. 
    Adda passes just as the sun rises, mere moments before her father arrives.
    It's never easy to watch someone lose a loved one, but it is by no means a new experience for you. You give the grieving father the privacy he needs and decide to collect payment for your services some other time.
    Once Everich leaves, you must as well. You need to gather more supplies.
    ** [Leave your home.]
    
-> END








= leeches
~ raise(phlegm)

The ceramic lid of the jar is cold when you lift it. The wriggling shapes inside stir when you disturb them. You pick out three, that should be sufficient. 
The leeches latch onto the girl's arms easily. Now you simply must wait for them to work their magic.
* {physician}[Wait.]
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
* {!physician}[Wait.]
    

-> END










 = bloodletting
~ raise(blood)
~ 10105I_smellAddaBlood = true
Rooting out the problem at the apparent source is the most direct route to a solution. 
You turn to the girl's father.
*<b>LEECH:</b> Hold her still. I'm going to drain those growths.
    Everich gently grabs her shoulders. After a moment, her squirming ceases. Perfect.
    You carefully slice the skin of each pustule with your lancet. Dark, sick blood, pours from the cuts. It almost smells sour.
    You press a bowl to the steady flow of blood. The wounds must drain until the blood runs clean.
        **[Wait.]
            Everich passes you a new bowl when you ask for it. He hesitates as you hand him the bowl full of blood.
            <b>EVERICH:</b> Leech... what am I to do with this?
            He's completely lost. {physician:Suddenly you miss the busy clinic back in the city.}{apothecary:Suddenly you miss Old Gritta and your days as her apprentice.}{barber:Suddenly you miss the battlefield, mercenaries make much better assistants.}{charlatan:You can't help but relate.}
- 
*<b>LEECH:</b> Set it on the table there, I'll deal with it later.
    ~ 10105I_infectedBlood = true
    <b>EVERICH:</b> As you say.
    He places it among your tools and clutter, then returns to his daughter's side.{barber:->bloodlettingBarber}{!barber:bloodettingFailure}
*<b>LEECH:<b> Dump it outside. I have no need of it. 
    You hear the door open, the splat of blood on dead leaves, then Everich returns.{barber:->bloodlettingBarber}{!barber:bloodettingFailure}

-(bloodlettingBarber)
There seems to be no end to the tainted blood. As the second bowl fills, you know that you have reached the limit of what you can safely drain from the girl. 
Though you cannot clear the illness from her body, the bloodletting has helped to bring her humors in balance.
*[Staunch the flow.]
    You dress Adda's neck with the last of your bandage. She hasn't been lucid the entire morning, but Adda falls into a deep sleep just a few minutes after you bandage her - as does her father, slumped in a chair nearby.
    With that handled, you can begin what you had originally intended for the day - restocking your medicinal supplies.
    **[Continue.]-> END

-(bloodlettingFailure)
~ lower(trustEverich)
~ addaDead = true
There seems to be no end to the tainted blood. You fill a second bowl, then a third, before Adda falls unconscious. You aren't practiced in bloodletting, but it doesn't take a barber-surgeon to know that's bad.
You use the last of your bandage to dress her neck, not that it will save her now.
-> addaDeath







= panacea
~raise(yellowBile)

You gather the ingredients - unicorn horn powder for this mysterious illness, mercury for the bruises, sage for the pain, and wine for flavor. 



    -> END
    
    
    
    
    
    
    
    
    
= addaDeath
Everich must see something in your expression. He tries to gently shake her awake.
<b>EVERICH:</b> Adda, darling... please. Wake up. 
His voice catches in his throat and he turns to you, brow furrowed and hands shaking.
<b>EVERICH:</b> What have you done, Leech? 
*<b>LEECH:</b> She's lost too much blood, the infection went too deep. I don't think I can save her.
    He turns back to his daughter. 
    <b>EVERICH:</b> I'm taking her home.
*<b>LEECH:</b> I'm sorry.
    He turns back to his daughter and sobs.
    <b>EVERICH:</b> I'm taking her home.
*<b>LEECH:</b> She'll be okay, just let me do my work.
    He looks at you incredulously, his anger growing.
    <b>EVERICH:</b> No. I'm taking her home. 
*[Say nothing.]
    He turns back to his daughter. 
    <b>EVERICH:</b> I'm taking her home.
-
**<b>LEECH:</b> Are you sure about that?
        Everich pays you no mind. He picks up Adda like she could shatter in his arms and walks out the door. 
    **<b>LEECH:</b> I see.
        Everich pays you no mind. He picks up Adda like she could shatter in his arms and walks out the door.
    **<b>LEECH:</b> I'm sorry, Everich.
        Everich pays you no mind. He picks up Adda like she could shatter in his arms and walks out the door.
-
->END