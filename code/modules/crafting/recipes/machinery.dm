/datum/crafting_recipe/machinery
	category = "Machinery"
	time = 120
	related_skill = SKILL_ENG
	tools = list(/obj/item/weapon/weldingtool = 1)

/datum/crafting_recipe/machinery/machine_frame
	name = "machine frame"
	result = list(/obj/machinery/constructable_frame/machine_frame = 1)
	parts = list( MATERIAL_STEEL_TYPE = 8)

/*
/datum/crafting_recipe/machinery/vertical_machine_frame
	name = "vertical machine frame"
	result = list(/obj/machinery/constructable_frame/machine_frame/vertical = 1)
	parts = list( MATERIAL_STEEL_TYPE = 8)
*/
/datum/crafting_recipe/machinery/computer
	related_skill = list(SKILL_ENG, SKILL_CRAFT)

/datum/crafting_recipe/machinery/computer/computer_frame
	name = "computer frame"
	result = list(/obj/structure/computerframe = 1)
	parts = list( MATERIAL_STEEL_TYPE = 5)

/datum/crafting_recipe/machinery/computer/modularconsole
	name = "modular console frame"
	result = list(/obj/item/modular_computer/console = 1)
	time = 200
	parts = list(MATERIAL_STEEL_TYPE = 10, /obj/item/stack/material/glass/ = 5)

/datum/crafting_recipe/machinery/computer/modularlaptop
	name = "modular laptop frame"
	result = list(/obj/item/modular_computer/laptop = 1)
	time = 200
	parts = list(MATERIAL_STEEL_TYPE = 10, /obj/item/stack/material/glass/ = 5)

/datum/crafting_recipe/machinery/computer/modulartablet
	name = "modular tablet frame"
	result = list(/obj/item/modular_computer/tablet = 1)
	time = 200
	parts = list(MATERIAL_STEEL_TYPE = 5, /obj/item/stack/material/glass/ = 2)

/*
/datum/crafting_recipe/machinery/computer/modularpda
	name = "modular pda frame"
	result = list(/obj/item/modular_computer/pda = 1)
	time = 200
	parts = list(MATERIAL_STEEL_TYPE = 3, /obj/item/stack/material/glass/ = 1)
*/
/datum/crafting_recipe/machinery/computer/modulartelescreen
	name = "modular telescreen frame"
	result = list(/obj/item/modular_computer/telescreen = 1)
	time = 200
	parts = list(MATERIAL_STEEL_TYPE = 8, /obj/item/stack/material/glass/ = 6)

/datum/crafting_recipe/machinery/turret_frame
	name = "turret frame"
	result = list(/obj/machinery/porta_turret_construct = 1)
	parts = list(MATERIAL_STEEL_TYPE = 10)



//wall or small you know them req only 2 list
/datum/crafting_recipe/machinery/wall
	parts = list(MATERIAL_STEEL_TYPE = 3)

/datum/crafting_recipe/machinery/wall/lightfixture
	name = "light fixture frame"
	result = list(/obj/item/frame/light = 1)

/datum/crafting_recipe/machinery/wall/lightfixture/small
	name = "small light fixture frame"
	result = list(/obj/item/frame/light/small = 1)

/datum/crafting_recipe/machinery/wall/apc
	name = "apc frame"
	result = list(/obj/item/frame/apc = 1)

/datum/crafting_recipe/machinery/wall/air_alarm
	name = "air alarm frame"
	result = list(/obj/item/frame/air_alarm = 1)

/datum/crafting_recipe/machinery/wall/fire_alarm
	name = "fire alarm frame"
	result = list(/obj/item/frame/fire_alarm = 1)

/datum/crafting_recipe/machinery/AI_core
	name = "AI core"
	result = list(/obj/structure/AIcore = 1)
	parts = list(/obj/item/stack/material/plasteel/ = 10, /obj/item/stack/material/glass/ = 5)
	related_skill = list(SKILL_ENG, SKILL_CRAFT)