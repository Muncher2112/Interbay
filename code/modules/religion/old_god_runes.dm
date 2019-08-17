/obj/effect/rune/old_god_rune
	name = "Rune of the old Gods"
	desc = "A heretical symbols drawn in chalk."
	anchored = 1
	icon = 'icons/effects/religion.dmi'
	icon_state = "blank"
	unacidable = 1
	plane = ABOVE_TURF_PLANE
	layer = RUNE_LAYER
	bcolor = "#FFFFFF"
	cultname = "Old God Worshiper's"

/obj/effect/rune/old_god_rune/New(var/loc, var/blcolor = "#FFFFFF", var/nblood = "chalk")
	..(loc,blcolor,nblood)
	bcolor = blcolor
	blood = nblood
	update_icon()

//Not sure why the cult runes do all that crazy stuff.
/obj/effect/rune/old_god_rune/update_icon()
	return

/obj/effect/rune/old_god_rune/examine(var/mob/living/user)
	. = ..()
	//If they ARE an old gods believer
	if(!user.religion_is_legal())
		to_chat(user, "This is \a [cultname] rune.")

/obj/effect/rune/old_god_rune/attack_hand(var/mob/living/user)
	if(user.religion_is_legal())
		to_chat(user, "You recognize these are heretical scrawling, but you can't figure out what it's for.")
	cast(user)


/mob/proc/blessing_rune()
	set category = "Old God Magic"
	set name = "Blessing"
	make_old_god_rune(/obj/effect/rune/old_god_rune/blessing)

/mob/proc/claiming_rune()
	set category = "Old God Magic"
	set name = "Claiming"
	make_old_god_rune(/obj/effect/rune/old_god_rune/claiming)

/mob/proc/healing_rune()
	set category = "Old God Magic"
	set name = "Healing"
	make_old_god_rune(/obj/effect/rune/old_god_rune/healing)

//Runes
/obj/effect/rune/old_god_rune/blessing
	name = "Old god's blessing"
	desc = "A blessing of the old god's written in a circle.  Used to channel favor into weapons and objects"
	icon_state = "blessing"

/obj/effect/rune/old_god_rune/claiming
	name = "Old god's claiming"
	desc = "A symbol of the Old God's million eyes, and how he watches everywhere."
	icon_state = "claiming"

/obj/effect/rune/old_god_rune/healing
	name = "Old god's healing"
	desc = "A symbol of the Old God's benevolence and protection.  Rejuvenate believers"
	icon_state = "healing"

//Casts
/
/obj/effect/rune/old_god_rune/blessing/cast(var/mob/living/user)
	// I'm not sure if this works, need to do a lot more testing.
	if (GLOB.all_religions[ILLEGAL_RELIGION].favor < 100 || !user)  //100 favor for 1 force
		fizzle(user)
		return
	GLOB.all_religions[ILLEGAL_RELIGION].favor -= 100
	var/obj/item/weapon/target
	for(var/obj/item/weapon/W in get_turf(src))
		// Need to check the weapon's sharpness and force to make sure it's suitable for the blessing
		if(W.force >= 10 || W.sharpness >= 25)
			target = W
			break
	if (target)
		target.force += 1
		target.sharpness += 1
		visible_message("<span class='warning'>The weapon grows hot to the touch, and a glowing rune apears on the hilt</span>")
	return


/obj/effect/rune/old_god_rune/claiming/cast(var/mob/living/user)
	var/turf/T = get_turf(src)
	if (!GLOB.all_religions[ILLEGAL_RELIGION].can_claim_for_gods(user,T))
		fizzle(user)
		return
	var/candles = 0

	for(var/obj/item/weapon/flame/candle/C in range(1, src)) //Check for candles around
		C.light()
		candles = 1
	if (candles != 0)
		new /obj/machinery/old_god_shrine(T)
		GLOB.all_religions[ILLEGAL_RELIGION].claim_territory(get_area(T),ILLEGAL_RELIGION)
		qdel(src)
	else
		fizzle(user)

/obj/effect/rune/old_god_rune/healing/cast(var/mob/living/user)
	if (GLOB.all_religions[ILLEGAL_RELIGION].favor < 100 || !user)  //If we don't have enough favor or no user
		fizzle(user)
		return
	GLOB.all_religions[ILLEGAL_RELIGION].favor -= 100
	var/mob/living/carbon/target = null
	for(var/mob/living/carbon/M in get_turf(src))
		if(!M.religion_is_legal(M) && M.stat != DEAD)
			target = M
			break
	playsound(target.loc,"sound/effects/bonebreak[rand(1,3)].ogg")
	target.agony_scream()
	to_chat(target, "You feel a chill, and [target]'s bones start to knit together.")
	target.heal_overall_damage(10,10)
