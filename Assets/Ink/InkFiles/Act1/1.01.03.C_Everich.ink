//Unlocked at start of game. Triggered by interacting with Everich. Repeatable (see: conversation can be triggered again, but previously chosen options are unavailable)
=== 10103C_Everich ===
You turn to Everich.
{10103C_questions:->everichQuestions|->firstInteraction}

= firstInteraction
<b>EVERICH:</b> Have you ever seen anything like this? 
The man is baffled and looking to you for reassurance.
    *{physician}<b>LEECH:</b> I've read about similar ailments, but never personally treated anything like this, no. 
        Everich's brow furrows at your words, his silence hangs heavy in the air.
    *{apothecary}<b>LEECH:</b> It's quite odd, I must admit. But there must be a tincture or salve for it... 
        Everich's brow furrows at your words, his silence hangs heavy in the air.
    *{barber}<b>LEECH:</b> Can't say that I have. Hundreds of broken bones or terrible gashes, but never a growth like this. 
        Everich's brow furrows at your words, his silence hangs heavy in the air.
    *<b>LEECH:</b> I've seen all sorts of ailments, Everich. No need to worry.
        ~ raise (trustEverich)
        His anxiety seems quelled for the moment. 
        <b>EVERICH:</b> Alright, S'pose I should let you do your work.
    *{charlatan}<b>LEECH:</b> Yes, many times. I know just the thing for it.
        ~ raise (trustEverich)
        He heaves a sigh of relief.
        <b>EVERICH:</b> Oh, thank the Lady. I knew you'd be able to help my girl.

- (everichQuestions)
~ 10103C_questions = true
*{physician} <b>LEECH:</b> When did she begin to exhibit symptoms?

    He looks at you blankly. You sigh.
    
    **<b>LEECH:</b> When did she start acting sick?
        
        <b>EVERICH:</b> Oh. 'Bout two days ago she got a fever. Complained about 'er head. -> everichQuestions

*{not physician}<b>LEECH:</b> When did she start acting sick?
    
    <b>EVERICH:</b> 'Bout two days ago she got a fever. Complained about 'er head. -> everichQuestions

*{10102I_arms}<b>LEECH:</b> How did she get the marks on her arm?

    The man seems surprised, then worried. He hadn't noticed them. 
            
    <b>EVERICH:</b> I... I don't know. Kept her resting at home the past day or so. Hoped this bout of illness would clear on its own...
            
    Unhelpful. But worth filing away for later. -> everichQuestions
    
*{10102I_neck}<b>LEECH:</b> How long has she had these growths?
    
    <b>EVERICH:</b> Spotted 'em last night. Seemed to be causing her pain...->everichQuestions

+[Leave him.]-> END