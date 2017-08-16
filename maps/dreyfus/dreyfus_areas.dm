/datum/map/dreyfus

	base_floor_type = /turf/simulated/floor/airless
	base_floor_area = /area/maintenance/exterior

	post_round_safe_areas = list (
		/area/centcom,
	)

/area/shuttle/arrival
	name = "\improper Arrival Shuttle"

/area/shuttle/arrival/station
	icon_state = "shuttle"

//Coupole

/area/dreyfus/coupole/corridor
	name = "Corridor Coupole"
	icon_state = "hallC1"

/area/dreyfus/coupole/maintenance/
	name = "Maintenance Coupole"
	icon_state = "maintcentral"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/coupole/chapelle
	name = "Chapelle"
	icon_state = "chapel"

/area/dreyfus/coupole/aumonier
	name = "Bureau Aumonier"
	icon_state = "chapeloffice"

/area/dreyfus/coupole/jardin
	name = "Jardin"
	icon_state = "garden"

/area/dreyfus/coupole/conference
	name = "Salle Conference"
	icon_state = "observatory"

/area/dreyfus/coupole/solaire/avant/exterieur
	name = "Panneaux Avant"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/avant/control
	name = "Controle Panneaux Avant"
	icon_state = "SolarcontrolA"

/area/dreyfus/coupole/solaire/arriere/exterieur
	name = "Panneaux Arriere"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/arriere/control
	name = "Controle Panneaux Arriere"
	icon_state = "SolarcontrolA"

//Pont administratif

/area/dreyfus/administration/corridor
	name = "Corridor Administration"
	icon_state = "hallC1"

/area/dreyfus/administration/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/administration/maintenance/avant
	name = "Maintenance Administration Avant"
	icon_state = "fmaint"

/area/dreyfus/administration/maintenance/arriere
	name = "Maintenance Administration Arriere"
	icon_state = "amaint"

/area/dreyfus/administration/toilettes
	name = "Toilettes Administration"
	icon_state = "toilet"

/area/dreyfus/administration/sec/reception
	name = "Reception Securite"
	icon_state = "security"

/area/dreyfus/administration/sec/vestiaires
	name = "Vestiaires Securite"
	icon_state = "brig"

/area/dreyfus/administration/sec/cellule
	name = "Cellule Detention"
	icon_state = "sec_prison"

/area/dreyfus/administration/sec/armurerie
	name = "Armurerie"
	icon_state = "armory"

/area/dreyfus/administration/sec/marshall
	name = "Bureau Marshall"
	icon_state = "sec_hos"

/area/dreyfus/administration/bureaux/openspace
	name = "Bureaux Administratif"
	icon_state = "library"

/area/dreyfus/administration/bureaux/executif
	name = "Bureaux Haute Administration"
	icon_state = "law"

/area/dreyfus/administration/bureaux/directeur
	name = "Quartier Directeur"
	icon_state = "captain"


//Pont residentiel

/area/dreyfus/residentiel/dock/corridor
	name = "Sortie Amarrage"
	icon_state = "hallC1"
	sound_env = HALLWAY

/area/dreyfus/residentiel/dock/toilettes
	name = "Toilettes Amarrage"
	icon_state = "toilet"
	sound_env = BATHROOM

/area/dreyfus/residentiel/hub/corridor
	name = "Corridor Hub Residentiel"
	icon_state = "hallC2"
	sound_env = HALLWAY

/area/dreyfus/residentiel/hub/concierge
	name = "Stockage Entretien"
	icon_state = "janitor"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/sejour/Corridor
	name = "Corridor Sejour"
	icon_state = "hallC3"
	sound_env = HALLWAY

/area/dreyfus/residentiel/sejour/cryo
	name = "Salle Cryogenie"
	icon_state = "cryo"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/sejour/gym
	name = "Salle Fitness"
	icon_state = "fitness"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/cafet
	name = "Cantine"
	icon_state = "cafeteria"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/sejour/cuisine
	name = "Cuisine"
	icon_state = "kitchen"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/vestiaire
	name = "Vestiaires"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/corridor
	name = "Acces Quartiers"
	icon_state = "hallf"
	sound_env = TUNNEL_ENCLOSED

