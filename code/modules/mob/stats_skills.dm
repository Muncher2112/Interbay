//I am aware this is probably a bad way of doing it but I'm using this method till I get a better one. - Matt
/mob
	var/str = 10    //strength - used for hitting and lifting.
	var/dex = 10    //dexterity - used for dodging and parrying.
	var/int = 10

    //skills
	var/melee = 50
	var/ranged_attack = 50
	var/medical = 20
	var/engineering = 50

proc/skillcheck(var/skill, var/requirement, var/show_message, var/message = "I have failed to do this.")//1 - 100
	if(skill >= requirement)
		return 1
	else
		if(prob(skill))
			return 1
		else
			if(show_message)
				to_chat(src, message)
			return 0


proc/statcheck(var/stat, var/requirement,var/show_message, var/message = "I have failed to do this.")//Requirement needs to be 1 through 20
	var/dice = "1d20"
	if(stat < requirement)
		var/H = roll(dice)
		if(stat <= H)
			return 1
		else
			if(show_message)
				to_chat(src, message)
			return 0
	else
		return 1


/mob/proc/skillnumtodesc(var/skill)
	switch(skill)
		if(0 to 10)
			return "<small><i>pathetic</i></small>"
		if(10 to 40)
			return "unskilled"
		if(40 to 60)
			return "skilled"
		if(60 to 80)
			return "very skilled"
		if(80 to INFINITY)
			return "<b>GOD LIKE</b>"


proc/strToDamageModifier(var/strength)
	switch(strength)
		if(1 to 5)
			return 0.5

		if(6 to 11)
			return 1

		if(12 to 15)
			return 1.5

		if(16 to INFINITY)
			return  1.75

/mob/living/carbon/human/proc/add_stats(var/stre, var/dexe, var/inti)//To make adding stats quicker.
	if(stre)
		str = stre
	if(dexe)
		dex = dexe
	if(inti)
		int = inti

/mob/living/carbon/human/proc/add_skills(var/meleee, var/ranged_attackk, var/medicall, var/engineeringg)//To make adding stats quicker.
	if(meleee)
		melee = meleee
	if(ranged_attackk)
		ranged_attack = ranged_attackk
	if(medicall)
		medical = medicall
	if(engineeringg)
		engineering = engineeringg

/mob/living/carbon/human/verb/check_skills()//Debug tool for checking skills.
	set name = "Check Skills"
	set category = "IC"
	
	to_chat(src, "<b><i>I am [skillnumtodesc(melee)] at melee.</b></i>\n")
	to_chat(src, "<b><i>I am [skillnumtodesc(ranged_attack)] with guns.</b></i>\n")
	to_chat(src, "<b><i>I am [skillnumtodesc(medical)] with medicine.</b></i>\n")
	to_chat(src, "<b><i>I am [skillnumtodesc(engineering)] at engineering.</b></i>\n")