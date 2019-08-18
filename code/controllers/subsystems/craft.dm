SUBSYSTEM_DEF(craft)
	name = "Craft"
	init_order = INIT_ORDER_CRAFT
	flags = SS_NO_FIRE
	var/list/categories //list of crafting_recipe objects(datums)
	var/list/cat_names //list of strings from crafting_recipe.category

	var/global/list/current_category = list()
	var/global/list/current_item = list()

/datum/controller/subsystem/craft/Initialize(timeofday)
	categories = list()
	cat_names = list()
	for(var/path in subtypesof(/datum/crafting_recipe))
		var/datum/crafting_recipe/CR = path
		if(!initial(CR.name))
			continue
		CR = new CR
		cat_names |= CR.category
		if(!(CR.category in categories))
			categories[CR.category] = list()
		categories[CR.category] += CR
		CHECK_TICK