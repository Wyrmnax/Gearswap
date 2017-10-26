-- SAM Gearsets
-- To Do:
--
--
--
--

if player.name == 'Khory' then
	-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')

	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,13)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,13)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,13)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(4,13)
			elseif player.sub_job == 'RNG' then 
				set_macro_page(5,13)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(6,13)
			end
		else
			set_macro_page(1,13)
		end

-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
    ammo="Staunch Tathlum",
    head="Loess Barbuta",
    body="Valorous Mail",
    hands="Ken. Tekko",
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Loricate Torque",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.idle.MDT = {     
	ammo="Staunch Tathlum",
    head="Loess Barbuta",
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands="Ken. Tekko",
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet="Flam. Gambieras +2",
    neck="Loricate Torque",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.idle.Evasion = {}

sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Danzo Sune-Ate"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				feet="Danzo Sune-Ate"})
-- TP - 49 52
sets.TP = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands="Ken. Tekko",
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
sets.TP.Acc = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands="Ken. Tekko",
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
-- TP - 28 18
sets.TP.Buffed = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands="Ken. Tekko",
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

-- Bow TP
sets.TP.Bow = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back="Smertrios's Mantle",
	}
sets.TP.Bow.Acc = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back="Smertrios's Mantle",
	}
sets.TP.Bow.Buffed = { 	
	ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back="Smertrios's Mantle",
	}

-- JA
sets.precast.JA["Meikyo Shisui"] = {feet="Sakonji Sune-ate"}
sets.precast.JA["Yaegasumi"] = {}

sets.precast.JA["Meditate"] = set_combine(sets.idle.PDT, {
				head="Wakido Kabuto",
				hands="Sakonji Kote",})
sets.precast.JA["Hasso"] = {hands="Wakido Kote",legs="Unkai Haidate +2"}
sets.precast.JA["Third Eye"] = {legs="Saotome Haidate"}
sets.precast.JA["Seigan"] = {head="Unkai Kabuto +2"}
sets.precast.JA["Blade Bash"] = {hands="Sakonji Kote"}
sets.precast.JA["Sekkanoki"] = {hands="Unkai Kote +2"}
sets.precast.JA["Sengikori"] = {feet="Unkai Sune-ate +2"}
sets.precast.JA["Hagakore"] = {feet="Hes. Gaiters"}
sets.precast.JA["Konzen-ittai"] = {}
sets.precast.JA["Warding Circle"] = {head="Wakido Kabuto"}

-- Weaponskills
sets.precast.WS = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Wakido Domaru +2",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache earring",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.WS['Tachi: Fudo'] = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Wakido Domaru +2",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.WS['Tachi: Shoha'] = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Wakido Domaru +2",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.WS['Tachi: Gekko'] = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Wakido Domaru +2",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.WS['Tachi: Rana'] = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Valorous Mail",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.WS['Tachi: Kaiten'] = { 	
	ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+30','Weapon skill damage +2%','STR+7',}},
    body="Wakido Domaru +2",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
-- Sword 
sets.precast.WS['Requiescat'] = { 	
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +2%','VIT+3','Accuracy+2','Attack+14',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +4%',}},
    neck="Moonbeam Nodowa",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
-- Ranged Weaponskill
sets.precast.RAWS = { 	
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.RAWS['Apex Arrow'] = { 	
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.RAWS['Namas Arrow'] = { 	
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
sets.precast.RAWS.Acc = {}
sets.precast.RAWS.Acc['Namas Arrow'] = { 	
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Hiza. Hizayoroi +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Nodowa",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				lear="Loquac. Earring",
                rring="Prolix Ring",
               })
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}

else

end