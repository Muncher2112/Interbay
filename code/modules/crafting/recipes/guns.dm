.//This fucking sucks.  Maybe some big brain can come along and figure out how to make this less shitty

/datum/crafting_recipe/revolver
	name = "Station made revolver"
	category = "Guns"
	tools = list(/obj/item/weapon/screwdriver)
	result = null
	time = 60
	base_chance = 100
	int_required = 12

/datum/crafting_recipe/revolver/one
	name = "Station made revolver one shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/one_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/one_chamber = 1)

/datum/crafting_recipe/revolver/two
	name = "Station made revolver two shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/two_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/two_chamber = 1)

/datum/crafting_recipe/revolver/three
	name = "Station made revolver three shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/three_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/three_chamber = 1)

/datum/crafting_recipe/revolver/four
	name = "Station made revolver four shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/four_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/four_chamber = 1)

/datum/crafting_recipe/ammo_38
	name = "38 Bullet"
	tools = list()
	parts = list(/obj/item/bullet_casing = 1, /obj/item/bullet_38 = 1, /obj/item/stack/material/phoron = 1)
	result = list(/obj/item/ammo_casing/c38  = 1)
	time = 30
	base_chance = 100
	int_required = 12