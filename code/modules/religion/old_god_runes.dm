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
	desc = "A blessing of the old god's written in a circle."
	icon_state = "blessing"

/obj/effect/rune/old_god_rune/claiming
	name = "Old god's claiming"
	desc = "A symbol of the old god's million eyes, and how he watches everywhere."
	icon_state = "claiming"


/obj/effect/rune/old_god_rune/blessing/cast(var/mob/living/user)
	//var/datum/religion/old_gods/OG = all_religions[ILLEGAL_RELIGION]
	to_world("[all_religions[ILLEGAL_RELIGION]]")
	all_religions[ILLEGAL_RELIGION].favour += 10
	to_world("cast blessing [all_religions[ILLEGAL_RELIGION].favour]")

/obj/effect/rune/old_god_rune/claiming/cast(var/mob/living/user)
	var/turf/T = get_turf(src)
	to_world("[T]")
	var/candles = 0
	for(var/obj/item/weapon/flame/candle/C in range(1, src)) //Check for candles around
		to_world("[C]")
		C.light()
		candles = 1
	if (candles != 0)
		new /obj/machinery/old_god_shrine(T)
		qdel(src)
	else
		fizzle(user)