/datum/crafting_recipe/structure
	name = "structure"
	category = "Structures"
	result = null
	time = 30
	base_chance = 100
	tools = list(/obj/item/weapon/weldingtool = 1)
	related_skill = SKILL_ENG

/datum/crafting_recipe/structure/Barricade
	name = "Barricade"
	parts = list(/obj/item/metal_bar = 4, /obj/item/stack/material/steel/ = 2)
	result = list(/obj/structure/barricade = 1)
	time = 60

/datum/crafting_recipe/structure/railing
	name = "Wooden railing"
	result = list(/obj/structure/railing = 1)
	parts = list(/obj/item/stack/material/wood/ = 5)

/datum/crafting_recipe/structure/railing_grey
	name = "Metal railing"
	result = list(/obj/structure/railing/grey = 1)
	parts = list(/obj/item/stack/rods = 5)
