//Unlocked after treating Adda.

// Triggered by interacting with the leech jar.
=== 10106I_Leeches ===
~ raise (10106I_stock)
{10105I_TreatingAdda.leeches:The leeches you used on Adda will need replacements.|Most of the leeches in your jar have bellies full of blood, it would be best to stock up on hungrier replacements.} Hopefully the leech collector has been busy.
*[Continue.]->END

// Triggered by interacting with bandages.
=== 10106I_Bandages ===
~ raise (10106I_stock)
{10105I_TreatingAdda.bloodletting:You used the last of your bandage to wrap Adda's neck.|You're nearly to the end of your bandage supply.} The Weaver should have more ready for you.
*[Continue.]->END

// Triggered by interacting with herbs.
=== 10106I_Mandragora ===
~ raise (10106I_stock)
{10105I_TreatingAdda.tisane:You used the last of your mandragora in the tisane.|The jar of mandragora root is almost empty.} It seems you'll be making a trip into the woods tonight. The leech collector should be able to spare her horse for a few hours.
*[Continue.]->END

// Triggered by interacting with a wine bottle.
=== 10106I_Wine ===
~ raise (10106I_stock)
{10105I_TreatingAdda.panacea:You used the last of your wine in the panacea.|You appear to be running low on wine, which can be just as useful in healing as it is in daily life.} The merchant should have some, if he's even still in town.

*[Continue.]->END

// Triggered by interacting with a book.
=== 10106I_PatientList ===
~ raise (10106I_stock)
Ah, the list you have to keep track of your patients. It seems Marin is due for a visit. 
*[Continue.]->END