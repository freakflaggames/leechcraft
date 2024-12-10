INCLUDE Act1/1.01.01.C_Intro.ink
INCLUDE Act1/1.01.02.I_AddaExam.ink
INCLUDE Act1/1.01.03.C_Everich.ink
INCLUDE Act1/1.01.04.I_Remedies.ink
INCLUDE Act1/1.01.05.I_TreatingAdda.ink
INCLUDE Act1/1.01.06.I_TakingStock.ink

EXTERNAL CutToBlack()
EXTERNAL FadeToBlack()
EXTERNAL FadeFromBlack()

// BACKGROUNDS
VAR physician = false
VAR apothecary = false
VAR barber = false
VAR charlatan = false

//HUMORS
VAR blood = 0
VAR yellowBile = 0
VAR blackBile = 0
VAR phlegm = 0

// PANIC
VAR panic = 0

// CHARACTER TRUST
VAR trustEverich = 0

// CHARACTR DEATHS
VAR addaDead = false

// REMEDIES
VAR totalRemedies = 0
VAR remedyAddaTisane = false
VAR remedyLeeches = false
VAR remedyBloodletting = false
VAR remedyUnicornPanacea = false

// STORY STATE
VAR 10102I_arms = false
VAR 10102I_neck = false
VAR 10105I_smellAddaBlood = false
VAR 10103C_questions = false
VAR 10106I_stock = 0

// "INVENTORY"
 VAR 10105I_infectedBlood = false

// RAISE & LOWER
=== function lower(ref x)
 	~ x = x - 1
=== function raise(ref x)
     ~ x = x + 1
     
