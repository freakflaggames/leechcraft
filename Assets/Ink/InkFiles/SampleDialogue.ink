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
*LEECH: See you around, Ulrich.

// END:
-
-> END