-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
    absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-ACC', 'Absorb-TP'}
    state.CapacityMode = M(false, 'Capacity Point Mantle')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.Buff.Poison = buffactive['Poison'] or false

    state.OffenseMode:options('None', 'Normal', 'Melee')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Melee')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    geo_sub_weapons = S{"Nehushtan", "Bolelabunga"}

    select_default_macro_book()
    send_command('bind != gs c toggle CapacityMode')
end

function file_unload()
    send_command('unbind !=')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 
        'Stonera', 'Watera', 'Aerora', 'Fira', 'Blizzara', 'Thundara',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1", body="Geomancy Tunic", back="Nantosuelta's Cape"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}

    sets.CapacityMantle  = { back="Mecistopins Mantle" }

    sets.Organizer = {
        main="Nehushtan", 
    }

    -- Fast cast sets for spells

    sets.precast.FC = {
        main="Grioavolr",
        head="Merlinic Hood",
		neck = "Voltsurge Torque",
        ear2="Loquacious Earring",
        hands="Magavan Mitts",
		body="Shango Robe",
		left_ring="Jhakri Ring",
		right_ring = "Lebeche Ring",
        back="Lifestream Cape",
        waist="Witful Belt",
        legs="Geomancy Pants",
        feet="Chelona Boots"
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --back="Pahtli Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    })

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        --head="Nahtirah Hat",
        neck= "Fotia Gorget",		
		ear1 = "Moonshade earring",
        ear2="Brutal Earring",		
		waist = "Fotia Belt",
        body="Jhakri Robe +2",
        hands="Gazu Bracelet",
        ring1="Rajas Ring",
        right_ring="Petrov Ring",
        back="Buquwik Cape",
        waist=gear.ElementalBelt,
    }

    sets.precast.WS['Flash Nova'] = {
        --head="Nahtirah Hat",
        neck= "Fotia Gorget",
		ear1 = "Moonshade earring",
        ear2="Brutal Earring",
        body="Jhakri Robe +2",
        hands="Gazu Bracelet",
        ring1="Rajas Ring",
        right_ring="Petrov Ring",
        back="Buquwik Cape",
        waist=gear.ElementalBelt,
    }

    sets.precast.WS['Starlight'] = {}

    sets.precast.WS['Moonlight'] = {}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
        ear2="Loquacious Earring",
        neck="Incanter's Torque",
        body="Azimuth Coat", -- 3%
        hands="Amalric Gages", 
		left_ring="Jhakri Ring",
        back="Lifestream Cape",
        waist="Witful Belt", -- 4%
        legs="Geomancy Pants", -- 5%
    }
    sets.midcast.Trust =  {
         head="Azimuth hood +1",
         hands="Amalric Gages", 
         body="Azimuth Coat",
         legs="Azimuth Tights +1",
         feet="Amalric Nails"
    }
     sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {
         body="Apururu Unity shirt",
     })

    sets.midcast.Geomancy = {
        main="Solstice",
        range="Dunna",
        head="Hike Khat", -- 10
        neck="Incanter's Torque", -- 10		
        ear1="Gwati Earring",
		body="Bagua Tunic +1", -- 12
        hands="Geomancy Mitaines", -- 15
		left_ring="Jhakri Ring",
        back="Lifestream Cape", -- 9
        legs="Geomancy Pants",
        feet="Amalric Nails"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs="Bagua Pants",
        feet="Azimuth Gaiters",
        back="Lifestream Cape", -- 9
    })

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
        main="Grioavolr",
        neck="Incanter's Torque",
        hands="Telchine Gloves",
    	back="Solemnity Cape",
        legs="Telchine Braconi"
    })
    
    sets.midcast.Curaga = sets.midcast.Cure

    --sets.midcast.Protectra = {ring1="Sheltered Ring"}

    --sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast.HighTierNuke = {
        main="Grioavolr",
        sub="Niobid Strap",
        --sub="Wizzan Grip",
        ammo="Witchstone",
        head="Amalric Coif",
        neck="Sanctity Necklace",
        ear1="Moldavite Earring",
        ear2="Friomisi Earring",
        body="Jhakri Robe +2",
        hands="Amalric Gages", 
		left_ring="Jhakri Ring",
        right_ring="Mujin Band",
        back="Twilight Cape",
        waist="Salire Belt", 
        legs="Amalric Slops",
        feet="Amalric Nails"
    }
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
        head="Merlinic Hood",
        ear1="Moldavite Earring",
        ear2="Friomisi Earring", 
        hands="Amalric Gages", 
        back="Refraction Cape",
        legs="Amalric Slops",
        feet="Amalric Nails"
        --feet="Bokwus Boots"
    })
    --sets.midcast['Elemental Magic'].Mindmelter = set_combine(sets.midcast.HighTierNuke, {
    --    main="Mindmelter"
    --})

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
        sub="Giuoco Grip",
        ear2="Friomisi Earring",
        body="Witching Robe",
		left_ring="Jhakri Ring",
        feet="Amalric Nails"
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        head="Merlinic Hood",
        ear1="Moldavite Earring",
        ear2="Gwati Earring", 		
        body="Jhakri Robe +2",
        hands="Amalric Gages", 
        legs="Amalric Slops",
        ring1="Sangoma Ring",
		left_ring="Jhakri Ring",
        right_ring="Mujin Band",
        back="Refraction Cape",
        feet="Amalric Nails"
    })

    sets.midcast.Macc = { 
        main="Grioavolr",
        sub="Niobid Strap", 
        ammo="Plumose Sachet",
        head="Amalric Coif",
        neck="Sanctity Necklace", 
        ear1="Lifestorm Earring", 
        ear2="Psystorm Earring",
        body="Azimuth Coat",
        hands="Amalric Gages",
		left_ring="Jhakri Ring",
        right_ring="Sangoma Ring",
        back="Refraction Cape",
        legs="Psycloth Lappas",
        waist="Yamabuki-no-obi", 
        feet="Amalric Nails"
    }
    sets.midcast.Absorb = set_combine(sets.midcast.Macc, {
        head="Amalric Coif",
        neck="Incanter's Torque", 
        ear1="Gwati Earring",
        ring1="Evanescence Ring",
        right_ring="Excelsis Ring",
        body="Geomancy Tunic",
        legs="Azimuth Tights +1",
    })
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Amalric Coif",
        neck="Incanter's Torque", 
        ear1="Gwati Earring",
        ear2="Hirudinea Earring",
        ring1="Evanescence Ring",
        right_ring="Excelsis Ring",
        body="Geomancy Tunic",
        legs="Azimuth Tights +1",
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc
    
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        neck="Incanter's Torque",
        waist="Casso Sash",
        back="Lifestream Cape",
        hands="Azimuth Gloves",
        right_ring="Globidonta Ring",
        feet="Bagua Sandals"
    })
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back="Lifestream Cape",
        ring1="Shiva Ring",
        right_ring="Globidonta Ring",
        feet="Bagua Sandals"
    })

	sets.midcast['Enhancing Magic'] = sets.midcast.FastRecast
        --sub="Fulcio Grip", 
        --neck="Colossus's Torque", 
        --body="Anhur Robe",
        --hands="Ayao's Gloves"
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        neck="Loricate Torque",
        body="Jhakri Robe +2",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        right_ring="Paguroidea Ring",
        --waist="Austerity Belt",
        --legs="Nares Trews",
    }


    -- Idle sets
    sets.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        range="Dunna",
        head="Amalric Coif",
        neck="Loricate Torque",
        ear1="Moldavite Earring",
        ear2="Friomisi Earring",
        body="Jhakri Robe +2",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        right_ring="Vocane Ring",
    	back="Cheviot Cape",
        waist="Fucho-no-obi",
        legs="Assid. Pants +1",
        feet="Geomancy Sandals"
    }
    sets.idle.PDT = set_combine(sets.idle, {
        head="Hike Khat",
        neck="Loricate Torque",
        hands="Geomancy Mitaines",
    	back="Solemnity Cape",
        feet="Azimuth Gaiters"
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        head="Hike Khat",
        neck="Loricate Torque",
        hands="Geomancy Mitaines",
        back="Lifestream Cape",
        feet="Bagua Sandals"
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
        right_ring="Patricius Ring",
    })

    sets.idle.Melee = set_combine(sets.idle, {
        main="Malevolence",
        neck="Lissome Necklace",
        --sub="Bolelabunga"
    })

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {
    --    legs="Bagua Pants", 
    --    feet="Geomancy Sandals",
    --    back="Lifestream Cape",
    --    --feet="Azimuth Gaiters"
    --})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
    --    legs="Bagua Pants", 
    --})
    --sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {
    --    legs="Bagua Pants", 
    --    feet="Azimuth Gaiters"
    --})
    --sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {
    --    legs="Bagua Pants", 
    --})

    sets.idle.Town = {
		body = "Novennial Dress",
		legs = "Novennial Boots",
		head = "Pixie Hairpin +1"		
    }

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
        range="Dunna",
        head="Merlinic Hood",
        neck="Loricate Torque",
        ear1="Zennaroi Earring",
        body="Azimuth Coat",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        right_ring="Vocane Ring",
        back="Cheviot Cape",
		waist = "Flume belt +1",
		legs="Nares Trews",
        feet="Azimuth Gaiters"
    }

    sets.defense.MDT = {
        range="Dunna",
        --head="Nahtirah Hat",
        --neck="Wiglen Gorget",
        ear1="Zennaroi Earring",
        ear2="Loquacious Earring",
        body="Azimuth Coat",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        right_ring="Vocane Ring",
        back="Dark Cape",
        waist="Yamabuki-no-Obi",
		legs="Nares Trews",
        --legs="Bokwus Slops",
    }

    sets.Kiting = {}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        range="Dunna",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Azimuth Coat",
        --body="Vanir Cotehardie",
        hands="Geomancy Mitaines",
        ring1="Petrov Ring",
        right_ring="K'ayres Ring",
        back="Kayapa Cape",
        waist="Windbuffet Belt +1",
        legs="Geomancy Pants",
        feet="Amalric Nails"
    }
    sets.engaged.Melee = set_combine(sets.engaged, {
        main="Malevolence",
    })
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	refine_various_spells(spell, action, spellMap, eventArgs)
    --if state.Buff.Poison then
    --    classes.CustomClass = 'Mindmelter'
    --end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    -- Make sure abilities using head gear don't swap 
	if spell.type:lower() == 'weaponskill' then
        -- CP mantle must be worn when a mob dies, so make sure it's equipped for WS.
        if state.CapacityMode.value then
            equip(sets.CapacityMantle)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
