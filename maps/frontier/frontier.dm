#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "frontier_announcements.dm"
	#include "frontier_areas.dm"


	//CONTENT
	#include "job/jobs.dm"
	#include "datums/uniforms.dm"
	#include "items/cards_ids.dm"
	#include "frontier_gamemodes.dm"
	#include "frontier_presets.dm"
	#include "frontier_shuttles.dm"

	#include "frontier-1.dmm"
	#include "frontier-2.dmm"
	#include "frontier-3.dmm"
	#include "frontier-4.dmm"
	#include "frontier-5.dmm"


	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/frontier

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Dreyfus
#endif
