--[[
    Please see the estension.xml file included with this distribution for
    attribution and copyright information.
--]]

-- slash command

function onInit()
Debug.chat(Session.IsHost);
	if User.isHost()  then
		Comm.registerSlashHandler("ctscINFO", infoCTSlashCommand);
		Comm.registerSlashHandler("ctLR", CTSlashCommandLongRest);
		Comm.registerSlashHandler("ctSR", CTSlashCommandShortRest);
		Comm.registerSlashHandler("ctAllIn", CTSlashCommandAllInitiative);
		Comm.registerSlashHandler("ctPCIn", CTSlashCommandPCInitiative);
		Comm.registerSlashHandler("ctNPCIn", CTSlashCommandNPCInitiative);
		Comm.registerSlashHandler("ctInReset", CTSlashCommandInitiativeReset);
	end
end


-- API CT commands
function infoCTSlashCommand()
   ChatManager.SystemMessage("/ctLR for Long Rest\r\r/ctSR for Short Rest\r\r/ctAllIn for rolling all Initiative\r\r/ctPCIn for PCs Initiative\r\r/ctNPCIn for NPCs Initiative\r\r/ctInReset for resetting all Initiative");
end

function CTSlashCommandLongRest()
   ChatManager.Message(Interface.getString("ct_message_restlong"), true);
   CombatManager2.rest(true);
end

function CTSlashCommandShortRest()
   ChatManager.Message(Interface.getString("ct_message_rest"), true);
   CombatManager2.rest(false);
end

function CTSlashCommandAllInitiative()
   CombatManager2.rollInit();
end

function CTSlashCommandNPCInitiative()
   CombatManager2.rollInit("npc");
end

function CTSlashCommandPCInitiative()
   CombatManager2.rollInit("pc");
end
function CTSlashCommandInitiativeReset()
   CombatManager.resetInit();
end
