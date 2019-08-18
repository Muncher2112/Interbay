/*
 * Wrench
 */
/obj/item/weapon/wrench
	name = "wrench"
	desc = "A wrench with many common uses. Can usually be found in your hand."
	icon = 'icons/obj/tools.dmi'
	icon_state = "wrench"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7.0
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 150)
	center_of_mass = "x=17;y=16"
	attack_verb = list("bashed", "battered", "bludgeoned", "whacked")


/obj/item/weapon/wrench/improvised
	name = "sheet spanner"
	desc = "A flat bit of metal with some usefully shaped holes cut into it."
	icon_state = "impro_wrench"
	//degradation = 4
	//tool_qualities = list(QUALITY_BOLT_TURNING = 15)