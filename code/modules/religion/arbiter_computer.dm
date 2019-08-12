/obj/machinery/computer/arbiter_computer
	var/mob/living/suspect
	name = "Heretic scanner machine"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "arbiter_computer"
	density = 1
	anchored = 1
	var/authenticated = 0
	var/mob/living/scan = null
	var/scanner_results = null

/obj/machinery/computer/arbiter_computer/attackby(var/obj/item/I, var/mob/user)
	if(!istype(I,/obj/item/device/arbiter_scanner))
		return

	var/obj/item/device/arbiter_scanner/scanner = I
	if(!scanner.stored_info)
		visible_message("<span class='notice'>The [src] beeps: \"No data detected.\"</span>")
		return
	if(scanner.stored_info == 2)
		visible_message("<span class='notice'>The [src] beeps: \"Subject <b>IS</b> a heretic.\"</span>")
		scanner_results = 2
		return
	else
		visible_message("<span class='notice'>The [src] beeps: \"Subject is <b>NOT</b> a heretic.\"</span>")
		scanner_results = 1

/obj/machinery/computer/arbiter_computer/attack_hand(mob/user as mob)
	..()
	/*
	visible_message("<span class='notice'>The [src] beeps: \"Scan subject with arbiter scanner, and then use the scanner on this machine for results.\"</span>")
	//visible_message("<span class='notice'>The [src] beeps: \"Verina's current request is [SSverina.last_fire]\"</span>")
	var/list/visible_locations = SSverina.get_shrine_locations()
	visible_message("<span class='notice'>The [src] beeps: \"I have detected shrines in the following locations: [visible_locations.Join(", ")]\"</span>")
	*/
	ui_interact(user)

/obj/machinery/computer/arbiter_computer/hear_talk(mob/living/M as mob, msg, var/verb="says", datum/language/speaking=null)
	if (msg == accepted_prayer && M.religion_is_legal())
		scan = M
		visible_message("<span class='notice'>Welcome [M.name].  Verina's blessing upon you.</span>")
		authenticated = 1
	else
		visible_message("<span class='notice'>Begone heretic!</span>")
	return

/obj/machinery/computer/arbiter_computer/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/list/visible_locations = SSverina.get_shrine_locations()
	var/dat = list()
	dat = text("Speak the prayer to confirm identity: [] <HR>", (scan ? text("[]", scan.name) :"----------"))
	if (authenticated)
		if (SSverina.request_item )
			dat += text("Verina is currently demanding <b> [SSverina.request_amount] [SSverina.request_item]s </b>, in <b>[round(SSverina.request_time/60)] minutes! </b><HR>")
		else
			dat += text("Verina is currently satiated. <HR>")
		if(visible_locations.len > 0)
			dat += text("verina has detected shrines in the following locations: <b>[visible_locations.Join(", ")]</b> <HR>")
		if(!scanner_results)
			dat += text("No sample is provided.  Please provide a revelator sample <BR>")
		else if(scanner_results == 2)
			dat += text("The [src] beeps: \"Subject <b>IS</b> a heretic. <HR>")
		else
			dat += text("The [src] beeps: \"Subject <b>IS NOT</b> a heretic. <HR>")
	user << browse(text("<HEAD><TITLE>Arbiter Records</TITLE></HEAD><TT>[]</TT>", dat), "window=arbiter_rec;size=600x400")
	onclose(user, "arbiter_rec")

/obj/machinery/computer/arbiter_computer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return
