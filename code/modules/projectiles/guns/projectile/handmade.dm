/obj/item/weapon/gun/projectile/handmade_pistol
	name = "handmade pistol"
	desc = "Looks unreliable. May blow up in your hands. Due to a strange design, this one can be reload only after shot. Or with the use of a screwdriver."
	icon_state = "hm_pistol"
	item_state = "pistol"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = SINGLE_CASING
	max_shells = 1
	caliber = "38"
	ammo_type = /obj/item/ammo_casing/c38
	var/chamber_open = FALSE
	jam_chance = 5

	New()
		..()
		open_chamber()

/obj/item/weapon/gun/projectile/handmade_pistol/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!chamber_open)
		if(istype(W, /obj/item/weapon/screwdriver) || istype(W, /obj/item/weapon/material/kitchen/utensil) || W.sharp)
			open_chamber()
			unjam(user)
			to_chat(user, SPAN_NOTICE("You force open chamber with [W]."))
			update_icon()
	else
		..()


/obj/item/weapon/gun/projectile/handmade_pistol/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	open_chamber()

/obj/item/weapon/gun/projectile/handmade_pistol/load_ammo(var/obj/item/A, mob/user)
	if(!chamber_open)
		to_chat(user, SPAN_WARNING("You need to open chamber first."))
		return
	else
		..()
		chamber_open = FALSE
		icon_state = "hm_pistol"
		playsound(src.loc, 'sound/weapons/guns/interact/batrifle_magin.ogg', 65, 1)

/obj/item/weapon/gun/projectile/handmade_pistol/unload_ammo(mob/user, var/allow_dump=1)
	if(!chamber_open)
		to_chat(user, SPAN_WARNING("You need to open chamber first."))
		return
	..()

/obj/item/weapon/gun/projectile/handmade_pistol/proc/open_chamber()
	src.chamber_open = TRUE
	icon_state = "hm_pistol_open"
	playsound(src.loc, 'sound/weapons/guns/interact/batrifle_magout.ogg', 65, 1)
	if(loaded.len)
		var/obj/item/ammo_casing/our_bullet = loaded[1]
		our_bullet.loc = get_turf(src)
		loaded -= our_bullet
		chambered = null