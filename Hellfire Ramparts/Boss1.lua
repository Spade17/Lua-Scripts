local npcId = 600022

function OnEnterCombat(event, creature, victim)
   creature:SendUnitYell("You're no match!", 0)
   creature:RegisterEvent(FlameShock, 1000, 1)
   creature:RegisterEvent(LavaLash, 3000, 0)
   creature:RegisterEvent(HealingTotem, 5000, 1)
   creature:RegisterEvent(StormStrike, 6000, 0)
   creature:RegisterEvent(Windfury, 1000, 1)
   creature:RegisterEvent(Flametongue, 1000, 1)
   creature:RegisterEvent(BjorisOnHealth, 1000, 0)
end

function BjorisOnHealth(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 75) then
		creature:RemoveEventById(event)
		creature:SendUnitYell("You must be a fool to think you will defeat me!", 0)
		creature:RegisterEvent(FlameShock, 5000, 0)
    end
end


function FlameShock(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 29228, true)
end

function LavaLash(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 65974, true)
end

function HealingTotem(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 10463, true)
end

function StormStrike(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 17364, true)
end

function Windfury(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 58804, true)
end

function Flametongue(event, delay, pCall, creature)
  creature:CastSpell(creature:GetVictim(), 58789, true)
end

function OnLeaveCombat(event, creature)
	creature:RemoveEvents()	
    creature:SendUnitYell("Fool!", 0)
	creature:CastSpell(creature, 23965, true)
end

function OnTargetDied(event, creature, victim)
    creature:SendUnitYell("Ha! You can't defeat me, you're no champion!", 0)
end

function OnDied(event, creature, killer)
    creature:RemoveEvents()
    creature:SendUnitYell("You cheated!", 0)
    creature:DespawnOrUnsummon(5000)
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 3, OnTargetDied)
RegisterCreatureEvent(npcId, 4, OnDied)