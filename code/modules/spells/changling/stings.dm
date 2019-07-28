/spell/targeted/sting/
	name = "Sting"
	desc = "Does nothing.  In fact how are you even here?"
	school = "Changling"
	var/genomecost = 10000000


/spell/targeted/sting/bind_sting
	name = "Blind Sting"
	desc = "This stingl inflicts a target with temporary blindness."
	feedback = "BS"
	duration = 300
	//Hoping these two vars are similar
	genomecost = 60
	charge_max = 300
	spell_flags = 0
	invocation = "BLIND STING"
	invocation_type = SpI_SHOUT
	message = "<span class='danger'>Your eyes cry out in pain!</span>"
	level_max = list(Sp_TOTAL = 3, Sp_SPEED = 1, Sp_POWER = 3)
	cooldown_min = 50
	range = 7
	max_targets = 1

	amt_eye_blind = 10
	amt_eye_blurry = 20

	hud_state = "wiz_blind"
