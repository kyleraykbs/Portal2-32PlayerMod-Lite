//? This file is a combined file of all the documented game events from all of Portal 2's game event files.
//? This exists to act as reference and documentation on what events output what data and the data's type.
//? Not all game events are interfaced to VScript by the plugin and some aren't able to be interfaced due to how the engine works.
//? Those marked with "Interface to VScript By P2:MM" followed by the VScript function called are ones interfaced by the P2:MM plugin.
//? Plugin code can be found at https://github.com/OrsellGaming/Portal-2-Multiplayer-Mod-Plugin

//? Below are plugin callback functions passed to VScript but keep the same name naming format:

//? `GEClientCommand` is the plugin's ClientCommand callback function.
//*	"GEClientCommand" // Called when a client inputs a console command.
//*	{
//*		"userid"	"short"		// user ID on server
//*		"entindex"	"int"		// user index on server
//*		"pcmd"		"string"	// console command called
//*		"fargs"		"string"	// console command args
//*	}

//? `GEClientActive` is the plugin's ClientActive callback function.
//*	"GEClientActive" // Called when a player is "activated" in the server, meaning fully loaded. This is not the same as fully connect which happens before ClientActive.
//*	{	
//* 	"userid"	"short"		// user ID on server
//*		"entindex"	"int"		// user index on server
//*	}

//? `GEGameFrame` is the plugin's GameFrame callback function.
//*	"GEGameFrame" // Called every server frame, used for the VScript loop. Warning: Don't do too intensive tasks with this!
//*	{
//*		"simulating" "bool"	
//*	}

//? `GEPlayerRespawn` is called by the hooked respawn function the game uses to respawn players.
//*	"GEPlayerRespawn" // Called when a player respawns.
//* {
//*		"playerHandle" "HSCRIPT" // player's VScript handle
//*	}

//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
//
// valid data key types are:
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit
//   local  : any data, but not networked to clients
//
// following key names are reserved:
//   local      : if set to 1, event is not networked to clients
//   unreliable : networked, but unreliable
//   suppress   : never fire this event
//   time	: firing server time
//   eventid	: holds the event ID

