//A makeshift knife, for doing all manner of cutting and stabbing tasks in a half-assed manner
/obj/item/weapon/shiv
	icon = 'icons/obj/tools.dmi'
	name = "shiv"
	desc = "A pointy piece of glass, abraded to an edge and wrapped in tape for a handle."
	icon_state = "impro_shiv"
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	drop_sound = 'sound/items/knife_drop.ogg'
	hitsound = 'sound/weapons/bladeslice.ogg'
	matter = list(MATERIAL_GLASS_TYPE = 1)
	sharp = TRUE
	edge = TRUE
	force = 7
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	//tool_qualities = list(QUALITY_CUTTING = 15, QUALITY_WIRE_CUTTING = 5, QUALITY_DRILLING = 10)
	//degradation = 4 //Gets worse with use
