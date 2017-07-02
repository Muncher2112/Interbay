proc/agony_scream(var/mob/M)
	var/screamsound = null
	if(M.stat)//No dead or unconcious people screaming pls.
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isMonkey())
			screamsound = "sound/voice/monkey_pain[rand(1,3)].ogg"

		else if(H.isChild())
			screamsound = "sound/voice/child_pain[rand(1,2)].ogg"

		else if(M.gender == MALE)
			screamsound = "sound/voice/man_pain[rand(1,3)].ogg"

		else
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

proc/agony_moan(var/mob/M)
	var/moansound = null
	if(M.stat)//No dead or unconcious people screaming pls.
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isMonkey())
			return

		if(H.isChild())
			moansound = 'sound/voice/child_moan1.ogg'

		else if(M.gender == MALE)
			moansound = "sound/voice/male_moan[rand(1,3)].ogg"

		else
			moansound = "sound/voice/female_moan[rand(1,3)].ogg"


	if(moansound)
		playsound(M, moansound, 25, 0, 1)