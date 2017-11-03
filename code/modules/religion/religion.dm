//PUTTING RELIGIOUS RELATED STUFF IN IT'S ON MODULES FOLDER FROM NOW ON. - Matt


//PROCS

//Stupidly simplistic? Probably. But I'm too tired to write something more complex.
/mob/living/proc/religion_is_legal()
	if(religion != LEGAL_RELIGION)
		return 0
	return 1



//CLOTHING
/obj/item/clothing/under/rank/arbiter
	name = "arbiter's uniform"
	desc = "A suit worn by members of the inquisition."
	icon_state = "arbiter"
	worn_state = "arbiter"
	item_state = "arbiter"

/obj/item/clothing/suit/storage/vest/arbiter
	name = "arbiter's vest"
	desc = "Bright orange so heretics see you coming."
	icon_state = "arbiter"
	item_state = "arbiter"
	armor = list(melee = 40, bullet = 35, laser = 40, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/cowl
	name = "supreme arbiter's cowl"
	desc = "Worn by the head hancho himself."
	icon_state = "cowl"
	item_state = "cowl"
	armor = list(melee = 45, bullet = 40, laser = 45, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/arbiter
	name = "arbiter helmet"
	desc = "The standard helmet that arbiter's wear."
	icon_state = "arbiter"
	item_state = "arbiter"
	flags_inv = HIDEFACE|HIDEEARS|BLOCKHEADHAIR//Hides their identity.

/obj/item/clothing/head/helmet/inquisitor
	name = "supreme arbiter helmet"
	desc = "The special helmet that the supreme arbiter wears."
	icon_state = "inquisitor"
	item_state = "inquisitor"

/obj/item/clothing/gloves/arbiter
	name = "arbiter's gloves"
	desc = "The perfect gloves to wrap around a heretics neck."
	icon_state = "arbiter"
	item_state = "arbiter"

/obj/item/clothing/shoes/jackboots/arbiter//Child of jackboots to avoid copy and paste.
	name = "arbiter boots"
	desc = "Sleek, and red as the blood of the heretics."
	icon_state = "arbiter"
	item_state = "arbiter"