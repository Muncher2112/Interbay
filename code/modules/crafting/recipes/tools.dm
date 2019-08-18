/datum/crafting_recipe/tool
	name = "Tool"
	category = "Tools"
	result = null
	time = 30 			//time in 1/10th of second
	base_chance = 100 	//base chance to get it right without skills
	int_required = 6
	related_skill = SKILL_CRAFT

/datum/crafting_recipe/tool/ducttape
	name = "Ductape"
	result = list(/obj/item/weapon/tape_roll = 1)
	parts = list(/obj/item/stack/medical/bruise_pack/handmade = 3,/obj/effect/spider/stickyweb = 1)

//A shard of glass wrapped in tape makes a crude sort of knife
/datum/crafting_recipe/tool/ductapeshiv
	name = "Shiv"
	tools = list(/obj/item/weapon/tape_roll = 1)
	result = list(/obj/item/weapon/shiv = 1)
	parts = list(/obj/item/weapon/material/shard = 1)

//A rod wrapped in tape makes a crude screwthing
/datum/crafting_recipe/tool/ductapescrewpusher
	name = "Screwpusher"
	tools = list(/obj/item/weapon/tape_roll = 1)
	result = list(/obj/item/weapon/screwdriver/improvised = 1)
	parts = list(/obj/item/stack/rods = 1)

//Rods bent into wierd shapes and held together with a screw
/datum/crafting_recipe/tool/ductapewiremanglers
	name = "Wiremanglers"
	result = list(/obj/item/weapon/wirecutters/improvised = 1)
	tools = list(/obj/item/weapon/screwdriver = 1)
	parts = list(/obj/item/stack/rods = 2)

//A pair of rods laboriously twisted into a useful shape
/datum/crafting_recipe/tool/ductaperebar
	name = "Rebar"
	result = list(/obj/item/weapon/crowbar/improvised = 1)
	parts = list(/obj/item/stack/rods = 2)


//A metal sheet with some holes cut in it
/datum/crafting_recipe/tool/ductapesheetspanner
	name = "Sheet spanner"
	tools = list(/obj/item/weapon/wirecutters = 1)
	result = list(/obj/item/weapon/wrench/improvised = 1)
	parts = list(MATERIAL_STEEL_TYPE = 1)


//A rod and a sheet bound together with ducks
/datum/crafting_recipe/tool/ductapejunkshovel
	name = "Junk shovel"
	tools = list(/obj/item/weapon/tape_roll = 1)
	result = list(/obj/item/weapon/shovel/improvised = 1)
	parts = list(MATERIAL_STEEL_TYPE = 1, /obj/item/stack/rods =1)

//A rod with bits of pointy shrapnel stuck to it. Good weapon
/datum/crafting_recipe/tool/ductapechoppa
	name = "Choppa"
	time = 150
	tools = list(/obj/item/weapon/tape_roll = 1)
	result = list(/obj/item/weapon/saw/improvised = 1)
	parts = list(/obj/item/stack/rods = 1, /obj/item/weapon/material/shard/shrapnel = 2)

//Some pipes duct taped together, attached to a tank and an igniter
/datum/crafting_recipe/tool/ductapejurytorch
	name = "Jury-rigged torch"
	time = 120
	tools = list(/obj/item/weapon/tape_roll = 1)
	result = list(/obj/item/weapon/weldingtool/improvised = 1)
	parts = list(/obj/item/pipe = 2, /obj/item/device/assembly/igniter = 1, /obj/item/weapon/tank/emergency = 1)

/* Coming back to this soon(tm)
/*************************
	TOOL MODS
*************************/
//Metal rods reinforced with fiber tape
/datum/crafting_recipe/tool/ductapebrace
	name = "Tool mod: Brace bar"
	result = list(/obj/item/weapon/tool_upgrade/reinforcement/stick = 1)
	parts =
		list(/obj/item/stack/rods, 1, 30),
		list(/obj/item/stack/rods, 1, 30),
		list(QUALITY_ADHESIVE, 50, 150)
	)



//A metal plate with bolts drilled and wrenched into it
/datum/crafting_recipe/tool/ductapeplate
	name = "Tool mod: reinforcement plate"
	result = list(/obj/item/weapon/tool_upgrade/reinforcement/plating = 1)
	parts =
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_DRILLING, 10, 150),
		list(/obj/item/stack/rods, 4, 30),
		list(QUALITY_BOLT_TURNING, 10, 150),
	)


//An array of sharpened bits of metal to turn a tool into more of a weapon
/datum/crafting_recipe/tool/ductapespikes
	name = "Tool mod: Spikes"
	result = list(/obj/item/weapon/tool_upgrade/augment/spikes = 1)
	parts =
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_WELDING, 10, 150),
		list(/obj/item/weapon/material/shard/shrapnel, 1, "time" = 30),
		list(/obj/item/weapon/material/shard/shrapnel, 1, "time" = 30),
		list(/obj/item/weapon/material/shard/shrapnel, 1, "time" = 30),
		list(/obj/item/weapon/material/shard/shrapnel, 1, "time" = 30),
		list(QUALITY_WELDING, 10, 150),
	)


//An improvised adapter to fit a larger power cell. This is pretty fancy as crafted items go
//Requires an APC frame, a fuckton of wires, a large cell, and several tools
/datum/crafting_recipe/tool/ductapecell_mount
	name = "Tool mod: Heavy cell mount"
	result = list(/obj/item/weapon/tool_upgrade/augment/cell_mount = 1)
	parts =
		list(/obj/item/frame/apc, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 10),
		list(/obj/item/weapon/cell/large, 1),
		list(QUALITY_SAWING, 10, "time" = 70),//The large cell is disassembled for parts
		list(QUALITY_WELDING, 10, "time" = 70),
	)

//Welding backpack disassembled into a smaller tank
/datum/crafting_recipe/tool/ductapefuel_tank
	name = "Tool mod: Expanded fuel tank"
	result = list(/obj/item/weapon/tool_upgrade/augment/fuel_tank = 1)
	parts = /obj/item/weapon/tool_upgrade/augment/fuel_tank)

	parts =
		list(/obj/item/weapon/weldpack, 1, "time" = 30),
		list(QUALITY_SAWING, 10, "time" = 120),//Disassemble the backpack
		list(QUALITY_BOLT_TURNING, 10, 40), //And open some valves
	)

*/