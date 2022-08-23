//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
//   ___         __                                 _  _ 
//  / __| __ _  / _| ___  __ _  _  _  __ _  _ _  __| |(_)
//  \__ \/ _` ||  _|/ -_)/ _` || || |/ _` || '_|/ _` | _ 
//  |___/\__,_||_|  \___|\__, | \_,_|\__,_||_|  \__,_|(_)
//                       |___/                           
//---------------------------------------------------
// Purpose: Set up a security measure against
//           abusive commands from clients.
//---------------------------------------------------

if (Config_SafeGuard) {
    try {
        if ( ::SendToConsole.getinfos().native ) {
            // Replace SendToConsole with SendToConsoleP232
            ::SendToConsoleP232 <- ::SendToConsole;;

            SendToConsole <- function(str) {
                if (str.slice(0, 16) != "snd_ducktovolume") {
                    printl("=======================================")
                    printl("=======================================")
                    printl("   PATCHED COMMAND ATTEMPTED TO RUN!   ")
                    printl("                                       ")
                    printl(" Command: " + str)
                    printl("                                       ")
                    printl("  This could be game logic running in  ")
                    printl("   the background. But it could ba a   ")
                    printl("  player that is attempting to exploit ")
                    printl("  the game. So we're going to stop it. ")
                    printl("=======================================")
                    printl("=======================================")
                }
            }
        }
    } catch (e) {
        // Should never have an exception
    }
} else {
    SendToConsoleP232 <- function(str) { SendToConsole(str) }
}
