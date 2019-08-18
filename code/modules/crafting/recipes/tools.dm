/datum/crafting_recipe/tools
	name = "Tool"
	category = "Tools"
	result = null
	time = 30 			//time in 1/10th of second
	base_chance = 100 	//base chance to get it right without skills
	int_required = 6

/datum/crafting_recipe/tools/wrench
	name = "Wrench" 			//in-game display name
	parts = list(/obj/item/metal_bar = 1, /obj/item/wrench_head = 1)			//type paths of items consumed associated with how many are needed
	tools = list(/obj/item/weapon/weldingtool = 1)			//type paths of items needed but not consumed
	result = list(/obj/item/weapon/wrench = 1)		//type path of item resulting from this craft

/datum/crafting_recipe/tools/wirecutters
	name = "Wirecutters"
	parts = list(/obj/item/weapon/material/butterflyblade = 2)
	tools = list(/obj/item/weapon/screwdriver = 1)
	result = list(/obj/item/weapon/wirecutters = 1)

/datum/crafting_recipe/tools/screwdriver
	name = "Screwdriver"
	parts = list(/obj/item/screwdriver_head = 1, /obj/item/glass_handle = 1)
	tools = list()
	result = list(/obj/item/weapon/screwdriver  = 1)