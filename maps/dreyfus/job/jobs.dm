/datum/map/dreyfus
	allowed_jobs = list(
						/datum/job/assistant,
						/datum/job/captain,
						/datum/job/hop,
						/datum/job/employe,
						/datum/job/rd,
						/datum/job/scientist,
						/datum/job/doctor,
						/datum/job/hos,
						/datum/job/qm,
						/datum/job/engineer,
						/datum/job/cargo_tech,
						/datum/job/mining,
						/datum/job/ouvrier,
						/datum/job/chef,
						/datum/job/chaplain,
						/datum/job/janitor
						)

/datum/job/assistant
	title = "Lackey"
	supervisors = "Everyone"
	minimal_player_age = 14
	economic_modifier = 3
	ideal_character_age = 21

/datum/job/captain
	title = "Commandant"
	supervisors = "KNC and you're good will."
	minimal_player_age = 41
	economic_modifier = 15
	ideal_character_age = 65
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/directeur

/datum/job/hop
	title = "Overseer"
	supervisors = "Commandant"
	minimal_player_age = 31
	economic_modifier = 12
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/adjoint

/datum/job/employe
	title = "Employe Administratif"
	supervisors = "les Directeurs"
	minimal_player_age = 21
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 5
	spawn_positions = 5
	selection_color = "#6161aa"
	faction = "Station"
	department_flag = COM
	department = "Command"
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/employe
	announced = 1
	access = list(access_lawyer)
	minimal_access = list(access_lawyer, access_heads)

/datum/job/rd
	title = "Superviseur"
	supervisors = "le Directeur General"
	minimal_player_age = 21
	economic_modifier = 9
	ideal_character_age = 40
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/science/superviseur
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)

/datum/job/scientist
	title = "Technomancer"
	supervisors = "le Superviseur"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch, access_robotics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch, access_robotics)

/datum/job/doctor
	selection_color = "#633d63"
	title = "Medecin"
	supervisors = "le Superviseur"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	

/datum/job/hos
	title = "Head Peacekeepr"
	supervisors = "votre Compagnie"
	minimal_player_age = 19
	economic_modifier = 10
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1


/datum/job/qm
	selection_color = "#3d3315"
	title = "Quartermaster"
	supervisors = "le Directeur General"
	minimal_player_age = 21
	economic_modifier = 7
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 2

/datum/job/engineer
	title = "Ingenieur"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 5
	ideal_character_age = 21
	total_positions = 3
	spawn_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/inge/inge
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)

/datum/job/mining
	selection_color = "#7c6a2e"
	title = "Mineur"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

/datum/job/cargo_tech
	selection_color = "#7c6a2e"
	title = "Manutentionnaire"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

/datum/job/ouvrier
	selection_color = "#7c6a2e"
	title = "Ouvrier de Production"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 5
	spawn_positions = 5
	faction = "Station"
	department_flag = SUP
	department = "Supply"
	announced = 1
	access = list(access_cargo, access_maint_tunnels)
	minimal_access = list(access_cargo, access_maint_tunnels)

/datum/job/chef
	title = "Cuisinier"
	supervisors = "les Directeurs"
	minimal_player_age = 16
	economic_modifier = 4
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1

/datum/job/chaplain
	title = "Aumonier"
	supervisors = "les Directeurs"
	minimal_player_age = 21
	economic_modifier = 6
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1

/datum/job/janitor
	title = "Concierge"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1

/datum/job/cyborg
	title = "Cyborg"
	alt_titles = list(
		"Robot",
		"Android",
		)