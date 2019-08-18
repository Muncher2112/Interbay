/datum/crafting_recipe/structure
	name = "structure"
	category = "Structures"
	result = null
	time = 30
	base_chance = 100
	tools = list(/obj/item/weapon/screwdriver = 1)
	related_skill = SKILL_ENG

/datum/crafting_recipe/structure/barricade_wood
	name = "Wooden Barricade"
	parts = list(MATERIAL_WOOD_TYPE = 10)
	result = list(/obj/structure/barricade = 1)
	time = 60

/datum/crafting_recipe/structure/barricade_steel
	name = "Steel Barricade"
	parts = list(MATERIAL_STEEL_TYPE = 5)
	result = list(/obj/structure/barricade/steel = 1)
	tools = list(/obj/item/weapon/weldingtool = 1)
	time = 60

/datum/crafting_recipe/structure/railing
	name = "Wooden railing"
	result = list(/obj/structure/railing = 1)
	parts = list(/obj/item/stack/material/wood/ = 5)

/datum/crafting_recipe/structure/railing_grey
	name = "Metal railing"
	result = list(/obj/structure/railing/grey = 1)
	parts = list(/obj/item/stack/rods = 5)

/datum/crafting_recipe/wall_girders
	name = "wall girders"
	result = list(/obj/structure/girder = 1)
	parts = list(MATERIAL_STEEL_TYPE = 5)

/datum/crafting_recipe/wall_girders/low
	name = "low girders"
	result = list(/obj/structure/girder/low = 1)
	parts = list(MATERIAL_STEEL_TYPE = 3)

/datum/crafting_recipe/kitchen_spike
	name = "Meat spike"
	result = list(/obj/structure/kitchenspike = 1)
	parts = list(MATERIAL_STEEL_TYPE = 3)

/datum/crafting_recipe/beehive_assembly
	name = "beehive assembly"
	result = list(/obj/item/beehive_assembly = 1)
	parts = list(MATERIAL_WOOD_TYPE  = 10)

/datum/crafting_recipe/beehive_frame
	name = "beehive frame"
	result = list(/obj/item/honey_frame = 1)
	parts = list(MATERIAL_WOOD_TYPE  = 1)
