#define CRAFT_ONE_PER_TURF 1
#define CRAFT_ON_FLOOR     2

/datum/crafting_recipe
	var/name = "" 			//in-game display name
	var/list/parts 			//type paths of items consumed associated with how many are needed
	var/list/tools 			//type paths of items needed but not consumed
	var/list/result 				//type path of item resulting from this craft
	var/time = 0 			//time in 1/10th of second
	var/base_chance = 100 	//base chance to get it right without skills
	var/int_required = 0    //Anyone can learn this
	var/related_skill = SKILL_CRAFT
	var/category = "Misc"

/datum/crafting_recipe/proc/check_parts(var/list/things)
	if(!parts)
		return 1
	var/list/needs = parts.Copy()
	for(var/atom/movable/A in things)
		for(var/T in needs)
			if(istype(A,T))
				if(istype(A, /obj/item/stack))
					var/obj/item/stack/S = A
					needs[T] -= S.amount
				else
					needs[T] -= 1
				if(needs[T] <= 0) //don't need any more of this type
					needs -= T
		if(!needs.len)
			return 1
	return 0

/datum/crafting_recipe/proc/check_tools(var/list/things)
	for(var/T in tools)
		if(!(locate(T) in things))
			return 0
	return 1

/datum/crafting_recipe/proc/use_ingridients(var/list/things)
	var/list/needs = parts.Copy()
	var/list/to_del = list()
	for(var/T in needs)
		if(ispath(T, /obj/item/stack))
			for(var/obj/item/stack/S in things)
				if(needs[T] >= 0 && istype(S, T))
					if(S.amount >= needs[T])
						S.use(needs[T])
						needs[T] = 0
					else
						needs[T] -= S.amount
						things -= S
						qdel(S)
		else
			for(var/atom/movable/A in things)
				if(needs[T] && istype(A,T))
					needs[T] -= 1
					things -= A
					to_del += A
		if(needs[T] <= 0) //don't need any more of this type
			continue

	for(var/atom/A in to_del)
		to_del -= A
		qdel(A)

	if(!needs.len)
		return 1
	return 0

/datum/crafting_recipe/proc/can_make(var/mob/user, var/turf/spot)
	var/list/things = spot.contents + user.contents
	if (!check_tools(things))
		to_chat(user, "You are missing the tools required.")
		return 0
	if (!check_parts(things))
		to_chat(user, "You are missing the parts required.")
		return 0
	return 1

// If a user has all the stuff, but not the tool, they can still see they are on the right track
/datum/crafting_recipe/proc/can_see(var/mob/user, var/turf/spot)
	var/list/things = spot.contents + user.contents
	return check_parts(things) && user.stats["int"] >= int_required && result//Int effects what you can craft

/datum/crafting_recipe/proc/make(var/mob/user, var/turf/spot)
	if(!can_make(user,spot))
		return 0
	user << "<span class='notice'>You start making \a [name].</span>"
	if(do_after(user, time))
		if(!can_make(user,spot))
			user << "<span class='warning'>You are missing some things to make \a [name].</span>"
			return 0
		use_ingridients(spot.contents + user.contents)
		if(prob(base_chance))  //Add whatever skill bonuses here
			for(var/T in result)
				for(var/i = 1 to result[T])
					new T(spot)
			user << "<span class='notice'>You make \a [name].</span>"
		else
			user << "<span class='warning'>You've failed to make \a [name].</span>"

/datum/crafting_recipe/proc/get_description()
	. = list()
	var/atom/A = result[1]
	.+="[initial(A.desc)]<br>"
	return jointext(., "<br>")

/datum/crafting_recipe/proc/get_ingredients()
	var/list/ingredients = list()
	for (var/part in parts)
		var/atom/A = new part
		ingredients += "[A.name]x[parts[part]]"  //This is to make lists of <Part>x<amount> without needing processing later
		qdel(A)
	var/return_text = "Ingredients: " + jointext(ingredients, ", ")
	return return_text

/datum/crafting_recipe/proc/get_tools()
	var/list/required_tools = list()
	for (var/tool in tools)
		var/atom/A = new tool
		required_tools += "[A.name]x1"  //This is to make lists of <Part>x<amount> without needing processing later
		qdel(A)
	var/return_text = "<br>" + "Tools: " +jointext(required_tools, ", ")
	return return_text