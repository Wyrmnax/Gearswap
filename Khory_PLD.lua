-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.Doom = buffactive.Doom or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'Reraise', 'Charm')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()
    
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
    send_command('bind @f11 gs c toggle EquipShield')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = {legs="Caballarius Breeches"}
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
    sets.precast.JA['Shield Bash'] = {hands="Caballarius Gauntlets"}
    sets.precast.JA['Sentinel'] = {feet="Caballarius Leggings"}
    sets.precast.JA['Rampart'] = {head="Caballarius Coronet"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat"}
    sets.precast.JA['Divine Emblem'] = {feet="Creed Sabatons +2"}
    sets.precast.JA['Cover'] = {head="Reverence Coronet +1"}

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Reverence Coronet +1",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Leviathan Ring",ring2="Aquasoul Ring",
        back="Weard Mantle",legs="Reverence Breeches +1",feet="Whirlpool Greaves"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Reverence Coronet +1",
        body="Gorney Haubert +1",hands="Reverence Gauntlets +1",ring2="Asklepian Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Whirlpool Greaves"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Incantor Stone",
		neck = "Voltsurge Torque",
        head="Cizin Helm",ear2="Loquacious Earring",ring2="Prolix Ring",ring2 = "Lebeche Ring",
		legs = "Founder's Hose",}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
			ammo="Amar Cluster",
			head={ name="Argosy Celata", augments={'DEX+10','Accuracy+15','"Dbl.Atk."+2',}},
			body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
			hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Argosy Sollerets", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			waist = "Fotia Belt",
			ear1 = "Moonshade earring",
			right_ear="Mache Earring",
			left_ring="Ifrit Ring",
			right_ring="Petrov Ring",
			back="Atheling Mantle",
			}

    sets.precast.WS.Acc = {ammo="Amar Cluster",
			head={ name="Argosy Celata", augments={'DEX+10','Accuracy+15','"Dbl.Atk."+2',}},
			body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
			hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Argosy Sollerets", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			waist = "Fotia Belt",
			ear1 = "Moonshade earring",
			right_ear="Mache Earring",
			left_ring="Ifrit Ring",
			right_ring="Petrov Ring",
			back="Atheling Mantle",}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ring1="Leviathan Ring",ring2="Aquasoul Ring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ring1="Leviathan Ring"})

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {hands="Buremte Gloves",waist="Zoran's Belt"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {waist="Zoran's Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Amar Cluster",
        head="Reverence Coronet +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Shiva Ring",ring2="K'ayres Ring",
        back="Toro Cape",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    
    sets.precast.WS['Atonement'] = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck=gear.ElementalGorget,
		ear1 = "Moonshade earring",ear2="Steelflash Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Rajas Ring",ring2="Vexer Ring",
        back="Fierabras's Mantle",waist=gear.ElementalBelt,legs="Reverence Breeches +1",feet="Caballarius Leggings"}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Reverence Coronet +1",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",
        waist="Zoran's Belt",legs="Enif Cosciales",feet="Reverence Leggings +1"}
        
    sets.midcast.Enmity = {        
	ammo="Staunch Tathlum",
    head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands={ name="Souv. Handschuhs", augments={'HP+50','Shield skill +10','Phys. dmg. taken -3',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Odyssean Greaves", augments={'Phys. dmg. taken -5%','STR+7','Accuracy+15',}},
    neck="Warder's Charm +1",
    waist="Flume Belt +1",
    left_ear="Halasz Earring",
    right_ear="Friomisi Earring",
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back={ name="Weard Mantle", augments={'VIT+2','Enmity+6',}},
	}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {legs="Enif Cosciales"})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {ammo="Iron Gobbet",
        head="Adaman Barbuta",neck="Invidia Torque",ear1="Hospitaler Earring",ear2="Bloodgem Earring",
        body="Reverence Surcoat +1",hands="Buremte Gloves",ring1="Kunaji Ring",ring2="Asklepian Ring",
        back="Fierabras's Mantle",waist="Chuq'aba Belt",legs="Reverence Breeches +1",feet="Caballarius Leggings"}

    sets.midcast['Enhancing Magic'] = {
    feet="Souveran Schuhs",}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {neck="Creed Collar",
        ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt"}
    

    -- Idle sets
    sets.idle ={
    main={ name="Nixxer", augments={'DMG:+15','Accuracy+15','Attack+15',}},
    sub={ name="Nibiru Shield", augments={'HP+80','Enmity+7','Phys. dmg. taken -5',}},
    ammo="Staunch Tathlum",
    head= "Jumalik Helm",
    body= "Jumalik mail",
    hands={ name="Souv. Handschuhs", augments={'HP+50','Shield skill +10','Phys. dmg. taken -3',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Souveran Schuhs",
    neck="Warder's Charm +1",
    waist="Flume Belt +1",
    left_ear="Odnowa earring +1",
    right_ear="Friomisi Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back={ name="Weard Mantle", augments={'VIT+2','Enmity+6',}},
}

    sets.idle.Town = sets.idle;
	
    sets.idle.Weak = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Creed Collar",ear1="Creed Earring",ear2="Bloodgem Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Fierabras's Mantle",waist="Flume belt +1",legs="Crimson Cuisses",feet="Reverence Leggings +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle"}
    sets.MP = {neck="Creed Collar",waist="Flume belt +1"}
    sets.MP_Knockback = {neck="Creed Collar",waist="Flume belt +1",back="Repulse Mantle"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {main="Anahera Sword",sub="Killedar Shield"} -- Ochain
    sets.MagicalShield = {main="Anahera Sword",sub="Beatific Shield +1"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Buckler Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume belt +1",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    sets.defense.HP = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Defending Ring",ring2="Meridian Ring",
        back="Weard Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    sets.defense.Reraise = {ammo="Iron Gobbet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
        body="Twilight Mail",hands="Reverence Gauntlets +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Weard Mantle",waist="Nierenschutz",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    sets.defense.Charm = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Lavalier +1",ear1="Creed Earring",ear2="Buckler Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume belt +1",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {ammo="Demonry Stone",
        head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Creed Baudrier",legs="Osmium Cuisses",feet="Reverence Leggings +1"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged ={
    main={ name="Nixxer", augments={'DMG:+15','Accuracy+15','Attack+15',}},
    sub={ name="Nibiru Shield", augments={'HP+80','Enmity+7','Phys. dmg. taken -5',}},
    ammo="Staunch Tathlum",
    head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands={ name="Souv. Handschuhs", augments={'HP+50','Shield skill +10','Phys. dmg. taken -3',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Souveran Schuhs",
    neck="Warder's Charm +1",
    waist="Flume Belt +1",
    left_ear="Odnowa earring +1",
    right_ear="Friomisi Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back={ name="Weard Mantle", augments={'VIT+2','Enmity+6',}},
}

    sets.engaged.Acc = {ammo="Amar Cluster",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Weard Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}

    sets.engaged.DW = {ammo="Amar Cluster",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Gorney Haubert +1",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Cetl Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}

    sets.engaged.DW.Acc = {ammo="Amar Cluster",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Weard Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}

    sets.engaged.PDT = set_combine(sets.engaged, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
        handle_equipping_gear(player.status)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    
    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
    
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
    
    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
    
    return defenseSet
end


function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra: ' .. state.ExtraDefenseMode.value
    end
    
    if state.EquipShield.value == true then
        msg = msg .. ', Force Equip Shield'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 3)
    else
        set_macro_page(1, 3)
    end
end
