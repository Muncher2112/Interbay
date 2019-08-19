/obj/item/weapon/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")


/obj/item/weapon/melee/whip/abyssal
	name = "abyssal whip"
	desc = "A weapon from the abyss. Requires 70 attack to wield."
	icon_state = "whip"
	item_state = "whip"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 16 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/weapon/melee/whip/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon_state = "chain"
	item_state = "whip"

/obj/item/weapon/material/sword/replica/officersword
	name = "fleet officer's sword"
	desc = "A polished sword issued to officers of the fleet."
	icon_state = "officersword"
	item_state = "officersword"
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE

/obj/item/weapon/material/sword/replica/officersword/marine
	name = "marine NCO's sword"
	desc = "A polished sword issued to SCG Marine NCOs."
	icon_state = "marinesword"

/obj/item/weapon/material/sword/replica/officersword/marineofficer
	name = "marine officer's sword"
	desc = "A curved sword issued to SCG Marine officers."
	icon_state = "marineofficersword"
	item_state = "marineofficersword"

/obj/item/weapon/material/sword/replica/officersword/pettyofficer
	name = "chief petty officer's cutlass"
	desc = "A polished cutlass issued to chief petty officers of the fleet."
	icon_state = "pettyofficersword"
	item_state = "pettyofficersword"
/obj/item/weapon/melee/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")


/obj/item/weapon/melee/toolbox_maul
	name = "toolmop the maul"
	desc = "Toolbox tied to mop. A weapon of choice."
	icon_state = "hm_hammer"
	item_state = "hm_hammer"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	block_chance = 15
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("robusted", "slammed")
	var/reinforced = FALSE
	var/obj/item/weapon/storage/toolbox/toolbox = null
	//structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	New()
		..()
		if(!toolbox)
			src.name = "unfinished [src.name]"
			src.desc = "Wired mop. You need toolbox to finish this."
			icon_state = "hm_hammer_unfinished"
			item_state = ""
			force = WEAPON_FORCE_WEAK
			throwforce = WEAPON_FORCE_WEAK
			origin_tech = list(TECH_COMBAT = 1)


/obj/item/weapon/melee/toolbox_maul/update_icon()
	..()
	overlays.Cut()
	if(reinforced)
		overlays += "[icon_state]-duct_tape"

/obj/item/weapon/melee/toolbox_maul/proc/break_apart(var/mob/living/user)
	qdel(src)
	var/obj/item/weapon/mop/mop = new(user.loc)
	if(!user.get_active_hand())
		user.put_in_active_hand(mop)
	else
		user.put_in_inactive_hand(mop)
	toolbox.loc = user.loc


/obj/item/weapon/melee/toolbox_maul/attackby(obj/item/C, mob/living/user)
	if(toolbox)
		if(istype(C, /obj/item/weapon/wirecutters))
			if(reinforced)
				to_chat(user, SPAN_NOTICE("You cutted up the tapes from [src]."))
				reinforced = FALSE
			else
				to_chat(user, SPAN_NOTICE("You carefully cut cables from [src]."))
				break_apart(user)

		if(istype(C, /obj/item/weapon/tape_roll))
			to_chat(user, SPAN_NOTICE("You begins to tie [src] with [C]..."))
			if(do_after(user, 50))
				if(!reinforced)
					to_chat(user, SPAN_NOTICE("You reinforce [src]."))
					reinforced = TRUE
				else
					to_chat(user, SPAN_WARNING("[src] is already reinforced."))
	else
		if(istype(C, /obj/item/weapon/storage/toolbox))
			src.name = initial(src.name)
			src.desc = initial(src.desc)
			src.force = initial(src.force)
			throwforce = initial(throwforce)
			origin_tech = initial(origin_tech)
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			toolbox = C
			user.drop_from_inventory(C, src)
			if(istype(C, /obj/item/weapon/storage/toolbox/electrical))
				icon_state = "hm_hammer_yellow"
				item_state = "hm_hammer_yellow"
			if(istype(C, /obj/item/weapon/storage/toolbox/mechanical))
				icon_state = "hm_hammer_blue"
				item_state = "hm_hammer_blue"
			to_chat(user, SPAN_NOTICE("You tied [C] to [src] and finally finish it!"))
	update_icon()

/obj/item/weapon/melee/toolbox_maul/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	..()
	if(!reinforced && prob(5))
		break_apart(user)
		playsound(src.loc, 'sound/effects/bang.ogg', 45, 1)
		user.visible_message(SPAN_WARNING("[src] breaks in hands of [user]!"))


/obj/item/weapon/melee/nailstick
	name = "nailed stick"
	desc = "Stick with some nails in it. Looks sharp enough."
	icon_state = "hm_spikeclub"
	item_state = "hm_spikeclub"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	block_chance = 20
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten", "slammed", "smacked", "struck", "battered")
	//structure_damage_factor = STRUCTURE_DAMAGE_HEAVY