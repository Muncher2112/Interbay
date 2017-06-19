
//This is a list of words which are ignored by the parser when comparing message contents for names. MUST BE IN LOWER CASE!
var/list/adminhelp_ignored_words = list("unknown","the","a","an","of","monkey","alien","as")

/client/verb/adminhelp(msg as text)
	set category = "Admin"
	set name = "Adminhelp"

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		to_chat(src, "<font color='red'>Error: Admin-PM: You cannot send adminhelps (Muted).</font>")
		return

	adminhelped = 1 //Determines if they get the message to reply by clicking the name.


	//clean the input msg
	if(!msg)
		return
	msg = sanitize(msg)
	if(!msg)
		return
	var/original_msg = msg

	if(!mob) //this doesn't happen
		return

			//Options bar:  mob, details ( admin = 2, dev = 3, mentor = 4, character name (0 = just ckey, 1 = ckey and character name), link? (0 no don't make it a link, 1 do so),
			//		highlight special roles (0 = everyone has same looking name, 1 = antags / special roles get a golden name)

	var/mentor_msg = "<span class='notice'><b><font color=red>Request for Help: </font>[get_options_bar(mob, 4, 1, 1, 0)]:</b> [original_msg]</span>"
	msg = "<span class='notice'><b><font color=red>Request for Help:: </font>[get_options_bar(mob, 2, 1, 1)]:</b> [original_msg]</span>"

	var/admin_number_afk = 0

	for(var/client/X in admins)
		if((R_ADMIN|R_MOD|R_MENTOR) & X.holder.rights)
			if(X.is_afk())
				admin_number_afk++
			if(X.is_preference_enabled(/datum/client_preference/holder/play_adminhelp_ping))
				sound_to(X, 'sound/effects/adminhelp.ogg')
			if(X.holder.rights == R_MENTOR)
				to_chat(X, mentor_msg)// Mentors won't see coloring of names on people with special_roles (Antags, etc.)
			else
				to_chat(X, msg)
	//show it to the person adminhelping too
	to_chat(src, "<font color='blue'>PM to-<b>Staff </b>: [original_msg]</font>")
	var/admin_number_present = admins.len - admin_number_afk
	log_admin("HELP: [key_name(src)]: [original_msg] - heard by [admin_number_present] non-AFK admins.")
	if(admin_number_present <= 0)
		adminmsg2adminirc(src, null, "[html_decode(original_msg)] - !![admin_number_afk ? "All admins AFK ([admin_number_afk])" : "No admins online"]!!")
	else
		adminmsg2adminirc(src, null, "[html_decode(original_msg)]")
	admin_pm_repository.store_pm(src, null, original_msg)
	feedback_add_details("admin_verb","AH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

