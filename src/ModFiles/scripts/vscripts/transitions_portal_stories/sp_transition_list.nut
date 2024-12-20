//! PURPOSE: for Mel, we have to manually include this file for it to function or else none of this gets defined even though it's present in portal_stories (vanilla bug)
// we also have to fix the command to transition.

//! TODO: make sure this file isnt present when mounting to Portal 2 from the launcher

DBG <- 0
FORCE_GUN_AND_HALLWAY <- 0

FIRST_MAP_WITH_GUN <- "sp_a2_underbounce"
FIRST_MAP_WITH_UPGRADE_GUN <- "sp_a2_underbounce"
FIRST_MAP_WITH_POTATO_GUN <- ""
LAST_PLAYTEST_MAP <- "sp_a4_finale"

// DoIncludeScript( "transitions/sp_elevator_motifs", self.GetScriptScope() )
CHAPTER_TITLES <- 
[
	{ map = "sp_a1_tramride", title_text = "CHAPTER 1", subtitle_text = "1952", displayOnSpawn = false,		displaydelay = 1.0 },
	{ map = "sp_a2_garden_de", title_text = "CHAPTER 2", subtitle_text = "Extended Relaxation", displayOnSpawn = true,	displaydelay = 2.5 },
	{ map = "sp_a3_junkyard", title_text = "CHAPTER 3", subtitle_text = "#The Ascent", displayOnSpawn = false,	displaydelay = 2.5 },
	{ map = "sp_a4_overgrown", title_text = "CHAPTER 4", subtitle_text = "Organic Complications", displayOnSpawn = true, displaydelay = 4.25 },
	{ map = "sp_a4_core_access", title_text = "CHAPTER 5", subtitle_text = "Intrusion", displayOnSpawn = true, displaydelay = 2.5 },
]

// Display the chapter title
function DisplayChapterTitle()
{
	foreach (index, level in CHAPTER_TITLES)
	{
		if (level.map == GetMapName() )
		{
			EntFire( "@chapter_title_text", "SetTextColor", "210 210 210 128", 0.0 )
			EntFire( "@chapter_title_text", "SetTextColor2", "50 90 116 128", 0.0 )
			EntFire( "@chapter_title_text", "SetPosY", "0.32", 0.0 )
			EntFire( "@chapter_title_text", "SetText", level.title_text, 0.0 )
			EntFire( "@chapter_title_text", "display", "", level.displaydelay )
			
			EntFire( "@chapter_subtitle_text", "SetTextColor", "210 210 210 128", 0.0 )
			EntFire( "@chapter_subtitle_text", "SetTextColor2", "50 90 116 128", 0.0 )
			EntFire( "@chapter_subtitle_text", "SetPosY", "0.35", 0.0 )
			EntFire( "@chapter_subtitle_text", "settext", level.subtitle_text, 0.0 )
			EntFire( "@chapter_subtitle_text", "display", "", level.displaydelay )
		}
	}
}

// Display the chapter title on spawn if it is flagged to show up on spawn
function TryDisplayChapterTitle()
{
	foreach (index, level in CHAPTER_TITLES)
	{
		if (level.map == GetMapName() && level.displayOnSpawn )
		{
			DisplayChapterTitle()
		}	
	}
}

LOOP_TIMER <- 0

initialized <- false

