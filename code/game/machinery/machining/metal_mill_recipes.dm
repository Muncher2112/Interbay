/var/global/list/metal_mill_recipes
/var/global/list/metal_mill_categories

/proc/populate_metal_mill_recipes()

	//Create global metal_mill recipe list if it hasn't been made already.
	metal_mill_recipes = list()
	metal_mill_categories = list()
	for(var/R in typesof(/datum/metal_mill/recipe)-/datum/metal_mill/recipe)
		var/datum/metal_mill/recipe/recipe = new R
		metal_mill_recipes += recipe
		metal_mill_categories |= recipe.category

		var/obj/item/I = new recipe.path
		if(I.matter && !recipe.resources) //This can be overidden in the datums.
			recipe.resources = list()
			for(var/material in I.matter)
				recipe.resources[material] = I.matter[material]*1.25 // More expensive to produce than they are to recycle.
		qdel(I)

/datum/metal_mill/recipe
	var/name = "object"
	var/path
	var/list/resources
	var/hidden
	var/category
	var/power_use = 0
	var/is_stack

/datum/metal_mill/recipe/Mill
	name = "Mill"
	path = /obj/item/trash
	category = "General"