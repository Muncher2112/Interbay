//TODO: Move this to a better location

/obj/item/bola
	name = "Bola"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a bola.  Good for tripping people the are running away."
	icon_state = "bola"
	matter = list(DEFAULT_WALL_MATERIAL = 20)

/obj/item/bola/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/C = hit_atom
	C.Weaken(10)

/datum/crafting_recipe/misc/
	name = "Miscellaneous items"
	category = "Miscellaneous"
	time = 30
	base_chance = 100
	int_required = 10
	result = null
	tools = list()

/datum/crafting_recipe/misc/bola
	name = "Bola"
	parts = list(/obj/item/cylinder = 3, /obj/item/stack/cable_coil = 15)
	result = list(/obj/item/bola = 1)
	int_required = 8

/datum/crafting_recipe/misc/light_tube
	name = "Light tube"
	parts = list(/obj/item/glass_tube = 1, /obj/item/stack/cable_coil = 5)
	tools = list(/obj/item/weapon/screwdriver = 1)
	result = list(/obj/item/weapon/light/tube	 = 1)
	int_required = 12

/datum/crafting_recipe/misc/metal_rod
	name = "metal rod"
	result = list(/obj/item/stack/rods = 1)
	time = 0
	parts = list(MATERIAL_STEEL_TYPE = 1)

/datum/crafting_recipe/misc/box
	name = "box"
	result = list(/obj/item/weapon/storage/box = 1)
	parts = list(MATERIAL_CARDBOARD_TYPE = 1)

/datum/crafting_recipe/misc/plastic_bag
	name = "plastic bag"
	result = list(/obj/item/weapon/storage/bag/plasticbag = 1)
	parts = list(MATERIAL_PLASTIC_TYPE = 1)

/datum/crafting_recipe/misc/ashtray
	name = "ashtray"
	result = list(/obj/item/weapon/material/ashtray = 1)
	parts = list(MATERIAL_STEEL_TYPE  = 10)

/datum/crafting_recipe/canister
	name = "canister"
	result = list(/obj/machinery/portable_atmospherics/canister/empty = 1)
	tools = list(/obj/item/weapon/weldingtool = 1)
	parts = list(MATERIAL_WOOD_TYPE  = 1)

/datum/crafting_recipe/cannon_frame
	name = "cannon frame"
	result = list(/obj/item/weapon/cannonframe = 1)
	parts = list(MATERIAL_STEEL_TYPE  = 10)

/datum/crafting_recipe/folder
	name = "grey folder"
	result = list(/obj/item/weapon/folder = 1)
	parts = list(MATERIAL_CARDBOARD_TYPE = 1)

/datum/crafting_recipe/folder/blue
	name = "blue folder"
	result = list(/obj/item/weapon/folder/blue = 1)

/datum/crafting_recipe/folder/red
	name = "red folder"
	result = list(/obj/item/weapon/folder/red = 1)

/datum/crafting_recipe/folder/white
	name = "white folder"
	result = list(/obj/item/weapon/folder/white = 1)

/datum/crafting_recipe/folder/yellow
	name = "yellow folder"
	result = list(/obj/item/weapon/folder/yellow = 1)

/*  Ne3d to look into adding this
/datum/crafting_recipe/handmade_handtele
	name = "cheap hand-tele"
	time = 60
	result = list(/obj/item/weapon/hand_tele/handmade = 1)
	parts = list(
		MATERIAL_PLASTIC_TYPE  = 6,
		MATERIAL_GLASS_TYPE = 2,
		/obj/item/weapon/circuitboard = 1,
		/obj/item/weapon/stock_parts/subspace/crystal = 1,
		/obj/item/weapon/stock_parts/capacitor = 1,
		/obj/item/weapon/cell/standard = 1,
		/obj/item/stack/cable_coil = 5
	)
*/
/datum/crafting_recipe/tray
	time = 40
	name = "dinner tray"
	result = list(/obj/item/weapon/tray = 1)
	tools = list(/obj/item/weapon/wirecutters = 1)
	parts = list(MATERIAL_STEEL_TYPE  = 1)