--function job_status_change(newStatus, oldStatus, eventArgs)
--    if newStatus == 'Engaged' then
--        -- nothing yet
--        elseif newStatus == 'Idle' then
--            determine_idle_group()
--    end
--end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Melee' then
            disable('main','sub')
        else
            enable('main','sub')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
            return 'Absorb'
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
            if lowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        elseif spell.type == 'Trust' then
            return 'Trust'

        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CapacityMode.value then
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end
    if state.OffenseMode.value == 'Melee' then
        idleSet = set_combine(sets.idle, sets.idle.Melee)
    end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    return meleeSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end
--Refine Nuke Spells
function refine_various_spells(spell, action, spellMap, eventArgs)
	aspirs = S{'Aspir','Aspir II','Aspir III'}
	sleeps = S{'Sleep II','Sleep'}
	sleepgas = S{'Sleepga II','Sleepga'}
	nukes = S{'Fire', 'Blizzard', 'Aero', 'Stone', 'Thunder', 'Water',
	'Fire II', 'Blizzard II', 'Aero II', 'Stone II', 'Thunder II', 'Water II',
	'Fire III', 'Blizzard III', 'Aero III', 'Stone III', 'Thunder III', 'Water III',
	'Fire IV', 'Blizzard IV', 'Aero IV', 'Stone IV', 'Thunder IV', 'Water IV',
	'Fire V', 'Blizzard V', 'Aero V', 'Stone V', 'Thunder V', 'Water V',
	'Fire VI', 'Blizzard VI', 'Aero VI', 'Stone VI', 'Thunder VI', 'Water VI',
	'Firaga', 'Blizzaga', 'Aeroga', 'Stonega', 'Thundaga', 'Waterga',
	'Firaga II', 'Blizzaga II', 'Aeroga II', 'Stonega II', 'Thundaga II', 'Waterga II',
	'Firaga III', 'Blizzaga III', 'Aeroga III', 'Stonega III', 'Thundaga III', 'Waterga III',	
	'Firaja', 'Blizzaja', 'Aeroja', 'Stoneja', 'Thundaja', 'Waterja',
	}
	cures = S{'Cure IV','Cure V','Cure IV','Cure III','Curaga III','Curaga II', 'Curaga',}
	
	if spell.skill == 'Healing Magic' then
		if not cures:contains(spell.english) then
			return
		end
		
		local newSpell = spell.english
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
		
		if spell_recasts[spell.recast_id] > 0 then
			if cures:contains(spell.english) then
				if spell.english == 'Cure' then
					add_to_chat(122,cancelling)
					eventArgs.cancel = true
				return
				elseif spell.english == 'Cure IV' then
					newSpell = 'Cure V'
				elseif spell.english == 'Cure V' then
					newSpell = 'Cure IV'
				elseif spell.english == 'Cure IV' then
					newSpell = 'Cure III'
				end
			end
		end
		
		if newSpell ~= spell.english then
			send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
			eventArgs.cancel = true
			return
		end
	elseif spell.skill == 'Dark Magic' then
		if not aspirs:contains(spell.english) then
			return
		end
		
		local newSpell = spell.english
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'

		if spell_recasts[spell.recast_id] > 0 then
			if aspirs:contains(spell.english) then
				if spell.english == 'Aspir' then
					add_to_chat(122,cancelling)
					eventArgs.cancel = true
				return
				elseif spell.english == 'Aspir II' then
					newSpell = 'Aspir'
				elseif spell.english == 'Aspir III' then
					newSpell = 'Aspir II'
				end
			end
		end
		
		if newSpell ~= spell.english then
			send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
			eventArgs.cancel = true
			return
		end
	elseif spell.skill == 'Elemental Magic' then
		if not sleepgas:contains(spell.english) and not sleeps:contains(spell.english) and not nukes:contains(spell.english) then
			return
		end

		local newSpell = spell.english
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'

		if spell_recasts[spell.recast_id] > 0 then
			if sleeps:contains(spell.english) then
				if spell.english == 'Sleep' then
					add_to_chat(122,cancelling)
					eventArgs.cancel = true
				return
				elseif spell.english == 'Sleep II' then
					newSpell = 'Sleep'
				end
			elseif sleepgas:contains(spell.english) then
				if spell.english == 'Sleepga' then
					add_to_chat(122,cancelling)
					eventArgs.cancel = true
					return
				elseif spell.english == 'Sleepga II' then
					newSpell = 'Sleepga'
				end
			elseif nukes:contains(spell.english) then	
				if spell.english == 'Fire' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Fire VI' then
					newSpell = 'Fire V'
				elseif spell.english == 'Fire V' then
					newSpell = 'Fire IV'
				elseif spell.english == 'Fire IV' then
					newSpell = 'Fire III'	
				elseif spell.english == 'Fire II' then
					newSpell = 'Fire'
				elseif spell.english == 'Firaja' then
					newSpell = 'Firaga III'
				elseif spell.english == 'Firaga II' then
					newSpell = 'Firaga'
				end 
				if spell.english == 'Blizzard' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Blizzard VI' then
					newSpell = 'Blizzard V'
				elseif spell.english == 'Blizzard V' then
					newSpell = 'Blizzard IV'
				elseif spell.english == 'Blizzard IV' then
					newSpell = 'Blizzard III'	
				elseif spell.english == 'Blizzard II' then
					newSpell = 'Blizzard'
				elseif spell.english == 'Blizzaja' then
					newSpell = 'Blizzaga III'
				elseif spell.english == 'Blizzaga II' then
					newSpell = 'Blizzaga'	
				end 
				if spell.english == 'Aero' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Aero VI' then
					newSpell = 'Aero V'
				elseif spell.english == 'Aero V' then
					newSpell = 'Aero IV'
				elseif spell.english == 'Aero IV' then
					newSpell = 'Aero III'	
				elseif spell.english == 'Aero II' then
					newSpell = 'Aero'
				elseif spell.english == 'Aeroja' then
					newSpell = 'Aeroga III'
				elseif spell.english == 'Aeroga II' then
					newSpell = 'Aeroga'	
				end 
				if spell.english == 'Stone' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Stone VI' then
					newSpell = 'Stone V'
				elseif spell.english == 'Stone V' then
					newSpell = 'Stone IV'
				elseif spell.english == 'Stone IV' then
					newSpell = 'Stone III'	
				elseif spell.english == 'Stone II' then
					newSpell = 'Stone'
				elseif spell.english == 'Stoneja' then
					newSpell = 'Stonega III'
				elseif spell.english == 'Stonega II' then
					newSpell = 'Stonega'	
				end 
				if spell.english == 'Thunder' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Thunder VI' then
					newSpell = 'Thunder V'
				elseif spell.english == 'Thunder V' then
					newSpell = 'Thunder IV'
				elseif spell.english == 'Thunder IV' then
					newSpell = 'Thunder III'	
				elseif spell.english == 'Thunder II' then
					newSpell = 'Thunder'
				elseif spell.english == 'Thundaja' then
					newSpell = 'Thundaga III'
				elseif spell.english == 'Thundaga II' then
					newSpell = 'Thundaga'	
				end 
				if spell.english == 'Water' then
					eventArgs.cancel = true
					return
				elseif spell.english == 'Water VI' then
					newSpell = 'Water V'
				elseif spell.english == 'Water V' then
					newSpell = 'Water IV'
				elseif spell.english == 'Water IV' then
					newSpell = 'Water III'	
				elseif spell.english == 'Water II' then
					newSpell = 'Water'
				elseif spell.english == 'Waterja' then
					newSpell = 'Waterga III'
				elseif spell.english == 'Waterga II' then
					newSpell = 'Waterga'	
				end 
			end
		end

		if newSpell ~= spell.english then
			send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
			eventArgs.cancel = true
			return
		end
	end
end

