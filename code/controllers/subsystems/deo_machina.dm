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


/datum/controller/subsystem/verina_controller/New()
	NEW_SS_GLOBAL(SSverina)

/datum/controller/subsystem/verina_controller/fire()
	//enqueue()
	if(state == SS_RUNNING)
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
	request_item = new request_item
	request_amount = rand(1,50)
	request_time = rand(300,600)

/datum/controller/subsystem/verina_controller/proc/reward()
	var/datum/supply_order/supply_reward = pick(supply_controller.master_supply_list)
	var/datum/supply_order/O = new /datum/supply_order()
	supply_controller.ordernum++
	O.ordernum = supply_controller.ordernum
	O.object = supply_reward
	O.orderedby = "Verina"
	O.reason = "For completing Verina's request!"
	O.orderedrank = "God"
	O.comment = "#[O.ordernum] Well done servant of Verina." // crates will be labeled with this.
	supply_controller.shoppinglist += O

/datum/controller/subsystem/verina_controller/proc/punish()
	to_world("Picking Punishment")