// This is the order to play the maps
MapPlayOrder<- [

// ===================================================
// ======================   PS: M   ======================
// ===================================================

// ===================================================
// ====================== ACT 1 ======================
// ===================================================

// ---------------------------------------------------
// 	Intro
// ---------------------------------------------------
"sp_a1_tramride",
"sp_a1_intro",
"sp_a1_lift",
"sp_a1_garden",

// ===================================================
// ====================== ACT 2 ======================
// ===================================================

"sp_a2_garden_de",
	"@test_dome_lift",
"sp_a2_underbounce",
	"@test_dome_lift",
"sp_a2_once_upon",
	"@test_dome_lift",
"sp_a2_past_power",
	"@test_dome_lift",
"sp_a2_ramp",
	"@test_dome_lift",
"sp_a2_firestorm",
	"@test_dome_lift",

// ===================================================
// ====================== ACT 3 ======================
// ===================================================

"sp_a3_junkyard",	
"sp_a3_concepts",	
"sp_a3_paint_fling",	
"sp_a3_faith_plate",	
"sp_a3_transition",	

// ===================================================
// ====================== ACT 4 ======================
// ===================================================

"sp_a4_overgrown",
"sp_a4_tb_over_goo",
"sp_a4_two_of_a_kind",
"sp_a4_destroyed",
"sp_a4_factory",

// ---------------------------------------------------
// ====================== ACT 5 ======================
// ---------------------------------------------------

"sp_a4_core_access",
"sp_a4_finale",


// ===================================================
// ==================== STORY MODE =====================
// ===================================================

// ===================================================
// ====================== ACT 1 ======================
// ===================================================

// ---------------------------------------------------
// 	Intro
// ---------------------------------------------------
"st_a1_tramride",
"st_a1_intro",
"st_a1_lift",
"st_a1_garden",

// ===================================================
// ====================== ACT 2 ======================
// ===================================================

"st_a2_garden_de",
	"@test_dome_lift",
"st_a2_underbounce",
	"@test_dome_lift",
"st_a2_once_upon",
	"@test_dome_lift",
"st_a2_past_power",
	"@test_dome_lift",
"st_a2_ramp",
	"@test_dome_lift",
"st_a2_firestorm",
	"@test_dome_lift",

// ===================================================
// ====================== ACT 3 ======================
// ===================================================

"st_a3_junkyard",	
"st_a3_concepts",	
"st_a3_paint_fling",	
"st_a3_faith_plate",	
"st_a3_transition",	

// ===================================================
// ====================== ACT 4 ======================
// ===================================================

"st_a4_overgrown",
"st_a4_tb_over_goo",
"st_a4_two_of_a_kind",
"st_a4_destroyed",
"st_a4_factory",

// ---------------------------------------------------
// ====================== ACT 5 ======================
// ---------------------------------------------------

"st_a4_core_access",
"st_a4_finale",
]


// --------------------------------------------------------
// EntFire_MapLoopHelper
// --------------------------------------------------------
function EntFire_MapLoopHelper( classname, suffix, command, param, delay )
{
	// This calls EntFire on an entity of a given type, named with the given suffix.
	// This deals with instance name mangling (though it doesn't guarantee uniqueness)
	local suffix_len = suffix.len()
	for ( local ent = Entities.FindByClassname( null, classname ); ent != null; ent = Entities.FindByClassname( ent, classname ) )
	{
		local ent_name = ent.GetName()
		local suffix_offset = ent_name.find( suffix )
		if ( ( suffix_offset != null ) && ( suffix_offset == ( ent_name.len() - suffix_len ) ) )
		{
			EntFire( ent_name, command, param, delay )
			return
		}
	}
	printl( "MAPLOOP: ---- ERROR! Failed to find entity " + suffix + " while initiating map transition" );
}

// --------------------------------------------------------
// Think
// --------------------------------------------------------
function Think()
{	
	// Start the game loop if the cvar is set
	if ( initialized && LoopSinglePlayerMaps() )
	{
		// initialize the timer
		if( LOOP_TIMER == 0 )
		{
			LOOP_TIMER = Time() + 10 // restart time in seconds
		}
		
		// transition to the next map if the timer has expired
		if ( LOOP_TIMER < Time() )
		{
			// reset loop timer
			LOOP_TIMER = 0

			printl( "\nMAPLOOP: timer expired, moving on..." )

			// Ensure point_viewcontrollers are disabled
			EntFire( "point_viewcontrol", "disable", 0, 0 )
		
			// Change the level (this sequence was originally in the 'transition_without_survey' logic_relay)
			EntFire_MapLoopHelper( "trigger_once",   "survey_trigger",    "Disable",       "",                    0.0 )
			EntFire_MapLoopHelper( "env_fade",       "exit_fade",         "Fade",          "",                    0.0 )
			EntFire_MapLoopHelper( "point_teleport", "exit_teleport",     "Teleport",      "",                    0.3 )
			EntFire_MapLoopHelper( "logic_script",   "transition_script", "RunScriptCode", "TransitionFromMap()", 0.4 )
		}
	}
	
	
	if (initialized)
	{
		return
	}
	initialized = true

	DumpMapList()

	local portalGunCommand = ""
	local portalGunSecondCommand = ""
	local foundMap = false
	
	foreach (index, map in MapPlayOrder)
	{
		if (MapPlayOrder[index] == FIRST_MAP_WITH_GUN)
		{
			portalGunCommand = "give_portalgun"
		}		
		else if (MapPlayOrder[index] == FIRST_MAP_WITH_UPGRADE_GUN)
		{
			portalGunSecondCommand = "upgrade_portalgun"
		}
		else if (MapPlayOrder[index] == FIRST_MAP_WITH_POTATO_GUN)
		{
			portalGunSecondCommand = "upgrade_potatogun"
		}
		
		if (GetMapName() == MapPlayOrder[index])
		{
			break
		}
	}

	TryDisplayChapterTitle()
	
	if (portalGunCommand != "" && GetMapName() != "sp_a1_tramride" && GetMapName() != "sp_a1_mel_intro" && GetMapName() != "sp_a1_lift" && GetMapName() != "sp_a1_garden" && GetMapName() != "sp_a2_garden_destroyed")
	{
		printl( "=======================Trying to run " + portalGunCommand )
		EntFire( "command", "Command", portalGunCommand, 0.0 )
		EntFire( "@command", "Command", portalGunCommand, 0.0 )
	}

	if (portalGunSecondCommand != "")
	{
		printl( "=======================Trying to run " + portalGunSecondCommand )
		EntFire( "command", "Command", portalGunSecondCommand, 0.1 )
		EntFire( "@command", "Command", portalGunSecondCommand, 0.1 )
	}
	
}

