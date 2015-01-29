local npcId = 600024

function OnEnterCombat(event, creature, victim)
   creature:SendUnitYell("You fool!", 0)
   creature:RegisterEvent(Immolate, 1500, 1)
   creature:RegisterEvent(SearingPain, 4000, 0)
   creature:RegisterEvent(Curse, 1000, 1)
   creature:RegisterEvent(WarlockOnHealth, 1000, 0)
end


function WarlockOnHealth(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 50) then
    creature:SendUnitYell("You're a fool for thinking you will defeat me!", 0)
		creature:RemoveEventById(event)
    creature:RegisterEvent(Fear, 1000, 1)    
		creature:RegisterEvent(ChaosBolt, 7000, 0)
    end
end


function Immolate(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47811)
end

function SearingPain(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47815)
end

function Curse(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47865, true)
end

function Fear(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 47859)
end

function ChaosBolt(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 50796, true)
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