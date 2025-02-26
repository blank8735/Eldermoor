/mob/living/carbon/human/species/rakshari
	race = /datum/species/rakshari

/datum/species/rakshari
	name = "Rakshari"
	id = "rakshari"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT

	desc = "<b>Rakshari</b><br>\
	The Rakshari trace their origins to nomadic desert tribes, hardened by the unforgiving sands, where survival bred resilience, cunning, and adaptability. \
	Once mere wanderers, they united under powerful Zybantine merchant-kings and warlords, transforming into a dominant slaver force that shaped the region's economy and warfare. \
	For centuries, they raided weaker settlements and rival caravans, capturing slaves to expand their cities, justifying their actions through religious doctrines that venerated strength and subjugation as divine order. \
	As they entrenched themselves within Zybantine society, the Rakshari refined their practices, introducing indentured servitude and debt bondage, ensuring even their own hosts were not immune to chains. \
	However, their ambitions grew too bold. In a failed bid to carve out an independent state where they could enslave even the Zybantines, the Rakshari waged war against their own patrons. \
	They envisioned a society where only the strong ruled, and all others served, yet their rebellion ended in catastrophe. Crushed by Zybantine armies and betrayed by their own, their people were nearly eradicated. \
	Now, the few Rakshari who remain are hunted relentlessly, ghosts of a lost empire, wandering the land as outcasts, forever haunted by the ashes of their failed dominion. \
	\
	THIS IS A HYPER DISCRIMINATED SPECIES. EXPECT A MORE DIFFICULT EXPERIENCE. PLAY AT YOUR OWN RISK.\
	"

	skin_tone_wording = "Tribal Identity"
	use_skintones = 1
	default_color = "FFFFFF"
	default_features = list("mcolor" = "FFF",, "wings" = "None")
	specstats = list("strength" = -1, "perception" = 2, "intelligence" = 0, "constitution" = -1, "endurance" = 0, "speed" = 1, "fortune" = 0)
	specstats_f = list("strength" = -2, "perception" = 3, "intelligence" = 1, "constitution" = -2, "endurance" = 0, "speed" = 2, "fortune" = 0)

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/rakshari.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/rakshari.dmi'
	child_icon = 'icons/roguetown/mob/bodies/c/child-rakshari.dmi'
	custom_clothes = FALSE
	custom_clothes = FALSE
	possible_ages = list(AGE_CHILD, AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	species_traits = list(EYECOLOR,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)

	offset_features = list(OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
	OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), \
	OFFSET_FACE = list(0,0), OFFSET_BELT = list(0,0), OFFSET_BACK = list(0,0), \
	OFFSET_NECK = list(0,0), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,0), \
	OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,0), OFFSET_UNDIES = list(0,0), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	patreon_req = 1

/datum/species/rakshari/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/thievescant)
	to_chat(C, "<span class='info'>I can gesture in thieves' cant with ,t before my speech.</span>")

/datum/species/rakshari/check_roundstart_eligible()
	return TRUE

/datum/species/rakshari/after_creation(mob/living/carbon/C)
	..()
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/thievescant)

/datum/species/rakshari/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/rakshari/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/rakshari/get_skin_list()
	return sortList(list(
		"Oasis Rakshari" = SKIN_COLOR_PLAIN_ELF, // - (White 2)
		"Mountain Rakshari" = SKIN_COLOR_MOUNTAIN_ELF, // - (White 3)
		"City Rakshari" = SKIN_COLOR_COASTAL_ELF, // - (White 4)
		"Desert Rakshari" = SKIN_COLOR_WOOD_ELF, // - (Mediterranean 1)
	))
