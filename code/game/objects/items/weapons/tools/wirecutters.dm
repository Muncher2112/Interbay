
/*
 * Wirecutters
 */
/obj/item/weapon/wirecutters
	name = "wirecutters"
	desc = "This cuts wires."
	icon = 'icons/obj/tools.dmi'
	icon_state = "cutters"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 6.0
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 80)
	center_of_mass = "x=18;y=10"
	attack_verb = list("pinched", "nipped")
	sharp = 1
//	edge = 1

/obj/item/weapon/wirecutters/improvised
	name = "wiremanglers"
	desc = "An improvised monstrosity made of bent rods which can sometimes be used to snip things."
	icon_state = "impro_cutter"
	w_class = ITEM_SIZE_NORMAL
	//tool_qualities = list(QUALITY_WIRE_CUTTING = 20, QUALITY_RETRACTING = 10, QUALITY_BONE_SETTING = 10)
	//degradation = 1.5

/obj/item/weapon/wirecutters/New()
	if(prob(50))
		icon_state = "cutters-y"
		item_state = "cutters_yellow"
	..()

/obj/item/weapon/wirecutters/attack(mob/living/carbon/C as mob, mob/living/user as mob)

	if(user.a_intent == I_HELP && (C.handcuffed) && (istype(C.handcuffed, /obj/item/weapon/handcuffs/cable)))
		usr.visible_message("\The [usr] cuts \the [C]'s restraints with \the [src]!",\
		"You cut \the [C]'s restraints with \the [src]!",\
		"You hear cable being cut.")
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return

	//Tearing out teeth
	if(ishuman(C) && user.zone_sel.selecting == "mouth")

		var/mob/living/carbon/human/H = C
		var/obj/item/organ/external/head/O = locate() in H.organs
		for (var/obj/item/weapon/grab/G in C.grabbed_by)
			if(G.loc == user && G.state >= GRAB_AGGRESSIVE)
				if(!O)
					return
				if(!user.doing_something)
					user.doing_something = 1
					H.visible_message("<span class='danger'>[user] tries to cut out [H]'s tongue with [src]!</span>",
								"<span class='danger'>[user] tries to cut out your tongue with [src]!</span>")
					if(do_after(user,100))//Losing your tongue is a pretty big deal, it should take a while.
						var/obj/item/organ/internal/tongue/T = H.internal_organs_by_name[BP_TONGUE]
						T.removed(H)
						H.visible_message("<span class='danger'>[user] cuts out [H]'s tongue with [src]!</span>",
								"<span class='danger'>[user] cuts out your tongue with [src]!</span>")
						return


		if(!O || !O.get_teeth())
			to_chat(user, "<span class='notice'>[H] doesn't have any teeth left!</span>")
			return
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] tries to tear off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tries to tear off your tooth with [src]!</span>")
			if(do_after(user, 50))
				if(!O || !O.get_teeth()) return
				var/obj/item/stack/teeth/E = pick(O.teeth_list)
				if(!E || E.zero_amount()) return
				var/obj/item/stack/teeth/T = new E.type(H.loc, 1)
				E.use(1)
				T.add_blood(H)
				E.zero_amount() //Try to delete the teeth
				H.visible_message("<span class='danger'>[user] tears off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tears off your tooth with [src]!</span>")

				H.apply_damage(rand(1, 3), BRUTE, O)
				if (rand(0,100) >= 50)  //TODO: As you get hurt more, your chance to reveal other heretics increases
					H.reveal_heretics(src)  //Tearing teeth out counts as tourture

				H.custom_pain("[pick("OH GOD YOUR MOUTH HURTS SO BAD!", "OH GOD WHY!", "OH GOD YOUR MOUTH!")]", 100, affecting = O)

				playsound(H, 'sound/effects/gore/trauma3.ogg', 40, 1, -1) //And out it goes.

				user.doing_something = 0
			else
				to_chat(user, "<span class='notice'>Your attempt to pull out a tooth fails...</span>")
				user.doing_something = 0
				return
		else
			to_chat(user, "<span class='notice'>You are already trying to pull out a tooth!</span>")
		return


	..()