// --------------------------------------------------------
// TransitionFromMap
// --------------------------------------------------------
function DumpMapList()
{
	if(DBG)
	{
		local mapcount = 0
		
		printl("================DUMPING MAP PLAY ORDER")
		
		foreach( index, map in MapPlayOrder )
		{
			// weed out our transitions
			if( MapPlayOrder[index].find("@") == null )
			{
				if( GetMapName() == MapPlayOrder[index] )
				{
					printl( mapcount + " " + MapPlayOrder[index] + " <--- You Are Here" )
				}
				else
				{
					printl( mapcount + " " + MapPlayOrder[index] )
				}
				mapcount++
			}
			
		}
		printl( mapcount + " maps total." )
		
		printl("================END DUMP")
	}
}
// --------------------------------------------------------
// TransitionFromMap
// --------------------------------------------------------
function TransitionFromMap()
{
	local next_map = null
	foreach( index, map in MapPlayOrder )
	{
		if( GetMapName() == MapPlayOrder[index] )
		{
			// make good
			local skipIndex = index
			for(local i=0;i<2;i+=1)
			{
				if( skipIndex + 1 < MapPlayOrder.len() )
				{
					if( MapPlayOrder[skipIndex + 1].find("@") != null )
					{
						skipIndex++
					}
					else
					{
						break
					}
				}
			}		
			
			if( ( skipIndex + 1 < MapPlayOrder.len() ) &&
			    ( GetMapName() != LAST_PLAYTEST_MAP  )    )
			{
				next_map = MapPlayOrder[ skipIndex + 1 ]
				if(DBG) printl( "Map " + GetMapName() + " connects to " + next_map )

				if ( Entities.FindByName( null, "@changelevel" ) == null )
				{
					if(DBG) printl( "('@changelevel' entity missing, using 'map' command instead)" )
					SendToConsole( "map " + next_map );
				}
				else
				{
					EntFire("p2mm_servercommand", "command", "changelevel " + next_map)
				}
			}
		}
	}
	
	if ( next_map == null )
	{
		if(DBG) printl( "Map " + GetMapName() + " is the last map" )
		EntFire( "end_of_playtest_text", "display", 0 )
		EntFire( "@end_of_playtest_text", "display", 0 )

		// If we are in the map loop and at the end of the list, start over at the beginning
		if ( LoopSinglePlayerMaps() )
		{
			printl( "MAPLOOP: No more maps, restarting loop." )
			next_map = MapPlayOrder[0]
			if ( Entities.FindByName( null, "@changelevel" ) == null )
			{
				SendToConsole( "map " + next_map );
			}
			else
			{
				EntFire("p2mm_servercommand", "command", "changelevel " + next_map)
			}
		}
	}

	printl( "" )
}

// --------------------------------------------------------
// MakeBatFile - dumps the map list in a formatted way, for easy recompilin'
// --------------------------------------------------------
function MakeBatFile() {
	local mapcount = 0
	
	printl("================DUMPING maps formatted for batch file")
	
	foreach( index, map in MapPlayOrder )
	{
		printl( "call build " + MapPlayOrder[index] )	
	}
	
	foreach( index, map in MapPlayOrder )
	{
		printl( "call p2_buildcubemaps " + MapPlayOrder[index] )	
	}
}

// this lets the elevator know that we are ready to transition.
function TransitionReady()
{
	::TransitionReady <- 1	
}