"ModEvents"
{
	"portal_player_touchedground"	// player landed || //! Doesn't work, "player_landed" does instead.
	{
		"userid"	"short"		// user ID on server
	}

	//? Interface to VScript By P2:MM | GEPlayerPing(userid, ping_x, ping_y, ping_z, entindex)
	"portal_player_ping"	// player pinged
	{
		"userid"	"short"		// user ID on server
		"ping_x"	"float"
		"ping_y"	"float"
		"ping_z"	"float"
	}
	
	//? Interface to VScript By P2:MM | GEPlayerPortaled(userid, portal2, entindex)
	"portal_player_portaled"		// player traveled through a portal
	{
		"userid"	"short"		// user ID on server
		"portal2"	"bool"		// false for portal1 (blue)
	}

	//? Interface to VScript By P2:MM | GETurretHitTurret()
	"turret_hit_turret"
	{
	}
	
	//? Interface to VScript By P2:MM | GECamDetach()
	"security_camera_detached"
	{
	}

	"challenge_map_complete"
	{
		"numbronze"	"short"
		"numsilver"	"short"
		"numgold"	"short"
	}
	"advanced_map_complete"
	{
		"numadvanced"	"short"
	}
	"quicksave"
	{
	}
	"autosave"
	{
	}
	"slowtime"
	{
	}
	
	"portal_enabled"
	{
		"userid"		"short"		// user ID on server
		"leftportal"	"bool"
	}
	
	"portal_fired"
	{
		"userid"		"short"		// user ID on server
		"leftportal"	"bool"
	}
	
	"gesture_earned"
	{
		"userid"	"short"		// user ID on server
		"teamtaunt"		"bool"
	}
	
	"player_gesture"
	{
		"userid"	"short"		// user ID on server
		"air"		"bool"
	}

	"player_zoomed"
	{
		"userid" "short"
	}

	"player_unzoomed"
	{
		"userid" "short"
	}
	
	"player_countdown"
	{
		"userid"	"short"		// user ID on server
	}
	
	"player_touched_ground"
	{
		"userid"	"short"
	}
	
	"player_long_fling"
	{
		"userid"	"short"
	}
	
	"remote_view_activated"
	{
	}
	
	"touched_paint"
	{
		"userid" "short"
		"painttype" "short"
		"surfacedir" "short"
	}
	"player_paint_jumped"
	{
		"userid" "short"
	}
	"move_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"movedone_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"counter_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"zoom_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"jump_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"partnerview_hint_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"paint_cleanser_visible"
	{
		"userid"	"short"	//The player who sees the entity
		"subject"	"long"	//Entindex of the entity they see
	}
	"paint_cleanser_not_visible"
	{
		"userid"	"short"
	}
	"player_touch_paint_cleanser"
	{
		"userid"	"short"
		"subject"	"long"	//Entindex of the cleanser
	}
	"bounce_count" // Player bounced on repulsion gel. Does not count repulsion gel on walls for some reason.
	{
		"userid"	"short"
		"bouncecount"	"short"
	}

	//? Interface to VScript By P2:MM | GEPlayerLanded(userid, entindex)
	"player_landed"
	{
		"userid"	"short"
	}

	"player_suppressed_bounce" // Prevented bounce on repulsion gel by crouching
	{
		"userid"	"short"
	}
	"OpenRadialMenu"
	{
		"target" "string"
	}
	"AddLocator"
	{
		"userid" "short"
		"subject" "short"
		"caption" "string"
	}

	//? Interface to VScript By P2:MM | GEPlayerSpawnBlue()
	"player_spawn_blue"
	{
	}

	//? Interface to VScript By P2:MM | GEPlayerSpawnOrange()
	"player_spawn_orange"
	{
	}

	"map_already_completed"
	{
	}
	
	"achievement_earned"
	{
		"player"	"byte"		// entindex of the player
		"achievement"	"short"		// achievement ID
	}
	
	"replay_status"
	{
	}
	
	"spec_target_updated"
	{
	}
	
	"player_fullyjoined"
	{
		"userid"	"byte"		// entindex of the player
		"name" "string"
	}
	
	"achievement_write_failed"
	{
	}
	
	"player_stats_updated"
	{
		"forceupload" "bool"
	}
	
	"round_start_pre_entity"
	{
	}
	
	"teamplay_round_start"			// round restart
	{
		"full_reset"	"bool"		// is this a full reset of the map
	}
	
	"client_disconnect"
	{
	}
	
	"server_pre_shutdown" 		// server is about to be shut down	
	{
		"reason"	"string"	// reason why server is about to be shut down
	}
	
	"difficulty_changed"
	{
		"newDifficulty"	"short"
		"oldDifficulty"	"short"
		"strDifficulty" "string" // new difficulty as string
	}
	
	"finale_start"
	{
		"rushes"		"short"
	}

	"finale_win"
	{
		"map_name"		"string"
		"difficulty"	"short"
	}

	"vote_passed"
	{
		"details"		"string"
		"param1"		"string"
		"team"			"byte"
		"reliable"		"1"		// this event is reliable
	}

//////////////////////////////////////////////////////////////////////
// Economy events
//////////////////////////////////////////////////////////////////////
	"inventory_updated"
	{
	}
	"cart_updated"
	{
	}
	"store_pricesheet_updated"
	{
	}
	"gc_connected"
	{
	}
	"item_schema_initialized"
	{
	}
	"client_loadout_changed"
	{
	}
	"gameui_activated"
	{
	}
	"gameui_hidden"
	{
	}

}

//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
// total game event byte length must be < 1024
//
// valid data key types are:
//   none   : value is not networked
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit



"gameevents"
{
	"team_info"				// info about team
	{
		"teamid"	"byte"		// unique team id
		"teamname"	"string"	// team name eg "Team Blue"
	}
	
	"team_score"				// team score changed
	{
		"teamid"	"byte"		// team id
		"score"		"short"		// total team score
	}
	
	"teamplay_broadcast_audio"	// emits a sound to everyone on a team
	{
		"team"	"byte"			// unique team id
		"sound"	"string"		// name of the sound to emit
	}
	
//////////////////////////////////////////////////////////////////////
// Player events
//////////////////////////////////////////////////////////////////////
	
	"player_team"				// player change his team
	{
		"userid"	"short"		// user ID on server
		"team"		"byte"		// team id
		"oldteam" "byte"		// old team id
		"disconnect" "bool"	// team change because player disconnects
		"autoteam" "bool"		// true if the player was auto assigned to the team
		"silent" "bool"			// if true wont print the team join messages
	}
	
	"player_class"				// a player changed his class
	{
		"userid"	"short"		// user ID on server
		"class"		"string"	// new player class / model
	}
	
	//? Interface to VScript By P2:MM | GEPlayerDeath(userid, attacker, entindex)
	"player_death"				// a game event, name may be 32 charaters long
	{
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed
	}
	
	"player_hurt"
	{
		"userid"	"short"   	// player index who was hurt				
		"attacker"	"short"	 	// player index who attacked
		"health"	"byte"		// remaining health points
	}
	
	"player_chat"				// a public player chat
	{
		"teamonly"	"bool"		// true if team only chat
		"userid" 	"short"		// chatting player 
		"text" 	 	"string"	// chat text
	}
	
	"player_score"				// players scores changed
	{
		"userid"	"short"		// user ID on server
		"kills"		"short"		// # of kills
		"deaths"	"short"		// # of deaths
		"score"		"short"		// total game score
	}
	
	//? Interface to VScript By P2:MM | GEPlayerSpawn(userid, entindex)
	"player_spawn"				// player spawned in game
	{
		"userid"	"short"		// user ID on server
	}
	
	"player_shoot"				// player shoot his weapon
	{
		"userid"	"short"		// user ID on server
		"weapon"	"byte"		// weapon ID
		"mode"		"byte"		// weapon mode
	}
	
	"player_use"
	{
		"userid"	"short"		// user ID on server
		"entity"	"short"		// entity used by player
	}
	
	"player_drop"
	{
		"userid"	"short"		// user ID on server
		"entity"	"short"		// entity used by player
	}

	"player_changename"
	{
		"userid"	"short"		// user ID on server
		"oldname"	"string"	// players old (current) name
		"newname"	"string"	// players new name
	}

	"player_hintmessage"
	{
		"hintmessage"	"string"	// localizable string of a hint
	}

//////////////////////////////////////////////////////////////////////
// Game events
//////////////////////////////////////////////////////////////////////

	"game_init"				// sent when a new game is started
	{
	}
		
	"game_newmap"				// send when new map is completely loaded
	{
		"mapname"	"string"	// map name
	}
	
	"game_start"				// a new game starts
	{
		"roundslimit"	"long"		// max round
		"timelimit"	"long"		// time limit
		"fraglimit"	"long"		// frag limit
		"objective"	"string"	// round objective
	}
	
	"game_end"				// a game ended
	{
		"winner"	"byte"		// winner team/user id
	}
	
	"round_start"
	{
		"timelimit"	"long"		// round time limit in seconds
		"fraglimit"	"long"		// frag limit in seconds
		"objective"	"string"	// round objective
	}
	
	"round_end"
	{
		"winner"	"byte"		// winner team/user i
		"reason"	"byte"		// reson why team won
		"message"	"string"	// end round message 
	}
	
	"game_message"				// a message send by game logic to everyone
	{
		"target"	"byte"		// 0 = console, 1 = HUD
		"text"		"string"	// the message text
	}

	"break_breakable"
	{
		"entindex"	"long"
		"userid"		"short"
		"material"	"byte"	// BREAK_GLASS, BREAK_WOOD, etc
	}

	"break_prop"
	{
		"entindex"	"long"
		"userid"	"short"
	}

	"entity_killed"
	{
		"entindex_killed" 	"long"
		"entindex_attacker"	"long"
		"entindex_inflictor"	"long"
		"damagebits"		"long"
	}
	
	"bonus_updated"
	{
		"numadvanced"	"short"
		"numbronze"	"short"
		"numsilver"	"short"
		"numgold"	"short"
	}
	
	"achievement_event"
	{
		"achievement_name"	"string"	// non-localized name of achievement
		"cur_val"		"short"		// # of steps toward achievement
		"max_val"		"short"		// total # of steps in achievement
	}

	"physgun_pickup"
	{
		"entindex"		"long"		// entity picked up
	}

	"flare_ignite_npc"
	{
		"entindex"		"long"		// entity ignited
	}

	"helicopter_grenade_punt_miss"
	{
	}

	"user_data_downloaded"				// fired when achievements/stats are downloaded from Steam or XBox Live
	{
	}

	"ragdoll_dissolved"
	{
		"entindex"	"long"
	}
	
	"gameinstructor_draw"
	{
	}
	
	"gameinstructor_nodraw"
	{
	}
	
	"map_transition"
	{
	}
	
	"entity_visible"
	{
		"userid"		"short"		// The player who sees the entity
		"subject"		"long"		// Entindex of the entity they see
		"classname"		"string"	// Classname of the entity they see
		"entityname"	"string"	// name of the entity they see
	}
	
	"set_instructor_group_enabled"
	{
		"group"		"string"
		"enabled"	"short"
	}
	
	"instructor_server_hint_create" //create a hint using data supplied entirely by the server/map. Intended for hints to smooth playtests before content is ready to make the hint unneccessary. NOT INTENDED AS A SHIPPABLE CRUTCH
	{
		"hint_name"					"string"	// what to name the hint. For referencing it again later (e.g. a kill command for the hint instead of a timeout)
		"hint_replace_key"			"string"	// type name so that messages of the same type will replace each other
		"hint_target"				"long"		// entity id that the hint should display at
		"hint_activator_userid"		"short"		// userid id of the activator
		"hint_timeout"				"short"	 	// how long in seconds until the hint automatically times out, 0 = never
		"hint_icon_onscreen"		"string"	// the hint icon to use when the hint is onscreen. e.g. "icon_alert_red"
		"hint_icon_offscreen"		"string"	// the hint icon to use when the hint is offscreen. e.g. "icon_alert"
		"hint_caption"				"string"	// the hint caption. e.g. "#ThisIsDangerous"
		"hint_activator_caption"	"string"	// the hint caption that only the activator sees e.g. "#YouPushedItGood"
		"hint_color"				"string"	// the hint color in "r,g,b" format where each component is 0-255
		"hint_icon_offset"			"float"		// how far on the z axis to offset the hint from entity origin
		"hint_range"				"float"		// range before the hint is culled
		"hint_flags"				"long"		// hint flags
		"hint_binding"				"string"	// bindings to use when use_binding is the onscreen icon
		"hint_gamepad_binding"		"string"	// gamepad bindings to use when use_binding is the onscreen icon
		"hint_allow_nodraw_target"	"bool"		// if false, the hint will dissappear if the target entity is invisible
		"hint_nooffscreen"			"bool"		// if true, the hint will not show when outside the player view
		"hint_forcecaption"			"bool"		// if true, the hint caption will show even if the hint is occluded
		"hint_local_player_only"	"bool"		// if true, only the local player will see the hint
	}
	
	"instructor_server_hint_stop" //destroys a server/map created hint
	{
		"hint_name"					"string"	// The hint to stop. Will stop ALL hints with this name
	}
}