/area/dreyfus/residentiel/quartiers/chambre1
	name = "Chambre 1"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre2
	name = "Chambre 2"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre3
	name = "Chambre 3"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/reception
	name = "Reception Clinique"
	icon_state = "medbay3"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/urgences
	name = "Acces Urgences"
	icon_state = "medbay4"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/traitement
	name = "Salle Traitement"
	icon_state = "medbay"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/laboratoire
	name = "Laboratoire Medicale"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/chirurgie
	name = "Salle Operation"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/patients
	name = "Salle Repos Patients"
	icon_state = "patients"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/vestiaire
	name = "Vestiaires Clinique"
	icon_state = "medbay"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/repos
	name = "Salle Detente Medicale"
	icon_state = "medbay2"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/morgue
	name = "Morgue"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/residentiel/maintenance/avant
	name = "Maintenance Zone Residentielle Avant"
	icon_state = "fmaint"

/area/dreyfus/residentiel/maintenance/arriere
	name = "Maintenance Zone Residentielle Arriere"
	icon_state = "amaint"


//Pont cargo

/area/dreyfus/cargo/maintenance/babord
	name = "Maintenance Zone Industrielle Babord"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/maintenance/tribord
	name = "Maintenance Zone Industrielle Tribord"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/industrie/accueil
	name = "Bureau Commandes et Livraisons"
	icon_state = "conference"

/area/dreyfus/cargo/industrie/entrepot
	name = "Entrepot Principal"
	icon_state = "primarystorage"

/area/dreyfus/cargo/industrie/entrepot/specialise
	name = "Entrepot Specialise"
	icon_state = "auxstorage"

/area/dreyfus/cargo/industrie/production
	name = "Atelier Production"
	icon_state = "mining_production"

/area/dreyfus/cargo/industrie/raffinerie
	name = "Raffinerie"
	icon_state = "mining"

/area/dreyfus/cargo/industrie/bureau_qm
	name = "Bureau du Contremaitre"
	icon_state = "quartoffice"

/area/dreyfus/cargo/industrie/quartiers
	name = "Quartiers Ouvriers"
	icon_state = "crew_quarters"

/area/dreyfus/cargo/Corridor
	name = "Corridor Industrie"
	icon_state = "hallC1"

/area/dreyfus/cargo/recherche/robotique
	name = "Atelier Robotique"
	icon_state = "robotics"

/area/dreyfus/cargo/recherche/developpement
	name = "Laboratoire Recherche et Developpement"
	icon_state = "research"

/area/dreyfus/cargo/recherche/salon
	name = "Salon Pole Recherche"
	icon_state = "research"

/area/dreyfus/cargo/recherche/bureau_rd
	name = "Bureau Superviseur"
	icon_state = "quartoffice"

/area/dreyfus/cargo/recherche/labo_xenoarch
	name = "Laboratoire Xenoarcheologie"
	icon_state = "xeno_lab"

/area/dreyfus/cargo/recherche/labo_anomalies
	name = "Laboratoire Anomalies"
	icon_state = "anomaly"

/area/dreyfus/cargo/industrie/raffinerie/avantposte
	name = "Avant-Poste"
	icon_state = "mining"

/area/dreyfus/cargo/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/cargo/industrie/raffinerie/avantposte/solar
	name = "Panneaux Arriere"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space


//Pont ingenierie

/area/dreyfus/ingenierie/moteur/atmos
	name = "Systemes de Survie"
	icon_state = "atmos"

/area/dreyfus/ingenierie/moteur
	name = "Generateur"
	icon_state = "engine"

/area/dreyfus/ingenierie/moteur/SMES
	name = "Stockage Energetique"
	icon_state = "engine_smes"

/area/dreyfus/ingenierie/moteur/controle
	name = "Salle Controle Generateur"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/moteur/acces
	name = "Maintenance Generateur"
	icon_state = "maint_engine"

/area/dreyfus/ingenierie/maintenance
	name = "Maintenance Ingenierie"
	icon_state = "maint_engineering"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/ingenierie/acces
	name = "Acces Ingenierie"
	icon_state = "engineering_foyer"

