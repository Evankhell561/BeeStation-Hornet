/obj/item/slimecross/sanguine
	name = "sanguine extract"
	desc = "It seems fragile and something is stirring inside.."
	effect = "sanguine"
	icon_state = "sanguine"
	throw_range = 7
	var/active = FALSE

/obj/item/slimecross/sanguine/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!QDELETED(src))
		QDEL_IN(src, 1)

/obj/item/slimecross/sanguine/gey
	colour = "grey"
	effect_desc = ""

/*
/obj/item/toy/balloon/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..()) //was it caught by a mob?
		balloon_burst(hit_atom)
*/

/obj/item/slimecross/sanguine/gey/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	var/mob/living/simple_animal/slime/S = new (T)
	if(isliving(hit_atom) && S.CanFeedon(hit_atom, TRUE))
		S.Feedon(hit_atom)

/obj/item/slimecross/sanguine/orange
	colour = "orange"
	effect_desc = ""
	throw_range = 7
	throwforce = 25

/obj/item/slimecross/sanguine/orange/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.adjust_fire_stacks(10)
		L.IgniteMob()
	else
		var/turf/T = get_turf(src)
		new /obj/effect/hotspot(T)
		T.hotspot_expose(1000, 100, 1)
		/*var/turf/target = get_turf(src)
		var/obj/item/flamethrower/F = new (target)
		F.ptank = new (F)
		F.default_ignite(target, 5)
		qdel(F)*/

/obj/item/slimecross/sanguine/purple
	colour = "purple"
	effect_desc = ""

/obj/item/slimecross/sanguine/purple/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	var/obj/item/grenade/chem_grenade/slimejelly/G = new (T)
	G.prime()


/obj/item/slimecross/sanguine/blue
	colour = "blue"
	effect_desc = ""

/obj/item/slimecross/sanguine/blue/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	var/obj/item/grenade/chem_grenade/water/G = new (T)
	G.prime()

/obj/item/slimecross/sanguine/metal
	colour = "metal"
	effect_desc = ""

/obj/item/slimecross/sanguine/metal/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()


/obj/item/slimecross/sanguine/yellow
	colour = "yellow"
	effect_desc = ""
	var/damage = 8

/obj/item/slimecross/sanguine/yellow/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.electrocute_act(damage, src)
		T = get_turf(L)
	else
		T = get_turf(src)
		for(var/mob/living/L in T)
			L.electrocute_act(damage, src)
	empulse(T, 1 ,1)


/obj/item/slimecross/sanguine/darkpurple
	colour = "dark purple"
	effect_desc = ""

/obj/item/slimecross/sanguine/darkpurple/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/open/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	if(isopenturf(T))
		T.atmos_spawn_air("plasma=50;TEMP=1000")

/datum/status_effect/frozenstasis/lesser
	duration = 1 MINUTES

/obj/item/slimecross/sanguine/darkblue
	colour = "dark blue"
	effect_desc = ""

/obj/item/slimecross/sanguine/darkblue/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.apply_status_effect(/datum/status_effect/frozenstasis/lesser)
	var/turf/open/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	if(isopenturf(T))
		T.MakeSlippery(TURF_WET_PERMAFROST, 1 MINUTES)


/obj/item/slimecross/sanguine/silver
	colour = "silver"
	effect_desc = ""

/obj/item/slimecross/sanguine/silver/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(iscarbon(hit_atom))
		var/mob/living/carbon/C = hit_atom
		C.reagents.add_reagent(/datum/reagent/consumable/nutriment, 100)

/obj/item/slimecross/sanguine/bluespace
	colour = "bluespace"
	effect_desc = ""

/obj/item/slimecross/sanguine/bluespace/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	for(var/atom/movable/A in T)
		if(A.anchored && !ismecha(A))
			continue
		do_teleport(A, get_turf(throwingdatum.thrower))


/obj/item/slimecross/sanguine/sepia
	colour = "sepia"

/obj/item/slimecross/sanguine/sepia/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	new /obj/effect/timestop(get_turf(T), 0, null, null)

/obj/item/slimecross/sanguine/cerulean
	colour = "cerulean"
	effect_desc = ""

/obj/item/slimecross/sanguine/cerulean/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T
	var/mob/living/L
	if(isliving(hit_atom))
		T = get_turf(hit_atom)
		L = hit_atom
	else
		T = get_turf(src)
		L = throwingdatum.thrower
	var/mob/living/M = DuplicateObject(L, TRUE, FALSE, T)
	M.maxHealth = max(round(L.maxHealth)/5, 1)
	M.health = M.maxHealth
	M.updatehealth()



/obj/item/slimecross/sanguine/pyrite
	colour = "pyrite"
	effect_desc = ""

/obj/item/slimecross/sanguine/pyrite/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T = (hit_atom && !isturf(hit_atom)) ? get_turf(hit_atom) : get_turf(src)
	var/obj/item/grenade/chem_grenade/colorful/G = new (T)
	G.prime()

/obj/item/slimecross/sanguine/red
	colour = "red"
	effect_desc = ""

/obj/item/slimecross/sanguine/red/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/turf/T
	if(hit_atom && !isturf(hit_atom))
		if(iscarbon(hit_atom))
			var/mob/living/carbon/C = hit_atom
			C.bleed(30)
		else
			T = get_turf(hit_atom)
	else
		T = get_turf(src)
	if(T)
		new /obj/effect/decal/cleanable/blood (T)


/obj/item/slimecross/sanguine/green
	colour = "green"
	effect_desc = ""
	throwforce = 25

/obj/item/slimecross/sanguine/green/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!. && isliving(hit_atom))
		var/mob/living/L = throwingdatum.thrower
		L.heal_overall_damage(25)


/obj/item/slimecross/sanguine/pink
	colour = "pink"
	effect_desc = ""


/obj/item/slimecross/sanguine/pink/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(iscarbon(hit_atom))
		var/mob/living/carbon/C = hit_atom
		C.hug_act(throwingdatum.thrower)


/obj/item/slimecross/sanguine/gold
	colour = "gold"
	effect_desc = ""


/obj/item/slimecross/sanguine/gold/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	var/instant_attack = FALSE
	var/turf/T
	if(isliving(hit_atom))
		T = get_turf(hit_atom)
		instant_attack = TRUE
	else
		T = get_turf(src)
	var/obj/effect/temp_visual/goliath_tentacle/original/O = new (T, throwingdatum.thrower, TRUE)
	if(instant_attack)
		O.tripanim(0)

/obj/item/slimecross/sanguine/oil
	colour = "oil"
	effect_desc = ""


/obj/item/slimecross/sanguine/oil/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	explosion(get_turf(src), -1, 3, 6)


/obj/item/slimecross/sanguine/black
	colour = "black"
	effect_desc = ""


/obj/item/slimecross/sanguine/black/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()


/obj/item/slimecross/sanguine/lightpink
	colour = "light pink"
	effect_desc = ""


/obj/item/slimecross/sanguine/lightpink/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(iscarbon(hit_atom))
		var/mob/living/carbon/C = hit_atom
		C.reagents.add_reagent(/datum/reagent/pax, 10)

/obj/item/slimecross/sanguine/adamantine
	colour = "adamantine"
	effect_desc = ""


/obj/item/slimecross/sanguine/adamantine/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()


/obj/item/slimecross/sanguine/rainbow
	colour = "rainbow"
	effect_desc = ""


/obj/item/slimecross/sanguine/rainbow/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()

