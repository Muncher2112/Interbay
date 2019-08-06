var/datum/controller/subsystem/verina_controller/SSverina

//The main controller of verina.  Will manage a few small subsystems, and manage what they are doing based on crew input
/datum/controller/subsystem/verina_controller
	name = "Verina"
	wait = 300  //30 minutes
	priority = 20
	flags = SS_BACKGROUND
	var/obj/request_item = null
	var/request_amount = -1
	var/request_time = -1
	var/visible_shrines = list()
	var/list/requestable_items = list(/obj/item/metal_bar,/obj/item/weapon/screwdriver)
	var/list/bannable_items = list()


/datum/controller/subsystem/verina_controller/New()
	to_world("SSVERINA IS BEING ADDED TO GLOBAL")
	NEW_SS_GLOBAL(SSverina)

/datum/controller/subsystem/verina_controller/fire()
	//enqueue()
	if(state == SS_RUNNING)
		to_world("Verina subsystem is running!")
		if(request_item)
			request_time -= 30
			to_world("We have a request out.  Check if it's complete")
			if(request_amount <= 0)
				to_world("The request is complete!")
				reward()
				generate_request()
			else if (request_time <= 0)
				to_world("The request is failed!")
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
		to_world("[get_area(S)]")
		shrine_locations += get_area(S)
	return shrine_locations

/datum/controller/subsystem/verina_controller/proc/generate_request()
	request_item = "[pick(requestable_items)]"
	request_item = new request_item
	request_amount = rand(0,25)
	request_time = rand(300,600)
	to_world("We are requesting [request_amount] [request_item.name]s, in [request_time/60] seconds")

/datum/controller/subsystem/verina_controller/proc/reward()
	to_world("Picking reward")

/datum/controller/subsystem/verina_controller/proc/punish()
	to_world("Picking Punishment")