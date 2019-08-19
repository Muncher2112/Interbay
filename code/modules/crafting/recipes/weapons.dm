/datum/crafting_recipe/weapon
	category = "Weapon"
	time = 60
	related_skill = SKILL_CRAFT

/datum/crafting_recipe/weapon/baseballbat
	name = "baseball bat"
	result = list(/obj/item/weapon/material/twohanded/baseballbat = 1)
	parts = list(MATERIAL_WOOD_TYPE = 6)

/datum/crafting_recipe/weapon/grenade_casing
	name = "grenade casing"
	result = list(/obj/item/weapon/grenade/chem_grenade = 1)
	parts = list(MATERIAL_STEEL_TYPE = 2)

/datum/crafting_recipe/weapon/fork
	name = "fork"
	result = list(/obj/item/weapon/material/kitchen/utensil/fork = 1)
	parts = list(MATERIAL_STEEL_TYPE = 1)

/datum/crafting_recipe/weapon/knife
	name = "steel knife"
	result = list(/obj/item/weapon/material/knife = 1)
	parts = list(MATERIAL_STEEL_TYPE = 2)

/datum/crafting_recipe/weapon/spoon
	name = "spoon"
	result = list(/obj/item/weapon/material/kitchen/utensil/spoon = 1)
	parts = list(MATERIAL_STEEL_TYPE  = 1)

/datum/crafting_recipe/weapon/knife_blade
	name = "knife blade"
	result = list(/obj/item/weapon/material/butterflyblade = 1)
	parts = list(MATERIAL_STEEL_TYPE = 6)

/datum/crafting_recipe/weapon/knife_grip
	name = "knife grip"
	result = list(/obj/item/weapon/material/butterflyhandle = 1)
	parts = list(MATERIAL_STEEL_TYPE = 4)

/datum/crafting_recipe/weapon/crossbow_frame
	name = "crossbow frame"
	result = list(/obj/item/weapon/crossbowframe = 1)
	parts = list(MATERIAL_WOOD_TYPE = 5)

/datum/crafting_recipe/weapon/teleportation_spear
	name = "telespear"
	time = 60
	result = list(/obj/item/weapon/tele_spear = 1)
	parts = list(
		/obj/item/stack/rods = 2,
		/obj/item/weapon/stock_parts/subspace/crystal = 1,
		/obj/item/device/assembly/igniter = 1,
		/obj/item/stack/cable_coil = 10)

/datum/crafting_recipe/weapon/improvised_maul
	name = "robust maul"
	result = list(/obj/item/weapon/melee/toolbox_maul = 1)
	parts = list(
			/obj/item/weapon/mop = 1,
			/obj/item/stack/cable_coil = 10)

/datum/crafting_recipe/weapon/nailed_bat
	name = "nailed bat"
	result = list(/obj/item/weapon/melee/nailstick = 1)
	parts = list(MATERIAL_WOOD_TYPE = 5,/obj/item/stack/rods = 3)

/datum/crafting_recipe/weapon/handmade_shield
	name = "handmade shield"
	result = list(/obj/item/weapon/shield/riot/handmade = 1)
	parts = list(MATERIAL_WOOD_TYPE = 12, MATERIAL_STEEL_TYPE = 2, /obj/item/stack/rods = 4)

/datum/crafting_recipe/weapon/tray_shield
	name = "handmade tray shield"
	result = list(/obj/item/weapon/shield/riot/handmade/tray = 1)
	parts = list(
			/obj/item/weapon/tray = 1,
			/obj/item/weapon/storage/belt = 2)

/datum/crafting_recipe/weapon/flamethrower
	name = "flamethrower"
	time = 100
	tools = list(/obj/item/weapon/screwdriver = 1)
	result = list(/obj/item/weapon/flamethrower = 1)
	parts = list(/obj/item/weapon/weldingtool = 1, /obj/item/device/assembly/igniter = 1, /obj/item/weapon/tank/phoron/ = 1)

/datum/crafting_recipe/weapon/mechanical_trap
	name = "makeshift mechanical trap"
	time = 175
	tools = list(/obj/item/weapon/screwdriver = 1, /obj/item/weapon/wrench = 1)
	result = list(/obj/item/weapon/beartrap/makeshift = 1)
	parts = list(/obj/item/weapon/saw = 1,  MATERIAL_STEEL_TYPE = 2, /obj/item/stack/cable_coil = 5)

/*
GUNS
*/

/datum/crafting_recipe/weapon/pistol
	name = "handmade gun"
	time = 100
	tools = list(/obj/item/weapon/screwdriver)
	result = list(/obj/item/weapon/gun/projectile/handmade_pistol = 1)
	parts = list(/obj/item/pipe = 1,
				/obj/item/weapon/crossbowframe = 1,
				/obj/item/weapon/grenade/chem_grenade = 1,
				/obj/item/device/assembly/igniter = 1,
				/obj/item/stack/cable_coil = 2)

/datum/crafting_recipe/weapon/rxd
	name = "RXD - Rapid Crossbow Device"
	time = 120
	tools = list(/obj/item/weapon/screwdriver = 1,  /obj/item/weapon/weldingtool/ = 1)
	result = list(/obj/item/weapon/gun/launcher/crossbow/RCD = 1)
	parts = list(
		/obj/item/weapon/rcd = 1,
		/obj/item/weapon/crossbowframe = 1,
		/obj/item/stack/cable_coil = 2)

/datum/crafting_recipe/weapon/revolver
	name = "Station made revolver"
	tools = list(/obj/item/weapon/screwdriver)
	result = null
	time = 60
	base_chance = 100
	int_required = 12

/datum/crafting_recipe/weapon/revolver/one
	name = "Station made revolver one shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/one_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/one_chamber = 1)

/datum/crafting_recipe/weapon/revolver/two
	name = "Station made revolver two shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/two_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/two_chamber = 1)

/datum/crafting_recipe/weapon/revolver/three
	name = "Station made revolver three shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/three_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/three_chamber = 1)

/datum/crafting_recipe/weapon/revolver/four
	name = "Station made revolver four shot"
	parts = list(/obj/item/reciever = 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/four_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/crafted/four_chamber = 1)
