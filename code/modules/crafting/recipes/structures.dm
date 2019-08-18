/datum/crafting_recipe/structure
	name = "structure"
	category = "Structures"
	result = null
	time = 30
	base_chance = 100
	tools = list(/obj/item/weapon/weldingtool = 1)

/datum/crafting_recipe/structure/chair
	name = "Chair"
	parts = list(/obj/item/metal_bar = 2, /obj/item/stack/material/steel/ = 1)
	result = list(/obj/structure/bed/chair = 1)

/datum/crafting_recipe/structure/bed
	name = "Bed"
	parts = list(/obj/item/metal_bar = 2, /obj/item/stack/material/steel/ = 2)
	result = list(/obj/structure/bed = 1)

/datum/crafting_recipe/structure/bar_stool
	name = "Bar Stool"
	parts = list(/obj/item/metal_bar = 1, /obj/item/stack/material/steel/ = 1)
	result = list(/obj/item/weapon/stool/bar  = 1)
	time = 20

/datum/crafting_recipe/structure/table_frame
	name = "Table Frame"
	parts = list(/obj/item/metal_bar = 2)
	result = list(/obj/structure/table = 1)
	time = 20

/datum/crafting_recipe/structure/Barricade
	name = "Barricade"
	parts = list(/obj/item/metal_bar = 4, /obj/item/stack/material/steel/ = 2)
	result = list(/obj/structure/barricade = 1)
	time = 60