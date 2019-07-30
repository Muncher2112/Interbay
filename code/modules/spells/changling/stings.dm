/spell/targeted/sting/
	name = "Sting"
	desc = "Does nothing.  In fact how are you even here?"
	school = "Changling"
	spell_flags = SELECTABLE | CHANGLING
	level_max = list(Sp_TOTAL = 1)
	max_targets = 1
	range = 1
	charge_type = Sp_RECHARGE
	charge_max = 100
	//invocation_type = SpI_SHOUT debug
	invocation_type = SpI_NONE
	still_recharging_msg = "<span class='notice'>Our stinger needs time to re-fill</span>"
	var/genomecost = 10000000
// Part the reason changling stuff should be moved under spells.  I hope this can all be removed some day soon.
	/*
	HOW TO FIND THESE VALUES FOR OLD CHANGLING STINGS:
		1. Open code/game/gamemodes/changeling/changeling_powers.dm
		2. Find the power you want
		3. Find in the function the call to changeling_power
		4. Values are changeling_power(required_chems, required_dna, max_genetic_damage, max_stat
		4a. Stings may call changeling_sting(required_chems), leave the rest at default
	*/
	var/required_chems = 0
	var/required_dna=0
	var/max_genetic_damage=100
	var/max_stat=0

// This is here because I want to make a ton of changling specific checks, and not make some wizard checks on cast
// Putting them together seems like it will be too many worthless checks, so I plan to make *ALL* changling spells targeted
// By using "-1" for "self-targeting" stings like lesser form and horror form.

// Does all the changling side work for checking if we can cast changling spells.
/spell/targeted/sting/cast_check(skipcharge = 0, mob/user = usr, var/list/targets)
	// This is all part of greater checks in /spell/proc/perform so we can be more lax with checks.  The checks I *THINK* are unnecesary are
	// Commented out, so if stack traces arrive they can be easily debugged.  Vars have also been changed as approriate
	//if(!usr.mind)		return 0
	//if(!iscarbon(usr))	return 0

	var/datum/changeling/changeling = usr.mind.changeling
	if(!changeling)
		world.log << "[usr] has the changeling_transform() verb but is not a changeling."
		return 0

	if(usr.stat > max_stat)
		to_chat(usr, "<span class='warning'>We are incapacitated.</span>")
		return 0

	if(changeling.absorbed_dna.len < required_dna)
		to_chat(usr, "<span class='warning'>We require at least [required_dna] samples of compatible DNA.</span>")
		return 0

	if(changeling.chem_charges < required_chems)
		to_chat(usr, "<span class='warning'>We require at least [required_chems] units of chemicals to do that!</span>")
		return 0

	if(changeling.geneticdamage > max_genetic_damage)
		to_chat(usr, "<span class='warning'>Our genomes are still reassembling. We need time to recover first.</span>")
		return 0

	return 1

// Handles chemical removal, should only be called ONCE
// Skipcharge does nothing. I wish it could be removed, and it might be later
/spell/targeted/sting/take_charge(user, skipcharge)
	var/datum/changeling/changeling = usr.mind.changeling
	changeling.chem_charges -= required_chems
	return

// All our sting spells.  Some have thier own cast functions.
/spell/targeted/sting/blind_sting
	name = "Blind Sting"
	desc = "This sting inflicts a target with temporary blindness."
	feedback = "BS"
	invocation = "BLIND STING"
	message = "<span class='danger'>Your eyes burn horrificly!</span>"
	required_chems = 10
	amt_eye_blind = 10
	amt_eye_blurry = 20
	hud_state = "ling_blind"

/spell/targeted/sting/paralysis_sting
	name = "Paralysis Sting"
	desc = "This sting paralyzies a target.  It is very obvious and can be seen by observers."
	feedback = "PS"
	invocation = "CRYO STING"
	message = "<span class='danger'>Your muscles begin to painfully tighten.</span>"
	required_chems = 30
	amt_paralysis=50
	hud_state = "ling_para"

/spell/targeted/sting/silence_sting
	name = "Silence Sting"
	desc = "This sting silencees a target."
	feedback = "SS"
	invocation = "SILENCE STING"
	message = "<span class='danger'>You feel a prick, your mouth closes and your face muscles tighten painfully.</span>"
	required_chems = 10
	amt_silence = 30
	hud_state = "ling_mute"

/spell/targeted/sting/epinephrine
	name = "Epinephrine sacs"
	desc = "We evolve additional sacs of adrenaline throughout our body."
	spell_flags = INCLUDEUSER | CHANGLING //This and range = -1 target ourselves
	feedback = "ES"
	invocation = "EPINEPHRINE SACS"
	range = -1
	message = "<span class='danger'>You feel burst of enegry!</span>"
	required_chems = 45
	hud_state = "ling_nostun"

/spell/targeted/sting/epinephrine/cast(var/list/targets, mob/user)
	for(var/mob/living/target in targets)
		// Not sure how I feel about crossing in old changling verbs, but this is SO easy
		target.changeling_unstun()
	return

/spell/targeted/sting/lesser_form
	name = "Lesser form"
	desc = "We debase ourselves and become lesser.  We become a monkey."
	spell_flags = INCLUDEUSER | CHANGLING  //This and range = -1 target ourselves
	feedback = "LF"
	invocation = "LESSER_FORM"
	range = -1
	message = "<span class='danger'>Our genes cry out!</span>"
	required_chems = 1
	hud_state = "ling_monkey"

/spell/targeted/sting/lesser_form/cast(var/list/targets, mob/user)
	for(var/mob/living/target in targets)
		// THIS IS SO EASY IT HAS TO BE WRONG
		target.changeling_lesser_form()
	return