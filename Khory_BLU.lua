------------------------------------------
-- Variables
------------------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
------------------------------------------
-- Windower Hooks              --
------------------------------------------

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if name == "terror" or name == "petrification" or name == "sleep" or name == "stun" then
		if gain == true then
			ChangeGear(sets.Utility.DerpDT)
		else
			ChangeGear(sets.TP[sets.TP.index[TP_ind]])
		end
	end
end

function user_setup()
    select_default_macro_book()
end

------------------------------------------
-- Binds                  --
------------------------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit cntrl and f9 it toggles the sets
send_command('bind f10 gs c toggle CDC set')
send_command('bind f11 gs c toggle Req set')
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 input /ws "Sanguine Blade" <t>')
send_command('bind ^f9 input /ws "Chant du Cygne" <t>') --^ means cntrl
send_command('bind ^f10 input /ws "Expiacion" <t>')
send_command('bind ^f11 input /ws "Requiescat" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>') --Sanguine Blade
send_command('bind !f9 gs c changemaccmab') --! means alt
send_command('bind !f10 gs c toggle Expi set')
send_command('bind !f11 gs c toggle Rea set')
send_command('bind !f12 gs c lockgearindex')

------------------------------------------
-- Console Commands             --
------------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			SetLocked = true
			msg("Equipment Set LOCKED!")
		else
			SetLocked = false
			msg("Equipment Set UNLOCKED!")
		end
	elseif command == 'lockgearindex' then
		if LockGearIndex == false then
			LockGearIndex = true
			LockGearSet = {
				ammo = player.equipment.ammo,
				head = player.equipment.head,
				neck = player.equipment.neck,
				ear1 = player.equipment.left_ear,
				ear2 = player.equipment.right_ear,
				body = player.equipment.body,
				hands = player.equipment.hands,
				ring1 = player.equipment.left_ring,
				ring2 = player.equipment.right_ring,
				back = player.equipment.back,
				waist = player.equipment.waist,
				legs = player.equipment.legs,
				feet = player.equipment.feet
			}
			msg("Gear Index Locked")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
				equip(sets.TP[sets.TP.index[TP_ind]])
			else
				equip(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
	end
	if command == 'toggle TP set' then
		TP_ind = TP_ind + 1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
		ChangeGear(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle Req set' then
		Requiescat_ind = Requiescat_ind + 1
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Requiescat Set changed to ' .. sets.Requiescat.index[Requiescat_ind] .. ' ----->')
	elseif command == 'toggle CDC set' then
		CDC_ind = CDC_ind + 1
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
		send_command('@input /echo <----- CDC Set changed to ' .. sets.CDC.index[CDC_ind] .. ' ----->')
	elseif command == 'toggle Expi set' then
		Expiacion_ind = Expiacion_ind + 1
		if Expiacion_ind > #sets.Expiacion.index then Expiacion_ind = 1 end
		send_command('@input /echo <----- Expiacion Set changed to ' .. sets.Expiacion.index[Expiacion_ind] .. ' ----->')
	elseif command == 'toggle Savage set' then
		SavageBlade_ind = SavageBlade_ind + 1
		if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
		send_command('@input /echo <----- Savage Blade Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
	elseif command == 'toggle Realm set' then
		Realmrazer_ind = Realmrazer_ind + 1
		if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
	elseif command == 'toggle FlashNova set' then
		FlashNova_ind = FlashNova_ind + 1
		if FlashNova_ind > #sets.FlashNova.index then FlashNova_ind = 1 end
		send_command('@input /echo <----- Flash Nova Set changed to ' .. sets.FlashNova.index[FlashNova_ind] .. ' ----->')
	elseif command == 'equip TP set' then
		ChangeGear(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'equip Idle set' then
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'changemaccmab' then
		MAB_ind = MAB_ind + 1
		if MAB_ind > #sets.BlueMagic.INT.index then MAB_ind = 1 end
		send_command('@input /echo <-----Blue Magic INT Type Changed To: ' .. sets.BlueMagic.INT.index[MAB_ind] .. '----->')
	end
end

------------------------------------------
-- Character States                     --
------------------------------------------
function IdleState()
    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    if player.mpp <= 50 then
        ChangeGear({waist = "Fucho-no-obi"})
    end
end

function RestingState()

end

function EngagedState()
	ChangeGear(sets.TP[sets.TP.index[TP_ind]])
end

------------------------------------------
-- cast                 --
------------------------------------------
function pc_JA(spell, act)
	IgnoreWS = S { "Sanguine Blade", "Flash Nova", "Realmrazer" }
	if spell.english == 'Azure Lore' then
		ChangeGear(sets.JA.AzureLore)
	end
	if spell.english == 'Provoke' then
		ChangeGear(sets.JA.Provoke)
	elseif spell.english == 'Warcry' then
		ChangeGear(sets.JA.Warcry)
	end
	if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance <= 6 then
		if spell.english == 'Requiescat' then
			ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
		elseif spell.english == 'Chant du Cygne' or spell.english == 'Vorpal Blade' then
			ChangeGear(sets.CDC[sets.CDC.index[CDC_ind]])
		elseif spell.english == 'Expiacion' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Savage Blade' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'True Strike' or spell.english == 'Judgment' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Realmrazer' then
			ChangeGear(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
		elseif spell.english == 'Flash Nova' then
			ChangeGear(sets.FlashNova[sets.FlashNova.index[FlashNova_ind]])
		elseif spell.english == 'Circle Blade' then
			ChangeGear(sets.WS.CircleBlade)
		elseif spell.english == 'Sanguine Blade' or spell.english == 'Red Lotus Blade' then
			ChangeGear(sets.WS.SanguineBlade)
		end
		if player.tp > 2749 then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped")
			end
		end
	elseif player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 6 and spell.type == 'WeaponSkill' then
		cancel_spell()
		msg("Weapon Skill Canceled  Target Out of Range")
	end

	if spell.english == 'Box Step' then
		ChangeGear(sets.Utility.Steps)
	elseif spell.english == 'Quick Step' then
		ChangeGear(sets.Utility.Steps)
	elseif spell.english == 'Animated Flourish' then
		ChangeGear(sets.BlueMagic.Enmity)
	end
end

function pc_Magic(spell, act)
	if spell.type == 'BlueMagic' then
		ChangeGear(sets.precast.FC.Blue)
	else
		ChangeGear(sets.precast.FC.Standard)
	end
end

function pc_Item(spell, act)
end


------------------------------------------
-- Midcast                 --
------------------------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Healing Magic' then
			ChangeGear(sets.BlueMagic.Cures)
		end
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Refresh' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif string.find(spell.english,'Shell') then
			ChangeGear(sets.Utility.ProShell)
		else
			ChangeGear(sets.Enhancing)
		end
	if spell.english == 'Stun' then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		end
	else if spell.skill == 'Blue Magic' then
		if spell.english == 'Battery Charge' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif spell.english == 'Regeneration' or string.find(spell.english,'Regen') then
			ChangeGear(sets.BlueMagic.Regeneration)
	
			--For any other Spell Spefic Gearset, add the needed elseif here
		else
			-- Generic Precat Set
			ChangeGear(sets.precast.FC.Blue)
		end
		if BlueMagic_Diffusion:contains(spell.english) then
			ChangeGear(sets.JA.Diffusion)
		end
		if PhysicalSpells:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRDEX)
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRVIT)
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				ChangeGear(sets.BlueMagic.AGI)
			elseif PhysicalBlueMagic:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif BlueMagic_PhysicalAcc:contains(spell.english) then
				ChangeGear(sets.BlueMagic.HeavyStrike)
			end
			if buffactive['Chain Affinity'] then
				ChangeGear(sets.JA.ChainAffinity)
			end
			if buffactive['Efflux'] then
				ChangeGear(sets.JA.Efflux)
			end
		end
		if MagicalSpells:contains(spell.english) then
			if BlueMagic_INT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
			elseif BlueMagic_Dark:contains(spell.english) then
				ChangeGear(sets.BlueMagic.DarkNuke)
			elseif BlueMagic_Light:contains(spell.english) then
				ChangeGear(sets.BlueMagic.LightNuke)
			elseif BlueMagic_Earth:contains(spell.english) then
				ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
			end
			if buffactive['Burst Affinity'] then
				ChangeGear(sets.JA.BurstAffinity)
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				ChangeGear(set_combine(equipSet, { waist = 'Hachirin-no-Obi' }))
			end
		end

		if BlueMagic_Accuracy:contains(spell.english) then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		elseif BlueMagic_Stun:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Stun)
		elseif BlueMagic_Enmity:contains(spell.english) or spell.english == 'Flash' then
			ChangeGear(sets.BlueMagic.Enmity)
		elseif BlueMagic_Buffs:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Buffs)
		elseif BlueMagic_Skill:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Skill)
		elseif buffactive.Diffusion then
			ChangeGear(sets.JA.Diffusion)
		elseif spell.english == 'White Wind' then
			ChangeGear(sets.BlueMagic.WhiteWind)
		elseif BlueMagic_Healing:contains(spell.english) or spell.english == 'Cure IV' or spell.english == 'Cure III' then
			ChangeGear(sets.BlueMagic.Cures)
		end
	end
	end
