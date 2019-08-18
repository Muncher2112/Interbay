/datum/crafting_recipe/medical
	name = "medical"
	category = "Medical"
	result = 0
	time = 30
	related_skill = SKILL_MED

/datum/crafting_recipe/medical/blood_pack
	name = "blood pack"
	result = list(/obj/item/weapon/reagent_containers/blood/empty = 1)
	parts = list(MATERIAL_PLASTIC_TYPE = 2)

/datum/crafting_recipe/medical/bandage
	name = "bandages"
	result = list(/obj/item/stack/medical/bruise_pack/handmade = 1)
	parts = list(/obj/item/clothing = 1)