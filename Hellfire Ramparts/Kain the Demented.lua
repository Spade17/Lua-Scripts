local NPC_ID = 600020

function On_Gossip(event, plr, unit)

plr:GossipMenuAddItem(0, "Spawn Level 60-70", 0, 1)
plr:GossipMenuAddItem(0, "Spawn Level 70-80", 0, 2)
plr:GossipMenuAddItem(0, "Spawn Level 80-90", 0, 3)
plr:GossipMenuAddItem(0, "Spawn Level 90-95", 0, 4)
plr:GossipMenuAddItem(0, "Spawn Level 95-100", 0, 5)
plr:GossipSendMenu(1, unit)
end

function On_Select(event, player, unit, sender, intid, code)


if (intid == 1) then
unit:SpawnCreature(600022, -1115.922607, 1714.478882, 89.677551, 3.547763)
unit:Emote(469)
end


if (intid == 2) then
unit:SpawnCreature(600023, -1115.922607, 1714.478882, 89.677551, 3.547763)
unit:Emote(469)
end

if (intid == 3) then
unit:SpawnCreature(600024, -1115.922607, 1714.478882, 89.677551, 3.547763)
unit:Emote(469)
end

if (intid == 4) then
unit:SpawnCreature(600025, -1115.922607, 1714.478882, 89.677551, 3.547763)
unit:Emote(469)
end

if (intid == 5) then
unit:SpawnCreature(600026, -1115.922607, 1714.478882, 89.677551, 3.547763)
unit:Emote(469)
end
	player:GossipComplete()
end
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)