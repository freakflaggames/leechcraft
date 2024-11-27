// STAT VARIABLES:
VAR trust = 0
VAR panic = 0

// STORY STATE VARIABLES:
VAR addalives = false

// START:
-> UlrichConversation


// RAISE/LOWER FUNCTIONS
=== function lower(ref x)
 	~ x = x - 1

=== function raise(ref x)
	~ x = x + 1

// DIALOGUE:

=== UlrichConversation ===

<b>ULRICH:</b> I heard about that business with the girl,{addalives: I'm glad to hear she's alright| I'm sorry to hear about her passing.} Do you know what ailed her?
*<b>LEECH:</b> {addalives:She is suffering|She suffered} a terrible fever and some bruising. Nothing to worry yourself about. 
    <b>ULRICH:</b> Ah, but illness harms most especially the youngest and eldest. I've been around long enough to know that what concerns the little ones concerns me too.
    <i>He sighs and glares at the sky.</i>
    <b>ULRICH:</b> Well, just let me know if I need to be worried about something going 'round. We're neighbors, after all.
    **<b>LEECH:</b> I will, Ulrich, you needn't truly worry.
        ~ lower (panic)
        <i>He nods, pleased with your answer.</i>
        <b>ULRICH:</b> Alright, then I'll save my worrying for other problems. Thank you, Leech. Good day, then.
    **<b>LEECH:</b> Yes, yes. If this turns out to be some apocalyptic plague I'll be sure to let you know.
        ~ lower (panic)
        <i>His brow furrows as he searches your expression, unsatisfied with your answer.</i>
        <b>ULRICH:</b> Sure. You'd best be going now. Wouldn't want to get in the way of someone so important as yourself.
    **<b>LEECH:</b> To be honest, I'm not quite sure what her illness {addalives:is|was}. But trust me, panicking won't do any good right now.
        <i>He looks concerned.</i>
        ~ raise (panic)
        <b>ULRICH:</b> Well. I appreciate your honesty. Even with all those books and your fancy education, it seems you don't know everything. I s'pose we'll just have to pray the girl {addalives:survives|is the only one to die of it}.
        <b>ULRICH:</b> Anyways, I won't bother you any longer. Good day, Leech.
*<b>LEECH:</b> I'm not entirely sure, but I hope to find out.
~ raise (panic)
He looks concerned.
<b>ULRICH:</b> Well. I appreciate your honesty. Even with all those books and your fancy education, it seems you don't know everything. I s'pose we'll just have to pray the girl {addalives:survives|is the only one to die of it}.
<b>ULRICH:</b> Anyways, I won't bother you any longer. Good day, Leech.
-
*<b>LEECH:</b> See you around, Ulrich.

// END:
-
-> END