
/datum/map/dreyfus
	name = "Dreyfus"
	full_name = "SSNI Dreyfus"
	path = "dreyfus"
	flags = MAP_HAS_BRANCH

	lobby_icon = 'maps/dreyfus/icons/lobby.dmi'

	station_levels = list(1,2,3,4,5,6)
	admin_levels = list(8)
	contact_levels = list(1,2,3,4,5,6)
	player_levels = list(1,2,3,4,5,6,7)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1,"5"=1,"6"=1,"7"=90)

	allowed_spawns = list("Arrivals Shuttle", "Cryogenic Storage")
	default_spawn = "Arrivals Shuttle"

	station_name  = "SSNI Dreyfus"
	station_short = "Dreyfus"
	dock_name     = "Relais NTTM1-54" // sur Charnay-4
	boss_name     = "Direction Centrale"
	boss_short    = "DIRCEN"
	company_name  = "NanoTrasen Industries"
	company_short = "NTi"
	system_name = "Iota-Pavonis"

	id_hud_icons = 'maps/dreyfus/icons/assignment_hud.dmi'


	map_admin_faxes = list("Nanotrasen Industries Direction Centrale")

	shuttle_docked_message = "La navette de roulement arrivée du %Dock_name% s'est amarée à la station. Départ dans %ETD%"
	shuttle_leaving_dock = "La navette de roulement d'équipage s'est désamarée. Arrivé estimée dans %ETA%."
	shuttle_called_message = "Un roulement d'équipage vers %Dock_name% viens d'être planifié. Une navette de transfert a été appelée. Elle arrivera dans approximativement %ETA%"
	shuttle_recall_message = "Le roulement de l'équipage a été annulé."
	emergency_shuttle_docked_message = "La navette d'évacuation s'est amarrée à la station. Vous êtes prié d'évacuer d'ici %ETD%."
	emergency_shuttle_leaving_dock = "La navette d'évacuation s'est désamarée. Arrivé estimée dans %ETA%."
	emergency_shuttle_called_message = "La navette d'évacuation a été appelée. Elle arrivera dans approximativement %ETA%"
	emergency_shuttle_recall_message = "La navette d'évacuation a été rappelée. Le coût de cette manoevre sera déduit directement de vos salaires."

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/dreyfus/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,3,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,3,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,4,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,4,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,2,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,2,64, 64)
	return 1
