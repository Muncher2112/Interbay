/obj/effect/rune/old_god_rune
	name = "rune of the Gold Gods"
	desc = "A heretical symbols drawn in chalk."
	anchored = 1
	icon = 'icons/effects/uristrunes.dmi'
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

/obj/effect/rune/old_god_rune/examine(var/mob/living/user)
	. = ..()
	//If they ARE a old gods believer
	if(!user.religion_is_legal())
		to_chat(user, "This is \a [cultname] rune.")


/mob/proc/blessing_rune()
	set category = "Old God Magic"
	set name = "Blessing"
	make_old_god_rune(/obj/effect/rune/old_god_rune/blessing)

/obj/effect/rune/old_god_rune/blessing
	name = "Old god's blessing"
	desc = "A strange collection of symbols drawn in chalk."

