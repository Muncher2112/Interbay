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
						/datum/job/janitor,
						/datum/job/ai,
						/datum/job/cyborg,
						)

/datum/job/assistant
	title = "Passager"
	supervisors = "tout le monde"
	minimal_player_age = 14
	economic_modifier = 3
	ideal_character_age = 21
	alt_titles = list(
		"Actionnaire",
		"Journaliste",
		"Visiteur",
		"Stagiaire",
		"Etudiant",
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)

/datum/job/captain
	title = "Directeur General"
	supervisors = "NanoTrasen et les Actionnaires"
	minimal_player_age = 41
	economic_modifier = 15
	ideal_character_age = 65
	alt_titles = list(
		"Directeur Executif",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/directeur
	allowed_branches = list(
		/datum/mil_branch/administration
	)

/datum/job/hop
	title = "Directeur Adjoint"
	supervisors = "le Directeur General"
	minimal_player_age = 31
	economic_modifier = 12
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Directeur R.H.",
		"Directeur Finances",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/adjoint
	allowed_branches = list(
		/datum/mil_branch/administration
	)

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
	alt_titles = list(
		"Gestionnaire",
		"Secretaire",
		"Controleur",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/employe
	allowed_branches = list(
		/datum/mil_branch/administration
	)
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
	alt_titles = list(
		"Directeur Specialise."
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
	)
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
	title = "Scientifique"
	supervisors = "le Superviseur"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Phyisicien",
		"Roboticien",
		"Chimiste",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)
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
	alt_titles = list(
		"Chirurgien",
		"Infirmier",
		"Biologiste",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/hos
	title = "Marshall"
	supervisors = "votre Compagnie"
	minimal_player_age = 19
	economic_modifier = 10
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Responsable de la Securite",
		"Mercenaire",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/qm
	selection_color = "#3d3315"
	title = "Contremaitre"
	supervisors = "le Directeur General"
	minimal_player_age = 21
	economic_modifier = 7
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 2
	alt_titles = list(
		"Directeur de Production",
		"Coordinateur de Production",
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)

/datum/job/engineer
	title = "Ingenieur"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 5
	ideal_character_age = 21
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Mecanicien",
		"Technicien Machinerie",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/inge/inge
	allowed_branches = list(
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)
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
	alt_titles = list(
		"Raffineur",
		"Technicien Minier",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
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
	alt_titles = list(
		"Technicien Logistique",
		"Prepose au Fret",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
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
	alt_titles = list(
		"Faconneur",
		"Ouvrier Polyvalent",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/ouvrier
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
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
	alt_titles = list(
		"Chef",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
	)

/datum/job/chaplain
	title = "Aumonier"
	supervisors = "les Directeurs"
	minimal_player_age = 21
	economic_modifier = 6
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Psychologue",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/janitor
	title = "Concierge"
	supervisors = "le Contremaitre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Technicien de Surface",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)

/datum/job/cyborg
	title = "Cyborg"
	alt_titles = list(
		"Robot",
		"Android",
		)