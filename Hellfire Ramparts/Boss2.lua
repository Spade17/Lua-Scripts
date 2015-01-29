local npcId = 600023

function OnEnterCombat(event, creature, victim)
   creature:SendUnitYell("You fool!", 0)
   creature:RegisterEvent(Judgement, 10000, 0)
   creature:RegisterEvent(DivineStorm, 8000, 0)
   creature:RegisterEvent(CrusaderStrike, 4000, 0)
   creature:RegisterEvent(SyloxusOnHealth, 1000, 0)
end

function SyloxusOnHealth(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 50) then
    creature:SendUnitYell("You're a fool for thinking you will defeat me!", 0)
		creature:RemoveEventById(event)
		creature:RegisterEvent(Wings, 1000, 1)
    end
end


function Judgement(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 20271, true)
end

function Wings(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 31884, true)
end

function DivineStorm(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 53385, true)
end

function DivineStorm(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 35395, true)
end

function CrusaderStrike(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 35395, true)
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