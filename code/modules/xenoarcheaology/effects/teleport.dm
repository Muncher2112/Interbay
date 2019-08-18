/datum/artifact_effect/teleport
	name = "teleport"
	effect_type = EFFECT_BLUESPACE

/datum/artifact_effect/teleport/DoEffectTouch(var/mob/user)
	var/weakness = GetAnomalySusceptibility(user)
	if(prob(100 * weakness))
		to_chat(user, "<span class='warning'>You are suddenly zapped away elsewhere!</span>")
		if (user.buckled)
			user.buckled.unbuckle_mob()

		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, get_turf(user))
		sparks.start()

		user.Move(pick(trange(50, get_turf(holder))))

		sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, user.loc)
		sparks.start()

/datum/artifact_effect/teleport/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/mob/living/M in range(src.effectrange,T))
			var/weakness = GetAnomalySusceptibility(M)
			if(prob(100 * weakness))
				to_chat(M, "<span class='warning'>You are displaced by a strange force!</span>")
				if(M.buckled)
					M.buckled.unbuckle_mob()

				var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(3, 0, get_turf(M))
				sparks.start()

				M.Move(pick(trange(50, T)))
				sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(3, 0, M.loc)
				sparks.start()

/datum/artifact_effect/teleport/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/mob/living/M in range(src.effectrange, T))
			var/weakness = GetAnomalySusceptibility(M)
			if(prob(100 * weakness))
				to_chat(M, "<span class='warning'>You are displaced by a strange force!</span>")
				if(M.buckled)
					M.buckled.unbuckle_mob()

				var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(3, 0, get_turf(M))
				sparks.start()

				M.Move(pick(trange(50, T)))
				sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(3, 0, M.loc)
				sparks.start()

/*
/obj/item/weapon/hand_tele/handmade
	name = "Handmade hand-teleporter"
	desc = "Handmade version of hand-tele. Woah, that's was they call an experimental science!"
	icon_state = "hm_hand-tele"
	portal_type = /obj/effect/portal/unstable
	portal_fail_chance = 50
	cell_charge_per_attempt = 50
	var/calibration_required = TRUE

/obj/item/weapon/hand_tele/handmade/attackby(obj/item/C, mob/living/user)
	..()
	if(istype(C, /obj/item/weapon/tool/screwdriver))
		if(user.a_intent == I_HURT)
			if(prob(5))
				var/turf/teleport_location = pick( getcircle(user.loc, 3) )
				user.drop_from_inventory(user.get_active_hand())
				user.drop_from_inventory(user.get_inactive_hand())
				if(teleport_location)
					do_teleport(user, teleport_location, 1)
					return
			if(do_after(user, 30))
				if(calibration_required)
					to_chat(user, SPAN_WARNING("You loosen [src]'s calibration, it'll probably fail when used now"))
					portal_fail_chance = 90
					calibration_required = FALSE
				else
					calibration_required = TRUE
					to_chat(user, SPAN_NOTICE("You recalibrate [src]. It'll probably function now"))
					portal_fail_chance = 50
		else
			if(do_after(user, 30))
				if(calibration_required)
					var/user_intelligence = user.stats.getStat(STAT_COG)
					portal_fail_chance -= user_intelligence
					if(portal_fail_chance < 0)
						portal_fail_chance = 0
					calibration_required = FALSE
					to_chat(user, SPAN_NOTICE("You carefully place bluespace crystal into slot to the end, and tweak the circuit with your [C]. [src] now looks more reliable."))
				else
					to_chat(user, SPAN_WARNING("[src] is calibrated already. You can decalibrate it with some harmful effort."))
*/
/obj/item/weapon/tele_spear
	name = "Telespear"
	desc = "This is just a stick with dodgy device at the end."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "telespear"
	item_state = "telespear"
	slot_flags = SLOT_BACK

/obj/item/weapon/tele_spear/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	playsound(src.loc, 'sound/effects/EMPulse.ogg', 65, 1)
	var/turf/teleport_location = pick( getcircle(user.loc, 8) )
	if(prob(5))
		do_teleport(user, teleport_location, 1)
	else
		do_teleport(M, teleport_location, 1)
	qdel(src)
	var/obj/item/stack/rods/R = new(M.loc)
	user.put_in_active_hand(R)