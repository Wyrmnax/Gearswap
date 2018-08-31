



---------------------------------------------------------------------------------
-- This lua is based off of the Kinematics template and uses Motenten globals. --
--                                                                             --
-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Byrne (Asura) --------------- [handling of sets and autoMP arguments]    --
--	  Gamergiving (Asura) ----------- [movement speed conversion mechanics]    --
--        Verbannt (Asura) -------------------  [organization of job functions]    --
--	  Lygre(Odin) ------------------------ [Made what this is based off of]    --
--                                                                             --
---------------------------------------------------------------------------------
	
	
-- This file should be treated as a work in progress, check back to The Black Sacrament Guide or Github for updates


	
	
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
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Setup which sets you want to contain which sets of gear. 
-- By default my sets are: Normal is bursting gear, Occult_Acumen is Conserve MP/MP return body, FreeNuke_Effect self explanatory.
-- If you're new to gearswap, the F9~12 keys and CTRL keys in combination is how you activate this stuff.

function job_setup()
    state.OffenseMode:options('None', 'Locked')
    state.CastingMode:options('Normal', 'Occult_Acumen', 'FreeNuke_Effect')
    state.IdleMode:options('Normal', 'PDT')
	state.VorsealMode = M('Normal', 'Vorseal')
	--Vorseal mode is handled simply when zoning into an escha zone--
    state.Moving  = M(false, "moving")
   
    MagicBurstIndex = 0
    state.MagicBurst = M(false, 'Magic Burst')
    state.ConsMP = M(false, 'AF Body')
    element_table = L{'Earth','Wind','Ice','Fire','Water','Lightning'}
    state.AOE = M(false, 'AOE')
 
 
    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
 
    degrade_array = {
        ['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V','Fire VI'},
        ['Firega'] = {'Firaga','Firaga II','Firaga III','Firaja'},
        ['Ice'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V','Blizzard VI'},
        ['Icega'] = {'Blizzaga','Blizzaga II','Blizzaga III','Blizzaja'},
        ['Wind'] = {'Aero','Aero II','Aero III','Aero IV','Aero V','Aero VI'},
        ['Windga'] = {'Aeroga','Aeroga II','Aeroga III','Aeroja'},
        ['Earth'] = {'Stone','Stone II','Stone III','Stone IV','Stone V','Stone VI'},
        ['Earthga'] = {'Stonega','Stonega II','Stonega III','Stoneja'},
        ['Lightning'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V','Thunder VI'},
        ['Lightningga'] = {'Thundaga','Thundaga II','Thundaga III','Thundaja'},
        ['Water'] = {'Water', 'Water II','Water III', 'Water IV','Water V','Water VI'},
        ['Waterga'] = {'Waterga','Waterga II','Waterga III','Waterja'},
        ['Aspirs'] = {'Aspir','Aspir II','Aspir III'},
        ['Sleepgas'] = {'Sleepga','Sleepga II'}
    }
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle CastingMode')
    organizer_items = {aeonic="Khatvanga"}
    select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
	send_command('unbind f10')
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
     
    ---- Precast Sets ----
     
    -- Precast sets to enhance JAs
	
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape",feet="Wicce Sabots +1"}
 
    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
     
    -- Can put HP/MP set here for convert
	
    sets.precast.JA.Convert = {}
 
 
    -- Base precast Fast Cast set, this set will have to show up many times in the function section of the lua
	-- So dont forget to do that.
 
    sets.precast.FC = {
	ammo="Staunch Tathlum",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Merlinic Jubbah",
    hands="Amalric Gages",
    legs="Mallquis Trews +1",
    feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
	neck = "Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Jhakri Ring",
    right_ring = "Lebeche Ring",
    back="Thauma. Cape",
	}
		
	
	sets.precast.FC.HighMP = {
	ammo="Staunch Tathlum",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Shango Robe",
    hands="Ea Cuffs",
    legs="Mallquis Trews +1",
    feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
	neck = "Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Jhakri Ring",
    right_ring = "Lebeche Ring",
    back="Thauma. Cape",
	}
		
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Enfeebling Magic'] = sets.precast.FC
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole earring"})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {body="Heka's Kalasiris",legs="Doyen pants", back="Pahtli Cape"})
 
    -- Midcast set for Death, Might as well only have one set, unless you plan on free-nuking death for some unexplainable reason.

    sets.midcast['Death'] = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Jhakri Robe +2",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+10%','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
		feet="Merlinic Crackows",
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Static Earring",
		left_ring="Archon Ring",
		right_ring="Mujin Band",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},}
 
    -- Sets for WS, Feel free to add one for Vidohunir if you have Laevateinn

    sets.precast.WS['Myrkr'] = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		hands="Amalric Gages",
		legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		feet="Psycloth Boots",
		neck="Sanctity Necklace",
		waist="Yamabuki-no-Obi",
		left_ear="Evans Earring",
		right_ear="Moonshade Earring",
		left_ring="Bifrost Ring",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},}
 
    ---- Midcast Sets ----
    sets.midcast.FastRecast = {}
 
    sets.midcast['Healing Magic'] = {}

    sets.midcast['Enhancing Magic'] = {
		main={ name="Grioavolr", augments={'MP+32','Mag. Acc.+30','"Mag.Atk.Bns."+30',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +4',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +4',}},
		hands={ name="Telchine Gloves", augments={'"Fast Cast"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		left_ear="Hearty Earring",
		right_ear="Dominance Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Solemnity Cape",
		}
 
	-- I personally do not have gear to alter these abilities as of the time of disseminating this file, but 
	-- definitely add them here if you have them.
 
    sets.midcast.Refresh = {}
    sets.midcast.Haste = {}
    sets.midcast.Phalanx = {}
    sets.midcast.Aquaveil = {}
    sets.midcast.Stoneskin = {}
 
    sets.midcast['Enfeebling Magic'] = {
		ammo="Ghastly Tathlum +1",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Mallquis Trews +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Vertigo Ring",
    right_ring={ name="Diamond Ring", augments={'INT+2','Spell interruption rate down -1%','"Resist Silence"+1',}},
    --back="Taranus's Cape",
	}   

    sets.midcast['Enfeebling Magic'].FreeNuke_Effect = set_combine(sets.midcast['Enfeebling Magic'],{
	ammo="Ghastly Tathlum +1",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Mallquis Trews +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Vertigo Ring",
    right_ring={ name="Diamond Ring", augments={'INT+2','Spell interruption rate down -1%','"Resist Silence"+1',}},
    --back="Taranus's Cape",
	})

	sets.midcast['Enfeebling Magic'].Occult_Acumen = set_combine(sets.midcast['Enfeebling Magic'],{
		ammo="Ghastly Tathlum +1",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Mallquis Trews +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Vertigo Ring",
    right_ring={ name="Diamond Ring", augments={'INT+2','Spell interruption rate down -1%','"Resist Silence"+1',}},
    --back="Taranus's Cape",
	})
	
	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
 
    sets.midcast['Dark Magic'] = {
	ammo="Ghastly Tathlum +1",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Jhakri Ring",
    right_ring="Evanescence Ring",
    --back="Taranus's Cape",
	}
 
    -- Elemental Magic sets
     
    sets.midcast['Elemental Magic'] = {
	main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Spaekona's Coat +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Mujin Band",
    --back="Taranus's Cape",
	}

    sets.midcast['Elemental Magic'].FreeNuke_Effect = set_combine(sets.midcast['Elemental Magic'], {
		    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Spaekona's Coat +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Shiva Ring",
    --back="Taranus's Cape",
	})
		
    sets.midcast['Elemental Magic'].Occult_Acumen = set_combine(sets.midcast['Elemental Magic'], {
		})
		
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	
    sets.midcast['Elemental Magic'].HighTierNuke.FreeNuke_Effect = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
	main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Spaekona's Coat +2",
    hands="Ea Cuffs",
    legs={ name="Amalric Slops", augments={'MP+60','"Mag.Atk.Bns."+20','Enmity-5',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Shiva Ring",
    --back="Taranus's Cape",
	})
		
    sets.midcast['Elemental Magic'].HighTierNuke.Occult_Acumen = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
		})
 
    sets.midcast.Impact = {
		head=empty,body="Twilight Cloak",
		hands="Jhakri cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet="Merlinic Crackows",
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Dignitary's Earring",
		right_ear="Barkaro. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
	
	sets.midcast['Comet'] = set_combine(sets.midcast['Elemental Magic'], {
		head="Pixie Hairpin +1",
		})
 
	sets.midcast['Comet'].FreeNuke_Effect = set_combine(sets.midcast['Elemental Magic'], {
		head="Pixie Hairpin +1",
		})
	
-- These next two sets are used later in the functions to determine what gear will be used in High MP and Low MP situations
-- SPECIFICALLY for Aspir spells.  In the LowMP set, put your best Aspir+ gear, in the other set put your best Max MP gear.
-- Find out how much your maximum MP is in each set, and adjust the MP values in the function area accordingly
-- (CTRL+F: Aspir Handling)

	sets.midcast.HighMP = {
		main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Evanescence Ring",
	right_ring="Mujin Band",
    --back="Taranus's Cape",
	}
 
	sets.midcast.LowMP = {
	main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','"Mag.Atk.Bns."+9',}},
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Evanescence Ring",
	right_ring="Mujin Band",
    --back="Taranus's Cape",
	}
		
    --Set to be equipped when Day/Weather match current spell element

    sets.Obi = {waist='Hachirin-no-Obi'}
	
	-- I actually have two references to equip this item, just in case your globals are out of date.
 
    -- Resting sets
	
    sets.resting = {}
 
    -- Idle sets: Make general idle set a max MP set, later hooks will handle the rest of your refresh sets, but
	-- remember to alter the refresh sets (Ctrl+F to find them)

    sets.idle = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Assid. Pants +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape"
	}
 
    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = { 
	main="Earth Staff",
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Assid. Pants +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape"
	}
     
    sets.Adoulin = {
        body="Councilor's Garb",
    }

    sets.MoveSpeed = {
        feet = "Herald's Gaiters",
    }
    
             
    sets.TreasureHunter = {waist="Chaac Belt"}
 
    -- Set for Conserve MP toggle, convert damage to MP body.
	
    sets.ConsMP = {body="Seidr Cotehardie"}
 
    --- PDT set is designed to be used for MP total set, MDT can be used for whatever you like but in MDT mode
	--- the player.mp arguments will likely stop working properly
	
    sets.defense.PDT = {
	main="Earth Staff",
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape",
	}
 
    sets.defense.MDT = {
		    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape",
	}
 
    sets.Kiting = {feet="Herald's Gaiters"}
	
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	
	sets.auto_refresh = {
	main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs="Assid. Pants +1",
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape",
	}
 
    -- Mana Wall idle set

    sets.buff['Mana Wall'] = {
		main="Terra's Staff",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Kaabnax Hat",
		body="Merlinic Jubbah",
		hands="Hagondes Cuffs +1",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Wicce Sabots +1",
		neck="Loricate Torque +1",
		waist="Slipor Sash",
		left_ear="Merman's Earring",
		right_ear="Merman's Earring",
		left_ring="Karieyh Ring",
		right_ring="Defending Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},}
 
    -- Engaged sets
 
    -- Set is designed for engaging a monster before pop to ensure you are at maximum MP value when Geas Fete triggers an MP refill.
	-- This is mostly used in this lua in situations where a fight is about to be initiated and you arent above whatever the maximum
	-- value for your idle set is.  Another simple way around this is to simply make a macro to equip the gear before the fight starts.
	
	sets.engaged = {    
	main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Ea Cuffs",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Mallquis Clogs +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    --back="Cheviot Cape",
	}
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
--- Define MP and buff specific Fast Cast and Midcast sets for conservation of MP for death sets, most will be
--- handled on thier own. What you need to change is the player.mp value to match slightly under what your max
--- MP is in your standard fast cast set. The set is designed to Dynamically switch fast cast sets to sets that
--- preserve your MP total if you are above the amount at which equiping your standard set would decrease your
--- maximum MP. Due to a rework in how these arguments are organised, all gearsets are being handled above the
--- function block for this file.
 
function job_precast(spell, action, spellMap, eventArgs)
    enable('feet','back')
	end

function job_post_precast(spell, action, spellMap, eventArgs)
	if player.mp > 2000 and state.VorsealMode.value == 'Vorseal' then
	equip(sets.precast.FC.HighMP)
	elseif player.mp < 2000 and state.VorsealMode.value == 'Vorseal' then
	equip(sets.precast.FC)
	elseif player.mp > 1650 and state.VorsealMode.value == 'Normal' then
	equip(sets.precast.FC.HighMP)
	elseif player.mp < 1650 and state.VorsealMode.value == 'Normal' then
	equip(sets.precast.FC)
end

if spell.english == "Impact" then
        equip({head=empty,body="Twilight Cloak"})
    elseif spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Hachirin-no-obi"
    end
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

-- This section is for you to define at what value your Aspir sets will change. This is to let your aspirs
-- get you into your death idle and higher MP values. This number should be around 100 MP lower than the
-- Fast cast argument above this to prevent looping. The intent is to ensure that if you use aspir while you
-- are already above a value defined in this section then it will put on your highest MP set, capping you off
-- rather than simply capping you to whatever your Aspir potency set's max MP value happens to be.

    if spell.action_type == 'Magic' then
			if spell.element == world.weather_element or spell.element == world.day_element then
            equip(set_combine(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi",}))
        end
            if spell.english == 'Death' then
                equip(sets.midcast['Death'])
			end
	end
 end

 -- Aspir Handling
 
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III' and state.VorsealMode.value == 'Vorseal' and player.mp > 1910 then
	equip(sets.midcast.HighMP)
	elseif spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III' and state.VorsealMode.value == 'Vorseal' and player.mp < 1910 then
	equip(sets.midcast.LowMP)
	elseif spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III' and state.VorsealMode.value == 'Normal' and player.mp > 1640 then
	equip(sets.midcast.HighMP)
	elseif spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III' and state.VorsealMode.value == 'Normal' and player.mp < 1640 then
	equip(sets.midcast.LowMP)
	end
	
    if spell.element == world.day_element or spell.element == world.weather_element then
        if string.find(spell.english,'helix') then
            equip(sets.midcast.Helix)
        else 
            equip(sets.Obi)
        end
    end
	if spell.skill == 'Elemental Magic' and (player.mp-spell.mp_cost) < 436 then
		equip(sets.ConsMP)
		end
	if spell.skill == 'Enfeebling Magic' and state.HybridMode ~= 'Resist' then
	equip(sets.midcast['Enfeebling Magic'].Effect)
	end
end
 
-- Duration arguments
-- Below you can include wait inputs for all spells that you are interested in having timers for
-- For the sake of brevity, I've only included crowd control spells into this list, but following
-- the same general format you should be able to intuitively include whatever you like.
 
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if buffactive['Mana Wall'] then
        enable('feet','back')
        equip(sets.buff['Mana Wall'])
        disable('feet','back')
    end
    if not spell.interrupted then
        if spell.english == "Sleep II" or spell.english == "Sleepga II" then -- Sleep II Countdown --
            send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Break" or spell.english == "Breakga" then -- Break Countdown --
            send_command('wait 25;input /echo Break Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Paralyze" then -- Paralyze Countdown --
             send_command('wait 115;input /echo Paralyze Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Slow" then -- Slow Countdown --
            send_command('wait 115;input /echo Slow Effect: [WEARING OFF IN 5 SEC.]')        
        end
    end
 
end
 
function nuke(spell, action, spellMap, eventArgs)
    if player.target.type == 'MONSTER' then
        if state.AOE.value then
            send_command('input /ma "'..degrade_array[element_table:append('ga')][#degrade_array[element_table:append('ga')]]..'" '..tostring(player.target.name))
        else
            send_command('input /ma "'..degrade_array[element_table][#degrade_array[element_table]]..'" '..tostring(player.target.name))
        end
    else 
        add_to_chat(5,'A Monster is not targetted.')
    end
end
 
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1] == 'element' then
        if commandArgs[2] then
            if element_table:contains(commandArgs[2]) then
                element_table = commandArgs[2]
                add_to_chat(5, 'Current Nuke element ['..element_table..']')
            else
                add_to_chat(5,'Incorrect Element value')
                return
            end
        else
            add_to_chat(5,'No element specified')
        end
    elseif commandArgs[1] == 'nuke' then
        nuke()
    end
end
 
 
function refine_various_spells(spell, action, spellMap, eventArgs)
    local aspirs = S{'Aspir','Aspir II','Aspir III'}
    local sleeps = S{'Sleep','Sleep II'}
    local sleepgas = S{'Sleepga','Sleepga II'}
 
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
 
    local spell_index
 
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
	if buffactive['Mana Wall'] then
		moving = false
    elseif mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                state.Moving.value = true
                send_command('gs c update')
                send_command('gs equip sets.MoveSpeed')
                if world.area:contains("Adoulin") then
                    send_command('gs equip sets.Adoulin')
                end

        moving = true

            elseif dist < 1 and moving then
                state.Moving.value = false
                send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == "Vorseal" then
	send_command('gs c cycle VorsealMode')
	elseif buff == "Vorseal" and not gain then
	send_command('gs c cycle VorsealMode')
	end
	if buff == "Visitant" then
	send_command('gs l blm3.lua')
	end
    -- Unlock feet when Mana Wall buff is lost.
	if buff == "Mana Wall" then
	send_command('wait 0.5;gs c update')
	end
    if buff == "Mana Wall" and not gain then
        enable('feet','back')
        handle_equipping_gear(player.status)
    end
    if buff == "Commitment" and not gain then
        equip({right_ring="Capacity Ring"})
        if player.equipment.right_ring == "Capacity Ring" then
            disable("right_ring")
        else
            enable("right_ring")
        end
    end
end
 
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Locked' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
    if stateField == 'Death Mode' then
        if newValue == true then
            state.OffenseMode:set('Locked')
            predeathcastmode = state.CastingMode.value
            --[[Insert 'equip(<set consisting of Death weapon and sub, to have them automatically lock when changing into Death mode>)']]
        elseif newValue == false then
            state.CastingMode:set(predeathcastmode)
        end
    end            
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
--[[function job_update(cmdParams, eventArgs)
    job_display_current_state(eventArgs)
    eventArgs.handled = true
end]]
 
function display_current_job_state(eventArgs)
    eventArgs.handled = true
    local msg = ''
     
    if state.OffenseMode.value ~= 'None' then
        msg = msg .. 'Combat ['..state.OffenseMode.value..']'
 
        if state.CombatForm.has_value then
            msg = msg .. ' (' .. state.CombatForm.value .. ')'
        end
        msg = msg .. ', '
    end
    --[[if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end]]
 
    msg = msg .. 'Casting ['..state.CastingMode.value..'], Idle ['..state.IdleMode.value..']'
 
    if state.MagicBurst.value then
        msg = msg .. ', MB [ON]'
    else
        msg = msg .. ', MB [OFF]'
    end
    if state.ConsMP.value then
        msg = msg .. ', AF Body [ON]'
    else
        msg = msg .. ', AF Body [OFF]'
    end
    if state.DeatCast.value then
        msg = msg .. ', Death Mode [ON]'
    else 
        msg = msg .. ', Death Mode [OFF]'
    end
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
     
    if state.Kiting.value then
        msg = msg .. ', Kiting [ON]'
    end
 
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end
 
    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
 
    add_to_chat(122, msg)
end
 
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
end
 
-- Modify the default idle set after it was constructed.
--- This is where I handle Death Mode Idle set construction, rather than weave it into the Idle state var
function customize_idle_set(idleSet)
	if buffactive['Mana Wall'] then
        idleSet = sets.buff['Mana Wall']
	elseif player.mpp < 51 and state.IdleMode.value == 'PDT' then
			idleSet = sets.idle.PDT
	elseif player.mpp < 51 and state.IdleMode.value == 'Normal' then
		idleSet = set_combine(sets.auto_refresh, sets.latent_refresh)		
	elseif player.mp < 2050 and state.VorsealMode.value == 'Vorseal' and state.IdleMode.value == 'PDT' then
			idleSet = sets.idle.PDT
	elseif player.mp < 2050 and state.VorsealMode.value == 'Vorseal' then
			idleSet = sets.auto_refresh
	elseif player.mp < 1650 and state.VorsealMode.value == 'Normal' and state.IdleMode.value == 'PDT' then
			idleSet = sets.idle.PDT
	elseif player.mp < 1650 and state.VorsealMode.value == 'Normal' and state.IdleMode.value == 'Normal' then
			idleSet = sets.auto_refresh
	end
    return idleSet
end
--- This is where I handle Death Mode Melee set modifications
function customize_melee_set(meleeSet)
    if buffactive['Mana Wall'] then
        meleeSet = set_combine(meleeSet, sets.buff['Mana Wall'])
    end
    return meleeSet
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 8)
	-- Do not remove below argument or the file WILL NOT WORK PROPERLY when reloaded in an escha area--
	if buffactive['Vorseal'] and state.VorsealMode.value == 'Normal' then
	send_command('gs c cycle VorsealMode')
	end
end