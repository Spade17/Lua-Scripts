local npcId = 600022

--Combat Functions
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

--Health check
function BjorisOnHealth(event, delay, pCall, creature)
    if (creature:GetHealthPct() <= 75) then --Check on health
		creature:RemoveEventById(event)
		creature:SendUnitYell("You must be a fool to think you will defeat me!", 0) --Yell if health is below 75
		creature:RegisterEvent(FlameShock, 5000, 0) --Flameshock register enables flameshock
    end
end


function FlameShock(event, delay, pCall, creature) --Flameshock
	creature:CastSpell(creature:GetVictim(), 29228, true)
end

function LavaLash(event, delay, pCall, creature) --Lava lash cast
	creature:CastSpell(creature:GetVictim(), 65974, true)
end

function HealingTotem(event, delay, pCall, creature) --Healing totem cast
  creature:CastSpell(creature:GetVictim(), 10463, true)
end

function StormStrike(event, delay, pCall, creature) --Stormstrike cast
  creature:CastSpell(creature:GetVictim(), 17364, true)
end

function Windfury(event, delay, pCall, creature) --Windfury Buff
  creature:CastSpell(creature:GetVictim(), 58804, true)
end

function Flametongue(event, delay, pCall, creature) --Flametongue Buff
  creature:CastSpell(creature:GetVictim(), 58789, true)
end

function OnLeaveCombat(event, creature) --Leave combat check.
	creature:RemoveEvents()	--Remove combat/dots
    creature:SendUnitYell("Fool!", 0)
	creature:CastSpell(creature, 23965, true) --Heal NPC to full.
end

function OnTargetDied(event, creature, victim) --Player dies
    creature:SendUnitYell("Ha! You can't defeat me, you're no champion!", 0)
end

function OnDied(event, creature, killer) --NPC dies.
    creature:RemoveEvents() --Removes combat/dots
    creature:SendUnitYell("You cheated!", 0) --On die yell
    creature:DespawnOrUnsummon(5000) --Despawn in 5 seconds.
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 3, OnTargetDied)
RegisterCreatureEvent(npcId, 4, OnDied)