/obj/item/weapon/paper/objectifs_dreyfus
	name = "Objectifs de productions"
	info = "Objectifs du service envoyés par les actionnaires :<br><br>"
	icon_state = "paper_words"

/obj/item/weapon/paper/objectifs_dreyfus/New()
	..()
	var/list/products = list(
	"<bold>sceaux (buckets)</bold>",
	"<bold>lampes torches (flashlights)</bold>",
	"<bold>extincteurs (extinguishers)</bold>",
	"<bold>jarres (jars)</bold>",
	"<bold>pieds de biche (crowbars)</bold>",
	"<bold>multitools</bold>",
	"<bold>scanners rayons-T (T-ray scanners)</bold>",
	"<bold>outils de soudure (welding tools)</bold>",
	"<bold>carte-mères de sas (airlock electronics)</bold>",
	"<bold>seringues (syringes)</bold>",
	"<bold>béchers (glass beakers)</bold>",
	"<bold>minuteurs (timers)</bold>",
	"<bold>néons (light tubs)</bold>",
	"<bold>ampoules (light bulbs)</bold>",
	"<bold>caméras en kit (camera assemblies)</bold>",
	"<bold>écrans d'ordinateur (console screens)</bold>" )

	var/amount_objectives_high
	var/proba_objectives_high = rand(100)
	if(proba_objectives_high < 50)
		amount_objectives_high = 1
	if(proba_objectives_high > 50 && proba_objectives_high < 80)
		amount_objectives_high = 2
	if(proba_objectives_high > 80)
		amount_objectives_high = 3

	var/amount_objectives_low
	var/proba_objectives_low = rand(100)
	if(proba_objectives_low < 50)
		amount_objectives_low = 2
	if(proba_objectives_low > 50 && proba_objectives_high < 80)
		amount_objectives_low = 4
	if(proba_objectives_low > 80)
		amount_objectives_low = 6

	for(var/i = 1; i <= amount_objectives_high, i++)
		if(products.len < 1) break
		var/S = pick(products)
		info += "Il y'a une forte demande de [S]<br>"
		products.Remove(S)

	info+="<br>"

	for(var/i = 1; i <= amount_objectives_low, i++)
		if(products.len < 1) break
		var/S = pick(products)
		info += "Il y'a une faible demande de [S]<br>"
		products.Remove(S)


	info+="<br>Il est impératif que les objectifs de productions soit respectés.<br><br>-Direction Centrale"
