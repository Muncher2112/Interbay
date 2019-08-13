var/datum/controller/subsystem/verina_controller/SSverina

//The main controller of verina.  Will manage a few small subsystems, and manage what they are doing based on crew input
/datum/controller/subsystem/verina_controller
	name = "Verina"
	wait = 300  //30 seconds
	priority = 20
	flags = SS_BACKGROUND
	var/obj/request_item = null
	var/request_amount = -1
	var/request_time = -1
	var/visible_shrines = list()
	var/list/requestable_items = list(/obj/item/metal_bar,/obj/item/weapon/screwdriver)
	var/list/bannable_items = list()
	var/list/banned_items = list()
	var/list/rewards = list()
	var/list/punishments = list()
	var/datum/punishment/active_punishment = null

/datum/controller/subsystem/verina_controller/New()
	NEW_SS_GLOBAL(SSverina)
	rewards = typesof(/datum/reward) - /datum/reward
	punishments = typesof(/datum/punishment) - /datum/punishment

/datum/controller/subsystem/verina_controller/fire()
	if(!rewards)  //I hope this doesn't happen every time
		rewards = typesof(/datum/reward) - /datum/reward
	if(!punishments)  //I hope this doesn't happen every time
		punishments = typesof(/datum/punishment) - /datum/punishment
	if(state == SS_RUNNING)
		//Handle requests
		if(request_item)
			request_time -= 30
			if(request_amount <= 0)
				reward()
				generate_request()
			else if (request_time <= 0)
				punish()
				generate_request()
			else
				to_world("Request for [request_amount] [request_item.name]s in [round(request_time/60)] minutes")

		if(!request_item) //Only generate if a request isn't set
			generate_request()
		//Handle punishments.  Count it down, and undo it if it's done
		if(active_punishment)
			if(active_punishment.timer <= 0)
				active_punishment.undo_punishment()
				active_punishment = null
			else
				active_punishment.timer -= 30

/datum/controller/subsystem/verina_controller/Initialize(time = null)
	to_world("Good morning!  Your station's Deo Machina sactioned AI is starting up!  The time is [time]")
	..()

/datum/controller/subsystem/verina_controller/stat_entry(msg)
	..("Verina is here")

/datum/controller/subsystem/verina_controller/Recover()
	to_world("Verina is recovering!")

/datum/controller/subsystem/verina_controller/proc/get_shrine_locations()
	var/shrine_locations = list()
	for(var/obj/machinery/old_god_shrine/S in visible_shrines)
		shrine_locations += get_area(S)
	return shrine_locations

/datum/controller/subsystem/verina_controller/proc/generate_request()
	var/list/request_type = pick(requestable_items)
	request_item = new request_type
	request_amount = rand(5,30)
	request_time = rand(180,600)

/*	Rewards get defined individually with thier own special verb
	All reward code should be self contained.  All the actual "reward" function will do is
	pick a reward and run it's very.
*/
/datum/reward/
	var/name = null
	var/value = 0 //Having these gated by value might be useful at some point, doing it out of 100 right now because I don't know cargo values
	var/message = null

/datum/reward/proc/do_reward()
	to_world("You should not be seeing this!")

/datum/controller/subsystem/verina_controller/proc/reward()
	rewards = typesof(/datum/reward) - /datum/reward
	var/datum/reward/reward = pick(rewards)
	reward = new reward
	reward.do_reward()
	priority_announcement.Announce("As a reward for fulfilling Her Grace's request for [SSverina.request_item], [station_name()] [reward.message]", "Verina", 'sound/misc/notice2.ogg')

/datum/reward/money
	name = "Money" //LOADSA EMONE
	value = 10
	message="has been graced with a bonus!  Praise be Verina!"

/datum/reward/money/do_reward()
	for(var/datum/money_account/account in all_money_accounts)
		account.money += rand(10,25)

/datum/reward/happiness/
	name = "Happiness"
	value = 25
	message="will received a burst of soothing psychic energy that will effect all true believers."

/datum/reward/happiness/do_reward()
	for(var/mob/living/carbon/human/H in GLOB.living_mob_list_)
		if(H.religion == LEGAL_RELIGION)
			H.add_event("fulfilledrequest", /datum/happiness_event/request_fulfilled)

/datum/reward/random_crate
	name = "Random Crate"
	value = 50
	message="has been graced with a suprise shipment!"

/datum/reward/random_crate/do_reward()
	var/datum/supply_order/supply_reward = pick(supply_controller.master_supply_list)
	var/datum/supply_order/O = new /datum/supply_order()
	//I pulled this out of supply stuff, but it should be a seperate function, like god damn
	supply_controller.ordernum++
	O.ordernum = supply_controller.ordernum
	O.object = supply_reward
	O.orderedby = "Verina"
	O.reason = "For completing Verina's request!"
	O.orderedrank = "God"
	O.comment = "#[O.ordernum] Well done servant of Verina." // crates will be labeled with this.
	supply_controller.shoppinglist += O


// Punishments work the same as rewards, but have a time limit, and need to save info to undo themselves

/datum/controller/subsystem/verina_controller/proc/punish()
	if(active_punishment)
		active_punishment.undo_punishment()
	punishments = typesof(/datum/punishment) - /datum/punishment
	var/datum/punishment/punishment = pick(punishments)
	punishment = new punishment
	punishment.do_punishment()
	active_punishment = punishment //Need to save this to undo it later
	priority_announcement.Announce("As a punishment for failing to fulfill Her Grace's request for [SSverina.request_item], [station_name()] [punishment.message]", "Verina", 'sound/misc/notice2.ogg')


/datum/punishment/
	var/name = null
	var/value = null
	var/message = null
	var/timer = 180 //3 minutes?

/datum/punishment/proc/do_punishment()
	to_world("You should not be seeing this!")

/datum/punishment/proc/undo_punishment()
	to_world("You should not be seeing this!")


/datum/punishment/tax/
	name = "tax"
	value = 25
	message = "has had a lump sum removed from all station acounts."

/datum/punishment/tax/do_punishment()
	for(var/datum/money_account/account in all_money_accounts)
		account.money -= rand(10,30)

/datum/punishment/tax/undo_punishment()
	return //You don't get your money back

/datum/punishment/disable_machinary/
	name = "Disable Machinary"
	value = 35
	message = "has had a on-board machine disabled until Verina is placated."
	var/obj/machinery/machine_disabled = null

/datum/punishment/disable_machinary/do_punishment()
	var/obj/machinery/target = pick(religion_controlled_machines) //Pick a machine to disable
	//to_world("Disabling [target]")
	target.religion_denied = 1
	target.overlays += image('icons/effects/effects.dmi',"energynet")
	machine_disabled = target

/datum/punishment/disable_machinary/undo_punishment()
	machine_disabled.religion_denied = 0 //Turn the machine back on
	machine_disabled.overlays.Cut()