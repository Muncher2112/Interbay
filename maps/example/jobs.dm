/datum/map/example
	allowed_jobs = list(/datum/job/kid)

/datum/job/kid
	title = "Cadet"
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	supervisors = "i dunno ur like a kid man"
	create_record = 0             //no one gives a fuck about kids lol
	account_allowed = 0			  //kids don't have bank accounts.
	outfit_type = /decl/hierarchy/outfit/job/cadet

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")
		..()




///Because kids like to appear in lists they have no business being in, commenting them out till they're fixed.
/datum/species/human/child //Oh lord here we go.
	name = "Child"
	name_plural = "Children"
	blurb = "But a child."
	total_health = 80 //Kids are weaker than adults.
	min_age = 10
	max_age = 14
	icobase = 'icons/mob/human_races/child/r_child.dmi'
	deform = 'icons/mob/human_races/child/r_def_child.dmi'
	//damage_overlays = 'icons/mob/human_races/masks/dam_monkey.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_child.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_child.dmi'
	spawn_flags = SPECIES_IS_RESTRICTED//No more kids becoming nuke ops.


/datum/species/human/child/handle_post_spawn(var/mob/living/carbon/human/H)
	H.mutations.Add(CLUMSY)
	H.pixel_y = -4
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//Children don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<span class='info'><big>You're [H.age] years old! Hooray!</big></span>")
	return ..()

/decl/hierarchy/outfit/job/cadet
	name = "Cadet's Outfit"
	uniform = /obj/item/clothing/under/child_jumpsuit
	shoes = /obj/item/clothing/shoes/child_shoes


/obj/item/clothing/under/child_jumpsuit
	name = "grey children's jumpsuit"
	desc = "Fitted just for kids."
	icon_state = "child_grey"
	child_exclusive = 1

/obj/item/clothing/shoes/child_shoes
	name = "black children's shoes"
	desc = "Fitted just for kids."
	icon_state = "child_black"
	child_exclusive = 1