end


function mc_Item(spell, act)
end


------------------------------------------
-- After Cast               --
------------------------------------------
function ac_JA(spell)
end

function ac_Magic(spell)
end

function ac_Item(spell)
end

function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end

------------------------------------------
-- Framework Core            --
------------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState();
	end
end

function precast(spell, act)
	if spell.action_type == 'Ability' then
		pc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		pc_Magic(spell, act)
	else
		pc_Item(spell, act)
	end
end

function midcast(spell, act)
	if spell.action_type == 'Ability' then
		mc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		mc_Magic(spell, act)
	else
		mc_Item(spell, act)
	end
end

function aftercast(spell)
	if spell.action_type == 'Ability' then
		ac_JA(spell)
	elseif spell.action_type == 'Magic' then
		ac_Magic(spell)
	else
		ac_Item(spell)
	end
	ac_Global()
end

function ChangeGear(GearSet)

	equipSet = GearSet
	equip(GearSet)
end

function LockGearSet(GearSet)
	LockedEquipSet = GearSet
	equip(GearSet)
	SetLocked = true
end

function UnlockGearSet()
	locked = false
	equip(equipSet)
end

--Unload Binds
function file_unload()
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()
	maps()

	HerculeanHelm = {}
	HerculeanHelm.TP = { name="Herculean Helm", augments={'"Triple Atk."+2','Pet: Attack+12 Pet: Rng.Atk.+12','Accuracy+15 Attack+15','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	HerculeanHelm.Nuke = { name="Herculean Helm", augments={'INT+3','"Mag.Atk.Bns."+20','Magic Damage +23','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	HerculeanHelm.DT = { name = "Herculean Helm", augments = { 'Attack+12', 'Phys. dmg. taken -4%', 'STR+9', 'Accuracy+8', } }
	HerculeanHelm.Refesh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
	HerculeanHelm.WSD = { name = "Herculean Helm", augments = { 'Attack+30','Weapon skill damage +5%', } }
	HerculeanHelm.WSDAcc = { name = "Herculean Helm", augments = { 'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+3','Accuracy+13','Attack+11', } }
	
	HerculeanGloves = {}
	HerculeanGloves.WSD = { name = "Herculean Gloves", augments = { 'Accuracy+21 Attack+21', 'Weapon skill damage +4%', 'Accuracy+9', 'Attack+10', } }
	HerculeanGloves.DT = { name = "Herculean Gloves", augments = { 'Accuracy+13', 'Damage taken-3%', 'AGI+1', 'Attack+5', } }
	HerculeanGloves.HighAcc = { name = "Herculean Gloves", augments = { 'Accuracy+23 Attack+23', '"Triple Atk."+2', 'DEX+15', 'Accuracy+11', 'Attack+13', } }
	HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'DEX+7', 'Weapon skill damage +2%', '"Refresh"+1', } }
	HerculeanGloves.Crit = { name = "Herculean Gloves", augments = { 'Attack+23', 'Crit. hit damage +4%', 'DEX+8', 'Accuracy+11', } }
	HerculeanGloves.TP = { name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	TelchineLegs = {}
	TelchineLegs.CP = { name = "Telchine Braconi" , augments = {'Potency of "Cure" effect received+7%','INT+1 MND+1',} }
	TelchineLegs.WS = { name = "Telchine Braconi" , augments = {'Accuracy+16','"Dbl.Atk."+3','STR+9',} }
	
	HerculeanLegs = {}
	HerculeanLegs.DT = { name = "Herculean Trousers", augments = { 'Accuracy+22', 'Damage taken-2%', 'VIT+6', } }
	HerculeanLegs.WSD = { name = "Herculean Trousers", augments = { 'Attack+28', 'Weapon skill damage +3%', 'STR+10', 'Accuracy+9', } }

	TaeonBoots = {}
	TaeonBoots.TA = { name = "Taeon Boots", augments = { 'STR+6 DEX+6', 'Accuracy+15 Attack+15', '"Triple Atk."+2' } }
	TaeonBoots.Regen ={ name="Taeon Boots", augments = {'Mag. Acc.+9','"Conserve MP"+5','"Regen" potency+3',} }
	
	HerculeanFeet = {}
	HerculeanFeet.QA = { name = "Herculean Boots", augments = { 'AGI+4', '"Dbl.Atk."+2', 'Quadruple Attack +3', 'Accuracy+4 Attack+4', } }
	HerculeanFeet.TA = { name="Herculean Boots", augments={'Attack+23','"Triple Atk."+3','STR+3','Accuracy+8',}}
	HerculeanFeet.DT = { name = "Herculean Boots", augments = { 'Accuracy+23', 'Damage taken -3%' } }
	HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanFeet.CritDmg = { name = "Herculean Boots", augments = { 'Accuracy+28', 'Crit. hit damage +5%', 'DEX+9', } }
	HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'Attack+22', 'Weapon skill damage +4%', 'Accuracy+15', } }

	Rosmerta = {}
	Rosmerta.Crit = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', } }
	Rosmerta.WSD = { name = "Rosmerta's Cape", augments = { 'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%', } }
	Rosmerta.STP = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10', } }
	Rosmerta.DW = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10', } }
	Rosmerta.Nuke = { name="Rosmerta's Cape", augments={ 'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10', } }
	Rosmerta.DA = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	
	
	
	sets.Idle = {}
	--Idle Sets--
	sets.Idle.index = { 'Standard', 'DT', 'Town' }
	Idle_ind = 3
	sets.Idle.Standard = {	
		ammo = "Ginsen",
		head = "Rawhide Mask",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Amalric Doublet",
		hands = "Herculean Gloves",
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Carmine Cuisses +1",
		feet = "Aya. Gambieras +1"
	}

	sets.Idle.DT = {
		ammo = "Ginsen",
		head = "Aya. Zucchetto +1",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza",
		hands = "Herculean Gloves",
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Ayanmo Cosciales",
		feet = "Aya. Gambieras +1"
	}

	sets.Idle.Town = {
		ammo = "Ginsen",
		head = HerculeanHelm.TP,
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Herculean Vest",
		hands = "Herculean Gloves",
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Herculean Trousers",
		feet = HerculeanFeet.TA
	}


	--TP Sets--
	sets.TP = {}
	sets.TP.index = { 'DualWield', 'CappedHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	--1=DualWield gear, uncapped haste, 2=CappedHaste, 3=AccuracyLite, 4=AccuracyMid, 5=AccuracyFull--
	TP_ind = 1

	--DW III +1200JP--
	sets.TP.DualWield = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.TP.CappedHaste = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyLite = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyMid = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyFull = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}


	--Weaponskill Sets--
	sets.WS = {}

	sets.Requiescat = {}

	sets.Requiescat.index = { 'Attack', 'Accuracy' }
	Requiescat_ind = 1

	sets.Requiescat.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.Requiescat.Accuracy = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA
	}

	sets.CDC = {}

	sets.CDC.index = { 'Attack', 'Accuracy', 'AccuracyHigh' }
	CDC_ind = 1

	sets.CDC.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Ramuh Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.CDC.Accuracy = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Mache Earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Epona's ring",
		ring2 = "Ramuh Ring",
		back = Rosmerta.Crit,
		--back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.CritDmg
	}

	sets.CDC.AccuracyHigh = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Mache earring",
		body = "Herculean Vest",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Begrudging Ring",
		ring2 = "Ramuh Ring +1",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.CritDmg
	}

	sets.Expiacion = {}

	sets.Expiacion.index = { 'Attack', 'Accuracy' }
	Expiacion_ind = 1

	sets.Expiacion.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Ifrit Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.Expiacion.Accuracy = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Ifrit Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.WS.SanguineBlade = {}

	sets.WS.SanguineBlade = {
		ammo = "Jukukik Feather",
		head = HerculeanHelm.Nuke,
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.WS.CircleBlade = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.SavageBlade = {}

	sets.SavageBlade.index = { 'Attack', 'Accuracy' }
	SavageBlade_ind = 1
	sets.SavageBlade.Attack = set_combine(sets.Expiacion.Attack, {})

	sets.SavageBlade.Accuracy = set_combine(sets.Expiacion.Accuracy, {})

	sets.Realmrazer = {}

	sets.Realmrazer.index = { 'Attack', 'Accuracy' }
	Realmrazer_ind = 1
	sets.Realmrazer.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.Realmrazer.Accuracy = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}

	sets.FlashNova = {}

	sets.FlashNova.index = { 'Attack', 'Accuracy' }
	FlashNova_ind = 1
	sets.FlashNova.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.FlashNova.Accuracy = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}


	--Blue Magic Sets--
	sets.BlueMagic = {}

	sets.BlueMagic.STR = {
		ammo = "Floestone",
		head = HerculeanHelm.Nuke,
		body = "Luhlaza Jubbah +1",
		neck = "Caro Necklace",
		ear1 = "Zennaroi Earring",
		ear2 = "Kuwunga Earring",
		body = "Adhemar Jacket",
		hands = HerculeanGloves.TP,
		ring1 = "Ifrit Ring +1",
		ring2 = "Petrov Ring",
		back = "Cornflower cape",
		waist = "Prosilio Belt +1",
		legs = "Samnuha Tights",
		feet = "Amalric Nails"
	}

	sets.BlueMagic.STRDEX = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRVIT = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRMND = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.AGI = set_combine(sets.BlueMagic.STR, {
		feet = "Thereoid Greaves"
	})
	--------------------------------------------------
	sets.BlueMagic.INT = {}
	sets.BlueMagic.INT.index = { "MAB", "MACC" }
	MAB_ind = 1

	sets.BlueMagic.INT.MAB = {
		ammo = "Mavi Tathlum",
		head = HerculeanHelm.Nuke,
		neck = "Sanctity Necklace",
		ear1 = "Moldavite Earring",
		ear2 = "Friomisi earring",
		body = "Amalric Doublet",
		hands = "Amalric Gages",
		ring1 = "Strendu Ring",
		ring2 = "Diamond Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Amalric Slops",
		feet = "Amalric Nails"
	}
	
	sets.BlueMagic.INT.MACC = {
		ammo = "Mavi Tathlum",
		head = "Amalric Coif",
		neck = "Sanctity Necklace",
		ear1 = "Hermetic Earring",
		ear2 = "Friomisi earring",
		body = "Amalric Doublet",
		hands = "Amalric Gages",
		ring1 = "Strendu Ring",
		ring2 = "Diamond Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak"
	}
	-----------------------------------------
	sets.BlueMagic.LightNuke = set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], {
		ring2 = "Weatherspoon Ring",
	})

	sets.BlueMagic.DarkNuke = set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], {
		head = "Pixie Hairpin +1",
		ring2 = "Archon Ring",
	})

	--CP cap 50%, CP Received cap 30%--
	sets.BlueMagic.Cures = {
		ammo = "Mavi Tathlum",
		head = HerculeanHelm.Nuke,
		neck = "Sanctity Necklace",
		ear1 = "Moldavite Earring",
		ear2 = "Friomisi earring",
		body = "Waether. Robe +1",
		hands = "Amalric Gages",
		ring1 = "Strendu Ring",
		ring2 = "Diamond Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak"
	}

	--Conserve MP Gear--
	sets.BlueMagic.Buffs = {
		ammo = "Mavi Tathlum",
		head = "Amalric Coif",
		neck = "Sanctity Necklace",
		ear1 = "Moldavite Earring",
		ear2 = "Friomisi earring",
		body = "Waether. Robe +1",
		hands = "Amalric Gages",
		ring1 = "Strendu Ring",
		ring2 = "Diamond Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak"
	}

	sets.BlueMagic.Battery = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
		waist = "Gishdubar Sash"
	})

	--Telchine Regen+ potency augments--
	sets.BlueMagic.Regeneration = set_combine(sets.BlueMagic.Buffs, {
		Body = "Telchine Chasuble",
		Feet =  TaeonBoots.Regen
	})

	sets.BlueMagic.Stun = {
		ammo = "Mavi Tathlum",
		head = "Amalric Coif",
		neck = "Sanctity Necklace",
		ear1 = "Hermetic Earring",
		ear2 = "Dignitary's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Etana Ring",
		ring2 = "Weatherspoon Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Psycloth Lappas",
		feet = "Hashishin Basmak"
	}

	sets.BlueMagic.HeavyStrike = {
		ammo = "Falcon Eye",
		head = HerculeanHelm.Nuke,
		neck = "Caro Necklace",
		ear1 = "Zennaroi Earring",
		ear2 = "Kuwunga Earring",
		body = "Adhemar Jacket",
		hands = HerculeanGloves.Crit,
		ring1 = "Ifrit Ring +1",
		ring2 = "Petrov Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = "Samnuha Tights",
		feet = "Amalric Nails"
	}

	sets.BlueMagic.WhiteWind = {
		ammo = "Mavi Tathlum",
		head = HerculeanHelm.Nuke,
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Ethereal Earring",
		body = "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Etana Ring",
		back = "Cornflower cape",
		waist = "Carrier's Sash",
		legs = TelchineLegs.CP,
		feet = "Medium's Sabots"
	}

	sets.BlueMagic.MagicAccuracy = {
		ammo = "Mavi Tathlum",
		head = "Amalric Coif",
		neck = "Sanctity Necklace",
		ear1 = "Hermetic Earring",
		ear2 = "Friomisi earring",
		body = "Waether. Robe +1",
		hands = "Amalric Gages",
		ring1 = "Shiva Ring +1",
		ring2 = "Diamond Ring",
		back = "Cornflower cape",
		waist = "Salire Belt",
		legs = "Psycloth Lappas",
		feet = "Hashishin Basmak"
	}

	--Occultation is every 50 skill, magic barrier equals skill, rest dont matter
	---For example diamondhide caps at 500
	sets.BlueMagic.Skill = {
		ammo = "Mavi Tathlum",
		head = "Amalric Coif",
		neck = "Incanter's Torque",
		ear1 = "Suppanomimi",
		ear2 = "Ethereal earring",
		body = "Assim. jubbah +1",
		hands = "Hashishin Bazubands +1",
		ring1 = "Lebeche ring",
		ring2 = "Weatherspoon Ring",
		back = "Cornflower cape",
		waist = "Gishdubar Sash",
		legs = "Hashishin Tayt +1",
		feet = "Hashishin Basmak"
	}

	sets.BlueMagic.Enmity = {
		ammo = "Sapience Orb",
		head = "Rabid Visor",
		neck = "Warder's Charm +1",
		ear1 = "None",
		ear2 = "None",
		body = "Emet Harness +1",
		hands = "None",
		ring1 = "Supershear Ring",
		ring2 = "Pernicious Ring",
		back = "Mubvumbamiri mantle",
		waist = "None",
		legs = "Obatala Subligar",
		Feet = "None"
	}




	--Utility Sets--

	sets.Utility = {}

	sets.Utility.Steps = set_combine(sets.TP.AccuracyFull, {})
	
	sets.Utility.ProShell = set_combine(sets.BlueMagic.Buffs, {
		ring2 = "Sheltered Ring"
	})
	
	
	sets.Utility.PDT = {
		ammo = "Staunch Tathlum",
		head = "Aya. Zucchetto +1",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza",
		hands = "Herculean Gloves",
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Shadow Mantle",
		waist = "Flume belt +1",
		legs = "Ayanmo Cosciales",
		feet = "Aya. Gambieras +1"
	}
	
	sets.Utility.DerpDT = set_combine(sets.Utility.PDT, {
		back = "Engulfer Cape +1"
	})

	sets.Utility.DTHybrid = {
		ammo = "Falcon Eye",
		head = "Herculean Helm",
		neck = "Loricate Torque",
		ear1 = "Suppanomimi",
		ear2 = "Cessance Earring",
		body = "Adhemar Jacket",
		hands = HerculeanGloves.DT,
		ring1 = "Vocane Ring",
		ring2 = "Patricius Ring",
		back = Rosmerta.Crit,
		waist = "Olseni Belt",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}

	sets.Utility.MDTank = {
		ammo = "Staunch Tathlum",
		head = "Herculean Helm",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Emet Harness +1",
		hands = HerculeanGloves.DT,
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Flume belt +1",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}
	
	--Shell V on. Need 23% when 5/5 with pants, 21% with sheltered (23 again with sheltered and trust)--
	sets.Utility.MDTV = {
		ammo = "Staunch Tathlum",
		head = "Herculean Helm",
		neck = "Warder's Charm +1",
		ear1 = "Flashward Earring",
		ear2 = "Etiolation Earring",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Vocane Ring",
		ring2 = "Shadow Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak +1"
	}

	--Shell II only--
	sets.Utility.MDTII = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}

	--No Shell--
	sets.Utility.MDTNO = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet", 
		hands = HerculeanGloves.DT,
		ring1 = "Vocane Ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}

	--Telchine with proper ball busting augments is the best for magic evasion--
	sets.Utility.MEVA = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Loricate Torque",
		ear1 = "Flashward Earring",
		ear2 = "Hearty Earring",
		body = "Amalric Doublet",
		hands = "Leyline Gloves",
		ring1 = "Shiva Ring +1",
		ring2 = "Purity Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak +1"
	}

	--Set I made for something niche--
	sets.Utility.RSleep = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Invidia Torque",
		ear1 = "Flashward Earring",
		ear2 = "Hearty Earring",
		body = "Amalric Doublet",
		hands = "Leyline Gloves",
		ring1 = "Wuji Ring",
		ring2 = "Purity Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Acipayam Belt",
		legs = "Amalric Slops",
		feet = "Hashishin Basmak +1"
	}
	
	sets.Enhancing = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		body = "Telchine Chasuble",
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})

	--Job Ability Sets--

	sets.JA = {}

	sets.JA.ChainAffinity = { feet = "Assim. charuqs +1" }

	sets.JA.BurstAffinity = { feet = "Hashishin Basmak +1" }

	sets.JA.Efflux = { legs = "Hashishin Tayt +1", back= Rosmerta.WSD }

	sets.JA.AzureLore = { hands = "Luhlaza bazubands" }

	sets.JA.Diffusion = set_combine(sets.BlueMagic.Buffs, { feet = "Luhlaza charuqs +1" })

	sets.JA.Provoke = set_combine(sets.BlueMagic.Enmity, {})

	sets.JA.Warcry = set_combine(sets.BlueMagic.Enmity, {})


	--Precast Sets--
	sets.precast = {}

	sets.precast.FC = {}

	sets.precast.FC.Standard = {
		ammo = "Sapience Orb",
		head = "Amalric Coif",
		neck = "Voltsurge Torque",
		ear1 = "Loquac. Earring",
		ear2 = "Etiolation Earring",
		body = "Taeon Tabard",
		hands = "Leyline Gloves",
		ring1 = "Prolix Ring",
		ring2 = "Weatherspoon Ring",
		back = "Perimede Cape",
		waist = "Witful Belt",
		legs = "Psycloth Lappas",
		feet = "Carmine Greaves +1"
	}

	--Empy body stacks with FC, 80% cap, empy hands must be on at time of casting (mid) for effect--
	sets.precast.FC.Blue = set_combine(sets.precast.FC.Standard, {
		--body = "Hashishin Mintan"
	})
