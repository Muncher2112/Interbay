//GUNS
/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty
	name = "\improper Mark I Stormrider"
	desc = "The much, much older brother of the Mark II. Kind of a piece of shit."
	icon_state = "mosin2"
	item_state = "mosin2"
	wielded_item_state = "mosin2-wielded"
	jam_chance = 15
	//pumpsound = 'sound/weapons/newrifle_reload.ogg'
	fire_sound = "brifle"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
	name = "\improper Mark I Stormrider"
	desc = "The much, much older brother of the Mark II. This one has a bayonet."
	icon_state = "mosin2-bayonet"
	force = 15
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"


/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/pump(mob/M as mob)
	if(is_jammed)
		M.visible_message("\The [M] begins to unjam [src].", "You begin to clear the jam of [src]")
		if(!do_after(M, 40, src))
			return
		is_jammed = 0
		playsound(src.loc, 'sound/effects/unjam.ogg', 50, 1)
		return
	..()
	M.visible_message("[M] pushes the bolt of \the [src.name]")

//AMMO
/obj/item/ammo_casing/brifle
	desc = "An old worn out looking bullet casing."
	caliber = "763"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/projectile/bullet/rifle/a762/brifle
	fire_sound = "brifle"
	

/*
/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/special_check(var/mob/user)
	if(!is_jammed && prob(jam_chance))
		playsound(src.loc, 'sound/effects/jam.ogg', 50, 1)
		src.visible_message("<span class='danger'>\The [src] jams!</span>")
		is_jammed = 1
		return 0
	else if(is_jammed)
		return 0
	else
		..()
*/

//Clothing
/obj/item/clothing/suit/storage/vest/opvest
	name = "armored vest"
	desc = "It provides some armor and some storage. Not really the best at either though."
	icon_state = "opvest"
	item_state = "opvest"
	armor = list(melee = 40, bullet = 35, laser = 40, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/siege
	name = "seige helmet"
	desc = "Better than a baseball cap. But not by much."
	icon_state = "siege_helmet"
	item_state = "siege_helmet"
	armor = list(melee = 40, bullet = 25, laser = 35, energy = 35, bomb = 30, bio = 0, rad = 0)