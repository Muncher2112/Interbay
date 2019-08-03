var/datum/controller/subsystem/verina_controller/SSverina

//The main controller of verina.  Will manage a few small subsystems, and manage what they are doing based on crew input
/datum/controller/subsystem/verina_controller
	name = "Verina"
	wait = 30  //30 seconds?
	priority = 20
	flags = SS_BACKGROUND


/datum/controller/subsystem/verina_controller/New()
	to_world("SSVERINA IS BEING ADDED TO GLOBAL")
	NEW_SS_GLOBAL(SSverina)

/datum/controller/subsystem/verina_controller/fire()
	to_world("Verina subsystem is firing!")
	//enqueue()
	if(state == SS_RUNNING)
		to_world("WERE RUNNING")

/datum/controller/subsystem/verina_controller/Initialize(time = null)
	to_world("Good morning!  Your station's Deo Machina sactioned AI is starting up!  The time is [time]")
	..()

/datum/controller/subsystem/verina_controller/stat_entry(msg)
	..("Verina is here")

/datum/controller/subsystem/garbage_collector/Recover()
	to_world("Verina is recovering!")