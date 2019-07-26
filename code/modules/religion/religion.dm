//PUTTING RELIGIOUS RELATED STUFF IN IT'S ON MODULES FOLDER FROM NOW ON. - Matt

//DATUM STUFF

/datum/religion
	var/name = "NONE"
	var/favour = 0
	var/followers = list()


/datum/religion/machina
	name = "Deo Machina"
	favour = 0
	followers = list()

/datum/religion/old_gods
	name = "Old Gods"
	favour = 0
	followers = list()

/datum/religion/narsie
	name = "Narsie"
	favour = 0
	followers = list()

//PROCS

//Stupidly simplistic? Probably. But I'm too tired to write something more complex.
/mob/living/proc/religion_is_legal()
	if(religion != LEGAL_RELIGION)
		return 0
	return 1

//Reveals a random heretic
/mob/living/proc/reveal_heretics(mob/living/M)
	to_world("in reveal heretics [M]")
	var/list/heretics = list()
	for(var/mob/living/carbon/human/H in human_mob_list)
		if(!H.religion_is_legal() && src.name != H.name)  //Don't add ourselves
			to_world("[H.name]")
			heretics += "[H.name]"
	var/name = ""
	if (religion_is_legal())  //Non-heretics will say a random name
		name = pick(human_mob_list)
	else
		name = pick(heretics)
	emote("scream",1)
	agony_scream()
	say(NewStutter("[name] is one of them!"))


//PRAYER
var/accepted_prayer //The prayer that all those who are not heretics will have.

proc/generate_random_prayer()//This generates a new one.
	var/prayer = pick("Oh great AI. ", "Oh our Lord Verina. ", "Verina, our Lord and Saviour. ")
	prayer += pick("You bathe us in your glow. ", "You bathe our minds in you omniscient wisdom. ", "You bathe our [pick("outpost","kingdom","cities")] in your wealth. ")
	prayer += pick("Verina be praised. ", "Verina save us all. ", "Verina guide us all. ")
	prayer += "Amen."
	return prayer

/obj/item/weapon/pen/crayon/chalk
	name = "consecrated chalk"
	//TODO: Make this arbitar only
	desc = "Heretical chalk used by Old God worshipers."
	icon_state = "crayongrey"
	colour = "#FFFFF"
	shadeColour = "#454545"
	colourName = "grey"

/mob/proc/make_old_god_rune(var/rune)
	var/turf/T = get_turf(src)
	//You need you chalk to draw runes
	if(!istype(get_active_hand(), /obj/item/weapon/pen/crayon/chalk) && !istype(get_inactive_hand(), /obj/item/weapon/pen/crayon/chalk))
		to_chat(src, "<span class='warning'>You can't draw old god runes without your blessed chalk!</span>")
		return
	var/self = "You quickly draw out the rune in your consecrated chalk."
	var/timer = 20
	//TODO: Make this a check tied to INT?
	visible_message("<span class='warning'>\The [src] quickly draws on the floor and begins to whisper quietly to themselves.</span>", "<span class='notice'>[self]</span>", "You hear scratching.")
	if(do_after(src, timer))
		if(locate(/obj/effect/rune) in T)
			return
		//These variables used to just be functions that returned a hard coded value.  So don't blame me, this is actually faster.
		var/obj/effect/rune/R = new rune(T, "#FFFFFF", "Chalk")
		var/area/A = get_area(R)
		log_and_message_admins("created \an [R.cultname] rune at \the [A.name] - [loc.x]-[loc.y]-[loc.z].")
		R.add_fingerprint(src)
		return 1
	return 0

