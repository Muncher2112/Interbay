proc/agony_scream(var/mob/M)
	var/screamsound = null
	if(M.stat)//No dead or unconcious people screaming pls.
		return

	if(M.gender == MALE)
		screamsound = "sound/voice/man_pain[rand(1,3)].ogg"

	if(M.gender == FEMALE)
		screamsound = "sound/voice/woman_agony[rand(1,3)].ogg"

	if(screamsound)
		playsound(M, screamsound, 25, 0, 1)

proc/gasp_sound(var/mob/M)
	var/gaspsound = null
	if(M.stat)
		return

	if(M.gender == MALE)
		gaspsound = "sound/voice/gasp_male[rand(1,7)].ogg"

	if(M.gender == FEMALE)
		gaspsound = "sound/voice/gasp_female[rand(1,7)].ogg"

	if(gaspsound)
		playsound(M, gaspsound, 25, 0, 1)