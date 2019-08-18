/obj/item/weapon/saw
	name = "metal saw"
	desc = "For cutting wood and other objects to pieces. Or sawing bones, in case of emergency."
	icon = 'icons/obj/tools.dmi'
	icon_state = "metal_saw"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	flags = CONDUCT
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL_TYPE = 3, MATERIAL_PLASTIC_TYPE = 1)
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharp = TRUE
	edge = TRUE
	//tool_qualities = list(QUALITY_SAWING = 30, QUALITY_CUTTING = 20, QUALITY_WIRE_CUTTING = 20)
	//embed_mult = 1 //Serrated blades catch on bone more easily

/obj/item/weapon/saw/improvised
	name = "choppa"
	desc = "A wicked serrated blade made of whatever nasty sharp things you could find. It would make a pretty decent weapon"
	icon_state = "impro_saw"
	force = WEAPON_FORCE_PAINFUL
	//tool_qualities = list(QUALITY_SAWING = 15, QUALITY_CUTTING = 10, QUALITY_WIRE_CUTTING = 10)
	//degradation = 1