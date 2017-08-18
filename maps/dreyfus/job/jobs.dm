/datum/map/dreyfus
	allowed_jobs = list(
						/datum/job/assistant,
						/datum/job/captain,
						/datum/job/hop,
						/datum/job/rd,
						/datum/job/scientist,
						/datum/job/doctor,
						/datum/job/hos,
						/datum/job/officer,
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

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,11), rand(9,11), rand(7,10))


/datum/job/captain
	title = "Commandant"
	supervisors = "KNC and you're good will."
	minimal_player_age = 41
	economic_modifier = 15
	ideal_character_age = 65
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/directeur
	
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,9), rand(9,11), rand(10,12))



/datum/job/hop
	title = "Overseer"
	supervisors = "the Commandant"
	minimal_player_age = 31
	economic_modifier = 12
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/adjoint

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,9), rand(9,11), rand(10,12))

/datum/job/employe
	title = "Employe Administratif"
	supervisors = "the Overseer"
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
	title = "Technomancer"
	supervisors = "the Commandant"
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

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(12,15))
		H.add_skills(rand(25, 50), rand(25,50), rand(65, 75))

/datum/job/scientist
	title = "Tenchotrainee"
	supervisors = "Technomancer"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch, access_robotics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch, access_robotics)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(10,14))
		H.add_skills(rand(25, 50), rand(25,50), rand(65, 75))

/datum/job/doctor
	selection_color = "#633d63"
	title = "Doctor"
	supervisors = "the Overseer"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(10,14))
		H.add_skills(rand(30,50), rand(30,50), rand(65,75))
	

/datum/job/hos
	title = "Head Peacekeeper"
	supervisors = "the Commandant"
	department_flag = SEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#601c1c"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/head_peacekeeper

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(12,16), rand(10,14), rand(8,12))
		H.add_skills(rand(60, 75), rand(60,75))


/datum/job/officer
	title = "Peacekeeper"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4	
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/peacekeeper

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,15), rand(10,14), rand(7,10))
		H.add_skills(rand(60, 75), rand(60,75))


/datum/job/qm
	selection_color = "#3d3315"
	title = "Quartermaster"
	supervisors = "the Overseer"
	minimal_player_age = 21
	economic_modifier = 7
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 2

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(7,10))

/datum/job/engineer
	title = "Upkeeper"
	supervisors = "the Overseer"
	minimal_player_age = 16
	economic_modifier = 5
	ideal_character_age = 21
	total_positions = 3
	spawn_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/inge/inge
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(7,10), rand(11,14))

/datum/job/mining
	selection_color = "#7c6a2e"
	title = "Miner"
	supervisors = "the Quartermaster"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(6,9))

/datum/job/cargo_tech
	selection_color = "#7c6a2e"
	title = "Crate Pusher"
	supervisors = "the Quartermaster"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(6,9))

/datum/job/ouvrier
	selection_color = "#7c6a2e"
	title = "Cargo Kid"
	supervisors = "the Quartermaster"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	faction = "Station"
	department_flag = SUP
	department = "Supply"
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	account_allowed = 0			  //This breaks things.
	create_record = 0             //No one gives a fuck about kids lol.
	has_email = 0				  //Nor do kids get email accounts.
	outfit_type = /decl/hierarchy/outfit/job/cargo_kid

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")//Actually makes them a child. Called before ..() so they can get their clothes.
		H.add_stats(rand(3,6), rand(12,16), rand(6,9))
		..()

/datum/job/chef
	title = "Cook"
	supervisors = "the Overseer"
	minimal_player_age = 16
	economic_modifier = 4
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1
	
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(7,12), rand(7,12), rand(10,15))

/datum/job/chaplain
	title = "Chaplain"
	supervisors = "the Overseer and God"
	minimal_player_age = 21
	economic_modifier = 6
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,10), rand(9,12), rand(10,14))

/datum/job/janitor
	title = "Janitor"
	supervisors = "the Overseer"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(5,9))

/datum/job/cyborg
	title = "Cyborg"
	alt_titles = list(
		"Robot",
		"Android",
		)