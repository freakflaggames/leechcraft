//Unlocked at start of game. Triggered by interacting with Adda
=== 10102I_AddaExam ===

You turn your attention back to the girl, Adda. She lies on the table, shivering and groaning in pain.

- (examine)

*Her arms... 
    ~ 10102I_arms = true
    You catch sight of a dark red bruise. Then another. 
    
    Something about them feels off. Her father might know more.
    
    -> examine
            
*Her neck...
    ~ 10102I_neck = true
    She has a growth. A pustule a bit larger than a pea, angry and red. You've never seen anything quite like it before.
    
    You spot another, slightly larger. Fascinating. 
    
    -> examine
*{10102I_arms && 10102I_neck}[Conclude your examination.] -> END