end

function maps()
	PhysicalSpells = S {
		'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance', 'Bloodrake',
		'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion',
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes', 'Barbed Crescent',
		'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage',
		'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball', 'Delta Thrust',
		'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack', 'Benthic Typhoon', 'Helldive',
		'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Heavy Strike'
	}

	PhysicalBlueMagic = S {
		'Asuran Claws', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch'
	}

	PhysicalBlueMagic_STR = S {
		'Battle Dance', 'Bloodrake', 'Death Scissors', 'Dimensional Death', 'Empty Thrash',
		'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 'Thrashing Assault', 'Vertical Cleave',
		'Whirl of Rage'
	}

	PhysicalBlueMagic_DEX = S {
		'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
		'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Paralyzing Triad', 'Seedspray',
		'Vanity Dive'
	}

	PhysicalBlueMagic_VIT = S {
		'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
		'Sprout Smack'
	}

	PhysicalBlueMagic_AGI = S {
		'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats'
	}

	BlueMagic_PhysicalAcc = S {
		'Heavy Strike'
	}

	MagicalSpells = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
		'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge',
		'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm',
		'Spectral Floe', 'Subduction', 'Sudden Lunge', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Mighty Guard',
		'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me', 'Blazing Bound',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush', 'Blinding Fulgor', 'Diffusion Ray', 'Ice Break',
		'Magic Hammer', 'Rail Cannon', 'Retinal Glare', 'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray'
	}

	BlueMagic_INT = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
		'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
		'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
		'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb'
	}

	BlueMagic_Dark = S {
		'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
	}

	BlueMagic_Light = S {
		'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
	}

	--- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
	BlueMagic_Earth = S {
		'Embalming Earth', 'Entomb', 'Sandspin'
	}

	BlueMagic_Accuracy = S {
		'1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
		'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
		'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
		'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
		'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
		'Venom Shell', 'Voracious Trunk', 'Yawn'
	}

	BlueMagic_Breath = S {
		'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
		'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
	}

	BlueMagic_Buffs = S {
		'Barrier Tusk', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
		'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat', 
		'Feather Barrier','Refueling','Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification'
	}

	BlueMagic_Skill = S {
		'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation', 'Atra. Libations'
	}

	BlueMagic_Healing = S {
		'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot'
	}
--- Acc + Macc "Stun" set ---
	BlueMagic_Stun = S {
		'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Whirl of Rage', 'Sub-zero Smash'
	}
	BlueMagic_Enmity = S {
		'Actinic Burst', 'Exuviation', 'Fantod', 'Jettatura', 'Temporal Shift'
	}
	BlueMagic_Diffusion = S {
		 'Harden Shell', 'Mighty Guard', 'Carcharian Verve'
	}
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 1)
end

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end