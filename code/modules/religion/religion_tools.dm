//TOOLS
//The scanner
/obj/item/device/arbiter_scanner
	icon = 'icons/obj/device.dmi'
	icon_state = "arbiterscanner"
	name = "heretic scanner"
	desc = "Inject someone with revelator and then scan them for results."
	w_class = ITEM_SIZE_SMALL
	force = 0
	var/stored_info = 0
	var/emagged = 0

/obj/item/device/arbiter_scanner/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		playsound(src, 'sound/effects/sparks3.ogg', 30, 0, -6)

/obj/item/device/arbiter_scanner/attack(mob/living/L, mob/user)

	if(!L.reagents.has_reagent("revelator"))
		user.visible_message("<span class='notice'>The [src] beeps: \"ERROR: Subject needs revelator.\"</span>")

	if(emagged)
		stored_info = rand(1,2)
		return

	else if(do_after(user,30))
		if(L.religion_is_legal() && !L.reagents.has_reagent("unrevelator"))//Unrevelator can trick the result.
			stored_info = 2
		else
			stored_info = 1
		user.visible_message("<span class='notice'>The [src] beeps: \"SCANNING COMPLETE.\"</span>")
	..()

//The brander
/obj/item/weapon/brander
	name = "branding device"
	desc = "A special baton, heated red hot by electricity for branding heretics, and other criminals. Activate it to select the brand."
	icon_state = "brander"
	item_state = "baton"
	var/brand = "HERETIC"



/obj/item/weapon/brander/attack(mob/living/carbon/human/H, mob/living/user)
	var/obj/item/organ/external/head/O = locate() in H.organs
	if(O && !H.branded)
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] begins to brand [H]\'s face with the [src]!</span>",
								"<span class='danger'>[user] begins to brand you!</span>")
			if(do_after(user, 50))
				H.custom_pain("[pick("OH GOD IT BURNS SO BAD!", "OH GOD WHY!", "OH GOD YOUR FACE!")]", 250, affecting = O)
				H.branded = brand
				user.doing_something = 0
				playsound(H, 'sound/items/Welder2.ogg', 40, 1, -1)
			else
				user.doing_something = 0

/obj/item/weapon/brander/attack_self(mob/user)
	..()
	var/input = input(user,"Select Brand Type", "Brands") as null|anything in list("HERETIC", "THIEF", "RAPIST", "CRIMINAL")
	if(input)
		brand = input



// LEGAL RELIGOPN
//The machine
/obj/machinery/arbiter_computer
	var/mob/living/suspect
	name = "Heretic scanner machine"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "arbiter_computer"
	density = 1
	anchored = 1

/obj/machinery/arbiter_computer/attackby(var/obj/item/I, var/mob/user)
	if(!istype(I,/obj/item/device/arbiter_scanner))
		return

	var/obj/item/device/arbiter_scanner/scanner = I
	if(!scanner.stored_info)
		visible_message("<span class='notice'>The [src] beeps: \"No data detected.\"</span>")
		return
	if(scanner.stored_info == 2)
		visible_message("<span class='notice'>The [src] beeps: \"Subject <b>IS</b> a heretic.\"</span>")
		return
	else
		visible_message("<span class='notice'>The [src] beeps: \"Subject is <b>NOT</b> a heretic.\"</span>")

/obj/machinery/arbiter_computer/attack_hand(mob/user as mob)
	..()
	visible_message("<span class='notice'>The [src] beeps: \"Scan subject with arbiter scanner, and then use the scanner on this machine for results.\"</span>")


/obj/machinery/arbiter_computer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return

/obj/structure/bed/chair/arbiter
	base_icon = "throne"
	icon_state = "throne"

/obj/structure/bed/chair/arbiter/post_buckle_mob(mob/living/M)
	M.interogation = abs(M.interogation-1) //Trick for flipping the toggle on off
	update_icon()
	return ..()

// ILLEGAL RELIGION

/obj/machinery/old_god_shrine
	name = "Old God Shrine"
	icon = 'icons/obj/structures.dmi'
	icon_state = "old_god_shrine"
	density = 1
	anchored = 1
	use_power = 0
	var/candles = list()

/obj/machinery/old_god_shrine/New(l,d=0)
	..(l)
	for(var/obj/item/weapon/flame/candle/C in range(1, src))
		candles += C

/obj/machinery/old_god_shrine/process()
	for(var/obj/item/weapon/flame/candle/C in candles) //Check for candles around
		if(C.lit)
			all_religions[ILLEGAL_RELIGION].favor += 0.5
		else
			candles -= C