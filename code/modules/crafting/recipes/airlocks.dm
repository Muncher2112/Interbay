/datum/crafting_recipe/airlock
	category = "Airlocks"
	time = 150
	parts = list(/obj/item/stack/material/steel/ = 10)
	tools = list(/obj/item/weapon/weldingtool = 1)
	result = null
	related_skill = SKILL_ENG

/datum/crafting_recipe/airlock/standard
	name = "standard airlock assembly"
	result = list(/obj/structure/door_assembly = 1)

/datum/crafting_recipe/airlock/command
	name = "command airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_com = 1)

/datum/crafting_recipe/airlock/security
	name = "security airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_sec = 1)

/datum/crafting_recipe/airlock/engineering
	name = "engineering airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_eng = 1)

/datum/crafting_recipe/airlock/mining
	name = "mining airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_min = 1)

/datum/crafting_recipe/airlock/atmospherics
	name = "atmospherics airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_atmo = 1)

/datum/crafting_recipe/airlock/research
	name = "research airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_research = 1)

/datum/crafting_recipe/airlock/medical
	name = "medical airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_med = 1)

/datum/crafting_recipe/airlock/maintenance
	name = "maintenance airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_mai = 1)

/datum/crafting_recipe/airlock/external
	name = "external airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_ext = 1)

/datum/crafting_recipe/airlock/freezer
	name = "freezer airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_fre = 1)

/datum/crafting_recipe/airlock/airtight
	name = "airtight hatch assembly"
	result = list(/obj/structure/door_assembly/door_assembly_hatch = 1)

/datum/crafting_recipe/airlock/maintenance
	name = "maintenance hatch assembly"
	result = list(/obj/structure/door_assembly/door_assembly_mhatch = 1)

/datum/crafting_recipe/airlock/high_security
	name = "high security airlock assembly"
	result = list(/obj/structure/door_assembly/door_assembly_highsecurity = 1)

/datum/crafting_recipe/airlock/emergency_shutter
	name = "emergency shutter"
	result = list(/obj/structure/firedoor_assembly = 1)

/datum/crafting_recipe/airlock/multitile
	name = "multi-tile airlock assembly"
	parts = list(/obj/item/stack/material/steel/ = 20)
	result = list(/obj/structure/door_assembly/multi_tile = 1)
