/datum/map/torch
	emergency_shuttle_docked_message = "WARNING: the escape pods are now unlocked. You have %ETD% to board the escape pods."
	emergency_shuttle_leaving_dock = "WARNING: the escape pods have been launched, arriving at rendezvous point in %ETA%."

	emergency_shuttle_called_message = "WARNING: emergency evacuation procedures are now in effect. Escape pods will unlock in %ETA%"
	emergency_shuttle_called_sound = sound('sound/AI/november/warning.ogg', volume = 45)

	emergency_shuttle_recall_message = "WARNING: emergency evacuation sequence aborted. Return to normal operating conditions."

	command_report_sound = sound(null, volume = 45)

	grid_check_message = "WARNING: Abnormal activity detected in the %STATION_NAME%'s power network. As a precaution, the %STATION_NAME%'s power must be shut down for an indefinite duration."
	grid_check_sound = sound('sound/AI/november/warning.ogg', volume = 45)

	grid_restored_message = "WARNING: Ship power to the %STATION_NAME% will be restored at this time"
	grid_restored_sound = sound('sound/AI/november/warning.ogg', volume = 45)

	meteor_detected_sound = sound('sound/AI/november/threat.ogg', volume = 45)

	radiation_detected_message = "WARNING: High levels of radiation detected in proximity of the %STATION_NAME%. Please evacuate into one of the shielded maintenance tunnels."
	radiation_detected_sound = sound('sound/AI/november/threat.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/november/subspace.ogg', volume = 45)

	unknown_biological_entities_message = "WARNING: Unknown biological entities have been detected near the %STATION_NAME%, please stand-by."

	unidentified_lifesigns_message = "WARNING: Unidentified lifesigns detected. Please lock down all exterior access points."
	unidentified_lifesigns_sound = sound('sound/AI/november/threat.ogg', volume = 45)

	xenomorph_spawn_sound = sound('sound/AI/november/threat.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/november/subspace.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/november/subspace.ogg', volume = 45)

/datum/map/torch/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return sound('sound/AI/november/warning.ogg', volume = 45)
		else
			return sound('sound/AI/november/warning.ogg', volume = 45)
