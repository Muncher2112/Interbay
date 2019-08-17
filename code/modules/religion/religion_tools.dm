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
		if(L.reagents.has_reagent("unrevelator")) //Unrevelator can trick the result.
			stored_info = 2
		else if(!L.religion_is_legal())
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

/obj/structure/bed/chair/arbiter
	base_icon = "throne"
	icon_state = "throne"

/obj/structure/bed/chair/arbiter/post_buckle_mob(mob/living/M)
	M.interogation = abs(M.interogation-1) //Trick for flipping the toggle on off
	update_icon()
	return ..()

/obj/machinery/offering_pad
	name = "Deo Machina offering pad"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "broadcaster_off"
	anchored = 1.0

/obj/machinery/offering_pad/hear_talk(mob/living/M as mob, msg, var/verb="says", datum/language/speaking=null)
	if (msg == accepted_prayer)
		var/list/mobs = list()
		var/list/objs = list()
		get_mobs_and_objs_in_view_fast(loc,0,mobs,objs)
		for (var/object in objs)
			if (istype(object,SSverina.request_item.type))
				if (istype(object,/obj/item/stack))
					var/obj/item/stack/S = object
					if (S.amount >= SSverina.request_amount)
						S.amount -= SSverina.request_amount
						SSverina.request_amount = 0
					else
						SSverina.request_amount -= S.amount
						qdel(S)
				else
					SSverina.request_amount -= 1
					qdel(object)
				playsound(get_turf(src), 'sound/misc/interference.ogg', 25, 1, extrarange = 3, falloff = 5)
				flick("broadcaster_send", src)

// ILLEGAL RELIGION

/obj/machinery/old_god_shrine
	name = "Old God Shrine"
	icon = 'icons/obj/structures.dmi'
	icon_state = "old_god_shrine"
	density = 1
	anchored = 1
	use_power = 0
	var/list/candles = list()

/obj/machinery/old_god_shrine/New(l,d=0)
	..(l)
	for(var/obj/item/weapon/flame/candle/C in range(1, src))
		candles += C
	if(near_camera())
		SSverina.visible_shrines += src

/obj/machinery/old_god_shrine/process()
	if (candles.len == 0)
		Destroy()
	for(var/obj/item/weapon/flame/candle/C in candles) //Check for candles around
		if(C.lit)
			GLOB.all_religions[ILLEGAL_RELIGION].favor += 0.5
		else
			candles -= C

/obj/machinery/old_god_shrine/Destroy()
	SSverina.visible_shrines -= src
	..()

/obj/machinery/old_god_shrine/proc/near_camera()
	if (!isturf(loc))
		return 0
	else if(!cameranet.is_visible(src))
		return 0
	GLOB.global_headset.autosay("Heretical Shrine detected in [get_area(src)]","Verina","Inquisition")
	return 1