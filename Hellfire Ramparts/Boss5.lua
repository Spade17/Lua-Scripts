local npcId = 600026

function OnEnterCombat(event, creature, victim)
   creature:SendUnitYell("You fool!", 0)
   creature:RegisterEvent(Rake, 5000, 1)
   creature:RegisterEvent(Mangle, 4000, 0)
   creature:RegisterEvent(OnHealthCheckRebel, 1000, 0)
end


function OnHealthCheckRebel(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 45) then
		creature:RemoveEventById(event) 
		creature:RegisterEvent(TigersFury, 1000, 1)
    end
end

function Rake(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 48574, true)
end
function Mangle(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 48566, true)
end

function TigersFury(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 50213, true)
end

function OnLeaveCombat(event, creature)
	creature:RemoveEvents()	
	creature:CastSpell(creature, 23965, true)
end

function OnTargetDied(event, creature, victim)
    creature:SendUnitYell("Ha! You can't defeat me, you're no champion!", 0)
end

function OnDied(event, creature, killer)
    creature:RemoveEvents()
    creature:DespawnOrUnsummon(5000)
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 3, OnTargetDied)
RegisterCreatureEvent(npcId, 4, OnDied)