//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// Don't change "server_*" events 
// No spaces in event names, max length 32
// All strings are case sensitive
//
// valid data key types are:
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit
//   local : any data, dont network this field
//
// following keys names are reserved:
//   local      : if set to 1, event is not networked to clients
//   reliable   : if set to 0, event is networked unreliable


"replayevents"
{

//////////////////////////////////////////////////////////////////////
// replay specific events
//////////////////////////////////////////////////////////////////////
	
	"replay_status"				// general replay status
	{
		"clients"	"long"		// number of replay spectators
		"slots"		"long"		// number of replay slots
		"proxies"	"short"		// number of replay proxies
		"master"	"string"	// disptach master IP:port
	}
	
	"replay_cameraman"			// a spectator/player is a cameraman
	{
		"index"		"short"			// camera man entity index
	}
	
	"replay_rank_camera"			// a camera ranking
	{
		"index"		"byte"			// fixed camera index
		"rank"		"float"			// ranking, how interesting is this camera view
		"target"	"short"			// best/closest target entity
	}
	
	"replay_rank_entity"			// an entity ranking
	{
		"index"		"short"			// entity index
		"rank"		"float"			// ranking, how interesting is this entity to view
		"target"	"short"			// best/closest target entity
	}
	
	"replay_fixed"				// show from fixed view
	{
		"posx"		"long"		// camera position in world
		"posy"		"long"		
		"posz"		"long"		
		"theta"		"short"		// camera angles
		"phi"			"short"		
		"offset"	"short"
		"fov"			"float"
		"target"	"short"		// follow this entity or 0
	}
	
	"replay_chase"					// shot of a single entity
	{
		"target1"		"short"		// primary traget index 
		"target2"		"short"		// secondary traget index or 0
		"distance"	"short"		// camera distance
		"theta"			"short"		// view angle horizontal 
		"phi"				"short"		// view angle vertical
		"inertia"		"byte"		// camera inertia
		"ineye"			"byte"		// diretcor suggests to show ineye
	}
	
	"replay_message"	// a replay message send by moderators
	{
		"text"	"string"
	}
	
	"replay_title"
	{
		"text"	"string"
	}
	
	"replay_chat"	// a replay chat msg send by spectators
	{
		"text"	"string"
	}
}

