
/*
 * Crowbar
 */

/obj/item/weapon/crowbar
	name = "crowbar"
	desc = "Used to remove floors and to pry open doors."
	icon = 'icons/obj/tools.dmi'
	icon_state = "crowbar"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 7
	item_state = "crowbar"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 50)
	center_of_mass = "x=16;y=20"
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned")
	parry_sounds = list('sound/weapons/blunt_parry1.ogg', 'sound/weapons/blunt_parry2.ogg', 'sound/weapons/blunt_parry3.ogg')

/obj/item/weapon/crowbar/improvised
	name = "rebar"
	desc = "A pair of metal rods laboriously twisted into a useful shape"
	icon_state = "impro_crowbar"
	item_state = "crowbar"
	//tool_qualities = list(QUALITY_PRYING = 10, QUALITY_DIGGING = 10)
	//degradation = 5 //This one breaks REALLY fast

/obj/item/weapon/crowbar/red
	icon = 'icons/obj/items.dmi'
	icon_state = "red_crowbar"
	item_state = "crowbar_red"

/obj/item/weapon/crowbar/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_sword_parry(user, damage, damage_source, attacker, def_zone, attack_text))
		return 1
	return 0



/obj/item/weapon/weldingtool/attack(mob/living/M, mob/living/user, target_zone)

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/S = H.organs_by_name[target_zone]

		if(!S || !(S.robotic >= ORGAN_ROBOT) || user.a_intent != I_HELP)
			return ..()

		if(!welding)
			to_chat(user, "<span class='warning'>You'll need to turn [src] on to patch the damage on [M]'s [S.name]!</span>")
			return 1

		if(S.robo_repair(15, BRUTE, "some dents", src, user))
			remove_fuel(1, user)

	else
		return ..()
