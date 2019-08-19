.//This fucking sucks.  Maybe some big brain can come along and figure out how to make this less shitty

/datum/crafting_recipe/ammo
	name = "Bullet"
	category = "Ammo"
	tools = list()
	parts = list(/obj/item/bullet_casing = 1, /obj/item/stack/material/phoron = 1)
	result = null
	time = 30
	base_chance = 100
	int_required = 12

/datum/crafting_recipe/ammo/ammo_38
	name = "38 Bullet"
	tools = list()
	parts = list(/obj/item/bullet_casing = 1, /obj/item/bullet_38 = 1, /obj/item/stack/material/phoron = 1)
	result = list(/obj/item/ammo_casing/c38  = 1)
	time = 30
	base_chance = 100
	int_required = 12