//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// Don't change this file, it defines engine events

"engineevents"
{
//////////////////////////////////////////////////////////////////////
// Server events
//////////////////////////////////////////////////////////////////////

	"server_spawn"				// send once a server starts
	{
		"hostname"	"string"	// public host name
		"address"	"string"	// hostame, IP or DNS name	
		"port"		"short"		// server port
		"game"		"string"	// game dir 
		"mapname"	"string"	// map name
		"maxplayers"	"long"		// max players
		"os"		"string"	// WIN32, LINUX
		"dedicated"	"bool"		// true if dedicated server
		"password"	"bool"		// true if password protected
	}
	
	"server_shutdown" 			// server shut down	
	{
		"reason"	"string"	// reason why server was shut down
	}
	
	"server_cvar" 				// a server console var has changed
	{
		"cvarname"	"string"	// cvar name, eg "mp_roundtime"		
		"cvarvalue"	"string"	// new cvar value
	}
	
	"server_message"			// a generic server message
	{
		"text"		"string"	// the message text
	}

	"server_addban"
	{
		"name"		"string"	// player name
		"userid"	"short"		// user ID on server
		"networkid"	"string"	// player network (i.e steam) id
		"ip"		"string"	// IP address
		"duration"	"string"	// length of the ban
		"by"		"string"	// banned by...
		"kicked"	"bool"		// whether the player was also kicked
	}

	"server_removeban"
	{
		"networkid"	"string"	// player network (i.e steam) id
		"ip"		"string"	// IP address
		"by"		"string"	// removed by...
	}
	
	//? Interface to VScript By P2:MM | GEPlayerConnect(name, index, userid, xuid, networkid, address, bot, entindex)
	//! WARNING: The player entity has yet to exist at this stage, so manipulating the entity could crash the game.
	//! Do so at "player_spawn" or "player_activate", both are called after the player entity exists.
	//! "player_activate" is more recommended to be used as "player_spawn" gets called twice when the host loads in.
	"player_connect"			// a new client connected
	{
		"name"		"string"	// player name		
		"index"		"byte"		// player slot (entity index-1)
		"userid"	"short"		// user ID on server (unique on server) "STEAM_1:...", will be "BOT" if player is bot
		"xuid"		"uint64"	// XUID/Steam ID (converted to const char*)
		"networkid" "string" 	// player network (i.e steam) id
		"address"	"string"	// ip:port
		"bot"		"bool"		// true if player is a AI bot
	}
	
	//? Interface to VScript By P2:MM | GEPlayerInfo(name, index, userid, friendsid, networkid, bot, entindex)
	"player_info"				// a player changed their name, called when a map starts also
	{
		"name"		"string"	// player name		
		"index"		"byte"		// player slot (entity index-1)
		"userid"	"short"		// user ID on server (unique on server) "STEAM_1:...", will be "BOT" if player is bot
		"friendsid" "short"		// friends identification number
		"networkid"	"string"	// player network (i.e steam) id
		"bot"		"bool"		// true if player is a AI bot
	}
	
	//! Needs to be fixed in the plugin, Valve broke player disconnections.
	//// Interface to VScript By P2:MM | GEPlayerInfo(name, userid, reason, xuid, networkid)
	"player_disconnect"			// a client was disconnected
	{
		"name"		"string"	// player name
		"userid"	"short"		// user ID on server
		"reason"	"string"	// "self", "kick", "ban", "cheat", "error"
		"xuid"		"uint64"	// XUID/Steam ID (converted to const char*)
		"networkid"	"string"	// player network (i.e steam) id
	}

	//? Interface to VScript By P2:MM | GEClientActive(userid, entindex)
	//? Technically not called by the game event itself but the "ClientActive"
	//? plugin call back because they both are called at the same time.
	"player_activate"
	{
		"userid"	"short"		// user ID on server
	}

	//? Interface to VScript By P2:MM | GEPlayerSay(userid, text, entindex)
	"player_say"
	{
		"userid"	"short"		// user ID on server
		"text"		"string"	// the say text
	}
}

