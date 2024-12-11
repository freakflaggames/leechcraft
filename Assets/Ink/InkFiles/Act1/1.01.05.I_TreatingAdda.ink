//Unlocked by collecting at least one remedy, examining Adda, and talking to Everich. Triggered by interacting with Adda again.

=== 10105I_TreatingAdda ===
{totalRemedies > 0 && 10102I_AddaExam && 10103C_questions:->treatingAdda|->END}
- (treatingAdda)
It's clear to see that she's suffering from a form of dyscrasia — an imbalance of the humors — but that appears to be a symptom of something greater. 
She has an excess of blood, proven by her fever, bruising, and those terrible red growths.
The pustules scare you the most. {not charlatan:Perhaps it would be best to lance them, but the girl is already in pain and it might be best to let her body fight on its own. The common response for excessive blood is bloodletting, but this may be an uncommon situation.|This is unlike anything you've "healed" before, and you're not sure how many more times you can say it was "the Lady's will" that your patient died. But each remedy you administer is a gamble, and you're feeling lucky.}
*{remedyAddaTisane}<b>REMEDY:</b> Tisane for Fever, Pain, & Pustules -> tisane
*{remedyLeeches}<b>REMEDY:</b> Leeches -> leeches
*{remedyBloodletting}<b>REMEDY:</b> Bloodletting -> bloodletting
*{remedyUnicornPanacea}<b>REMEDY:</b> Unicorn Horn Panacea -> panacea



= tisane
~ raise(blackBile)
~ FadeToBlack()
You gather the ingredients - the last of your mandragora root, dried coriander, and redcurrants - and boil some water.
{apothecary:Herbalism is a slow and patient sort of medicine. It demands a gentle touch and a keen eye. Old Gritta taught you that, years ago.}{charlatan:Herbalism has always seemed like a joke to you. At least you know your medicine is a farce - apothecaries, on the other hand, seem convinced a few leaves can cure a severed hand. It's a good thing you aren't dealing with a severed hand.}{not apothecary && not charlatan:Herbalism has always seemed like a slow and dull sort of medicine to you. As a healer, it is odd to sit by and wait while your patient suffers.}
Everich watches silently until you pour the water and wait for the tisane to brew.
<b>EVERICH:</b> 'Scuse me for asking, Leech, but do you truly think a tea is going to cure this illness?
*<b>LEECH:</b> It must seem odd to you, but trust me, this should address all of her symptoms.
    <b>EVERICH:</b> Well, I s'pose you're the healer for a reason.
    He still seems a bit uncertain.
*{apothecary}<b>LEECH:</b> Actually, it is a tisane - a tincture would have been preferred, but I lack the proper extracts. Rest assured, it will be more effective than a cup of tea.
    <b>EVERICH:</b> Ah, apologies.
    His worries seem calmed, for the moment.
*{not apothecary}<b>LEECH:</b> It's more accurate to call it a tisane than a tea.
    He mumbles under his breath.
    <b>EVERICH:</b> Don't see what difference it makes...
*{apothecary}<b>LEECH:</b> You underestimate the power of a good cup of tea, Everich.
    ~ raise (trustEverich)
    He chuckles at that.
    <b>EVERICH:</b> Ha! And perhaps you overestimate it. Ah, but I s'pose you'd know your teas better than most.
-
Once the tisane is ready, you bring it to Adda and hold it to her mouth to get her to drink. She has hardly been lucid at all, but you manage to get every last drop down her throat. It will take some time for it to take effect.
*{apothecary}[Wait.]->tisaneApothecary
*{not apothecary}[Wait.]->tisaneFailure

- (tisaneApothecary)
Adda hasn't been lucid the entire morning, but she drifts into slumber just a few minutes later - as does her father, slumped in a chair nearby. 
Mandragora is a testy plant, but you are skilled in your work. Too much is toxic, too little is ineffective. And Adda's age added another level of complexity to the whole thing. It is a relief that she rests easily, even if her illness persists. 
With that handled, you can begin what you had originally intended for the day - restocking your medicinal supplies. 
*[Continue]
    ~ FadeFromBlack()
    ->END

- (tisaneFailure)
You expect the girl to settle as her humors come into balance, but her condition continues to deteriorate. The fever worsens, as does her pain. Adda's struggling weakens and weakens until she falls unconscious.
The tisane has had no effect. Any number of things could have gone wrong. Perhaps you used too much mandragora, or too little. Perhaps the herbs lost their potentcy. Perhaps they weren't even the correct herbs. 
Regardless, you lack the time to try another treatment. 
*[Think.]-> addaDeath



= leeches
~ raise(phlegm)
~ FadeToBlack()
The ceramic lid of the jar is cold when you lift it. The wriggling shapes inside stir when you disturb them. {physician:You pick out three, that should do the trick.|You pick out ten, half the amount you would use on an adult.} 
Everich watches in fascinated disgust.
{physician:<b>EVERICH:</b> Is it necessary to use that many of them?|<b>EVERICH:</b> And you think this will work?}
*{physician}<b>LEECH:</b> It may seem like a lot, but each only sucks a small amount of blood. And she has quite an excess of it at the moment.
    ~ raise (trustEverich)
    <b>EVERICH:</b> Ah, okay.
    Though the worms unsettle him, Everich calms a bit.
*{physician}<b>LEECH:</b> Do you want her to get better?
    He grumbles, but says nothing.
*{not physician}<b>LEECH:</b> Yes, the leeches will suck her excess blood, but won't put her at risk of losing too much.
    <b>EVERICH:</b> Ah, okay.
    He still seems uncertain.
*{not physician}<b>LEECH:</b> I hope so.
    He looks at you, concerned. 
    <b>EVERICH:</b> Well, that's hardly a comfort, Leech.
-
The leeches latch onto the girl's arms easily. Now you must simply wait for them to {physician:work their magic|do their work}.
* {physician}[Wait.]->leechesPhysician
* {not physician}[Wait.]->leechesFailure

-(leechesPhysician)
Adda hasn't been lucid the entire morning, but she drifts into slumber just a few minutes later - as does her father, slumped in a chair nearby.
The leeches detach when their bellies are full and you place them back in the jar as dawn arrives. These leeches will be satisfied for months, you will need new, hungrier ones soon.
With that handled, you can begin what you had originally intended for the day - restocking your medicinal supplies. 
*[Continue]
    ~ FadeFromBlack()
    ->END

-(leechesFailure)
You expect the girl to settle as her humors come into balance, but her condition continues to deteriorate. The fever worsens, as does her pain. Adda's struggling weakens and weakens until she falls unconscious.
The leeches seem to have had no effect, they haven't drained Adda's blood quickly enough. And with how she's faring, you don't have the time to try another treatment. 
*[Think.]-> addaDeath



 = bloodletting
~ raise(blood)
~ FadeToBlack()
~ 10105I_smellAddaBlood = true
Rooting out the problem at the apparent source is the most direct route to a solution. 
You turn to the girl's father.
*<b>LEECH:</b> Hold her still. I'm going to drain those growths.
-
Everich looks at you with wide eyes. 
<b>EVERICH:</b> You're taking a knife to her neck?
    *<b>LEECH:</b> Yes, and you're going to help me keep her still.
        He seems unhappy, but he speaks after a moment of hesitation.
        <b>EVERICH:</b> If we've no other choice... Fine.
    *{barber}<b>LEECH:</b> These pustules are the root of her illness. If I don't drain the infected blood, she will die. 
        ~ raise (trustEverich)
        He fear only grows, but so does his resolve.
        <b>EVERICH:</b> Alright. I trust you, Leech. With my daughter's life, I trust you.
    *<b>LEECH:</b> Calm down, Everich. I promise I will be careful.
        He looks at you, concerned. 
        <b>EVERICH:</b> That's hardly a comfort, Leech. But if it must be done...
-
Everich gently grabs her shoulders. After a moment, her squirming ceases. Perfect.
You carefully slice the skin of each pustule with your lancet. Dark, sick blood, pours from the cuts. It almost smells sour.
You press a bowl to the steady flow of blood. The wounds must drain until the blood runs clean.
    *[Wait.]
        Everich passes you a new bowl when you ask for it. He hesitates as you hand him the bowl full of blood.
        <b>EVERICH:</b> Leech... what am I to do with this?
        He's completely lost. {physician:Suddenly you miss the busy clinic back in the city.}{apothecary:Suddenly you miss Old Gritta and your days as her apprentice.}{barber:Suddenly you miss the battlefield, mercenaries make much better assistants.}{charlatan:You can't help but relate.}
