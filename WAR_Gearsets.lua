-- WAR Gear_sets
-- Created: 6/1/2014
-- Last Modified: 6/14/2014
-- To Do:
--

if player.name == 'Khory' then
-- includes
	
	include('include/mappings.lua')
	include('include/equipment.lua')
	--include('include/autoexec.lua')
	
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = {     ammo="Staunch Tathlum",
    head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Brutal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Cichol's Mantle",
}

sets.idle.MDT = {     ammo="Staunch Tathlum",
    head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Brutal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Cichol's Mantle",
}

sets.misc.Town = set_combine(sets.idle.PDT, {feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				feet="Hermes' Sandals"})

sets.lockstyle = set_combine(sets.misc.Town,{})

-- Precast
-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				    ammo="Staunch Tathlum",
    head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+3','INT+4','"Refresh"+2',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    neck="Voltsurge Torque",
    waist="Flume Belt +1",
    left_ear="Halasz Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Lebeche Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},
})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.PDT,{head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands={ name="Souv. Handschuhs", augments={'HP+50','Shield skill +10','Phys. dmg. taken -3',}},
    legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},})
	
sets.misc.Steps = {ammo="Ginsen",
			head="Yaoyotl Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Boii Mufflers", lring="Patricius Ring", rring="Ramuh Ring +1",
            back="Kayapa Cape", waist="Anguinus Belt", legs=Aug.Skirmish.Yorium.DT, feet="Boii Calligae"}
sets.misc.flourish = {}

-- JA
sets.Enmity = {}

sets.precast.JA["Mighty Strikes"] = {hands="Agoge Mufflers"}
sets.precast.JA["Brazen Rush"] = {}

sets.precast.JA["Provoke"] = set_combine(sets.Enmity,{})
sets.precast.JA["Berserk"] = {body="Pummeler's Lorica", feet="Agoge Calligae"}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {head="Agoge Mask"}
sets.precast.JA["Aggressor"] = {head="Pummeler's Mask", body="Agoge Lorica"}
sets.precast.JA["Tomahawk"] = {ammo="Thr. Tomahawk", feet="Agoge Calligae"}
sets.precast.JA["Restraint"] = {hands="Ravager's Mufflers +2"}
sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses"}
sets.precast.JA["Savagery"] = {head="Agoge Mask"}
sets.precast.JA["Aggressive Aim"] = {body="Agoge Lorica"}


-- Generic TP Set
sets.TP = {     ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}
	
sets.TP.Acc = {    ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}

sets.TP.Hybrid = {     ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}			

-- Great Axe TP 
sets.TP.GA = {      ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}

-- Ionis Haste +2% Save TP 25+
sets.TP.GA.Ionis = set_combine(sets.TP.GA, {}  )

-- Great Axe Accuracy TP
sets.TP.GA.Acc = {	    ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}

sets.TP.GA.Acc.Ionis = set_combine(sets.TP.GA.Acc,{})

-- GreatSword
sets.TP.GS = {    ammo="Seeth. Bomblet +1",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+22 Attack+22','AGI+10','Accuracy+12',}},
    neck="Subtlety Spec.",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}

sets.TP.GS.Acc = set_combine(sets.TP.GS,{})

-- Weaponskills
sets.precast.WS = {        ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}
	
sets.precast.WS.Acc = {        ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},}
				
sets.precast.WS.MS = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
-- Great Axe
-- Ukko's Fury
sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})

sets.precast.WS.Acc["Ukko's Fury"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
				
-- Upheaval				
sets.precast.WS["Upheaval"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})

sets.precast.WS.MS["Upheaval"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
		
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
sets.precast.WS.MS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Dbl.Atk."+3','Accuracy+11',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head={ name="Argosy Celata", augments={'DEX+10','Accuracy+15','"Dbl.Atk."+2',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
				

end