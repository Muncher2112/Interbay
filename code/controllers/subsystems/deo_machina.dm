var/datum/controller/subsystem/verina_controller/SSverina

//The main controller of verina.  Will manage a few small subsystems, and manage what they are doing based on crew input
/datum/controller/subsystem/verina_controller
	name = "Verina"
	wait = 600  //1 minutes
	priority = 20
	flags = SS_BACKGROUND
	var/obj/request_item = null
	var/request_amount = -1
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
	request_amount = rand(0,100)
	to_world("We are requesting [request_amount] [request_item.name]s")