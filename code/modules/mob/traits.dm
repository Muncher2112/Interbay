/mob
	var/traits = list()

/mob/proc/has_trait(var/trait_name)
    if(trait_name in traits)
        return TRUE
    return FALSE

/*
Traits are special attributes a crew memeber can have.  They can do a bunch of crazy things.  Ideally, they should all be accessed like skills or stats
using has_trait("Trait name"), then doing whatever you want the trait to do.   Some traits have a "apply" verb, that will set effects like extra stats.
They should have a remove trait that removes it, just for posterity

Maybe this is a shit way to do it but whatever.
*/

datum/trait
    var/name = "The basic trait"

datum/trait/proc/apply_trait(var/mob/target)
    target.traits += src.name

datum/trait/proc/remove_trait(var/mob/target)
    target.traits -= src.name

//Traits effecting stats, bassically a trait that adds ten to each stats

datum/trait/stat/
	 var/stat

datum/trait/stat/strength
    name = "Weightlifter"
    stat = "STR"

datum/trait/stat/dexterity
    name = "Lightfoot"
    stat = "DEX"

datum/trait/stat/intelligence
    name = "Nerdy"
    stat = "INT"

datum/trait/stat/constitution
    name = "Iron stomach"
    stat = "CON"

datum/trait/stat/apply_trait(var/mob/target)
    target.stats[stat] += 10
    ..()

datum/trait/stat/remove_trait(var/mob/target)
    target.stats[stat] -= 10
    ..()

datum/trait/master_chef
    name = "Master Chef"

datum/trait/sword_master
    name = "Blademaster"

datum/trait/marksman
    name = "Marksman"
