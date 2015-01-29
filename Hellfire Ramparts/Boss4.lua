local npcId = 600025

function OnEnterCombat(event, creature, victim)
   creature:SendUnitYell("You fool!", 0)
   creature:RegisterEvent(Rend, 3000, 1)
   creature:RegisterEvent(MortalStrike, 7000, 0)
   creature:RegisterEvent(Shockwave, 8000, 1)
   creature:RegisterEvent(Charge, 1000, 1)
   creature:RegisterEvent(HealthCheckCump, 1000, 0)
end


function HealthCheckCump(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 45) then
    creature:SendUnitYell("I'll live up to my title, unlike you!", 0)
		creature:RemoveEventById(event) 
		creature:RegisterEvent(Bladestorm, 1000, 1)
    end
end

function Charge(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 60067, true)
end
function Rend(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47465, true)
end

function MortalStrike(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47486, true)
end

function Shockwave(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 46968, true)
end

function Bladestorm(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 46924, true)
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