- 
*<b>LEECH:</b> Set it on the table there, I'll deal with it later.
    ~ 10105I_infectedBlood = true
    <b>EVERICH:</b> As you say.
    He places it among your tools and clutter, then returns to his daughter's side.{barber:->bloodlettingBarber}{not barber:->bloodlettingFailure}
*<b>LEECH:</b> Dump it outside. I have no need of it. 
    You hear the door open, the splat of blood on dead leaves, then Everich returns.{barber:->bloodlettingBarber}{not barber:->bloodlettingFailure}

-(bloodlettingBarber)
There seems to be no end to the tainted blood. As the second bowl fills, you know that you have reached the limit of what you can safely drain from the girl. 
Though you cannot clear the illness from her body, the bloodletting has helped to bring her humors in balance.
*[Staunch the flow.]
    You dress Adda's neck with the last of your bandage. She hasn't been lucid the entire morning, but Adda falls into a deep sleep just a few minutes after you bandage her - as does her father, slumped in a chair nearby.
    With that handled, you can begin what you had originally intended for the day - restocking your medicinal supplies.
    **[Continue.]
        ~ FadeFromBlack()
        -> END

-(bloodlettingFailure)
There seems to be no end to the tainted blood. You fill a second bowl, then a third, before Adda falls unconscious. You aren't practiced in bloodletting, but it doesn't take a barber-surgeon to know that's bad.
You grab the last of your bandage to dress her neck, not that it will save her now.
*[Wrap the wounds.]-> addaDeath



