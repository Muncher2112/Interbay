#if !defined(USING_MAP_DATUM)

	#include "curie_areas.dm"
	#include "curie_shuttles.dm"
	#include "curie_presets.dm"
	#include "curie_jobs.dm"

	#include "../exodus/exodus_areas.dm"

	#include "../shared/exodus_torch/areas.dm"
	#include "../shared/exodus_torch/presets.dm"
	#include "../shared/exodus_torch/zas_tests.dm"
	#include "../shared/exodus_torch/loadout/loadout_gloves.dm"
	#include "../shared/exodus_torch/loadout/loadout_head.dm"
	#include "../shared/exodus_torch/loadout/loadout_shoes.dm"
	#include "../shared/exodus_torch/loadout/loadout_suit.dm"

	#include "../exodus/loadout/loadout_accessories.dm"
	#include "../exodus/loadout/loadout_eyes.dm"
	#include "../exodus/loadout/loadout_head.dm"
	#include "../exodus/loadout/loadout_shoes.dm"
	#include "../exodus/loadout/loadout_suit.dm"
	#include "../exodus/loadout/loadout_uniform.dm"
	#include "../exodus/loadout/loadout_xeno.dm"

	#include "curie-1.dmm"
	#include "curie-2.dmm"
	#include "curie-3.dmm"
	#include "curie-4.dmm"
	#include "curie-5.dmm"
	#include "curie-6.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/curie

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Curie
#endif
