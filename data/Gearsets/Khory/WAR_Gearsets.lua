-- WAR Gear_sets
-- Created: 6/1/2014
-- Last Modified: 6/14/2014
-- To Do
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
			if player.sub_job == 'NIN' then
				set_macro_page(1,12)
			elseif player.sub_job == 'SAM' then
				set_macro_page(2,12)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,12)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(4,12)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(5,12)
			end
		else
			set_macro_page(1,12)
		end
		
-- Auto Sets
	
--Maximum Multi Attack set	
--	    sets.Engaged = {
--        ammo="Ginsen",
--        head="Flam. Zucchetto +2",
--        body="Valorous Mail", --da5 augment
--        hands="Sulev. Gauntlets +2",
--        legs=Pumm_Legs,
--        feet=Pumm_Feet,
--        neck="War. Beads +2",
--        waist="Ioskeha Belt +1",
--        left_ear="Brutal Earring",
--        right_ear="Cessance Earring",
--        left_ring="Flamma Ring",--"Regal Ring",                
--        right_ring="Niqmaddu Ring",
--        back=back_Cichol_Melee,                 -- da 10
--    } 
	
-- Standard/idle
sets.idle.PDT = { 
				ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",}

sets.idle.MDT = { ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",}

sets.misc.Town = set_combine(sets.idle.PDT, {feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})

sets.Enmity = {}

-- TP set
sets.TP = {  ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",}

-- GreatAxe TP 
sets.TP.GA = {  ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",}

-- Ionis Haste +2% Save TP 25+
sets.TP.GA.Ionis = set_combine(sets.TP.GA, {  ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",})

-- Great Axe Accuracy TP
sets.TP.GA.Acc = {	 ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",}

sets.TP.GA.Acc.Ionis = set_combine(sets.TP.GA.Acc,{ ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",})
-- GreatSword
sets.TP.GS = { ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",}


sets.TP.GS.Acc = set_combine(sets.TP.GS,{ ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back="Atheling Mantle",})

-- JA
sets.precast.JA["Mighty Strikes"] = {hands="Warrior's Mufflers +2"}
sets.precast.JA["Brazen Rush"] = {}

sets.precast.JA["Provoke"] = set_combine(sets.Enmity,{})
sets.precast.JA["Berserk"] = {body="Pummeler's Lorica", feet="Warrior's Calligae +2"}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {head="Warrior's Mask"}
sets.precast.JA["Aggressor"] = {head="Pummeler's Mask", body="Warrior's Lorica +2"}
sets.precast.JA["Tomahawk"] = {ammo="Thr. Tomahawk", feet="Warrior's Calligae +2"}
sets.precast.JA["Restraint"] = {hands="Ravager's Mufflers +2"}
sets.precast.JA["Warrior's Charge"] = {legs="Warrior Cuisses +2"}
sets.precast.JA["Savagery"] = {head="Warrior's Mask +2"}
sets.precast.JA["Aggressive Aim"] = {body="Warrior's Lorica +2"}

-- Weaponskills
sets.precast.WS = {ammo="Ravager's Orb",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}
sets.precast.WS.MS = set_combine(sets.precast.WS, {ammo="Ravager's Orb",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
-- Great Axe
sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})
				
sets.precast.WS["Upheaval"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})
				
sets.precast.WS.MS["Upheaval"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})
				
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})
sets.precast.WS.MS["Fell Cleave"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Valor. Hose", augments={'Attack+3','Weapon skill damage +2%','VIT+13','Accuracy+14',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back="Atheling Mantle",})
				
-- Dagger
sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, 
	{ammo="Seeth. Bomblet +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +3%','VIT+10','Accuracy+14',}},
    feet={ name="Valorous Greaves", augments={'Pet: Haste+4','Crit.hit rate+3','Weapon skill damage +6%','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moldavite Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+17 Attack+17',}},})
				
-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm", lear="Loquac. Earring", 
				rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end
