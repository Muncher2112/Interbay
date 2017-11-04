#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "utopia_announcements.dm"
	#include "utopia_areas.dm"


	//CONTENT
	#include "job/jobs.dm"
	#include "datums/uniforms.dm"
	#include "items/cards_ids.dm"
	#include "utopia_gamemodes.dm"
	#include "utopia_presets.dm"
	#include "utopia_shuttles.dm"

	#include "utopia-1.dmm"
	#include "utopia-2.dmm"
	#include "utopia-3.dmm"
	#include "utopia-4.dmm"


	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/utopia

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Utopia
#endif
