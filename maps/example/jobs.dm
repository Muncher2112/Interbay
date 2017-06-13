/datum/map/example
	allowed_jobs = list(/datum/job/kid)

/datum/job/kid
	title = "Child"
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	supervisors = "i dunno ur like a kid man"

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")
		..()