= panacea
~ raise(yellowBile)
~ FadeToBlack()
{charlatan:You gather the ingredients - unicorn horn powder, mercury, sage, and wine - and mix them with a flourish.|You gather the ingredients - unicorn horn powder for this mysterious illness, mercury for the bruises, sage for the pain, and wine for flavor.} 
The resulting mixture is unappealing, {charlatan:but that often works in your favor. To many, an unappealing medicine is expected and a pleasant one is suspect.|but many medicines are.}
<b>EVERICH:</b> Where do you get unicorn horn powder these days, anyway?
*{charlatan}<b>LEECH:</b> I happen to know the last reliable unicorn hunter this side of the mountains. We met some years ago while I was travelling.
    You have always been a talented liar. When he searches your face and sees no falsehood, he leans forward in interest.
    <b>EVERICH:</b> Now that must be some tale. Perhaps you can tell it to me sometime.
*{charlatan}<b>LEECH:</b> Around three years ago I came across a unicorn on my travels. Though it pained me to kill it, I knew this powder could save lives.
    <b>EVERICH:</b> Oh, surely you jest...
    You have always been a talented liar. When he searches your face and sees no falsehood, he leans forward in interest.
    <b>EVERICH:</b> By the Lady... Some other day you must tell me the tale.
*{not charlatan}<b>LEECH:</b> From that merchant that came through in the spring, with the braided beard and red cart. 
    <b>EVERICH:</b> Ah, how could I forget. He tried to trade three empty flasks for the shoes off my feet. Odd man.