/area/dreyfus/ingenierie/controle
	name = "Salle Controle Station"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/equipement
	name = "Vestiaires Ingenierie"
	icon_state = "engineering_locker"

/area/dreyfus/ingenierie/EVA
	name = "Salle Stockage SEV"
	icon_state = "eva"

/area/dreyfus/ingenierie/quartiers
	name = "Quartiers Ingenierie"
	icon_state = "crew_quarters"

/area/dreyfus/ingenierie/telecomm
	name = "Telecommunications"
	icon_state = "tcomsatcham"

/area/dreyfus/ingenierie/detente
	name = "Salle Detente Ingenierie"
	icon_state = "engineering_break"

//Faux pont

/area/dreyfus/fauxpont/maintenance
	name = "Maintenance Synthetique"
	icon_state = "maint_eva"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/fauxpont/decheterie
	name = "Traitement des Ordures"
	icon_state = "disposal"

/area/dreyfus/fauxpont/drones
	name = "Atelier Auxiliaire"
	icon_state = "ai_cyborg"

/area/dreyfus/fauxpont/iasalon
	name = "Acces IA"
	icon_state = "ai_foyer"

/area/dreyfus/fauxpont/iacontrole
	name = "Salle Controle IA"
	icon_state = "ai_upload"

/area/dreyfus/fauxpont/iachambre
	name = "Chambre IA"
	icon_state = "ai_chamber"

/area/dreyfus/fauxpont/iasalon
	name = "Acces IA"
	icon_state = "ai_foyer"

/area/dreyfus/fauxpont/vestiaires
	name = "Vestiaire Auxiliaire"
	icon_state = "engineering"

// Elevator areas.
/area/turbolift/coupole
	name = "ascenseur (coupole)"
	lift_floor_label = "Secteur A"
	lift_floor_name = "Coupole"
	lift_announce_str = "Arrivé à Secteur A, Coupole : Salle de Conference, Chapelle, Jardin."

/area/turbolift/bureaux
	name = "ascenseur (bureaux)"
	lift_floor_label = "Secteur B"
	lift_floor_name = "Administration"
	lift_announce_str = "Arrivé à Secteur B, Administration : Bureaux des Employes, du Directeur, du Marshall et Evacuation."

/area/turbolift/civil
	name = "ascenseur (residentiel)"
	lift_floor_label = "Secteur C"
	lift_floor_name = "Zone Residentielle"
	lift_announce_str = "Arrivé à Secteur C, Zone Residentielle : Cafetariat, Gymnase, Vestiaires, Clinique et Quartiers."

/area/turbolift/cargo
	name = "ascenseur (usine)"
	lift_floor_label = "Secteur D"
	lift_floor_name = "Zone Industrielle"
	lift_announce_str = "Arrivé à Secteur D, Zone Industrielle : Usine, Entrepots, Raffinerie et Recherche & Developpement."

/area/turbolift/engi
	name = "ascenseur (ingenierie)"
	lift_floor_label = "Secteur E"
	lift_floor_name = "Ingenierie"
	lift_announce_str = "Arrivé à Secteur E, Ingenierie : Generateur, Systemes de Survie, Telecommunications."
	base_turf = /turf/simulated/floor

// Dircen

/area/syndicate_mothership
	name = "Base Mercenaire"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0

/area/syndicate_mothership/ninja
	name = "\improper Ninja Base"

//Rescue ship

area/shuttle/lavalette/start
	name = "Corvette La Valette"
	icon_state = "shuttlered"

//Merc ship

area/shuttle/merc/start
	name = "Chasseur Huon"
	icon_state = "shuttlered"

//Skipjack

/area/skipjack_station
	name = "Skipjack Stiletto"
	icon_state = "yellow"
	requires_power = 0

//Pod areas

/area/shuttle/escape_pod1/station
	name = "\improper Escape Pod One"
	flags = AREA_RAD_SHIELDED
	icon_state = "shuttle2"

//Pod landing

/area/dreyfus/exterieur
	icon_state = "mining"
	requires_power = 0
	dynamic_lighting = 0