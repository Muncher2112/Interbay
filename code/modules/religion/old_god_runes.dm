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

//Runes
/obj/effect/rune/old_god_rune/blessing
	name = "Old god's blessing"
	desc = "A blessing of the old god's written in a circle.  Used to channel favor into living believers"
	icon_state = "blessing"

/obj/effect/rune/old_god_rune/claiming
	name = "Old god's claiming"
	desc = "A symbol of the old god's million eyes, and how he watches everywhere."
	icon_state = "claiming"


/obj/effect/rune/old_god_rune/blessing/cast(var/mob/living/user)
	to_world("Here is the favor [all_religions[ILLEGAL_RELIGION].favor] : [user]")
	if (!all_religions[ILLEGAL_RELIGION].favor < 100 || !user)  //If we don't have enough favor or no user
		fizzle(user)
		return
	all_religions[ILLEGAL_RELIGION].favor -= 100
	var/mob/living/carbon/target = null
	for(var/mob/living/carbon/M in get_turf(src))
		if(!M.religion_is_legal(M) && M.stat != DEAD)
			target = M
			break
	playsound(target,"sound/effects/bonebreak[rand(1,4)].wav")
	target.agony_scream()
	to_chat(target, "You feel a chill, and [target]'s bones start to knit together.")
	target.heal_overall_damage(10,10)
	to_world("cast blessing [all_religions[ILLEGAL_RELIGION].favor]")


/obj/effect/rune/old_god_rune/claiming/cast(var/mob/living/user)
	var/turf/T = get_turf(src)
	if (!all_religions[ILLEGAL_RELIGION].can_claim_for_gods(user,T))
		fizzle(user)
		return
	var/candles = 0
	for(var/obj/item/weapon/flame/candle/C in range(1, src)) //Check for candles around
		C.light()
		candles = 1
	if (candles != 0)
		new /obj/machinery/old_god_shrine(T)
		all_religions[ILLEGAL_RELIGION].claim_territory(get_area(T),ILLEGAL_RELIGION)
		qdel(src)
	else
		fizzle(user)