*<b>LEECH:</b> I wouldn't want to ruin the mystery, now would I?
    ~ lower (trustEverich)
    He grumbles, but says nothing.
-
*[Give Adda the panacea.]
{charlatan:The performance of medicine is a delicate art - it must be logical, yet equal parts mysterious and magical. The illusion must be perfect to deceive the body into healing itself.|Using ingredients like "unicorn horn powder" is always a risk, especially without testing them first, but this is a dire situation. You can only hope that this is real, and not any number of poor substitutes - ram horn powder, sawdust, or even something actively harmful.}
{charlatan:This phenomenon has allowed you to take up a career in medicine despite having more experience in ending a life than saving one.}
You bring the mixture to Adda and hold it to her mouth to make her drink. She has hardly been lucid at all, but you manage to get every last drop down her throat with only a little difficulty.
-
*[Wait.]->panaceaFailure

-(panaceaFailure)
It doesn't take long for Adda's condition to deteriorate. The fever worsens, she develops a relentless cough, and her shivering becomes uncontrollable shaking. 
You barely have time to consider a solution {charlatan: - or what lie you'll tell Everich to explain why the medicine failed -} before she falls unconscious. She has little time, but maybe there's still something you can do.
*[Think.] -> addaDeath
    
    
    
= addaDeath
~ addaDead = true
~ lower(trustEverich)
{panacea:Everich immediately tries desperately to shake her awake.|Everich must see something in your expression. He tries to gently shake her awake.}
<b>EVERICH:</b> Adda, darling... please. Wake up. 
His voice catches in his throat and he turns to you, brow furrowed and hands shaking.
<b>EVERICH:</b> What have you done, Leech? 
*{bloodletting}<b>LEECH:</b> She's lost too much blood, the infection went too deep. I don't think I can save her.
    He turns back to his daughter. 
    <b>EVERICH:</b> I'm taking her home.
*{leeches}<b>LEECH:</b> The leeches aren't working. She still has too much blood in her body, and I worry it might be too late.
    He turns back to his daughter. 
    <b>EVERICH:</b> I'm taking her home.
*{tisane}<b>LEECH:</b> The tisane isn't working and the illness has weakened her too much. It may be too late for her, but I can try.
    He turns back to his daughter. 
    <b>EVERICH:</b> No. I'm taking her home.
*{panacea}<b>LEECH:</b> That panacea was a last resort. I don't think I can help her now.
    He looks at you incredulously, his anger growing.
    <b>EVERICH:</b> I'm taking her home.
*<b>LEECH:</b> I'm sorry.
    He turns back to his daughter and sobs.
    <b>EVERICH:</b> I'm taking her home.
*{not charlatan}<b>LEECH:</b> She'll be okay, just let me do my work.
    He looks at you incredulously, his anger growing.
    <b>EVERICH:</b> No. I'm taking her home. 
{charlatan && not panacea}<b>LEECH:</b> She'll be okay, you just have to trust me.
    He looks at you incredulously, his anger growing.
    <b>EVERICH:</b> No, I trusted you this far and look at where that got me. I'm taking her home. 
*{charlatan && panacea}<b>LEECH:</b> This is perfectly normal. She'll wake in a few hours, purged of her illness. Just let her rest.
    He looks at you incredulously, his anger growing. He doesn't believe you.
    <b>EVERICH:</b> No. I'm taking her home, before you put any more poison in her.
*[Say nothing.]
    He turns back to his daughter. 
    <b>EVERICH:</b> I'm taking her home.
-
*<b>LEECH:</b> Are you sure about that?
*<b>LEECH:</b> I see.
*<b>LEECH:</b> I'm sorry, Everich.
-
Everich pays you no mind. He picks up Adda like she could shatter in his arms and walks out the door.
The silence of your home feels heavy, as do the thoughts racing through your mind. 
Regardless, you can now begin what you had originally intended for the day - restocking your medicinal supplies.
*[Continue.]
    ~ FadeFromBlack()
    ->END