//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// Don't change "server_*" events 
// No spaces in event names, max length 32
// All strings are case sensitive
//
// valid data key types are:
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit
//   local : any data, dont network this field
//
// following keys names are reserved:
//   local      : if set to 1, event is not networked to clients
//   reliable   : if set to 0, event is networked unreliable


"hltvevents"
{

//////////////////////////////////////////////////////////////////////
// HLTV specific events
//////////////////////////////////////////////////////////////////////
	
	"hltv_status"				// general HLTV status
	{
		"clients"	"long"		// number of HLTV spectators
		"slots"		"long"		// number of HLTV slots
		"proxies"	"short"		// number of HLTV proxies
		"master"	"string"	// disptach master IP:port
	}
	
	"hltv_cameraman"			// a spectator/player is a cameraman
	{
		"index"		"short"			// camera man entity index
	}
	
	"hltv_rank_camera"			// a camera ranking
	{
		"index"		"byte"			// fixed camera index
		"rank"		"float"			// ranking, how interesting is this camera view
		"target"	"short"			// best/closest target entity
	}
	
	"hltv_rank_entity"			// an entity ranking
	{
		"index"		"short"			// entity index
		"rank"		"float"			// ranking, how interesting is this entity to view
		"target"	"short"			// best/closest target entity
	}
	
	"hltv_fixed"				// show from fixed view
	{
		"posx"		"long"		// camera position in world
		"posy"		"long"		
		"posz"		"long"		
		"theta"		"short"		// camera angles
		"phi"			"short"		
		"offset"	"short"
		"fov"			"float"
		"target"	"short"		// follow this entity or 0
	}
	
	"hltv_chase"					// shot of a single entity
	{
		"target1"		"short"		// primary traget index 
		"target2"		"short"		// secondary traget index or 0
		"distance"	"short"		// camera distance
		"theta"			"short"		// view angle horizontal 
		"phi"				"short"		// view angle vertical
		"inertia"		"byte"		// camera inertia
		"ineye"			"byte"		// diretcor suggests to show ineye
	}
	
	"hltv_message"	// a HLTV message send by moderators
	{
		"text"	"string"
	}
	
	"hltv_title"
	{
		"text"	"string"
	}
	
	"hltv_chat"	// a HLTV chat msg send by spectators
	{
		"text"	"string"
	}
}