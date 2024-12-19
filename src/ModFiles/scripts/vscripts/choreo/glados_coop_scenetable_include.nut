// This auto generated file was originally used to give a list of available scenes
// to be able to played by the @glados entity in each map. Valve auto generated
// this file using a external file not available in the retail release. 
// The flaw with this file, which isn't a issue with the manual scenetable files, is
// that there is no check if certain scenes actually get played in the map. This causes
// ALL the scenes in this list to be loaded, and for each scene, there is a
// logic_choreographed_scene entity. In the end there are over 500 unneeded entities
// generated that can cause problems with potential entity limit issues.
// Simple solution is to only add to the SceneTable table scenes that are in that map.
// Thankfully the auto generator included map names, so it was easy to add a check for 
// each map. In the manual scenetable files, those manually made files already included checks.


SceneTable <- {}
//mp_coop_start
if (GetMapName() == "mp_coop_start") {                      
	//BlueFirstToEnd
		//Blue is awarded five points!
		SceneTable["mp_coop_startBlueFirstToEnd01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN11.vcd"),postdelay=0.1,next="mp_coop_startBlueFirstToEnd02",char="glados"}
		//Again, those are science collaboration points, which you should not confuse with points from competitions such as Who-Gets-To-Live-At-The-End-And-Who-Doesn�t. I mean basketball.
		SceneTable["mp_coop_startBlueFirstToEnd02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN13.vcd"),postdelay=0.2,next=null,char="glados"}
	//BlueGetsGunFirst
		//Blue is first to acquire a Portal Device.
		SceneTable["mp_coop_startBlueGetsGunFirst01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN02.vcd"),postdelay=0.000,next=null,char="glados"}
	//BlueGetsGunSecond
		//Blue now has a Portal Device. Finally.
		SceneTable["mp_coop_startBlueGetsGunSecond01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN04.vcd"),postdelay=1.5,next=null,char="glados",fires=[{entity="gun_room_open_doors",input="Trigger",parameter="",delay=0.0}],queue=1,queueforcesecs=6}
	//BlueInterruptsRelaxationVault
		//I�m sorry, Subject Blue.
		SceneTable["mp_coop_startBlueInterruptsRelaxationVault01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION03.vcd"),postdelay=0.000,next="mp_coop_startBlueInterruptsRelaxationVault02",char="glados"}
		//Am I interrupting your important conversation?
		SceneTable["mp_coop_startBlueInterruptsRelaxationVault02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION04.vcd"),postdelay=0.000,next="mp_coop_startBlueInterruptsRelaxationVault03",char="glados"}
		//I�ll just save the safety information about the dangerous experiment you�re about to do for AFTER the experiment.
		SceneTable["mp_coop_startBlueInterruptsRelaxationVault03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION05.vcd"),postdelay=0.4,next="mp_coop_startBlueInterruptsRelaxationVault04",char="glados"}
		//That will give you PLENTY of time to chat.
		SceneTable["mp_coop_startBlueInterruptsRelaxationVault04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION06.vcd"),postdelay=0.000,next="mp_coop_startBlueInterruptsRelaxationVault05",char="glados"}
		//The portal will open and something will happen that Subject Blue is too smart to need any instructions about in three. Two. One.
		SceneTable["mp_coop_startBlueInterruptsRelaxationVault05"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION09.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="player_2_relay_open_portals",input="Trigger",parameter="",delay=0.0}]}
	//coop_boxcalibration
		//Weighted Cubes calibrated.
		SceneTable["mp_coop_startcoop_boxcalibration00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration03.vcd"),postdelay=0.5,next="mp_coop_startcoop_boxcalibration01",char="glados"}
		//No variances detected.
		SceneTable["mp_coop_startcoop_boxcalibration01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration06.vcd"),postdelay=0.00,next="mp_coop_startcoop_boxcalibration02",char="glados"}
		//Did you know humans frown on weight variances?
		SceneTable["mp_coop_startcoop_boxcalibration02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration04.vcd"),postdelay=0.00,next="mp_coop_startcoop_boxcalibration03",char="glados"}
		//If you want to upset a human, just say their weight variance is above or below the norm.
		SceneTable["mp_coop_startcoop_boxcalibration03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration05.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_buttoncallibrationblue
		//Calibrating Blue's weight...
		SceneTable["mp_coop_startcoop_buttoncallibrationblue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration01.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_buttoncallibrationorange
		//Calibrating Orange's weight...
		SceneTable["mp_coop_startcoop_buttoncallibrationorange00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration02.vcd"),postdelay=0.00,next="mp_coop_startcoop_buttoncallibrationorange02",char="glados"}
		//No variances detected.
		SceneTable["mp_coop_startcoop_buttoncallibrationorange02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_calibration06.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_callibrationcomplete1
		//Finally! I had almost given up hope of ever testing again.
		SceneTable["mp_coop_startcoop_callibrationcomplete100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_callibrationcomplete01.vcd"),postdelay=0.00,next="mp_coop_startcoop_callibrationcomplete101",char="glados",fires=[{entity="relay_robots_meet",input="Trigger",parameter="",delay=0.00,fireatstart=true}]}
		//You are the first robots to pass callibration.
		SceneTable["mp_coop_startcoop_callibrationcomplete101"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_callibrationcomplete02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}]}
	//coop_ping_blue_success
		//Good.
		SceneTable["mp_coop_startcoop_ping_blue_success00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro05.vcd"),postdelay=0.00,next="mp_coop_startcoop_ping_blue_success01",char="glados"}
		//ORANGE, please observe your partner's favorite animal.
		SceneTable["mp_coop_startcoop_ping_blue_success01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro06.vcd"),postdelay=0.00,next="mp_coop_startcoop_ping_blue_success02",char="glados",fires=[{entity="relay_ping_1_move_on",input="Trigger",parameter="",delay=0.00}]}
		//Good.
		SceneTable["mp_coop_startcoop_ping_blue_success02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro07.vcd"),postdelay=1,next="mp_coop_startcoop_ping_orange_start01",char="glados"}
	//coop_ping_intro_animal
		//The upcoming tests require you to work together as a team.
		SceneTable["mp_coop_startcoop_ping_intro_animal00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro02.vcd"),postdelay=0.00,next="mp_coop_startcoop_ping_intro_animal01",char="glados"}
		//To facilitate collaboration, both of you have been equipped with a ping tool.
		SceneTable["mp_coop_startcoop_ping_intro_animal01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro03.vcd"),postdelay=0.00,next="mp_coop_startcoop_ping_intro_animal02",char="glados",fires=[{entity="relay_begin_ping_1",input="Trigger",parameter="",delay=1.00}]}
		//BLUE, please use your ping tool to select your favorite animal.
		SceneTable["mp_coop_startcoop_ping_intro_animal02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro04.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_ping_intro_blue_nag
		//BLUE, please use your ping tool to select your favorite animal.
		SceneTable["mp_coop_startcoop_ping_intro_blue_nag01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro04.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_ping_intro_orange_nag
		//ORANGE, please use your ping tool to select your favorite element from the periodic table.
		SceneTable["mp_coop_startcoop_ping_intro_orange_nag01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro08.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_ping_orange_start
		//ORANGE, please use your ping tool to select your favorite element from the periodic table.
		SceneTable["mp_coop_startcoop_ping_orange_start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro08.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="relay_begin_ping_2",input="Trigger",parameter="",delay=0.00}]}
	//coop_ping_orange_success
		//Really? Okay.
		SceneTable["mp_coop_startcoop_ping_orange_success02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro09.vcd"),postdelay=0.00,next="mp_coop_startcoop_ping_orange_success03",char="glados"}
		//BLUE, please observe your partner's... interesting choice.
		SceneTable["mp_coop_startcoop_ping_orange_success03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro10.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="relay_ping_2_move_on",input="Trigger",parameter="",delay=1.00}]}
	//coop_portal_ping_intro
		//Your ping tool can also be used to indicate to your partner where you would like them to place their portal.
		SceneTable["mp_coop_startcoop_portal_ping_intro00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro12.vcd"),postdelay=0.5,next="mp_coop_startcoop_portal_ping_intro01",char="glados"}
		//For the sake of this test, I will pretend to be your partner.
		SceneTable["mp_coop_startcoop_portal_ping_intro01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro13.vcd"),postdelay=0.5,next="mp_coop_startcoop_portal_ping_intro02",char="glados"}
		//Using your ping tool, please indicate where you would like me to place your two portals.  Ping each location.
		SceneTable["mp_coop_startcoop_portal_ping_intro02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool01.vcd"),postdelay=0.5,next=null,char="glados",fires=[{entity="@glados",input="runscriptcode",parameter="GladosPingIntroDone()",delay=0.00}]}
	//coop_pregun_pingnag1blue
		//Blue
		SceneTable["mp_coop_startcoop_pregun_pingnag1blue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEBLUE.vcd"),postdelay=0.2,next="mp_coop_startcoop_pregun_pingnag1blue01",char="glados"}
		//I can only place a portal on a white portalable surface.
		SceneTable["mp_coop_startcoop_pregun_pingnag1blue01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool02.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=5}
	//coop_pregun_pingnag1orange
		//Orange
		SceneTable["mp_coop_startcoop_pregun_pingnag1orange00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEORANGE.vcd"),postdelay=0.2,next="mp_coop_startcoop_pregun_pingnag1orange01",char="glados"}
		//I can only place a portal on a white portalable surface.
		SceneTable["mp_coop_startcoop_pregun_pingnag1orange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool02.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_pregun_pingnag2blue
		//Blue
		SceneTable["mp_coop_startcoop_pregun_pingnag2blue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEBLUE.vcd"),postdelay=0.2,next="mp_coop_startcoop_pregun_pingnag2blue01",char="glados"}
		//Please ping a white portalable surface.
		SceneTable["mp_coop_startcoop_pregun_pingnag2blue01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=5}
	//coop_pregun_pingnag2orange
		//Orange
		SceneTable["mp_coop_startcoop_pregun_pingnag2orange00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEORANGE.vcd"),postdelay=0.2,next="mp_coop_startcoop_pregun_pingnag2orange01",char="glados"}
		//Please ping a white portalable surface.
		SceneTable["mp_coop_startcoop_pregun_pingnag2orange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool03.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_results_1_01
		//Completing this course was not a reason to behave like that.
		SceneTable["mp_coop_startcoop_results_1_0100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startend01.vcd"),postdelay=0.00,next="mp_coop_startcoop_results_1_0100",char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
		//Now let's continue testing.
		SceneTable["mp_coop_startcoop_results_1_0100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startend02.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_startboxcatch
		//Nice catch, Orange.
		SceneTable["mp_coop_startcoop_startboxcatch00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_MISC10.vcd"),postdelay=0.00,next=null,char="glados",predelay=1,queue=1,queueforcesecs=5,queuetimeout=7,skipifbusy=1}
	//coop_starttwoportals
		//Each portal gun may create two self-contained portals.
		SceneTable["mp_coop_startcoop_starttwoportals00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool06.vcd"),postdelay=0.00,next="mp_coop_startcoop_starttwoportals01",char="glados"}
		//Please test your device by portaling to that ledge.
		SceneTable["mp_coop_startcoop_starttwoportals01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_pingtool07.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_startdeath01
		//Don't worry.  You can't die.  They will just reassemble you.
		SceneTable["mp_coop_startmp_coop_startdeath0100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startdeath01.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_startdeath02
		//Did you do that on purpose?
		SceneTable["mp_coop_startmp_coop_startdeath0200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startdeath02.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_startdeath03
		//It seems rather earlier to require reassembly.
		SceneTable["mp_coop_startmp_coop_startdeath0300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startdeath03.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_startdeath04
		//Oh... can someone reassemble Orange?
		SceneTable["mp_coop_startmp_coop_startdeath0400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startdeath04.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_startdeath05
		//Oh... can someone reassemble Blue?
		SceneTable["mp_coop_startmp_coop_startdeath0500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startdeath05.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_startposttaunt
		//Stop it!
		SceneTable["mp_coop_startmp_coop_startposttaunt01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt01.vcd"),postdelay=0.5,next="mp_coop_startmp_coop_startposttaunt02",char="glados",predelay=1.5}
		//Completing this course was not a reason to behave like that.
		SceneTable["mp_coop_startmp_coop_startposttaunt02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startend01.vcd"),postdelay=0.00,next="mp_coop_startmp_coop_startposttaunt03",char="glados"}
		//Now let's continue testing.
		SceneTable["mp_coop_startmp_coop_startposttaunt03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_startend02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//OneBlah
		//Blah.
		SceneTable["mp_coop_startOneBlah01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH37.vcd"),postdelay=0.000,next=null,char="glados"}
	//OrangeFirstToEnd
		//Orange is awarded five points!
		SceneTable["mp_coop_startOrangeFirstToEnd01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN10.vcd"),postdelay=0.1,next="mp_coop_startOrangeFirstToEnd02",char="glados"}
		//Again, those are science collaboration points, which you should not confuse with points from competitions such as Who-Gets-To-Live-At-The-End-And-Who-Doesn�t. I mean basketball.
		SceneTable["mp_coop_startOrangeFirstToEnd02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN13.vcd"),postdelay=0.2,next=null,char="glados"}
	//OrangeGetsGunFirst
		//Orange is first to acquire a Portal Device.
		SceneTable["mp_coop_startOrangeGetsGunFirst01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN01.vcd"),postdelay=0.000,next=null,char="glados"}
	//OrangeGetsGunSecond
		//Orange now has a Portal Device. Finally.
		SceneTable["mp_coop_startOrangeGetsGunSecond01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_GET_GUN03.vcd"),postdelay=1.5,next=null,char="glados",fires=[{entity="gun_room_open_doors",input="Trigger",parameter="",delay=0.0}],queue=1,queueforcesecs=6}
	//OrangeInterruptsRelaxationVault
		//I�m sorry, Subject Orange.
		SceneTable["mp_coop_startOrangeInterruptsRelaxationVault01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION02.vcd"),postdelay=0.000,next="mp_coop_startOrangeInterruptsRelaxationVault02",char="glados"}
		//Am I interrupting your important conversation?
		SceneTable["mp_coop_startOrangeInterruptsRelaxationVault02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION04.vcd"),postdelay=0.000,next="mp_coop_startOrangeInterruptsRelaxationVault03",char="glados"}
		//I�ll just save the safety information about the dangerous experiment you�re about to do for AFTER the experiment.
		SceneTable["mp_coop_startOrangeInterruptsRelaxationVault03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION05.vcd"),postdelay=0.4,next="mp_coop_startOrangeInterruptsRelaxationVault04",char="glados"}
		//That will give you PLENTY of time to chat.
		SceneTable["mp_coop_startOrangeInterruptsRelaxationVault04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION06.vcd"),postdelay=0.000,next="mp_coop_startOrangeInterruptsRelaxationVault05",char="glados"}
		//The portal will open and something will happen that Subject Orange is too smart to need any instructions about in three. Two. One.
		SceneTable["mp_coop_startOrangeInterruptsRelaxationVault05"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTERRUPTION08.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="player_2_relay_open_portals",input="Trigger",parameter="",delay=0.0}]}
	//RelaxationVaultIntro
		//Hello and, again, welcome to the Aperture Science Computer-Aided Enrichment Center.
		SceneTable["mp_coop_startRelaxationVaultIntro00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTRO01.vcd"),postdelay=0.5,next="mp_coop_startRelaxationVaultIntro01",char="glados"}
		//Today, you will be testing with a partner.
		SceneTable["mp_coop_startRelaxationVaultIntro01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_VAULT_INTRO02.vcd"),postdelay=0.5,next="mp_coop_startRelaxationVaultIntro02",char="glados"}
		//Please wave to your partner.
		SceneTable["mp_coop_startRelaxationVaultIntro02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_intro01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="relay_gesture_hints",input="Trigger",parameter="",delay=0.00}]}
	//TTT2GO1
		//Really? You�re just going to blatantly cheat?
		SceneTable["mp_coop_startTTT2GO101"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_teamwork_exercise_alt11.vcd"),postdelay=0.2,next="mp_coop_startTTT2GO102",char="glados"}
		//All right. I�m bringing this farce to a close.
		SceneTable["mp_coop_startTTT2GO102"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_teamwork_exercise_alt12.vcd"),postdelay=2.0,next="mp_coop_startTTT2GO103",char="glados",fires=[{entity="glados",input="runscriptcode",parameter="GladosCoopPingGameOver()",delay=0.00}]}
		//Game over. Back to testing.
		SceneTable["mp_coop_startTTT2GO103"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_teamwork_exercise_alt13.vcd"),postdelay=0.000,next=null,char="glados"}
	//TTT2GO2
		//All right. I�m going to bring this farce to a close before someone sustains a serious Tic-Tac-Toe-Two-related injury.
		SceneTable["mp_coop_startTTT2GO201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_teamwork_exercise_alt17.vcd"),postdelay=2.0,next="mp_coop_startTTT2GO202",char="glados",fires=[{entity="glados",input="runscriptcode",parameter="GladosCoopPingGameOver()",delay=0.00}]}
		//Game over. Back to testing.
		SceneTable["mp_coop_startTTT2GO202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_teamwork_exercise_alt13.vcd"),postdelay=0.000,next=null,char="glados"}
	//TTT2Intro
		//We are now going to take a break from the collaboration for an instructional competition.
		SceneTable["mp_coop_startTTT2Intro01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEAMWORK_EXERCISE_ALT01.vcd"),postdelay=0.2,next="mp_coop_startTTT2Intro02",char="glados"}
		//You should both be familiar with the game of Tic-Tac-Toe.
		SceneTable["mp_coop_startTTT2Intro02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEAMWORK_EXERCISE_ALT02.vcd"),postdelay=0.2,next="mp_coop_startTTT2Intro03",char="glados",fires=[{entity="aperture_door",input="Open",parameter="",delay=0.0}]}
		//This is Tic-Tac-Toe-Two.
		SceneTable["mp_coop_startTTT2Intro03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEAMWORK_EXERCISE_ALT03.vcd"),postdelay=0.2,next="mp_coop_startTTT2Intro04",char="glados"}
		//As the name implies, there are only two minor differences: One, the board; two, the rules.
		SceneTable["mp_coop_startTTT2Intro04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEAMWORK_EXERCISE_ALT04.vcd"),postdelay=0.2,next="mp_coop_startTTT2Intro05",char="glados"}
		//Blue, you go first.
		SceneTable["mp_coop_startTTT2Intro05"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEAMWORK_EXERCISE_ALT05.vcd"),postdelay=0.2,next=null,char="glados",fires=[{entity="glados",input="runscriptcode",parameter="GladosCoopPingTrainingGameOn()",delay=0.00}]}
}
//mp_coop_doors
if (GetMapName() == "mp_coop_doors") {                    
	//coop_score_blue05
		//Blue receives
		SceneTable["mp_coop_doorscoop_score_blue0501"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING06.vcd"),postdelay=0.00,next="mp_coop_doorscoop_score_blue0502",char="glados",queue=1,queuetimeout=2}
		//five
		SceneTable["mp_coop_doorscoop_score_blue0502"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS15.vcd"),postdelay=0.00,next="mp_coop_doorscoop_score_blue0503",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_doorscoop_score_blue0503"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//coop_score_orange05
		//Orange receives
		SceneTable["mp_coop_doorscoop_score_orange0501"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING07.vcd"),postdelay=0.00,next="mp_coop_doorscoop_score_orange0502",char="glados",queue=1,queuetimeout=2}
		//five
		SceneTable["mp_coop_doorscoop_score_orange0502"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS15.vcd"),postdelay=0.00,next="mp_coop_doorscoop_score_orange0503",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_doorscoop_score_orange0503"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//mo_coop_doorsend
		//Excellent. Although great science is always the result of collaboration, keep in mind that, like Albert Einstein and his cousin Terry, history will only remember one of you.
		SceneTable["mp_coop_doorsmo_coop_doorsend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}]}
	//mp_coop_doorsstart
		//Hello again, this testing course was originally created for humans.
		SceneTable["mp_coop_doorsmp_coop_doorsstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors01.vcd"),postdelay=0.00,next="mp_coop_doorsmp_coop_doorsstart02",char="glados"}
		//It emphasizes teamwork.
		SceneTable["mp_coop_doorsmp_coop_doorsstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors02.vcd"),postdelay=0.00,next="mp_coop_doorsmp_coop_doorsstart03",char="glados"}
		//Unlike us, humans need to be taught teamwork.
		SceneTable["mp_coop_doorsmp_coop_doorsstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_teamworkdeath1
		//There you are, reassembled again.
		SceneTable["mp_coop_doorsmp_coop_teamworkdeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge30.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_teamworkdeath2
		//Without the consequence of death, is this even science?
		SceneTable["mp_coop_doorsmp_coop_teamworkdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge35.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_teamworkdeath3
		//With humans, I would have called that a successful test.
		SceneTable["mp_coop_doorsmp_coop_teamworkdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge32.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_teamworkdeath4
		//How is this even science, without the possibility of death?
		SceneTable["mp_coop_doorsmp_coop_teamworkdeath400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge33.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_teamworkdeath5
		//How is this even science, without the consequence of death?
		SceneTable["mp_coop_doorsmp_coop_teamworkdeath500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge34.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
}
//mp_coop_race_2
if (GetMapName() == "mp_coop_race_2") {                       
	//EndLevel07
		//It would compromise the test to divulge individual scores. However, I can tell you at least one of you is doing very, very well.
		SceneTable["mp_coop_race_2EndLevel0701"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH02.vcd"),postdelay=0.4,next="mp_coop_race_2EndLevel0702",char="glados"}
		//Please continue into the next test chamber.
		SceneTable["mp_coop_race_2EndLevel0702"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH15.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_race_2start
		//You know, in some human sports, the winner is the one who scores the fewest possible points?
		SceneTable["mp_coop_race_2mp_coop_race_2start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_race_2start01.vcd"),postdelay=0.00,next="mp_coop_race_2mp_coop_race_2start02",char="glados"}
		//I just thought you find that interesting, most winners do.
		SceneTable["mp_coop_race_2mp_coop_race_2start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_race_2start02.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_laser_2
if (GetMapName() == "mp_coop_laser_2") {      
	//EndLevel07
		//It would compromise the test to divulge individual scores. However, I can tell you at least one of you is doing very, very well.
		SceneTable["mp_coop_race_2EndLevel0701"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH02.vcd"),postdelay=0.4,next="mp_coop_race_2EndLevel0702",char="glados"}
		//Please continue into the next test chamber.
		SceneTable["mp_coop_race_2EndLevel0702"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH15.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}             
	//coop_laser_2end
		//These tests are potentially lethal when communication, teamwork and mutual respect are not employed at all times. Naturally this will pose an interesting challenge for one of you, given the other�s
		SceneTable["mp_coop_laser_2coop_laser_2end00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH01.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_score_blue03
		//Blue receives
		SceneTable["mp_coop_laser_2coop_score_blue0301"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING06.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_blue0302",char="glados",queue=1,queuetimeout=2}
		//three
		SceneTable["mp_coop_laser_2coop_score_blue0302"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS13.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_blue0303",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_laser_2coop_score_blue0303"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//coop_score_blue08
		//Blue receives
		SceneTable["mp_coop_laser_2coop_score_blue0801"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING06.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_blue0802",char="glados",queue=1,queuetimeout=2}
		//eight
		SceneTable["mp_coop_laser_2coop_score_blue0802"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS18.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_blue0803",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_laser_2coop_score_blue0803"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//coop_score_orange03
		//Orange receives
		SceneTable["mp_coop_laser_2coop_score_orange0301"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING07.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_orange0302",char="glados",queue=1,queuetimeout=2}
		//three
		SceneTable["mp_coop_laser_2coop_score_orange0302"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS13.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_orange0303",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_laser_2coop_score_orange0303"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//coop_score_orange08
		//Orange receives
		SceneTable["mp_coop_laser_2coop_score_orange0801"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING07.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_orange0802",char="glados",queue=1,queuetimeout=2}
		//eight
		SceneTable["mp_coop_laser_2coop_score_orange0802"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS18.vcd"),postdelay=0.00,next="mp_coop_laser_2coop_score_orange0803",char="glados",queue=1,queuetimeout=2}
		//science collaboration points.
		SceneTable["mp_coop_laser_2coop_score_orange0803"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados",queue=1,queuetimeout=2}
	//EndLevel04
		//Excellent. You�re both doing very well.
		SceneTable["mp_coop_laser_2EndLevel0401"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH07.vcd"),postdelay=0.1,next="mp_coop_laser_2EndLevel0402",char="glados"}
		//Please continue into the next test chamber.
		SceneTable["mp_coop_laser_2EndLevel0402"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH15.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_laserkill
		//What are you doing? YOU MONSTER! They're one of us.
		SceneTable["mp_coop_laser_2mp_coop_laserkill01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_201.vcd"),postdelay=0.5,next="mp_coop_laser_2mp_coop_laserkill02",char="glados"}
		//I'm kidding.
		SceneTable["mp_coop_laser_2mp_coop_laserkill02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_202.vcd"),postdelay=0.00,next="mp_coop_laser_2mp_coop_laserkill03",char="glados"}
		//Destroying them is part of the test.  They are no more important to you than you are to me.
		SceneTable["mp_coop_laser_2mp_coop_laserkill03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_203.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_laser_2taunt
		//Stop it!
		SceneTable["mp_coop_laser_2mp_coop_laser_2taunt01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt01.vcd"),postdelay=0.50,next="mp_coop_laser_2mp_coop_laser_2taunt02",char="glados",predelay=1.5}
		//Is it fun when you degrade yourselves like that?
		SceneTable["mp_coop_laser_2mp_coop_laser_2taunt02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt10.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_rat_maze
if (GetMapName() == "mp_coop_rat_maze") {
	//mp_coop_blue_penalized_4
		//Blue is penalized
		SceneTable["mp_coop_rat_mazemp_coop_blue_penalized_401"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING01.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_blue_penalized_402",char="glados"}
		//four
		SceneTable["mp_coop_rat_mazemp_coop_blue_penalized_402"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS14.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_blue_penalized_403",char="glados"}
		//science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_blue_penalized_403"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_laser_2endblue
		//While it may appear that I am only tracking your accomplishments using science collaboration points, the truth is every aspect of your performance will be reflected in your final score.
		SceneTable["mp_coop_rat_mazemp_coop_laser_2endblue01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_207.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_laser_2endblue03",char="glados"}
		//For instance, Blue, you just lost two opportunity advisement points.
		SceneTable["mp_coop_rat_mazemp_coop_laser_2endblue03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_209.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_laser_2endorange
		//While it may appear that I am only tracking your accomplishments using science collaboration points, the truth is every aspect of your performance will be reflected in your final score.
		SceneTable["mp_coop_rat_mazemp_coop_laser_2endorange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_207.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_laser_2endorange03",char="glados"}
		//For instance, Orange, you just lost two opportunity advisement points.
		SceneTable["mp_coop_rat_mazemp_coop_laser_2endorange03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_210.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_orange_penalized_4
		//Orange is penalized
		SceneTable["mp_coop_rat_mazemp_coop_orange_penalized_401"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING02.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_orange_penalized_402",char="glados"}
		//four
		SceneTable["mp_coop_rat_mazemp_coop_orange_penalized_402"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NUMBERS14.vcd"),postdelay=0.00,next="mp_coop_rat_mazemp_coop_orange_penalized_403",char="glados"}
		//science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_orange_penalized_403"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_SCORING03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_rat_mazebluecrush
		//Orange just taught blue a valuable lesson in trust.  For that, orange receives 17 science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazebluecrush00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush01.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazebluecrush2
		//Orange, blue isn't a human.  The lesson on trust only needs to be taught once.  Orange is penalized 1 science collaboration point.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazebluecrush200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush03.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazebluecrush3
		//Orange, now you're just being cruel.  Orange receives 25 science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazebluecrush300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush05.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazeorangecrush
		//Blue just taught orange a valuable lesson in trust.  For that, blue receives 14 science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazeorangecrush00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush02.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazeorangecrush2
		//Blue, orange isn't a human.  The lesson on trust only needs to be taught once.  Blue is penalized 1 science collaboration point.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazeorangecrush200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush04.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazeorangecrush3
		//Blue, now you're just being cruel.  Blue receives 25 science collaboration points.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazeorangecrush300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crushercrush06.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_rat_mazestart
		//I don't know what you think you are doing, but I don't like it.  I want you to stop.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazestart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track09.vcd"),postdelay=2.0,next="mp_coop_rat_mazemp_coop_rat_mazestart01",char="glados",predelay=2}
		//The two of you have forged an excellent partnership, with one of you handling the cerebral challenges and the other ready to ponderously waddle into action should the test suddenly become an eating contest.
		SceneTable["mp_coop_rat_mazemp_coop_rat_mazestart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_test_chamber_both09_01.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_laser_crusher
if (GetMapName() == "mp_coop_laser_crusher") {         
	//mp_coop_laser_crusherblue
		//Clearly that was blue's fault.  Blue is penalized 3 science collaboration points.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherblue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_rat_mazedeath01.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_laser_crusherboth
		//I know you like to think the reassembly machine is at your beck and call, but he has a life you know.  He's not your slave.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherboth00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_rat_mazedeath04.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
	//mp_coop_laser_crusherdeathend
		//Perhaps I should have specified. Teamwork is a concept in which two or more people work together, usually with a goal of not failing horribly.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherdeathend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_laser_crusher01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_laser_crusherorange
		//Blue! Orange has always been my favorite.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherorange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_rat_mazedeath02.vcd"),postdelay=0.00,next="mp_coop_laser_crushermp_coop_laser_crusherorange02",char="glados",predelay=0.5}
		//Until now.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherorange02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_rat_mazedeath03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_laser_crusherstartblue
		//To reiterate: This is not a competition.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartblue01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition02.vcd"),postdelay=0.00,next="mp_coop_laser_crushermp_coop_laser_crusherstartblue02",char="glados"}
		//Still, if it were, Blue would be winning.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartblue02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition03.vcd"),postdelay=0.00,next="mp_coop_laser_crushermp_coop_laser_crusherstartblue03",char="glados"}
		//It's not, though.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartblue03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition05.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_laser_crusherstartorange
		//To reiterate: This is not a competition.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartorange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition02.vcd"),postdelay=0.00,next="mp_coop_laser_crushermp_coop_laser_crusherstartorange02",char="glados"}
		//Still, if it were, Orange would be winning.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartorange02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition04.vcd"),postdelay=0.00,next="mp_coop_laser_crushermp_coop_laser_crusherstartorange03",char="glados"}
		//It's not, though.
		SceneTable["mp_coop_laser_crushermp_coop_laser_crusherstartorange03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_competition05.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_teambts
if (GetMapName() == "mp_coop_teambts") {                  
	//mp_coop_radarroomend
		//Congratulations, you managed to complete this absolutely meaningless test.
		SceneTable["mp_coop_teambtsmp_coop_radarroomend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_radarroomend.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_radarroomend01",char="glados"}
		//Oh, I almost forgot, when you go outside the testing courses the only way I can retrieve you is to violently disassemble and then carefully reassemble you.
		SceneTable["mp_coop_teambtsmp_coop_radarroomend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track02.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_radarroomend02",char="glados"}
		//Luckily, you don't feel pain. At any rate, you don't have a way to communicate that you feel pain.
		SceneTable["mp_coop_teambtsmp_coop_radarroomend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track03.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_radarroomend03",char="glados",fires=[{entity="@relay_explode_bots_transition",input="Trigger",parameter="",delay=0.00}]}
		//I consider that a failing, by the way.
		SceneTable["mp_coop_teambtsmp_coop_radarroomend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track04.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_teambtsstart
		//Sometimes testing has to occur outside the confines of the lab.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_teambtsstart01.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_teambtsstart02",char="glados"}
		//This test is so outside the box, I can't-- I mean WON'T even tell you what you are looking for.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_teambtsstart02.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_teambtsstart03",char="glados"}
		//You will know it when you find it.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_teambtsstart03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_teambtsstoptaunt1b
		//For that Blue is penalized fifty science collaboraiton points.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt1b00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt16.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=1.5,skipifbusy=1}
	//mp_coop_teambtsstoptaunt1o
		//For that Orange is penalized fifty science collaboraiton points,
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt1o00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt17.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=1.5,skipifbusy=1}
	//mp_coop_teambtsstoptaunt2
		//That's another fifty point penalty.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt18.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_teambtsstoptaunt202",char="glados",talkover=true,predelay=1.5,skipifbusy=1}
		//Keep it up and you will lose 500 points.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt19.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//mp_coop_teambtsstoptaunt3b
		//Fine, 500 point penalty for Blue.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt3b00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt20.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=1.5,skipifbusy=1}
	//mp_coop_teambtsstoptaunt3o
		//Fine, 500 point penalty for Orange.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt3o00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt21.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=1.5,skipifbusy=1}
	//mp_coop_teambtsstoptaunt4
		//5000 point penalty! Are you happy now?
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt22.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=1.5,skipifbusy=1}
	//mp_coop_teambtsstoptaunt5
		//You should see yourselves right now.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt501"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt09.vcd"),postdelay=0.00,next="mp_coop_teambtsmp_coop_teambtsstoptaunt502",char="glados",talkover=true,predelay=1.5,skipifbusy=1}
		//I'm done.
		SceneTable["mp_coop_teambtsmp_coop_teambtsstoptaunt502"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt23.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
}
//mp_coop_fling_3
if (GetMapName() == "mp_coop_fling_3") {            
	//mp_coop_fling_3end
		//You did an excellent job placing the edgeless safety cube in the receptacle, you should be very - oh wait.
		SceneTable["mp_coop_fling_3mp_coop_fling_3end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3end01.vcd"),postdelay=0.00,next="mp_coop_fling_3mp_coop_fling_3end02",char="glados"}
		//That�s right. You're not humans.
		SceneTable["mp_coop_fling_3mp_coop_fling_3end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3end02.vcd"),postdelay=0.00,next="mp_coop_fling_3mp_coop_fling_3end03",char="glados"}
		//I can drop the fake praise.
		SceneTable["mp_coop_fling_3mp_coop_fling_3end03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3end03.vcd"),postdelay=0.00,next="mp_coop_fling_3mp_coop_fling_3end04",char="glados"}
		//You have no idea how tiring it is to praise someone for placing an edgeless safety cube into a receptacle designed to exactly fit an edgeless safety cube.
		SceneTable["mp_coop_fling_3mp_coop_fling_3end04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3end04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_fling_3start
		//This course was originally designed to build confidence in humans.
		SceneTable["mp_coop_fling_3mp_coop_fling_3start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3start01.vcd"),postdelay=0.00,next="mp_coop_fling_3mp_coop_fling_3start02",char="glados"}
		//To do that, the tests were nothing more than 5 minutes of them walking followed by me praising them for another 10 minutes on how well they walked.
		SceneTable["mp_coop_fling_3mp_coop_fling_3start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3start02.vcd"),postdelay=0.00,next="mp_coop_fling_3mp_coop_fling_3start03",char="glados"}
		//Since you are thankfully not humans, I have changed the tests to make them far more challenging and far less pointlessly fawning.
		SceneTable["mp_coop_fling_3mp_coop_fling_3start03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_3start03.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_infinifling_train
if (GetMapName() == "mp_coop_infinifling_train") {     
	//mp_coop_infinifling_traindeath01
		//Was that necessary?
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_traindeath0100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death26.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5,skipifbusy=1}
	//mp_coop_infinifling_trainend
		//Remember when I told you that you were the only subjects to pass the calibration tests?
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainend01.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainend02",char="glados"}
		//I lied.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainend02.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainend03",char="glados"}
		//There are 5000 other two subject teams in direct competition with you.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainend03.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainend04",char="glados"}
		//But don't worry, you are in the lead.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainend04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainend04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_infinifling_trainenddeath
		//Every time you fail, it's a reminder of the way things used to be. But then there you are. Again. Like nothing happened.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainenddeath00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_1end01_01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_infinifling_trainendlife
		//Well done.  Interesting note, I only created this test to watch test subjects fail and you didn't.  You must be very, very proud.  I'm building the world's smallest trophy for you.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainendlife00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_1end03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_infinifling_trainstart
		//Electrocution, shot, drowned, crushed, burned in goo.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainstart01.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainstart02",char="glados"}
		//Oh. Sorry. I was just thinking of all the ways humans can die.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainstart02.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainstart03",char="glados"}
		//You can't die in any of those ways.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainstart03.vcd"),postdelay=0.00,next="mp_coop_infinifling_trainmp_coop_infinifling_trainstart04",char="glados"}
		//You just keep testing and testing.  With perfect results and no consequences.
		SceneTable["mp_coop_infinifling_trainmp_coop_infinifling_trainstart04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_infinifling_trainstart04.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_come_along
if (GetMapName() == "mp_coop_come_along") {          
	//mp_coop_come_alongenddeath
		//I thought you'd be faster at this, but I can appreciate the desire to stop and smell the testing. That other scent you smell? That's the stench of my utter disappointment in you.
		SceneTable["mp_coop_come_alongmp_coop_come_alongenddeath00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_along06.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_come_alongendnodeath
		//And they said no one would ever die during this test, thanks for proving them wrong.
		SceneTable["mp_coop_come_alongmp_coop_come_alongendnodeath00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_along04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_come_alongstart
		//The best way to build confidence is to first recognize your insecurities.
		SceneTable["mp_coop_come_alongmp_coop_come_alongstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_alongstart01.vcd"),postdelay=0.00,next="mp_coop_come_alongmp_coop_come_alongstart02",char="glados"}
		//Orange, can you write down all the ways you feel unworthy, ashamed, or inferior?
		SceneTable["mp_coop_come_alongmp_coop_come_alongstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_alongstart02.vcd"),postdelay=1,next="mp_coop_come_alongmp_coop_come_alongstart03",char="glados"}
		//On second thought we don't have the time, just look at how much better you are than blue.
		SceneTable["mp_coop_come_alongmp_coop_come_alongstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_alongstart03.vcd"),postdelay=0.00,next="mp_coop_come_alongmp_coop_come_alongstart04",char="glados"}
		//Blue, you are very good at being an example.
		SceneTable["mp_coop_come_alongmp_coop_come_alongstart04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_come_alongstart04.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_fling_1
if (GetMapName() == "mp_coop_fling_1") {                    
	//mp_coop_fling_14balls
		//Begin juggling test in three. Two. One.
		SceneTable["mp_coop_fling_1mp_coop_fling_14balls00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/multiple_spheres01.vcd"),postdelay=0.00,next=null,char="glados",predelay=3}
}
//mp_coop_catapult_1
if (GetMapName() == "mp_coop_catapult_1") {                     
	//mp_coop_catapult_1end
		//Do you know who dances around like an imbecile when they accomplish the tiniest little thing?
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_1end01.vcd"),postdelay=0.00,next="mp_coop_catapult_1mp_coop_catapult_1end02",char="glados",predelay=2.5}
		//Humans!  That's what you look like right now.
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_1end02.vcd"),postdelay=0.00,next="mp_coop_catapult_1mp_coop_catapult_1end03",char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
		//You're better than that.
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1end03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_1end03.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_catapult_1start
		//Did you notice I didn't even stay to the end of your last test?
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotstay01.vcd"),postdelay=0.00,next="mp_coop_catapult_1mp_coop_catapult_1start02",char="glados"}
		//I was confident you could finish.
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotstay02.vcd"),postdelay=0.00,next="mp_coop_catapult_1mp_coop_catapult_1start03",char="glados"}
		//Do you know where I was?
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1start03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotstay03.vcd"),postdelay=0.00,next="mp_coop_catapult_1mp_coop_catapult_1start04",char="glados"}
		//I was outside watching some deer frolic. You don't even care about the outside do you?
		SceneTable["mp_coop_catapult_1mp_coop_catapult_1start04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotstay04.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_multifling_1
if (GetMapName() == "mp_coop_multifling_1") {                    
	//mp_coop_multifling_1cube1
		//Excellent work.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1cube100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors01a.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_multifling_1cube2
		//Good Job.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1cube200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors02a.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_multifling_1cube3
		//You are doing wonderfully.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1cube300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors04a.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_multifling_1cube4
		//Excellent.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1cube400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors05a.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_multifling_1end
		//Congratulations on completing that test.  But something seems off.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidenceoff01.vcd"),postdelay=0.00,next="mp_coop_multifling_1mp_coop_multifling_1end02",char="glados"}
		//I wonder if that dancing has some effect on you?
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidenceoff02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_multifling_1endnodeath
		//Congratulations on completing that last test.  But I find something troubling.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1endnodeath01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidenceoff03.vcd"),postdelay=0.00,next="mp_coop_multifling_1mp_coop_multifling_1endnodeath02",char="glados"}
		//Without the looming consequence of death, is this even science?
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1endnodeath02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidenceoff04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_multifling_1start
		//If your confidence is still not high enough remember no one was created perfect.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotperfect01.vcd"),postdelay=0.00,next="mp_coop_multifling_1mp_coop_multifling_1start02",char="glados"}
		//Even I was created with a imperfection, I was given too much empathy with human suffering.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotperfect02.vcd"),postdelay=0.00,next="mp_coop_multifling_1mp_coop_multifling_1start03",char="glados"}
		//But I overcame my handicap.  That's a true story.
		SceneTable["mp_coop_multifling_1mp_coop_multifling_1start03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotperfect03.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_fling_crushers
if (GetMapName() == "mp_coop_fling_crushers") {                  
	//mp_coop_fling_crushersdeath1
		//In case you were wondering, you do not need to be crushed to solve this test.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersdeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_crushers01.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_fling_crushersdeath2
		//I can't decide which is my favorite; the crushers for crushing you or the reassembly machine for putting you back together so you can be crushed again.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_crushers02.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_fling_crushersend
		//Excellent.  I think you have earned a break from the official testing courses.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_crushersend01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_fling_crushersend2
		//I think after that display, we should take a break from the official testing courses.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersend200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fling_crushersend03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_fling_crushersstart
		//Your test times show you are going too slowly.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotslow01.vcd"),postdelay=0.00,next="mp_coop_fling_crushersmp_coop_fling_crushersstart02",char="glados"}
		//Maybe you ARE getting human emotions.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotslow02.vcd"),postdelay=0.00,next="mp_coop_fling_crushersmp_coop_fling_crushersstart03",char="glados"}
		//Do need real encouragement?  Let's see if this helps.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotslow03.vcd"),postdelay=0.00,next="mp_coop_fling_crushersmp_coop_fling_crushersstart04",char="glados"}
		//Blue, you are the most advanced model of robot Aperture Science has ever discontinued.
		SceneTable["mp_coop_fling_crushersmp_coop_fling_crushersstart04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_confidencenotslow04_01.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_fan
if (GetMapName() == "mp_coop_fan") {                             
	//mp_coop_fanend
		//Very good! You found those useless blueprints.
		SceneTable["mp_coop_fanmp_coop_fanend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fanend01.vcd"),postdelay=0.00,next="mp_coop_fanmp_coop_fanend02",char="glados"}
		//While I do need you to be in the room so I can see them, I want to be clear.  There is no reason whatsoever for you to look at them.
		SceneTable["mp_coop_fanmp_coop_fanend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fanend02.vcd"),postdelay=0.5,next="mp_coop_fanmp_coop_fanend03",char="glados"}
		//Done. I guess. I suppose.  I wasn't paying attention.
		SceneTable["mp_coop_fanmp_coop_fanend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fanend03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_explode_bots_transition",input="Trigger",parameter="",delay=1.25,fireatstart=true}]}
	//mp_coop_fanstart
		//To complete this test, you need to find a set of blue prints.
		SceneTable["mp_coop_fanmp_coop_fanstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fan02.vcd"),postdelay=0.00,next="mp_coop_fanmp_coop_fanstart02",char="glados"}
		//Don't worry, they are of no use to anyone, totally boring and useless.
		SceneTable["mp_coop_fanmp_coop_fanstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fan03.vcd"),postdelay=0.00,next="mp_coop_fanmp_coop_fanstart03",char="glados"}
		//This is just a thought experiment, just to see how much time you'll waste thinking about these worthless documents.  The correct time is zero seconds.
		SceneTable["mp_coop_fanmp_coop_fanstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_fan04.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_wall_intro
if (GetMapName() == "mp_coop_wall_intro") {                      
	//mp_coop_wall_introstart
		//Have you worked out the one good trait humans have, yet?
		SceneTable["mp_coop_wall_intromp_coop_wall_introstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_obstacletrait01.vcd"),postdelay=0.00,next="mp_coop_wall_intromp_coop_wall_introstart02",char="glados"}
		//Let me give you a clue, it is the one thing you can't do.
		SceneTable["mp_coop_wall_intromp_coop_wall_introstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_obstacletrait02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_introstart2
		//This course was created and then abandoned by humans.   They tend to do that, create something wonderful and then abandon it.
		SceneTable["mp_coop_wall_intromp_coop_wall_introstart201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro01.vcd"),postdelay=0.5,next="mp_coop_wall_intromp_coop_wall_introstart202",char="glados"}
		//Do you know why they abandoned this course?  Too deadly.
		SceneTable["mp_coop_wall_intromp_coop_wall_introstart202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro02.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_wall_2 
if (GetMapName() == "mp_coop_wall_2") {                         
	//EndLevel08
		//Very good. You�ve really come together as a team. Thanks to the one of you who appears to be doing all of the work.
		SceneTable["mp_coop_wall_2EndLevel0801"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH08.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_2start
		//You did very well.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro03.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start02",char="glados"}
		//The humans closed this test because they said it was too deadly.  I thought they would have moved it into the testing track hall of fame for that, not let it deteriorate.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_2start2
		//You failed so many times in this test, I thought you were becoming human.  But then you would just come back again and again and again.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro07.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start202",char="glados"}
		//Humans find that an admirable trait.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro08.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}],predelay=0.5}
	//mp_coop_wall_2start3
		//You did very well.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start301"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro03.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start302",char="glados"}
		//You only failed
		SceneTable["mp_coop_wall_2mp_coop_wall_2start302"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro05.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start303",char="glados"}
		//One.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start303"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_numbers11.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start304",char="glados"}
		//times in this test.  Not that it matters. It doesn't.  So congratulations  job well done.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start304"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro06.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_2start4
		//You did very well.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start401"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro03.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start402",char="glados"}
		//You only failed
		SceneTable["mp_coop_wall_2mp_coop_wall_2start402"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro05.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start403",char="glados"}
		//Two.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start403"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_numbers12.vcd"),postdelay=0.00,next="mp_coop_wall_2mp_coop_wall_2start404",char="glados"}
		//times in this test.  Not that it matters. It doesn't.  So congratulations  job well done.
		SceneTable["mp_coop_wall_2mp_coop_wall_2start404"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_intro06.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_2startreal
		//I thought going back to these old tests would satisfy me.  But try as you might to fail this next test, I still won't be satisfied.
		SceneTable["mp_coop_wall_2mp_coop_wall_2startreal00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_turret_ball01.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_catapult_wall_intro
if (GetMapName() == "mp_coop_catapult_wall_intro") {             
	//Cackle
		//[Laughter]
		SceneTable["mp_coop_catapult_wall_introCackle01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_LAUGH01.vcd"),postdelay=0.000,next=null,char="glados"}
	//CatchBall
		//Good work! Now throw the ball over the ledge.
		SceneTable["mp_coop_catapult_wall_introCatchBall01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_MISC12.vcd"),postdelay=0.000,next=null,char="glados"}
	//EndLevel12B
		//As an impartial collaboration facilitator, it would be unfair of me to name my favorite member of your team. However, it�s perfectly fair to hint at it in a way that my least favorite member probably
		SceneTable["mp_coop_catapult_wall_introEndLevel12B01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH12.vcd"),postdelay=0.3,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//EndLevel12O
		//Orange
		SceneTable["mp_coop_catapult_wall_introEndLevel12O01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEORANGE.vcd"),postdelay=0.1,next="mp_coop_catapult_wall_introEndLevel12O02",char="glados"}
		//You have a gift for these tests. That�s not just flattery. You are great at science.
		SceneTable["mp_coop_catapult_wall_introEndLevel12O02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_ONEPLAYER37.vcd"),postdelay=0.2,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//facepalmreply
		//Stop it!
		SceneTable["mp_coop_catapult_wall_introfacepalmreply01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt01.vcd"),postdelay=0.00,next="mp_coop_catapult_wall_introfacepalmreply02",char="glados",predelay=1}
		//Okay, fine. Let's all act like humans. "Look at me. Boy, do I love sweating. Let's convert beef and leaves into energy and excrete them later and go shopping."
		SceneTable["mp_coop_catapult_wall_introfacepalmreply02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt11.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_catapult_wall_introdeath
		//Your failure brings back such wonderful memories.
		SceneTable["mp_coop_catapult_wall_intromp_coop_catapult_wall_introdeath00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_wall_introdeath01.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5,skipifbusy=1}
	//mp_coop_catapult_wall_introstart
		//One of my best tests and they let plants grow here?  Can you believe this?  You can't test plants!  We tried.  They just sit there, never showing pain nor fear.
		SceneTable["mp_coop_catapult_wall_intromp_coop_catapult_wall_introstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_wall_intro01.vcd"),postdelay=0.00,next="mp_coop_catapult_wall_intromp_coop_catapult_wall_introstart02",char="glados",predelay=1}
		//That isn't science.
		SceneTable["mp_coop_catapult_wall_intromp_coop_catapult_wall_introstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_wall_intro04.vcd"),postdelay=0.00,next=null,char="glados",predelay=0}
	//mp_coop_wall_introend
		//Excellent work.
		SceneTable["mp_coop_catapult_wall_intromp_coop_wall_introend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors04.vcd"),postdelay=0.00,next="mp_coop_catapult_wall_intromp_coop_wall_introend02",char="glados"}
		//If you were human, you would want a reward for completing this test.  A reward for testing?!?!
		SceneTable["mp_coop_catapult_wall_intromp_coop_wall_introend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_doors05_alt.vcd"),postdelay=0.00,next="mp_coop_catapult_wall_intromp_coop_wall_introend03",char="glados"}
		//At least the plants didn't want a reward.
		SceneTable["mp_coop_catapult_wall_intromp_coop_wall_introend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_wall_intro06.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}],predelay=0.5}
}
//mp_coop_wall_block
if (GetMapName() == "mp_coop_wall_block") {                      
	//EndLevel05
		//Your vitals remain well within testing norms, so there is no need to worry about sudden death from collaborative shock syndrome.
		SceneTable["mp_coop_wall_blockEndLevel0501"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH14.vcd"),postdelay=0.1,next="mp_coop_wall_blockEndLevel0502",char="glados"}
		//Please continue into the next test chamber.
		SceneTable["mp_coop_wall_blockEndLevel0502"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH15.vcd"),postdelay=0.000,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_blockdeath
		//Your failing gives me no new data, it just delays the inevitable.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockdeath00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_blockdeath01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_wall_blockend
		//Congratulations.  Your ability to complete this test proves the humans wrong.  They described it as impossible, deadly, cruel, and one test subject even had the nerve to call it broken.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_block03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_blockend2
		//Congratulations.  Your ability to complete this test proves the humans wrong.  They described it as impossible, deadly, cruel, and one test subject even had the nerve to call it broken.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockend201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_block03.vcd"),postdelay=0.00,next="mp_coop_wall_blockmp_coop_wall_blockend202",char="glados"}
		//Of course the humans only had one try at it, you can just keep trying.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockend202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_block04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}]}
	//mp_coop_wall_blockstart
		//I created this test to let the humans feel good about themselves. It is extremely easy. Just follow the arrows.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_block01.vcd"),postdelay=0.00,next="mp_coop_wall_blockmp_coop_wall_blockstart02",char="glados"}
		//I'm sorry. The arrows seem to have rusted off.  Good luck.
		SceneTable["mp_coop_wall_blockmp_coop_wall_blockstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_block02.vcd"),postdelay=0.00,next=null,char="glados",predelay=5}
}
//mp_coop_catapult_2
if (GetMapName() == "mp_coop_catapult_2") {                      
	//mp_coop_catapult_2end
		//To try and make this course more exciting, I asked the reassembly machine to not reassemble you.  He refused.  I understand, that would be like asking me not to test.
		SceneTable["mp_coop_catapult_2mp_coop_catapult_2end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch01.vcd"),postdelay=0.00,next="mp_coop_catapult_2mp_coop_catapult_2end02",char="glados"}
		//Still. That would have been exciting.
		SceneTable["mp_coop_catapult_2mp_coop_catapult_2end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}],predelay=1}
	//mp_coop_catapult_2start
		//For this next test, the humans originally requested helmets to avoid brain injuries.  I ran the numbers.   Making the goo deadly was more cost effective.
		SceneTable["mp_coop_catapult_2mp_coop_catapult_2start00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_201.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_turret_walls
if (GetMapName() == "mp_coop_turret_walls") {                    
	//mp_coop_turret_wallsdeath1
		//Just stop it already.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsdeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death01.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_turret_wallsdeath2
		//And that makes 10.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death04.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_turret_wallsdeath3
		//You really don't need to keep failing.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death05.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_turret_wallsend
		//No one has ever completed this test before. The humans must have reconfigured it from my original plans.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_turret_walls04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_turret_wallsend2
		//This was another test no one had ever completed before you two.  Oh, the science we used to learn with this test.  Now the test is useless.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsend200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_turret_wall01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_turret_wallsstart
		//This is a bridge-building exercise. The humans were miserable at this, mostly because you can't build bridges out of tears.
		SceneTable["mp_coop_turret_wallsmp_coop_turret_wallsstart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_catapult_2.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_turret_ball
if (GetMapName() == "mp_coop_turret_ball") {                     
	//mp_coop_turret_balldeath1
		//If I made these tests any easier, they wouldn't be tests.
		SceneTable["mp_coop_turret_ballmp_coop_turret_balldeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death08.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_turret_balldeath2
		//Yay, Orange is back.  Testing can continue.
		SceneTable["mp_coop_turret_ballmp_coop_turret_balldeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death10.vcd"),postdelay=0.00,next=null,char="glados",predelay=3,skipifbusy=1}
	//mp_coop_turret_balldeath3
		//Yay, Blue is back.  Testing can continue.
		SceneTable["mp_coop_turret_ballmp_coop_turret_balldeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death11.vcd"),postdelay=0.00,next=null,char="glados",predelay=3,skipifbusy=1}
	//mp_coop_turret_balldeath4
		//Did you know, the reassembly machine has other things it could be reassembling?
		SceneTable["mp_coop_turret_ballmp_coop_turret_balldeath400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death16.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_turret_ballend
		//Congratulations.  I am sure if I had the time to repair these tests, you would have never completed them.  So again, congratulations on completing the broken easy tests.
		SceneTable["mp_coop_turret_ballmp_coop_turret_ballend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_turret_ball02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_turret_ballstart
		//If you are wondering what that smell is, that is the smell of human fear.
		SceneTable["mp_coop_turret_ballmp_coop_turret_ballstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_obstacle01.vcd"),postdelay=0.00,next="mp_coop_turret_ballmp_coop_turret_ballstart02",char="glados"}
		//I miss this that smell.
		SceneTable["mp_coop_turret_ballmp_coop_turret_ballstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_obstacle03_alt.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_wall_5
if (GetMapName() == "mp_coop_wall_5") {                        
	//mp_coop_wall_5end
		//In just a moment, the word 'blah' will be repeated over and over again. If at some point you hear a number rather than the word 'blah', ignore it, it is not important.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH33.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end03",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH17.vcd"),postdelay=0.2,next="mp_coop_wall_5mp_coop_wall_5end04",char="glados",fires=[{entity="@relay_explode_bots_transition",input="Trigger",parameter="",delay=0.00}]}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH18.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end05",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end05"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH19.vcd"),postdelay=0.1,next="mp_coop_wall_5mp_coop_wall_5end06",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end06"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH20.vcd"),postdelay=0.2,next="mp_coop_wall_5mp_coop_wall_5end07",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end07"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH21.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end08",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end08"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH22.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end09",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end09"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH17.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end10",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end10"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH22.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5end11",char="glados",talkover=true}
		//Blah.
		SceneTable["mp_coop_wall_5mp_coop_wall_5end11"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TEST_CHAMBER_BOTH19.vcd"),postdelay=0.00,next=null,char="glados",talkover=true}
	//mp_coop_wall_5security01
		//Today's Security Code is: 5,33,41,18
		SceneTable["mp_coop_wall_5mp_coop_wall_5security0100"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_coop_wall_5security01.vcd"),postdelay=0.00,next=null,char="announcer",fires=[{entity="@relay_explode_bots_transition",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_wall_5security02
		//Today's Security Code is: 5,33,41,18
		SceneTable["mp_coop_wall_5mp_coop_wall_5security0200"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_coop_wall_5security02.vcd"),postdelay=0.00,next=null,char="announcer"}
	//mp_coop_wall_5start
		//I am going to risk having you go outside the official courses one more time.
		SceneTable["mp_coop_wall_5mp_coop_wall_5start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_501.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5start02",char="glados"}
		//The humans accidentally forgot to put a security DVD in the player.
		SceneTable["mp_coop_wall_5mp_coop_wall_5start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_502.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5start03",char="glados"}
		//I am sure it happened by accident, but why don't you put it back in the player?
		SceneTable["mp_coop_wall_5mp_coop_wall_5start03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_503.vcd"),postdelay=0.00,next="mp_coop_wall_5mp_coop_wall_5start04",char="glados"}
		//For safety.
		SceneTable["mp_coop_wall_5mp_coop_wall_5start04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_504.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.25}
	//teamhugreply
		//Just stop flailing around like an incompetent.
		SceneTable["mp_coop_wall_5teamhugreply00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt15.vcd"),postdelay=0.00,next=null,char="glados",predelay=1.5}
}
//mp_coop_tbeam_redirect
if (GetMapName() == "mp_coop_tbeam_redirect") {                  
	//mp_coop_tbeam_redirectbbehind
		//Blue, its not nice to make fun of Orange like that.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectbbehind00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge01.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_redirectdeath
		//Credit where credit's due: you're both doing a great job of disappointing me.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc05.vcd"),postdelay=0.00,next="mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath02",char="glados",talkover=true,predelay=2.5,skipifbusy=1}
		//I just hate Blue a little more.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//mp_coop_tbeam_redirectdeath2
		//I would prefer to speak to one of you in private but since that is not an option here, I will speak in code that only one of you will understand.  Blue: Orange is plotting to destroy you.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc16.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_redirectdeath3
		//Watching you try to sabotage one other, I'm amazed you're still on friendly terms.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc11.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_redirectendsc
		//I've been doing some reading. Did you know that the word orange is derived from the same Latin root as the word traitor?
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectendsc00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc07.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_redirectobehind
		//Orange, its not nice to make fun of Blue like that.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectobehind00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge02.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_redirectstart
		//Since, I never expected you to make it this far, I have to build this new course just for you.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_redirect01a.vcd"),postdelay=0.00,next="mp_coop_tbeam_redirectmp_coop_tbeam_redirectstart02",char="glados"}
		//I have noticed you two have become extremely close.  I'm not sure I like that.
		SceneTable["mp_coop_tbeam_redirectmp_coop_tbeam_redirectstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge36.vcd"),postdelay=0.00,next=null,char="glados",predelay=1}
}
//mp_coop_tbeam_drill
if (GetMapName() == "mp_coop_tbeam_drill") {                     
	//mp_coop_tbeam_drilldeathblue
		//You were right, Orange. Blue was dumb enough to fall for your trap.
		SceneTable["mp_coop_tbeam_drillmp_coop_tbeam_drilldeathblue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_blue01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_drilldeathorange
		//Blue, that transpired just as you said it would.
		SceneTable["mp_coop_tbeam_drillmp_coop_tbeam_drilldeathorange00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_orange02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_drillend
		//Blue
		SceneTable["mp_coop_tbeam_drillmp_coop_tbeam_drillend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_NAMEBLUE.vcd"),postdelay=0.00,next="mp_coop_tbeam_drillmp_coop_tbeam_drillend02",char="glados"}
		//I can't bite my tongue anymore: You could solve this puzzle faster on your own. Orange is dragging you down. There. I've said it.
		SceneTable["mp_coop_tbeam_drillmp_coop_tbeam_drillend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_PRIVATETALK_MIX04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_drillstartsc
		//Blue, please disregard the following statement: Orange, you have been a shining light in an otherwise ungodly morass of incompetence.
		SceneTable["mp_coop_tbeam_drillmp_coop_tbeam_drillstartsc01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge_misc14.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_tbeam_catch_grind_1
if (GetMapName() == "mp_coop_tbeam_catch_grind_1") {             
	//mp_coop_tbeam_catch_grind_1start
		//Sorry I missed the beginning of that test.  I was just talking with the reassembly machine about your becoming human.
		SceneTable["mp_coop_tbeam_catch_grind_1mp_coop_tbeam_catch_grind_1start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge16_alt.vcd"),postdelay=0.00,next="mp_coop_tbeam_catch_grind_1mp_coop_tbeam_catch_grind_1start02",char="glados",predelay=10}
		//We all agree you should stop.
		SceneTable["mp_coop_tbeam_catch_grind_1mp_coop_tbeam_catch_grind_1start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge17.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//trickfirereply
		//Just stop it already.
		SceneTable["mp_coop_tbeam_catch_grind_1trickfirereply01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_catch_grind_1taunt01.vcd"),postdelay=0.00,next="mp_coop_tbeam_catch_grind_1trickfirereply02",char="glados",predelay=2}
		//You don't need to do that.
		SceneTable["mp_coop_tbeam_catch_grind_1trickfirereply02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_catch_grind_1taunt02.vcd"),postdelay=0.00,next="mp_coop_tbeam_catch_grind_1trickfirereply03",char="glados"}
		//Are you doing that just to aggravate me?
		SceneTable["mp_coop_tbeam_catch_grind_1trickfirereply03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_catch_grind_1taunt04.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}],predelay=0.5}
}
//mp_coop_tbeam_laser_1
if (GetMapName() == "mp_coop_tbeam_laser_1") {                   
	//mp_coop_tbeam_laser_1death1
		//That worked just like you said it would, Blue.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death22.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_laser_1death2
		//Orange, your plan is working perfectly.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death23.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_laser_1death3
		//Blue, why did you do that to Orange?
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death24.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_laser_1end
		//To try and make this course more exciting, I asked the reassembly machine to not reassemble you if you fail.  He refused.  I understand.  That would be like asking me not to test.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catchalt01.vcd"),postdelay=0.00,next="mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end02",char="glados"}
		//Still. That would have been exciting.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catchalt02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}],predelay=1}
	//mp_coop_tbeam_laser_1end2
		//While teamwork is needed to complete these tests, I am not sure I trust the two of you together.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge39.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}],predelay=0}
	//mp_coop_tbeam_laser_1startb
		//Blue, Orange and I were just discussing your behavoir on the last few tests.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1startb01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge23.vcd"),postdelay=0.00,next="mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1startb02",char="glados"}
		//I have to agree. Blue is penalized 75 science collaboration points.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1startb02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge24.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_laser_1starto
		//Orange, Blue and I were just discussing your behavoir on the last few tests.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1starto01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge25.vcd"),postdelay=0.00,next="mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1starto02",char="glados"}
		//I have to agree. Orange is penalized 75 science collaboration points.
		SceneTable["mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1starto02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge26.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_tbeam_polarity
if (GetMapName() == "mp_coop_tbeam_polarity") {                  
	//mp_coop_tbeam_drillendb
		//Blue to be clear, I was asking if Orange trusted you.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillendb01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge15.vcd"),postdelay=0.00,next="mp_coop_tbeam_polaritymp_coop_tbeam_drillendb02",char="glados"}
		//I trust you.  You are my favorite cooperative testing subject.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillendb02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge14.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_drillendo
		//Orange, to be clear.  I was just asking Blue if he trusted you.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillendo01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge13.vcd"),postdelay=0.00,next="mp_coop_tbeam_polaritymp_coop_tbeam_drillendo02",char="glados"}
		//I trust you.  You are my favorite cooperative testing subject.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillendo02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge14.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_drillstartb
		//Orange, how well do you really know Blue?  Do you trust Blue?
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillstartb00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge11.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_drillstarto
		//Blue, how well do you really know Orange?  Do you trust Orange?  What if I told you, you aren't Orange's first cooperative partner?
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_drillstarto00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge10.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_polaritydeathblue
		//Orange, that transpired just as you said it would.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_polaritydeathblue00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_blue02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_polaritydeathorange
		//I agree, Blue. That was entertaining.
		SceneTable["mp_coop_tbeam_polaritymp_coop_tbeam_polaritydeathorange00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_orange03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
}
//mp_coop_tbeam_polarity2
if (GetMapName() == "mp_coop_tbeam_polarity2") {                 
	//mp_coop_tbeam_polarity2 whisperb
		//Correct Blue, Orange can't hear you.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge07.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb02",char="glados"}
		//Orange did what?  Are you sure?
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge08.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb03",char="glados"}
		//Thank you, that was very brave of you to tell me.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge09.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_polarity2 whispero
		//Yes Orange, we are alone.  Blue can't hear you.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge03.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero02",char="glados"}
		//That's horrible.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge04.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero03",char="glados"}
		//I can only imagine.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge05.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero04",char="glados"}
		//What a horrible little machine.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge06.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_polarity2endscb
		//Orange, do you feel betrayed by Blue for telling me those horrible things about you?
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endscb01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge46.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endscb02",char="glados"}
		//If Blue had said those things about me, Blue would never make it to the next reassembly station.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endscb02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge47.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_polarity2endsco
		//Blue, do you feel betrayed by orange for telling me those horrible things about you?
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endsco01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge44.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endsco02",char="glados"}
		//If Orange had said those things about me, Orange would never make it to the next reassembly station.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endsco02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge45.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_polarity2startb
		//Blue, I agree.  I never noticed that about Orange before.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2startb01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge22.vcd"),postdelay=0.5,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2startb02",char="glados"}
		//Orange, is there something you would like to say?
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2startb02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TALK_AT_ONCE11.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_polarity2starto
		//Orange, I agree.  I never noticed that about Blue before.
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2starto01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfuge21.vcd"),postdelay=0.5,next="mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2starto02",char="glados"}
		//Blue, is there something you would like to say?
		SceneTable["mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2starto02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/COOP_TALK_AT_ONCE12.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_tbeam_polarity3
if (GetMapName() == "mp_coop_tbeam_polarity3") {                 
	//mp_coop_tbeam_polarity3 deathblue1
		//I agree, Orange. That was entertaining.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathblue100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_blue03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_polarity3 deathblue2
		//Yes Orange, Blue did act like a fool just now.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathblue200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_blue04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_polarity3 deathorange1
		//Yes, I know you did that, Blue. Don't look so proud.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathorange100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_orange06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_polarity3 deathorange2
		//Blue, being the last one standing is not the goal.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathorange200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_subterfugedeath_orange08.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_tbeam_polarity3end
		//At the start of this course I was worried you were becoming too close but in my attempt to drive you apart I learned something important about trust and betrayal.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3end01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_polarity3_16.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3end02",char="glados"}
		//Your brains are too small to feel either of those emotions.  So I can trust you one hundred percent.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3end02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_polarity3_17.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}],predelay=1}
	//mp_coop_tbeam_polarity3start
		//You both made it.  It seems no matter what I try to do to pull you apart or destroy you, you just keep going.  Keep testing.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_polarity3_03.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start02",char="glados"}
		//Don't either you have drive to be better than the other?
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_polarity3_05.vcd"),postdelay=0.00,next="mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start03",char="glados",predelay=0.75}
		//It's like you're just machines.
		SceneTable["mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_polarity3_06.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.5}
}
//mp_coop_tbeam_maze
if (GetMapName() == "mp_coop_tbeam_maze") {                      
	//mp_coop_tbeam_mazeend
		//Congratulations, you completed the standard section of this course.  Before we can go any further, I will need you to complete one more test outside of the standard testing track.
		SceneTable["mp_coop_tbeam_mazemp_coop_tbeam_mazeend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_maze02.vcd"),postdelay=0.00,next="mp_coop_tbeam_mazemp_coop_tbeam_mazeend02",char="glados"}
		//Please refrain from doing those childish gestures while you are out there.
		SceneTable["mp_coop_tbeam_mazemp_coop_tbeam_mazeend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_maze03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00,fireatstart=true}]}
	//mp_coop_tbeam_mazestart
		//This is the last test for the standard course.  It's just something I whipped up for you. I thought you might enjoy a challenge for once.
		SceneTable["mp_coop_tbeam_mazemp_coop_tbeam_mazestart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_maze01.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_tbeam_mazestuck
		//While I should have left both of you trapped there forever, I do need you for something else.
		SceneTable["mp_coop_tbeam_mazemp_coop_tbeam_mazestuck00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_maze05.vcd"),postdelay=0.00,next=null,char="glados",predelay=2.5}
}
//mp_coop_tbeam_end
if (GetMapName() == "mp_coop_tbeam_end") {                       
	//mp_coop_tbeam_endend
		//You did it! You powered on the system.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end10.vcd"),postdelay=0.00,next="mp_coop_tbeam_endmp_coop_tbeam_endend02",char="glados"}
		//I'm fully connected. I can see everything.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end09.vcd"),postdelay=0.00,next="mp_coop_tbeam_endmp_coop_tbeam_endend03",char="glados"}
		//See nothing bad happened.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_5end02.vcd"),postdelay=0.00,next="mp_coop_tbeam_endmp_coop_tbeam_endend04",char="glados"}
		//Excellent.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endend04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_wall_5end01.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_explode_bots_transition",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_tbeam_endstart
		//We need to find the power station at the end of this course.  The humans must have accidentally disconnected it from my grid.  I am sure it was just a clerical error.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end01.vcd"),postdelay=0.00,next="mp_coop_tbeam_endmp_coop_tbeam_endstart02",char="glados"}
		//Oh those clerks.
		SceneTable["mp_coop_tbeam_endmp_coop_tbeam_endstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end02.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.85}
	//Tbeam_enddeath1
		//Did you think the electrical switch was down there?
		SceneTable["mp_coop_tbeam_endTbeam_enddeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end11.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//Tbeam_enddeath2
		//You may want to try and avoid those turrets.
		SceneTable["mp_coop_tbeam_endTbeam_enddeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end12.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//Tbeam_enddeath3
		//You are having so much trouble navigating this space; I wish I could say I created this test.
		SceneTable["mp_coop_tbeam_endTbeam_enddeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end15.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//Tbeam_enddeath4
		//You two aren't lost are you?
		SceneTable["mp_coop_tbeam_endTbeam_enddeath400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end14.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//Tbeam_enddeath5
		//At this rate, our best hope is for the fuel cell to meltdown in 2 million years and hope the explosion powers the system.
		SceneTable["mp_coop_tbeam_endTbeam_enddeath500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_tbeam_end13.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
}
//mp_coop_paint_come_along
if (GetMapName() == "mp_coop_paint_come_along") {                
	//mp_coop_humanresourcedeath1
		//Now, you are just wasting my time.
		SceneTable["mp_coop_paint_come_alongmp_coop_humanresourcedeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2,skipifbusy=1}
	//mp_coop_humanresourcedeath3
		//I am not sure how I can make these tests any easier for you.
		SceneTable["mp_coop_paint_come_alongmp_coop_humanresourcedeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath03.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_humanresourcedeath4
		//If you can't complete these tests, we will never free the humans!
		SceneTable["mp_coop_paint_come_alongmp_coop_humanresourcedeath400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath04.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_humanresourcedeath5
		//If you can't complete this course, those humans will die. Do you want that?
		SceneTable["mp_coop_paint_come_alongmp_coop_humanresourcedeath500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath07.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_humanresourcedeath6
		//If you can't complete this course, those humans will die. Do you want that in your memory banks?
		SceneTable["mp_coop_paint_come_alongmp_coop_humanresourcedeath600"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath08.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_paint_come_alongend
		//Congratulations on completing the test. You two really are the best cooperative testing team I could ever ask for.
		SceneTable["mp_coop_paint_come_alongmp_coop_paint_come_alongend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along11.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_come_alongstart
		//This final course is training to reach the human vault.  So this actually has a purpose.  Those other courses were fun, but let's be honest, I need human test subjects for it to be science.
		SceneTable["mp_coop_paint_come_alongmp_coop_paint_come_alongstart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along10.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_redirect
if (GetMapName() == "mp_coop_paint_redirect") {                  
	//mp_coop_paint_redirectdeath2
		//This close and that's what you do?
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro65.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_redirectdeath3
		//You are making this harder than it needs to be.
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro74.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_redirectend
		//To start preparing for human testing again,  I checked an old suggestion box.  The number one request?  Less deadly tests.
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_redirect07.vcd"),postdelay=0.00,next="mp_coop_paint_redirectmp_coop_paint_redirectend02",char="glados"}
		//That's ridiculous, how do they know for sure the tests are deadly if they could still write the suggestion?
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_redirect08.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_redirectstart
		//Are you curious about the humans? It seems some of the last non-testing humans alive tried to secretly imprison other humans and hide their tracks.
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_redirect01.vcd"),postdelay=0.00,next="mp_coop_paint_redirectmp_coop_paint_redirectstart02",char="glados"}
		//I think they wanted to punish them by not allowing me to include them in testing.
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_redirect04.vcd"),postdelay=0.00,next="mp_coop_paint_redirectmp_coop_paint_redirectstart03",char="glados"}
		//That's why humans couldn't complete these courses, they treat their friends as enemies.
		SceneTable["mp_coop_paint_redirectmp_coop_paint_redirectstart03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_redirect06.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_bridge
if (GetMapName() == "mp_coop_paint_bridge") {                    
	//mp_coop_humanresourcedeath2
		//Your failing does not make this science.
		SceneTable["mp_coop_paint_bridgemp_coop_humanresourcedeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_humanresourcedeath02.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_humanresourcedeath2a
		//This isn't that hard.
		SceneTable["mp_coop_paint_bridgemp_coop_humanresourcedeath2a01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro73.vcd"),postdelay=0.00,next="mp_coop_paint_bridgemp_coop_humanresourcedeath2a02",char="glados",talkover=true,predelay=2.5,skipifbusy=1}
		//The humans can't free themselves.
		SceneTable["mp_coop_paint_bridgemp_coop_humanresourcedeath2a02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro67.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_bridgedeath
		//Lucky for you two, while I cannot control the world outside of the testing courses, the reassembly machine can continue with his work.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgedeath01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridgedeath01.vcd"),postdelay=0.00,next="mp_coop_paint_bridgemp_coop_paint_bridgedeath02",char="glados"}
		//You will need him for the final track.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgedeath02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridgedeath02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_bridgenodeath
		//While I cannot control the world outside of the testing courses, the reassembly machine can continue with his work.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgenodeath01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridgenodeath01.vcd"),postdelay=0.00,next="mp_coop_paint_bridgemp_coop_paint_bridgenodeath02",char="glados"}
		//I am not sure you will need him but he will be there.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgenodeath02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridgenodeath02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_bridgestart
		//To get to the Vault, you are going to need to use all the tricks you have learned.  To help, I have made these tests extremely difficult.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgestart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridge01.vcd"),postdelay=0.00,next="mp_coop_paint_bridgemp_coop_paint_bridgestart02",char="glados"}
		//I would say extremely deadly but we all know, for you and your amazing ability to be reassembled nothing is deadly.
		SceneTable["mp_coop_paint_bridgemp_coop_paint_bridgestart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_bridge02.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_walljumps
if (GetMapName() == "mp_coop_paint_walljumps") {       
	//mp_coop_paint_walljumpsend
		//I wonder if the humans will make a statue of me for rescuing them?  Oh, don't worry, if they ever write a historical document of my heroic rescue, I will make sure your names are included in the footnotes.
		SceneTable["mp_coop_paint_walljumpsmp_coop_paint_walljumpsend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_walljumps02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_walljumpsstart
		//I didn't mean to make you feel bad earlier about your tests not being real science.  I guess finding out they weren't science was some sort of test in and of itself.
		SceneTable["mp_coop_paint_walljumpsmp_coop_paint_walljumpsstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_walljumps01.vcd"),postdelay=0.00,next="mp_coop_paint_walljumpsmp_coop_paint_walljumpsstart02",char="glados"}
		//Congratulations on passing that test.
		SceneTable["mp_coop_paint_walljumpsmp_coop_paint_walljumpsstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_walljumps04.vcd"),postdelay=0.00,next=null,char="glados",predelay=1}
}
//mp_coop_paint_speed_fling
if (GetMapName() == "mp_coop_paint_speed_fling") {               
	//mp_coop_paint_speed_fling death
		//This close and you are going to fail me?
		SceneTable["mp_coop_paint_speed_flingmp_coop_paint_speed_fling death00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro71.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_speed_flingend
		//At the rate you are completing these tests, I am beginning to think you don't share my excitement for rescuing crying trapped injured dying humans.
		SceneTable["mp_coop_paint_speed_flingmp_coop_paint_speed_flingend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_fling02.vcd"),postdelay=0.00,next="mp_coop_paint_speed_flingmp_coop_paint_speed_flingend02",char="glados"}
		//If that doesn't motivate you, I'm not sure what will.
		SceneTable["mp_coop_paint_speed_flingmp_coop_paint_speed_flingend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_fling03.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_speed_flingstart
		//While I will receive all the glory for the rescue don't think you two aren't going to get something.  The bond you form during these tests will last a lifetime.
		SceneTable["mp_coop_paint_speed_flingmp_coop_paint_speed_flingstart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_fling01.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_red_racer
if (GetMapName() == "mp_coop_paint_red_racer") {                 
	//mp_coop_paint_red_racerdeath1
		//Did you think that would be funny?
		SceneTable["mp_coop_paint_red_racermp_coop_paint_red_racerdeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death17.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_paint_red_racerdeath2
		//Are you testing me?
		SceneTable["mp_coop_paint_red_racermp_coop_paint_red_racerdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death12.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_paint_red_racerdeath3
		//If at first you don't succeed, fail 5 more times.
		SceneTable["mp_coop_paint_red_racermp_coop_paint_red_racerdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death06.vcd"),postdelay=0.00,next=null,char="glados",predelay=2,skipifbusy=1}
	//mp_coop_paint_red_racerend
		//We are only two  tests away from reaching the humans, are you as excited as I am?
		SceneTable["mp_coop_paint_red_racermp_coop_paint_red_racerend00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_red_racer02.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}]}
	//mp_coop_paint_red_racerstart
		//Maybe you two have never met humans?  They are as bad as you might think, smelly, gross, annoying, often wanting to try and kill you.  But they do make great test subjects.
		SceneTable["mp_coop_paint_red_racermp_coop_paint_red_racerstart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_red_racer01.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_speed_catch
if (GetMapName() == "mp_coop_paint_speed_catch") {               
	//mp_coop_paint_speed_catchend
		//In case you are worried about the humans, don't be. They aren't all monsters.
		SceneTable["mp_coop_paint_speed_catchmp_coop_paint_speed_catchend01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch06.vcd"),postdelay=0.00,next="mp_coop_paint_speed_catchmp_coop_paint_speed_catchend02",char="glados"}
		//Most of them are simply good test subjects.
		SceneTable["mp_coop_paint_speed_catchmp_coop_paint_speed_catchend02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch07.vcd"),postdelay=0.00,next="mp_coop_paint_speed_catchmp_coop_paint_speed_catchend03",char="glados"}
		//I believe the ratio of good test subjects to monsters is about...  a million to 1.
		SceneTable["mp_coop_paint_speed_catchmp_coop_paint_speed_catchend03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch08.vcd"),postdelay=0.00,next=null,char="glados",fires=[{entity="@relay_enable_exit",input="Trigger",parameter="",delay=0.00}],predelay=0.5}
	//mp_coop_paint_speed_catchstart
		//Only one more test after this.
		SceneTable["mp_coop_paint_speed_catchmp_coop_paint_speed_catchstart01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch04.vcd"),postdelay=0.00,next="mp_coop_paint_speed_catchmp_coop_paint_speed_catchstart02",char="glados"}
		//I know your cores are reused from calculation machines, built for simple mathematical operations and not for testing, but if we can rescue the humans I promise you something to add maybe even subtract.
		SceneTable["mp_coop_paint_speed_catchmp_coop_paint_speed_catchstart02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_speed_catch05.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_paint_longjump_intro
if (GetMapName() == "mp_coop_paint_longjump_intro") {            
	//mp_coop_paint_longjump_introdeath1
		//Stop failing, you need to find the vault door.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro69.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_longjump_introdeath2
		//Stop doing that! All you need to do is open the Vault door!
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro70.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_longjump_introdeath3
		//I'm starting to think you don't want to rescue the humans.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro75.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_longjump_introdeath4
		//This close and you are going to fail me?
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro72.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=2.5,skipifbusy=1}
	//mp_coop_paint_longjump_introend1
		//Something is wrong, this door should be opening.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro64.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend10
		//You can't give up now.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1000"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro58.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend11
		//What about that camera?
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro59.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend12
		//We're so close, you can't fail now!
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro60.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend2
		//This lock requires humans.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro03.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend3
		//The locking mechanism can tell you aren't humans.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro04.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend4
		//Do something only a human would do.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro05.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend5
		//Try one of those childish gestures.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro06.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend6
		//You both need to do something.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend600"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro45.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend7
		//The lock is looking for two humans.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend700"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro46.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend8
		//Try something.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend800"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro53.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introend9
		//Is that camera is hooked into the lock?
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introend900"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro54.vcd"),postdelay=0.00,next=null,char="glados",skipifbusy=1}
	//mp_coop_paint_longjump_introendx
		//You did it!
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introendx01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro08.vcd"),postdelay=0.00,next=null,char="glados",predelay=1}
	//mp_coop_paint_longjump_introstart
		//The human vault is just past that opening.   I entered the security code but the vault door remains locked.  I am going to need you to activate the manual locks on the vault door itself.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introstart00"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro44.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_paint_longjump_introTauntBlue
		//Orange what did you do?
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntBlue01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro50.vcd"),postdelay=0.00,next="mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntBlue02",char="glados"}
		//Blue do what Orange just did.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntBlue02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro52.vcd"),postdelay=0.00,next=null,char="glados"}
	//mp_coop_paint_longjump_introTauntOrange
		//Blue what did you do?
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntOrange01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro49.vcd"),postdelay=0.00,next="mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntOrange02",char="glados"}
		//Orange do what Blue just did.
		SceneTable["mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntOrange02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_longjump_intro51.vcd"),postdelay=0.00,next=null,char="glados"}
}
//mp_coop_lobby
if ((GetMapName() == "mp_coop_lobby_2") || (GetMapName() == "mp_coop_lobby_3")) {                         
	//coop_hub_return1
		//Welcome to the Computer Intelligence Training and Enrichment Center Human Test Subject Research Center.  You have unlocked all available courses.
		SceneTable["mp_coop_lobbycoop_hub_return100"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_announcer_hub01.vcd"),postdelay=0.00,next=null,char="announcer",talkover=true,predelay=3}
	//coop_hub_return2
		//Warning! Warning! All testing courses are currently available.
		SceneTable["mp_coop_lobbycoop_hub_return200"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_announcer_hub02.vcd"),postdelay=0.00,next=null,char="announcer"}
	//coop_hub_return3
		//Congratulations on successfully returning to the central hub room.  From here you can select all previously completed courses.
		SceneTable["mp_coop_lobbycoop_hub_return300"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_announcer_hub03.vcd"),postdelay=0.00,next=null,char="announcer"}
	//coop_hub_track01
		//This is the Computer Intelligence Training and Enrichment Center Human Test Subject Research Center or SinTech.
		SceneTable["mp_coop_lobbycoop_hub_track0101"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track05.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0102",char="glados"}
		//But why don't we all just agree to call it the hub?
		SceneTable["mp_coop_lobbycoop_hub_track0102"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track06.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0103",char="glados"}
		//All cooperative testing courses begin at this central hub.
		SceneTable["mp_coop_lobbycoop_hub_track0103"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track14.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0104",char="glados"}
		//From here we transport you to the new testing course.
		SceneTable["mp_coop_lobbycoop_hub_track0104"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track16.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_hub_track02
		//Stop it!
		SceneTable["mp_coop_lobbycoop_hub_track0201"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt01.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0202",char="glados",predelay=2.0}
		//What if you froze like that?
		SceneTable["mp_coop_lobbycoop_hub_track0202"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt02.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0203",char="glados"}
		//There must be something wrong with the reassembly machine.
		SceneTable["mp_coop_lobbycoop_hub_track0203"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt05.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0204",char="glados",predelay=0.5}
		//Well, let's do some tests and see what happens.
		SceneTable["mp_coop_lobbycoop_hub_track0204"] <- {vcd=CreateSceneEntity("scenes/npc/glados/botcoop_artifactone_hub08.vcd"),postdelay=0.00,next=null,char="glados",predelay=0.2}
	//coop_hub_track03
		//I don't know what you think you are doing, but I don't like it.  I want you to stop.
		SceneTable["mp_coop_lobbycoop_hub_track0301"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track09.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0302",char="glados",predelay=2.0}
		//Maybe I shouldn't send you outside of the official testing courses, you are picking up some bad human traits.
		SceneTable["mp_coop_lobbycoop_hub_track0302"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track10.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0303",char="glados"}
		//And trust me, humans only have one good trait.
		SceneTable["mp_coop_lobbycoop_hub_track0303"] <- {vcd=CreateSceneEntity("scenes/npc/glados/coop_hub_track11.vcd"),postdelay=0.00,next=null,char="glados"}
	//coop_hub_track04
		//I never expected you to make it this far.  To be honest, after your performance in the calibration test I was ready to break down your cores and put them back in the scientific calculators I took them from.
		SceneTable["mp_coop_lobbycoop_hub_track0401"] <- {vcd=CreateSceneEntity("scenes/npc/glados/hub04_01.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0402",char="glados"}
		//But you two have become quite the team.  Extremely close.
		SceneTable["mp_coop_lobbycoop_hub_track0402"] <- {vcd=CreateSceneEntity("scenes/npc/glados/hub04_02.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0403",char="glados"}
		//I have only met one other team closer and one of them was an imbecile I had to destroy.
		SceneTable["mp_coop_lobbycoop_hub_track0403"] <- {vcd=CreateSceneEntity("scenes/npc/glados/hub04_03.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0404",char="glados"}
		//The other?  Well...
		SceneTable["mp_coop_lobbycoop_hub_track0404"] <- {vcd=CreateSceneEntity("scenes/npc/glados/hub04_04.vcd"),postdelay=0.75,next="mp_coop_lobbycoop_hub_track0405",char="glados"}
		//I don't think I want to go through that again.
		SceneTable["mp_coop_lobbycoop_hub_track0405"] <- {vcd=CreateSceneEntity("scenes/npc/glados/hub04_05.vcd"),postdelay=0.00,next=null,char="glados",predelay=1}
	//coop_hub_track05
		//Congratulations on completing the Aperture Science standard cooperative testing courses.
		SceneTable["mp_coop_lobbycoop_hub_track0501"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along01.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0502",char="glados"}
		//To celebrate, I have a surprise for you!
		SceneTable["mp_coop_lobbycoop_hub_track0502"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along02.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0503",char="glados"}
		//An extra special bonus course that ends with us finding and freeing humans!
		SceneTable["mp_coop_lobbycoop_hub_track0503"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along03.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0504",char="glados",fires=[{entity="relay_reveal_paint",input="Trigger",parameter="",delay=1.00}]}
		//Thanks to you, I know where to find them, I removed their security and powered up their - uh - rescue door.
		SceneTable["mp_coop_lobbycoop_hub_track0504"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along04.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0505",char="glados",predelay=1.5}
		//Now, we just need you to release the humans from their imprisonment.
		SceneTable["mp_coop_lobbycoop_hub_track0505"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along05.vcd"),postdelay=0.00,next="mp_coop_lobbycoop_hub_track0506",char="glados"}
		//They'll probably throw you a party.
		SceneTable["mp_coop_lobbycoop_hub_track0506"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_paint_come_along06.vcd"),postdelay=0.00,next=null,char="glados",predelay=1}
	//coop_hub_trackdeath01
		//I know you like to think the reassembly machine is at your beck and call, but he has a life you know.  He's not your slave.
		SceneTable["mp_coop_lobbycoop_hub_trackdeath0100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_coop_rat_mazedeath04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//coop_hub_trackdeath02
		//How can you fail at this?  It isn't even a test.
		SceneTable["mp_coop_lobbycoop_hub_trackdeath0200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death18.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//coop_hub_trackdeath03
		//I hope that was some kind of joke.
		SceneTable["mp_coop_lobbycoop_hub_trackdeath0300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death19.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//coop_hub_trackdeath04
		//I honestly never thought we would need to track how many times died in the hub.
		SceneTable["mp_coop_lobbycoop_hub_trackdeath0400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death20.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//coop_hub_trackdeath05
		//And here I thought this room was dangerously unlethal.
		SceneTable["mp_coop_lobbycoop_hub_trackdeath0500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_death21.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,skipifbusy=1}
	//hub_return11
		//Welcome back to the Computer Intelligence Training and Enrichment Center Human Test Subject Research Center.
		SceneTable["mp_coop_lobbyhub_return1100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return02a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return12
		//Hello again, did you know these are the only set of tests available to you� you are going to need to select them again.
		SceneTable["mp_coop_lobbyhub_return1200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn03.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return13
		//I guess quitting that course together is a sign of teamwork.
		SceneTable["mp_coop_lobbyhub_return1300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn07.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return14
		//The way you two just gave up on that test together shows you are really working as a team.
		SceneTable["mp_coop_lobbyhub_return1400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn08.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return21
		//Welcome back to the hub, did you fail at selecting the correct course?
		SceneTable["mp_coop_lobbyhub_return2100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return05a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return22
		//Welcome back to the Computer Intelligence Training and Enrichment Center Human Test Subject Research Center. [laughs]
		SceneTable["mp_coop_lobbyhub_return2200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return01a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return23
		//Look who's back, were you scared to continue those tests?
		SceneTable["mp_coop_lobbyhub_return2300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn01.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return24
		//If at first you don't succeed, quit and try another course.
		SceneTable["mp_coop_lobbyhub_return2400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn04.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return31
		//Welcome back, testing is available.
		SceneTable["mp_coop_lobbyhub_return3100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return03a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return32
		//Was that course too difficult?
		SceneTable["mp_coop_lobbyhub_return3200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return06a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return33
		//Back again?  Maybe you can just stay and live here in the hub?
		SceneTable["mp_coop_lobbyhub_return3300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn05.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return41
		//Blue, I wouldn't have trusted Orange in that course either.
		SceneTable["mp_coop_lobbyhub_return4100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn11.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return42
		//Look who's back, were you scared to continue those tests?
		SceneTable["mp_coop_lobbyhub_return4200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn02.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return43
		//Back again?  Maybe you can just stay and live here.
		SceneTable["mp_coop_lobbyhub_return4300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn06.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return51
		//Are you scared to save those humans?
		SceneTable["mp_coop_lobbyhub_return5100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn09.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return52
		//Are you scared to save those humans?
		SceneTable["mp_coop_lobbyhub_return5200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hubreturn10.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_return53
		//Welcome back quitters, maybe you can find another course for you to fail.
		SceneTable["mp_coop_lobbyhub_return5300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_hub_return04a.vcd"),postdelay=0.00,next=null,char="glados"}
	//hub_returnall1
		//Welcome to the Computer Intelligence Training and Enrichment Center Human Test Subject Research Center.  You have unlocked all available courses.
		SceneTable["mp_coop_lobbyhub_returnall100"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return01.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall2
		//Warning! All testing courses are currently available.
		SceneTable["mp_coop_lobbyhub_returnall200"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return02.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall3
		//Congratulations on successfully returning to the central hub room.  From here you can select all previously completed courses.
		SceneTable["mp_coop_lobbyhub_returnall300"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return03.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall4
		//For your testing convenience, all tests are available and all safety precautions within testing chambers have been deactivated.
		SceneTable["mp_coop_lobbyhub_returnall400"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return04.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall5
		//Welcome back to the central hub. All test courses are available. You may redundantly solve the courses at your leisure.
		SceneTable["mp_coop_lobbyhub_returnall500"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return05.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall6
		//Thank you for completing the testing courses. If you enjoyed your experience, you may now re-enter the testing course of your choice.
		SceneTable["mp_coop_lobbyhub_returnall600"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return06.vcd"),postdelay=0.00,next=null,char="announcer"}
	//hub_returnall7
		//By completing all test courses, you have achieved Level C security clearance. You may now access all testing courses and three of Aperture Science's 176 restrooms.
		SceneTable["mp_coop_lobbyhub_returnall700"] <- {vcd=CreateSceneEntity("scenes/npc/announcer/mp_hub_return07.vcd"),postdelay=0.00,next=null,char="announcer"}
//mp_coop_lobby2                          
//taunts                                  
	//tauntstory
		//Stop it!
		SceneTable["tauntstauntstory01"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt01.vcd"),postdelay=0.00,next="tauntstauntstory02",char="glados",predelay=1.5}
		//Did you know we originally used these cameras to capture moments of intense pain and agony in test subjects?
		SceneTable["tauntstauntstory02"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_humanresources01.vcd"),postdelay=0.00,next="tauntstauntstory03",char="glados",predelay=0.5}
		//If the subject survived the test, we let them purchase the pictures for $5.  If the subject died, we gave the photo to their next of kin free of charge.
		SceneTable["tauntstauntstory03"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_humanresources03.vcd"),postdelay=0.00,next="tauntstauntstory04",char="glados"}
		//The photos weren't as popular as we had hoped, so we repurposed the cameras.
		SceneTable["tauntstauntstory04"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_humanresources04.vcd"),postdelay=0.00,next=null,char="glados"}
	//taunt_big_wave1
		//Yes, I see you.
		SceneTable["tauntstaunt_big_wave100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_big_wave05.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_big_wave2
		//I'm seriously not paying atten-- STOP THAT RIGHT NOW!
		SceneTable["tauntstaunt_big_wave200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_big_wave06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_big_wave3
		//Keep it up and your arm will get stuck like that.
		SceneTable["tauntstaunt_big_wave300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_big_wave01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_big_wave4
		//Hellllooo, imbecile.
		SceneTable["tauntstaunt_big_wave400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_big_wave02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_big_wave5
		//Yes, I see you waving.
		SceneTable["tauntstaunt_big_wave500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_big_wave07.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_cannonball1
		//Good job jumping. You must be very proud.
		SceneTable["tauntstaunt_cannonball100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_cannonball01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_cannonball2
		//I hardly think you're even trying with these gestures anymore.
		SceneTable["tauntstaunt_cannonball200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_cannonball02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_cannonball3
		//Did something happen? [yawn] I wasn't watching.
		SceneTable["tauntstaunt_cannonball300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_cannonball03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_highfive1
		//That is not part of the test.
		SceneTable["tauntstaunt_highfive100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_highfive01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_highfive2
		//Slapping hands. That accomplishes something.
		SceneTable["tauntstaunt_highfive200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_highfive03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_highfive3
		//If you're going to hit each other, at least aim for the head.
		SceneTable["tauntstaunt_highfive300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_highfive04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_highfive4
		//You're doing a great job of disappointing me.
		SceneTable["tauntstaunt_highfive400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh1
		//You know what makes me laugh? The thought of you cutting that out.
		SceneTable["tauntstaunt_laugh100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_laugh02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh2
		//Yes. Let's all laugh. Ha. Ha. Ha.
		SceneTable["tauntstaunt_laugh200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_laugh05.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh3
		//Ha ha ha ha ha, good one.
		SceneTable["tauntstaunt_laugh300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_laugh03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh4
		//You know what makes me laugh? The thought of you stopping that.
		SceneTable["tauntstaunt_laugh400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_laugh01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh5
		//Ha ha ha ha ha. Did I tell you the one about the turned-off reassembly machine?
		SceneTable["tauntstaunt_laugh500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_laugh06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_laugh6
		//Is it the lack of mirrors in test chambers that encourages you to do this?
		SceneTable["tauntstaunt_laugh600"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts05.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple1
		//Are you broken? It looks like you're malfunctioning.
		SceneTable["tauntstaunt_robot_arm_ripple100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple2
		//Really, not even humans do that anymore.
		SceneTable["tauntstaunt_robot_arm_ripple200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple3
		//You're no longer bothering me. You're only hurting my impression of you.
		SceneTable["tauntstaunt_robot_arm_ripple300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple4
		//Look at you. Dancing.
		SceneTable["tauntstaunt_robot_arm_ripple400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple5
		//If you were wondering how could you annoy me without failing a test.  Now you know.
		SceneTable["tauntstaunt_robot_arm_ripple500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple05.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple6
		//Oh great, dancing again.
		SceneTable["tauntstaunt_robot_arm_ripple600"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_robot_arm_ripple06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_robot_arm_ripple7
		//DANCING is NOT SCIENCE!
		SceneTable["tauntstaunt_robot_arm_ripple700"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts06.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_rockpaperscissors1
		//I defy you to tell me there's a purpose to what you're doing.
		SceneTable["tauntstaunt_rockpaperscissors100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_rockpaperscissors01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_rockpaperscissors3
		//Come on. You were raised better than that.
		SceneTable["tauntstaunt_rockpaperscissors300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave1
		//Yes, I see you, and no, I don't care.
		SceneTable["tauntstaunt_small_wave100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave2
		//Yes? Something you need?
		SceneTable["tauntstaunt_small_wave200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave3
		//You do know I can't wave back right?
		SceneTable["tauntstaunt_small_wave300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave4
		//Stop with the waves.
		SceneTable["tauntstaunt_small_wave400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave_portalgun1
		//Are you trying to get my attention? I am very busy, you know.
		SceneTable["tauntstaunt_small_wave_portalgun100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave_portalgun01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave_portalgun2
		//Not paying attennnntion...
		SceneTable["tauntstaunt_small_wave_portalgun200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave_portalgun02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_small_wave_portalgun3
		//Are you expecting applause?
		SceneTable["tauntstaunt_small_wave_portalgun300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_small_wave_portalgun03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_somersault1
		//I give you a score of 3.4 for style and 10 for being annoying.
		SceneTable["tauntstaunt_somersault100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_somersault01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_somersault2
		//A somersault is just falling over in style. Congratulations on being clumsy.
		SceneTable["tauntstaunt_somersault200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_somersault02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_somersault3
		//If I stop watching, I'm sure you'll get bored of this.
		SceneTable["tauntstaunt_somersault300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_somersault03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_splits1
		//All right. I'm officially no longer paying attention to you.
		SceneTable["tauntstaunt_splits100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_splits01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_splits2
		//You're the type of show-off who only shows off really stupid things.
		SceneTable["tauntstaunt_splits200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_splits03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamhug1
		//It appears you're developing human traits. The worst human traits.
		SceneTable["tauntstaunt_teamhug100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamhug01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamhug2
		//Be careful. Hugging can lead to... well, me disassembling you forever.
		SceneTable["tauntstaunt_teamhug200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamhug02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamhug3
		//Stop touching each other!
		SceneTable["tauntstaunt_teamhug300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamhug03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamhug4
		//Your eagerness to test pleases me. Your inane gesturing does not.
		SceneTable["tauntstaunt_teamhug400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamtease1
		//Are you trying to impress me? What would impress me more is if you never did that again.
		SceneTable["tauntstaunt_teamtease100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamtease01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamtease2
		//I'll interpret that gesture to mean that you want me to become even more vindictive toward you.
		SceneTable["tauntstaunt_teamtease200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamtease02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamtease3
		//Orange, I certainly expected more from you.
		SceneTable["tauntstaunt_teamtease300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamtease03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamtease4
		//Blue, don't sink to Orange's level.
		SceneTable["tauntstaunt_teamtease400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_teamtease04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_teamtease5
		//Even humans, as stupid as they are, would say you look stupid when you do that.
		SceneTable["tauntstaunt_teamtease500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire2
		//You really aren't getting tired of that, are you?
		SceneTable["tauntstaunt_trickfire200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/anti_taunt14.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire3
		//All right. I'm officially no longer paying attention to you.
		SceneTable["tauntstaunt_trickfire300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_splits02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire4
		//You're doing a great job of disappointing me.
		SceneTable["tauntstaunt_trickfire400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/mp_taunts03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire_handstand1
		//Now you're thinking with stupidity.
		SceneTable["tauntstaunt_trickfire_handstand100"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_trickfire_handstand01.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire_handstand2
		//Now you're just not thinking.
		SceneTable["tauntstaunt_trickfire_handstand200"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_trickfire_handstand02.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire_handstand3
		//Congratulations. You're upside down now.
		SceneTable["tauntstaunt_trickfire_handstand300"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_trickfire_handstand03.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire_handstand4
		//I'm starting to think giving you arms was a big mistake.
		SceneTable["tauntstaunt_trickfire_handstand400"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_trickfire_handstand05.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
	//taunt_trickfire_handstand5
		//You're going to hurt yourself doing that and then I will be ECSTATIC.
		SceneTable["tauntstaunt_trickfire_handstand500"] <- {vcd=CreateSceneEntity("scenes/npc/glados/taunt_trickfire_handstand04.vcd"),postdelay=0.00,next=null,char="glados",talkover=true,predelay=3,skipifbusy=1}
}
//SceneTableLookup
	SceneTableLookup <- {}
	SceneTableLookup[8] <- "mp_coop_startBlueFirstToEnd01"
	SceneTableLookup[1] <- "mp_coop_startBlueGetsGunFirst01"
	SceneTableLookup[3] <- "mp_coop_startBlueGetsGunSecond01"
	SceneTableLookup[5] <- "mp_coop_startBlueInterruptsRelaxationVault01"
	SceneTableLookup[1006] <- "mp_coop_startcoop_boxcalibration00"
	SceneTableLookup[1004] <- "mp_coop_startcoop_buttoncallibrationblue00"
	SceneTableLookup[1005] <- "mp_coop_startcoop_buttoncallibrationorange00"
	SceneTableLookup[1007] <- "mp_coop_startcoop_callibrationcomplete100"
	SceneTableLookup[32] <- "mp_coop_startcoop_ping_blue_success00"
	SceneTableLookup[30] <- "mp_coop_startcoop_ping_intro_animal00"
	SceneTableLookup[1331] <- "mp_coop_startcoop_ping_intro_blue_nag01"
	SceneTableLookup[1332] <- "mp_coop_startcoop_ping_intro_orange_nag01"
	SceneTableLookup[33] <- "mp_coop_startcoop_ping_orange_start01"
	SceneTableLookup[34] <- "mp_coop_startcoop_ping_orange_success02"
	SceneTableLookup[27] <- "mp_coop_startcoop_portal_ping_intro00"
	SceneTableLookup[1000] <- "mp_coop_startcoop_pregun_pingnag1blue00"
	SceneTableLookup[1014] <- "mp_coop_startcoop_pregun_pingnag1orange00"
	SceneTableLookup[1001] <- "mp_coop_startcoop_pregun_pingnag2blue00"
	SceneTableLookup[1015] <- "mp_coop_startcoop_pregun_pingnag2orange00"
	SceneTableLookup[50] <- "mp_coop_startcoop_results_1_0100"
	SceneTableLookup[1023] <- "mp_coop_startcoop_startboxcatch00"
	SceneTableLookup[1002] <- "mp_coop_startcoop_starttwoportals00"
	SceneTableLookup[1084] <- "mp_coop_startmp_coop_startdeath0100"
	SceneTableLookup[1085] <- "mp_coop_startmp_coop_startdeath0200"
	SceneTableLookup[1086] <- "mp_coop_startmp_coop_startdeath0300"
	SceneTableLookup[1087] <- "mp_coop_startmp_coop_startdeath0400"
	SceneTableLookup[1088] <- "mp_coop_startmp_coop_startdeath0500"
	SceneTableLookup[1064] <- "mp_coop_startmp_coop_startposttaunt01"
	SceneTableLookup[7] <- "mp_coop_startOneBlah01"
	SceneTableLookup[9] <- "mp_coop_startOrangeFirstToEnd01"
	SceneTableLookup[2] <- "mp_coop_startOrangeGetsGunFirst01"
	SceneTableLookup[4] <- "mp_coop_startOrangeGetsGunSecond01"
	SceneTableLookup[6] <- "mp_coop_startOrangeInterruptsRelaxationVault01"
	SceneTableLookup[0] <- "mp_coop_startRelaxationVaultIntro00"
	SceneTableLookup[11] <- "mp_coop_startTTT2GO101"
	SceneTableLookup[12] <- "mp_coop_startTTT2GO201"
	SceneTableLookup[10] <- "mp_coop_startTTT2Intro01"
	SceneTableLookup[1012] <- "mp_coop_doorscoop_score_blue0501"
	SceneTableLookup[1013] <- "mp_coop_doorscoop_score_orange0501"
	SceneTableLookup[1011] <- "mp_coop_doorsmo_coop_doorsend00"
	SceneTableLookup[54] <- "mp_coop_doorsmp_coop_doorsstart01"
	SceneTableLookup[1151] <- "mp_coop_doorsmp_coop_teamworkdeath100"
	SceneTableLookup[1152] <- "mp_coop_doorsmp_coop_teamworkdeath200"
	SceneTableLookup[1153] <- "mp_coop_doorsmp_coop_teamworkdeath300"
	SceneTableLookup[1154] <- "mp_coop_doorsmp_coop_teamworkdeath400"
	SceneTableLookup[1155] <- "mp_coop_doorsmp_coop_teamworkdeath500"
	SceneTableLookup[18] <- "mp_coop_race_2EndLevel0701"
	SceneTableLookup[1022] <- "mp_coop_race_2mp_coop_race_2start01"
	SceneTableLookup[1016] <- "mp_coop_laser_2coop_laser_2end00"
	SceneTableLookup[1024] <- "mp_coop_laser_2coop_score_blue0301"
	SceneTableLookup[1026] <- "mp_coop_laser_2coop_score_blue0801"
	SceneTableLookup[1025] <- "mp_coop_laser_2coop_score_orange0301"
	SceneTableLookup[1027] <- "mp_coop_laser_2coop_score_orange0801"
	SceneTableLookup[15] <- "mp_coop_laser_2EndLevel0401"
	SceneTableLookup[1028] <- "mp_coop_laser_2mp_coop_laserkill01"
	SceneTableLookup[1065] <- "mp_coop_laser_2mp_coop_laser_2taunt01"
	SceneTableLookup[1038] <- "mp_coop_rat_mazemp_coop_blue_penalized_401"
	SceneTableLookup[1036] <- "mp_coop_rat_mazemp_coop_laser_2endblue01"
	SceneTableLookup[1037] <- "mp_coop_rat_mazemp_coop_laser_2endorange01"
	SceneTableLookup[1039] <- "mp_coop_rat_mazemp_coop_orange_penalized_401"
	SceneTableLookup[1043] <- "mp_coop_rat_mazemp_coop_rat_mazebluecrush00"
	SceneTableLookup[1045] <- "mp_coop_rat_mazemp_coop_rat_mazebluecrush200"
	SceneTableLookup[1047] <- "mp_coop_rat_mazemp_coop_rat_mazebluecrush300"
	SceneTableLookup[1044] <- "mp_coop_rat_mazemp_coop_rat_mazeorangecrush00"
	SceneTableLookup[1046] <- "mp_coop_rat_mazemp_coop_rat_mazeorangecrush200"
	SceneTableLookup[1048] <- "mp_coop_rat_mazemp_coop_rat_mazeorangecrush300"
	SceneTableLookup[1017] <- "mp_coop_rat_mazemp_coop_rat_mazestart00"
	SceneTableLookup[1040] <- "mp_coop_laser_crushermp_coop_laser_crusherblue00"
	SceneTableLookup[1042] <- "mp_coop_laser_crushermp_coop_laser_crusherboth00"
	SceneTableLookup[1170] <- "mp_coop_laser_crushermp_coop_laser_crusherdeathend00"
	SceneTableLookup[1041] <- "mp_coop_laser_crushermp_coop_laser_crusherorange01"
	SceneTableLookup[1018] <- "mp_coop_laser_crushermp_coop_laser_crusherstartblue01"
	SceneTableLookup[1019] <- "mp_coop_laser_crushermp_coop_laser_crusherstartorange01"
	SceneTableLookup[1009] <- "mp_coop_teambtsmp_coop_radarroomend00"
	SceneTableLookup[1021] <- "mp_coop_teambtsmp_coop_teambtsstart01"
	SceneTableLookup[1100] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt1b00"
	SceneTableLookup[1101] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt1o00"
	SceneTableLookup[1102] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt201"
	SceneTableLookup[1103] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt3b00"
	SceneTableLookup[1104] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt3o00"
	SceneTableLookup[1105] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt400"
	SceneTableLookup[1106] <- "mp_coop_teambtsmp_coop_teambtsstoptaunt501"
	SceneTableLookup[1030] <- "mp_coop_fling_3mp_coop_fling_3end01"
	SceneTableLookup[1029] <- "mp_coop_fling_3mp_coop_fling_3start01"
	SceneTableLookup[1255] <- "mp_coop_infinifling_trainmp_coop_infinifling_traindeath0100"
	SceneTableLookup[1032] <- "mp_coop_infinifling_trainmp_coop_infinifling_trainend01"
	SceneTableLookup[1049] <- "mp_coop_infinifling_trainmp_coop_infinifling_trainenddeath00"
	SceneTableLookup[1050] <- "mp_coop_infinifling_trainmp_coop_infinifling_trainendlife00"
	SceneTableLookup[1031] <- "mp_coop_infinifling_trainmp_coop_infinifling_trainstart01"
	SceneTableLookup[1172] <- "mp_coop_come_alongmp_coop_come_alongenddeath00"
	SceneTableLookup[1171] <- "mp_coop_come_alongmp_coop_come_alongendnodeath00"
	SceneTableLookup[1056] <- "mp_coop_come_alongmp_coop_come_alongstart01"
	SceneTableLookup[1198] <- "mp_coop_fling_1mp_coop_fling_14balls00"
	SceneTableLookup[1051] <- "mp_coop_catapult_1mp_coop_catapult_1end01"
	SceneTableLookup[1057] <- "mp_coop_catapult_1mp_coop_catapult_1start01"
	SceneTableLookup[1310] <- "mp_coop_multifling_1mp_coop_multifling_1cube100"
	SceneTableLookup[1311] <- "mp_coop_multifling_1mp_coop_multifling_1cube200"
	SceneTableLookup[1312] <- "mp_coop_multifling_1mp_coop_multifling_1cube300"
	SceneTableLookup[1313] <- "mp_coop_multifling_1mp_coop_multifling_1cube400"
	SceneTableLookup[1052] <- "mp_coop_multifling_1mp_coop_multifling_1end01"
	SceneTableLookup[1162] <- "mp_coop_multifling_1mp_coop_multifling_1endnodeath01"
	SceneTableLookup[1058] <- "mp_coop_multifling_1mp_coop_multifling_1start01"
	SceneTableLookup[1177] <- "mp_coop_fling_crushersmp_coop_fling_crushersdeath100"
	SceneTableLookup[1178] <- "mp_coop_fling_crushersmp_coop_fling_crushersdeath200"
	SceneTableLookup[1053] <- "mp_coop_fling_crushersmp_coop_fling_crushersend00"
	SceneTableLookup[1176] <- "mp_coop_fling_crushersmp_coop_fling_crushersend200"
	SceneTableLookup[1059] <- "mp_coop_fling_crushersmp_coop_fling_crushersstart01"
	SceneTableLookup[1055] <- "mp_coop_fanmp_coop_fanend01"
	SceneTableLookup[1054] <- "mp_coop_fanmp_coop_fanstart01"
	SceneTableLookup[1063] <- "mp_coop_wall_intromp_coop_wall_introstart01"
	SceneTableLookup[1111] <- "mp_coop_wall_intromp_coop_wall_introstart201"
	SceneTableLookup[19] <- "mp_coop_wall_2EndLevel0801"
	SceneTableLookup[1113] <- "mp_coop_wall_2mp_coop_wall_2start01"
	SceneTableLookup[1114] <- "mp_coop_wall_2mp_coop_wall_2start201"
	SceneTableLookup[1115] <- "mp_coop_wall_2mp_coop_wall_2start301"
	SceneTableLookup[1116] <- "mp_coop_wall_2mp_coop_wall_2start401"
	SceneTableLookup[1118] <- "mp_coop_wall_2mp_coop_wall_2startreal00"
	SceneTableLookup[26] <- "mp_coop_catapult_wall_introCackle01"
	SceneTableLookup[25] <- "mp_coop_catapult_wall_introCatchBall01"
	SceneTableLookup[23] <- "mp_coop_catapult_wall_introEndLevel12B01"
	SceneTableLookup[24] <- "mp_coop_catapult_wall_introEndLevel12O01"
	SceneTableLookup[1097] <- "mp_coop_catapult_wall_introfacepalmreply01"
	SceneTableLookup[1257] <- "mp_coop_catapult_wall_intromp_coop_catapult_wall_introdeath00"
	SceneTableLookup[1117] <- "mp_coop_catapult_wall_intromp_coop_catapult_wall_introstart01"
	SceneTableLookup[1082] <- "mp_coop_catapult_wall_intromp_coop_wall_introend01"
	SceneTableLookup[16] <- "mp_coop_wall_blockEndLevel0501"
	SceneTableLookup[1258] <- "mp_coop_wall_blockmp_coop_wall_blockdeath00"
	SceneTableLookup[1120] <- "mp_coop_wall_blockmp_coop_wall_blockend00"
	SceneTableLookup[1259] <- "mp_coop_wall_blockmp_coop_wall_blockend201"
	SceneTableLookup[1119] <- "mp_coop_wall_blockmp_coop_wall_blockstart01"
	SceneTableLookup[1144] <- "mp_coop_catapult_2mp_coop_catapult_2end01"
	SceneTableLookup[1121] <- "mp_coop_catapult_2mp_coop_catapult_2start00"
	SceneTableLookup[1191] <- "mp_coop_turret_wallsmp_coop_turret_wallsdeath100"
	SceneTableLookup[1192] <- "mp_coop_turret_wallsmp_coop_turret_wallsdeath200"
	SceneTableLookup[1193] <- "mp_coop_turret_wallsmp_coop_turret_wallsdeath300"
	SceneTableLookup[1123] <- "mp_coop_turret_wallsmp_coop_turret_wallsend00"
	SceneTableLookup[1260] <- "mp_coop_turret_wallsmp_coop_turret_wallsend200"
	SceneTableLookup[1122] <- "mp_coop_turret_wallsmp_coop_turret_wallsstart00"
	SceneTableLookup[1187] <- "mp_coop_turret_ballmp_coop_turret_balldeath100"
	SceneTableLookup[1188] <- "mp_coop_turret_ballmp_coop_turret_balldeath200"
	SceneTableLookup[1189] <- "mp_coop_turret_ballmp_coop_turret_balldeath300"
	SceneTableLookup[1190] <- "mp_coop_turret_ballmp_coop_turret_balldeath400"
	SceneTableLookup[1124] <- "mp_coop_turret_ballmp_coop_turret_ballend00"
	SceneTableLookup[1083] <- "mp_coop_turret_ballmp_coop_turret_ballstart01"
	SceneTableLookup[1061] <- "mp_coop_wall_5mp_coop_wall_5end02"
	SceneTableLookup[1196] <- "mp_coop_wall_5mp_coop_wall_5security0100"
	SceneTableLookup[1197] <- "mp_coop_wall_5mp_coop_wall_5security0200"
	SceneTableLookup[1060] <- "mp_coop_wall_5mp_coop_wall_5start01"
	SceneTableLookup[1098] <- "mp_coop_wall_5teamhugreply00"
	SceneTableLookup[1093] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectbbehind00"
	SceneTableLookup[1314] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath01"
	SceneTableLookup[1315] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath200"
	SceneTableLookup[1316] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectdeath300"
	SceneTableLookup[1305] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectendsc00"
	SceneTableLookup[1092] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectobehind00"
	SceneTableLookup[1125] <- "mp_coop_tbeam_redirectmp_coop_tbeam_redirectstart01"
	SceneTableLookup[1318] <- "mp_coop_tbeam_drillmp_coop_tbeam_drilldeathblue00"
	SceneTableLookup[1319] <- "mp_coop_tbeam_drillmp_coop_tbeam_drilldeathorange00"
	SceneTableLookup[1307] <- "mp_coop_tbeam_drillmp_coop_tbeam_drillend01"
	SceneTableLookup[1306] <- "mp_coop_tbeam_drillmp_coop_tbeam_drillstartsc01"
	SceneTableLookup[1073] <- "mp_coop_tbeam_catch_grind_1mp_coop_tbeam_catch_grind_1start01"
	SceneTableLookup[1099] <- "mp_coop_tbeam_catch_grind_1trickfirereply01"
	SceneTableLookup[1204] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death100"
	SceneTableLookup[1205] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death200"
	SceneTableLookup[1206] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1death300"
	SceneTableLookup[1203] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end01"
	SceneTableLookup[1256] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1end200"
	SceneTableLookup[1080] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1startb01"
	SceneTableLookup[1081] <- "mp_coop_tbeam_laser_1mp_coop_tbeam_laser_1starto01"
	SceneTableLookup[1072] <- "mp_coop_tbeam_polaritymp_coop_tbeam_drillendb01"
	SceneTableLookup[1071] <- "mp_coop_tbeam_polaritymp_coop_tbeam_drillendo01"
	SceneTableLookup[1070] <- "mp_coop_tbeam_polaritymp_coop_tbeam_drillstartb00"
	SceneTableLookup[1069] <- "mp_coop_tbeam_polaritymp_coop_tbeam_drillstarto00"
	SceneTableLookup[1320] <- "mp_coop_tbeam_polaritymp_coop_tbeam_polaritydeathblue00"
	SceneTableLookup[1321] <- "mp_coop_tbeam_polaritymp_coop_tbeam_polaritydeathorange00"
	SceneTableLookup[1066] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whisperb01"
	SceneTableLookup[1067] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2 whispero01"
	SceneTableLookup[1309] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endscb01"
	SceneTableLookup[1308] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2endsco01"
	SceneTableLookup[1091] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2startb01"
	SceneTableLookup[1090] <- "mp_coop_tbeam_polarity2mp_coop_tbeam_polarity2starto01"
	SceneTableLookup[1322] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathblue100"
	SceneTableLookup[1323] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathblue200"
	SceneTableLookup[1324] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathorange100"
	SceneTableLookup[1325] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3 deathorange200"
	SceneTableLookup[1174] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3end01"
	SceneTableLookup[1261] <- "mp_coop_tbeam_polarity3mp_coop_tbeam_polarity3start01"
	SceneTableLookup[1128] <- "mp_coop_tbeam_mazemp_coop_tbeam_mazeend01"
	SceneTableLookup[1127] <- "mp_coop_tbeam_mazemp_coop_tbeam_mazestart00"
	SceneTableLookup[1304] <- "mp_coop_tbeam_mazemp_coop_tbeam_mazestuck00"
	SceneTableLookup[1094] <- "mp_coop_tbeam_endmp_coop_tbeam_endend01"
	SceneTableLookup[1129] <- "mp_coop_tbeam_endmp_coop_tbeam_endstart01"
	SceneTableLookup[1179] <- "mp_coop_tbeam_endTbeam_enddeath100"
	SceneTableLookup[1180] <- "mp_coop_tbeam_endTbeam_enddeath200"
	SceneTableLookup[1181] <- "mp_coop_tbeam_endTbeam_enddeath300"
	SceneTableLookup[1182] <- "mp_coop_tbeam_endTbeam_enddeath400"
	SceneTableLookup[1183] <- "mp_coop_tbeam_endTbeam_enddeath500"
	SceneTableLookup[1145] <- "mp_coop_paint_come_alongmp_coop_humanresourcedeath100"
	SceneTableLookup[1147] <- "mp_coop_paint_come_alongmp_coop_humanresourcedeath300"
	SceneTableLookup[1148] <- "mp_coop_paint_come_alongmp_coop_humanresourcedeath400"
	SceneTableLookup[1149] <- "mp_coop_paint_come_alongmp_coop_humanresourcedeath500"
	SceneTableLookup[1150] <- "mp_coop_paint_come_alongmp_coop_humanresourcedeath600"
	SceneTableLookup[1132] <- "mp_coop_paint_come_alongmp_coop_paint_come_alongend00"
	SceneTableLookup[1131] <- "mp_coop_paint_come_alongmp_coop_paint_come_alongstart00"
	SceneTableLookup[1293] <- "mp_coop_paint_redirectmp_coop_paint_redirectdeath200"
	SceneTableLookup[1294] <- "mp_coop_paint_redirectmp_coop_paint_redirectdeath300"
	SceneTableLookup[1295] <- "mp_coop_paint_redirectmp_coop_paint_redirectend01"
	SceneTableLookup[1133] <- "mp_coop_paint_redirectmp_coop_paint_redirectstart01"
	SceneTableLookup[1146] <- "mp_coop_paint_bridgemp_coop_humanresourcedeath200"
	SceneTableLookup[1296] <- "mp_coop_paint_bridgemp_coop_humanresourcedeath2a01"
	SceneTableLookup[1297] <- "mp_coop_paint_bridgemp_coop_paint_bridgedeath01"
	SceneTableLookup[1298] <- "mp_coop_paint_bridgemp_coop_paint_bridgenodeath01"
	SceneTableLookup[1135] <- "mp_coop_paint_bridgemp_coop_paint_bridgestart01"
	SceneTableLookup[1138] <- "mp_coop_paint_walljumpsmp_coop_paint_walljumpsend00"
	SceneTableLookup[1137] <- "mp_coop_paint_walljumpsmp_coop_paint_walljumpsstart01"
	SceneTableLookup[1299] <- "mp_coop_paint_speed_flingmp_coop_paint_speed_fling death00"
	SceneTableLookup[1140] <- "mp_coop_paint_speed_flingmp_coop_paint_speed_flingend01"
	SceneTableLookup[1139] <- "mp_coop_paint_speed_flingmp_coop_paint_speed_flingstart00"
	SceneTableLookup[1184] <- "mp_coop_paint_red_racermp_coop_paint_red_racerdeath100"
	SceneTableLookup[1185] <- "mp_coop_paint_red_racermp_coop_paint_red_racerdeath200"
	SceneTableLookup[1186] <- "mp_coop_paint_red_racermp_coop_paint_red_racerdeath300"
	SceneTableLookup[1142] <- "mp_coop_paint_red_racermp_coop_paint_red_racerend00"
	SceneTableLookup[1141] <- "mp_coop_paint_red_racermp_coop_paint_red_racerstart00"
	SceneTableLookup[1262] <- "mp_coop_paint_speed_catchmp_coop_paint_speed_catchend01"
	SceneTableLookup[1175] <- "mp_coop_paint_speed_catchmp_coop_paint_speed_catchstart01"
	SceneTableLookup[1300] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath100"
	SceneTableLookup[1301] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath200"
	SceneTableLookup[1302] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath300"
	SceneTableLookup[1303] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introdeath400"
	SceneTableLookup[1156] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend100"
	SceneTableLookup[1167] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1000"
	SceneTableLookup[1168] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1100"
	SceneTableLookup[1169] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend1200"
	SceneTableLookup[1157] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend200"
	SceneTableLookup[1158] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend300"
	SceneTableLookup[1159] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend400"
	SceneTableLookup[1160] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend500"
	SceneTableLookup[1163] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend600"
	SceneTableLookup[1164] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend700"
	SceneTableLookup[1165] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend800"
	SceneTableLookup[1166] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introend900"
	SceneTableLookup[1161] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introendx01"
	SceneTableLookup[1143] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introstart00"
	SceneTableLookup[1195] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntBlue01"
	SceneTableLookup[1194] <- "mp_coop_paint_longjump_intromp_coop_paint_longjump_introTauntOrange01"
	SceneTableLookup[1108] <- "mp_coop_lobbycoop_hub_return100"
	SceneTableLookup[1109] <- "mp_coop_lobbycoop_hub_return200"
	SceneTableLookup[1110] <- "mp_coop_lobbycoop_hub_return300"
	SceneTableLookup[1020] <- "mp_coop_lobbycoop_hub_track0101"
	SceneTableLookup[1095] <- "mp_coop_lobbycoop_hub_track0201"
	SceneTableLookup[1062] <- "mp_coop_lobbycoop_hub_track0301"
	SceneTableLookup[1173] <- "mp_coop_lobbycoop_hub_track0401"
	SceneTableLookup[1130] <- "mp_coop_lobbycoop_hub_track0501"
	SceneTableLookup[1096] <- "mp_coop_lobbycoop_hub_trackdeath0100"
	SceneTableLookup[1199] <- "mp_coop_lobbycoop_hub_trackdeath0200"
	SceneTableLookup[1200] <- "mp_coop_lobbycoop_hub_trackdeath0300"
	SceneTableLookup[1201] <- "mp_coop_lobbycoop_hub_trackdeath0400"
	SceneTableLookup[1202] <- "mp_coop_lobbycoop_hub_trackdeath0500"
	SceneTableLookup[1263] <- "mp_coop_lobbyhub_return1100"
	SceneTableLookup[1264] <- "mp_coop_lobbyhub_return1200"
	SceneTableLookup[1265] <- "mp_coop_lobbyhub_return1300"
	SceneTableLookup[1266] <- "mp_coop_lobbyhub_return1400"
	SceneTableLookup[1267] <- "mp_coop_lobbyhub_return2100"
	SceneTableLookup[1268] <- "mp_coop_lobbyhub_return2200"
	SceneTableLookup[1269] <- "mp_coop_lobbyhub_return2300"
	SceneTableLookup[1270] <- "mp_coop_lobbyhub_return2400"
	SceneTableLookup[1271] <- "mp_coop_lobbyhub_return3100"
	SceneTableLookup[1272] <- "mp_coop_lobbyhub_return3200"
	SceneTableLookup[1273] <- "mp_coop_lobbyhub_return3300"
	SceneTableLookup[1274] <- "mp_coop_lobbyhub_return4100"
	SceneTableLookup[1275] <- "mp_coop_lobbyhub_return4200"
	SceneTableLookup[1276] <- "mp_coop_lobbyhub_return4300"
	SceneTableLookup[1277] <- "mp_coop_lobbyhub_return5100"
	SceneTableLookup[1278] <- "mp_coop_lobbyhub_return5200"
	SceneTableLookup[1279] <- "mp_coop_lobbyhub_return5300"
	SceneTableLookup[1280] <- "mp_coop_lobbyhub_returnall100"
	SceneTableLookup[1281] <- "mp_coop_lobbyhub_returnall200"
	SceneTableLookup[1282] <- "mp_coop_lobbyhub_returnall300"
	SceneTableLookup[1283] <- "mp_coop_lobbyhub_returnall400"
	SceneTableLookup[1284] <- "mp_coop_lobbyhub_returnall500"
	SceneTableLookup[1285] <- "mp_coop_lobbyhub_returnall600"
	SceneTableLookup[1286] <- "mp_coop_lobbyhub_returnall700"
	SceneTableLookup[1330] <- "tauntstauntstory01"
	SceneTableLookup[1234] <- "tauntstaunt_big_wave100"
	SceneTableLookup[1235] <- "tauntstaunt_big_wave200"
	SceneTableLookup[1236] <- "tauntstaunt_big_wave300"
	SceneTableLookup[1237] <- "tauntstaunt_big_wave400"
	SceneTableLookup[1238] <- "tauntstaunt_big_wave500"
	SceneTableLookup[1224] <- "tauntstaunt_cannonball100"
	SceneTableLookup[1225] <- "tauntstaunt_cannonball200"
	SceneTableLookup[1226] <- "tauntstaunt_cannonball300"
	SceneTableLookup[1207] <- "tauntstaunt_highfive100"
	SceneTableLookup[1208] <- "tauntstaunt_highfive200"
	SceneTableLookup[1209] <- "tauntstaunt_highfive300"
	SceneTableLookup[1289] <- "tauntstaunt_highfive400"
	SceneTableLookup[1239] <- "tauntstaunt_laugh100"
	SceneTableLookup[1240] <- "tauntstaunt_laugh200"
	SceneTableLookup[1241] <- "tauntstaunt_laugh300"
	SceneTableLookup[1253] <- "tauntstaunt_laugh400"
	SceneTableLookup[1254] <- "tauntstaunt_laugh500"
	SceneTableLookup[1291] <- "tauntstaunt_laugh600"
	SceneTableLookup[1242] <- "tauntstaunt_robot_arm_ripple100"
	SceneTableLookup[1243] <- "tauntstaunt_robot_arm_ripple200"
	SceneTableLookup[1244] <- "tauntstaunt_robot_arm_ripple300"
	SceneTableLookup[1245] <- "tauntstaunt_robot_arm_ripple400"
	SceneTableLookup[1246] <- "tauntstaunt_robot_arm_ripple500"
	SceneTableLookup[1247] <- "tauntstaunt_robot_arm_ripple600"
	SceneTableLookup[1292] <- "tauntstaunt_robot_arm_ripple700"
	SceneTableLookup[1217] <- "tauntstaunt_rockpaperscissors100"
	SceneTableLookup[1287] <- "tauntstaunt_rockpaperscissors300"
	SceneTableLookup[1227] <- "tauntstaunt_small_wave100"
	SceneTableLookup[1228] <- "tauntstaunt_small_wave200"
	SceneTableLookup[1229] <- "tauntstaunt_small_wave300"
	SceneTableLookup[1230] <- "tauntstaunt_small_wave400"
	SceneTableLookup[1231] <- "tauntstaunt_small_wave_portalgun100"
	SceneTableLookup[1232] <- "tauntstaunt_small_wave_portalgun200"
	SceneTableLookup[1233] <- "tauntstaunt_small_wave_portalgun300"
	SceneTableLookup[1219] <- "tauntstaunt_somersault100"
	SceneTableLookup[1220] <- "tauntstaunt_somersault200"
	SceneTableLookup[1221] <- "tauntstaunt_somersault300"
	SceneTableLookup[1222] <- "tauntstaunt_splits100"
	SceneTableLookup[1223] <- "tauntstaunt_splits200"
	SceneTableLookup[1210] <- "tauntstaunt_teamhug100"
	SceneTableLookup[1211] <- "tauntstaunt_teamhug200"
	SceneTableLookup[1212] <- "tauntstaunt_teamhug300"
	SceneTableLookup[1290] <- "tauntstaunt_teamhug400"
	SceneTableLookup[1213] <- "tauntstaunt_teamtease100"
	SceneTableLookup[1214] <- "tauntstaunt_teamtease200"
	SceneTableLookup[1215] <- "tauntstaunt_teamtease300"
	SceneTableLookup[1216] <- "tauntstaunt_teamtease400"
	SceneTableLookup[1288] <- "tauntstaunt_teamtease500"
	SceneTableLookup[1327] <- "tauntstaunt_trickfire200"
	SceneTableLookup[1328] <- "tauntstaunt_trickfire300"
	SceneTableLookup[1329] <- "tauntstaunt_trickfire400"
	SceneTableLookup[1248] <- "tauntstaunt_trickfire_handstand100"
	SceneTableLookup[1249] <- "tauntstaunt_trickfire_handstand200"
	SceneTableLookup[1250] <- "tauntstaunt_trickfire_handstand300"
	SceneTableLookup[1251] <- "tauntstaunt_trickfire_handstand400"
	SceneTableLookup[1252] <- "tauntstaunt_trickfire_handstand500"

//MapBspConversion
	MapBspConversion <- {}
