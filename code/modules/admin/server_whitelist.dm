#define CKEYWHITELIST "data/ckey_whitelist.txt"

/hook/startup/proc/loadCkeyWhitelist()
	load_ckey_whitelist()
	return 1

/proc/load_ckey_whitelist()
	log_admin("Loading ckey_whitelist")
	ckey_whitelist = file2list(CKEYWHITELIST)
	if(!ckey_whitelist.len)
		log_admin("ckey_whitelist was empty")
		ckey_whitelist = null
	else
		log_admin("ckey_whitelist: [ckey_whitelist.len] entrie(s).")

/proc/check_ckey_whitelisted(var/ckey)
	return (ckey_whitelist && (ckey in ckey_whitelist) )

/datum/admins/proc/ToggleCkeyWhitelist()
	set category = "Server"
	set name = "Toggle ckey Whitelist"
	set desc="Toggles the ckey Whitelist on and off."

	config.useckeywhitelist = !config.useckeywhitelist
	if(config.useckeywhitelist)
		load_ckey_whitelist()
		to_world("<B>The pool is now closed.</B>")
		log_admin("[key_name(usr)] enabled the ckey whitelist.")
	else
		ckey_whitelist = null
		to_world("<B>The pool is now open.</B>")
		log_admin("[key_name(usr)] disabled the ckey whitelist.")

/datum/admins/proc/ReloadCkeyWhitelist()
	set category = "Server"
	set name = "Reload ckey Whitelist"
	set desc="Reloads the ckey Whitelist."

	load_ckey_whitelist()
	log_and_message_admins("[key_name(usr)] has reloaded the ckey whitelist.")

#undef CKEYWHITELIST
