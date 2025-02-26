	/*==============*
	*				*
	*	Tiberian	*
	*				*
	*===============*/

/mob/living/carbon/human/species/tieberian
	race = /datum/species/tieberian

/datum/species/tieberian
	name = "Tiberian"
	id = "tiberian"
	desc = "<b>Tiberian</b><br> \
	Tiberians; also known as Infernal-Spawn, Hell-Bloods, Surface-Devils, and, mockingly, thief-lings.\
	Forged by the Demon Princes themselves, tiberians were shaped as their emissaries, molded in the image of their creators and cast onto the mortal realm. \
	They cannot reproduce with mortals, ensuring their blood remains untainted—each tiberian is a legacy of demonic will. \
	Their mere presence invites suspicion; merchants clutch their coin purses, city guards keep a watchful eye, and whispers follow them in every shadowed alley. \
	This distrust festers into a cycle—scorn breeds resentment, and resentment fuels the very misdeeds they are accused of. \
	Many tiberians live on the fringes of society, forming elusive, nomadic groups that dwell beyond prying eyes. \
	Sharp senses and keen paranoia define them, for luck rarely graces those burdened with infernal lineage. \
	Their bodies bear the strange remnants of their origins—hollow bones, misplaced scales, jagged spines—making them more fragile than they appear. \
	To make matters worse, their creators wove misfortune into their very essence, ensuring hardship follows them like a specter. \
	Yet, their fireproof nature hints at the possibilities left behind by their infernal forebears… \
	Tiberians may manifest any number of demonic traits—twisted horns, cloven hooves, ridged spines, or patches of scale. \
	To common folk, their appearance is unsettling, a living reminder of the Demon Princes' will—and a scapegoat for their fears. \
	\
	THIS IS A DISCRIMINATED SPECIES. EXPECT A MORE DIFFICULT EXPERIENCE. PLAY AT YOUR OWN RISK."

	skin_tone_wording = "Progenitor"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP,TRAIT_NOFIRE)
	default_features = list("mcolor" = "FFF", "ears" = "ElfW", "tail_human" = "TiebTail", "horns" = "TiebHorns")
	use_skintones = 1
	disliked_food = NONE
	liked_food = NONE
	possible_ages = list(AGE_CHILD, AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = "t3"
	mutant_bodyparts = list("ears","tail_human","horns")
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
	OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), \
	OFFSET_FACE = list(0,0), OFFSET_BELT = list(0,0), OFFSET_BACK = list(0,0), \
	OFFSET_NECK = list(0,0), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,0), \
	OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,0), OFFSET_UNDIES = list(0,0), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list("strength" = 0, "perception" = 1, "intelligence" = 2, "constitution" = -1, "endurance" = 0, "speed" = 0, "fortune" = -1)
	specstats_f = list("strength" = -1, "perception" = 1, "intelligence" = 2, "constitution" = -2, "endurance" = 1, "speed" = 1, "fortune" = -1)
	enflamed_icon = "widefire"
	patreon_req = 0

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
	)
	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/tieberian/check_roundstart_eligible()
	return TRUE

/datum/species/tieberian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/hellspeak)

/datum/species/tieberian/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/sandspeak))
	C.grant_language(/datum/language/hellspeak)
	to_chat(C, "<span class='info'>I can speak Infernal with ,h before my speech.</span>")

/datum/species/tieberian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/hellspeak)

/datum/species/tieberian/handle_speech(datum/source, list/speech_args)
	. = ..()
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		if(message[1])
			if(message[1] != "*")
				message = " [message]"
				var/list/accent_words = strings("accent_universal.json", "universal")

				for(var/key in accent_words)
					var/value = accent_words[key]
					if(islist(value))
						value = pick(value)

					message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
					message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
					message = replacetextEx(message, " [key]", " [value]")

	speech_args[SPEECH_MESSAGE] = trim(message)

/datum/species/tieberian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/tieberian/get_skin_list()
	return sortList(list(
		"Crimson Land" = SKIN_COLOR_CRIMSON_LAND, // - (Bright red)
		"Vorrakians" = SKIN_COLOR_VORRAKIANS, // - (Dark orange)
		"Sundered" = SKIN_COLOR_SUNDERED, //  - (Orange)
		"Zarkana" = SKIN_COLOR_ARCANA, // - (Dark violet)
		"Zareskians" = SKIN_COLOR_ZARESKIANS, // - (Pink)
		"Prydians" = SKIN_COLOR_PRYDIANS, // - (Purple)
		"Abyssium" = SKIN_COLOR_ABYSS, // - (Navy blue)
		"Castillian" = SKIN_COLOR_CASTILLIAN, // - (Pale red)
		"Asturias" = SKIN_COLOR_ASTURIAS, // - (Clay red)
		"Vaquero" = SKIN_COLOR_VAQUERO, // - (Earthly red)
		"Zanguine" = SKIN_COLOR_ZANGUINE, // - (Dark violet)
		"Ash" = SKIN_COLOR_ASH, // - (Pale blue)
		"Azrelians" = SKIN_COLOR_AZRELIANS, // - (Lavender blue)
		"Mysterious" = SKIN_COLOR_MYSTERIOUS, // - (Super Red)
	))

/datum/species/tieberian/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"purple - arcane" = "3f2f42",

	"blue - abyss" = "09282d",

	"red - demonic" = "480808",
	"red - impish" = "641010",
	"red - rubescent" = "8d5858"

	))

/datum/species/tieberian/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
	return randname

/datum/species/tieberian/random_surname()
	return " [pick(world.file2list("strings/rt/names/other/tieflast.txt"))]"

/datum/species/tieberian/get_accent_list()
	return strings("spanish_replacement.json", "spanish")
