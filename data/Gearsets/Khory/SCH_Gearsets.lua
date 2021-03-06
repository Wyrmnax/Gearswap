-- SCH Gearsets
-- Created: 6/13/2014
-- Last Updated: 6/13/2014
-- To Do:
--
--
--
--


if player.Name == 'Khory' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,5)
			elseif player.sub_job =='WHM' then
				set_macro_page(1,5)
			elseif player.sub_job == 'SCH' then
				set_macro_page(1,5)
			elseif player.sub_job == 'BRD' then
				set_macro_page(1,5)
			elseif player.sub_job =='NIN' then 
				set_macro_page(1,5)
			end
		else
			set_macro_page(1,5)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {    
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head="Chironic Hat",
    body="Jhakri Robe +2",
    hands="Arbatel Bracers",
    legs="Assid. Pants +1",
    feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
    neck="Loricate Torque",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		sets.idle.MDT = {
		    main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head="Chironic Hat",
    body="Jhakri Robe +2",
    hands="Arbatel Bracers",
    legs="Assid. Pants +1",
    feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
    neck="Loricate Torque",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}			
		sets.Resting = set_combine(sets.idle.PDT, {})
		sets.idle.Standard = set_combine(sets.idle.PDT,{})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- JA
		sets.precast.JA["Tabula Rasa"] = {legs="Argute Pants +2"}
		sets.precast.JA["Caper Emissarius"] = {}
		
		sets.precast.JA["Sublimation"] = {}
		sets.precast.JA["Enlightenment"] = {}
		sets.precast.JA["Libra"] = {}
		sets.precast.JA["Modus Veritas"] = {}
		sets.precast.JA["Libra"] = {}
		
		-- Strategems 
		sets.precast.JA["Rapture"] = {}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
		    ammo="Ghastly Tathlum +1",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Merlinic Jubbah",
    legs="Psycloth Lappas",
	hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+9','"Fast Cast"+5','"Mag.Atk.Bns."+5',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Fast Cast"+6','INT+1',}},
    neck="Voltsurge Torque",
    waist="witful belt",
    left_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},
	}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})  	

		sets.precast.Elemental = set_combine(sets.precast.Fastcast, {})  					
				
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="Nares Cap", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie",
				waist="Austerity Belt", feet="Umbani Boots"}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {
		    main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Merlinic Jubbah",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Arbatel Loafers +1",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		-- Damage
		sets.midcast.Nuke = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19','Magic burst dmg.+11%','MND+1','"Mag.Atk.Bns."+4',}},
    body="Merlinic Jubbah",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Arbatel Loafers +1",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.LowNuke = {
	main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="Enki Strap",
    ammo="Ghastly Tathlum +1",
    head="Volte Cap",
    body="Merlinic Jubbah",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+11%','MND+7',}},
    feet="Arbatel Loafers +1",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
		--Healing Magic
		sets.midcast.Cure = {rring="Lebeche Ring"}
		
		sets.midcast.Curaga = {rring="Lebeche Ring"}
	
		-- Enhancing 
		-- 
		sets.midcast.Enhancing = {main="Kirin's Pole", sub="Fulcio Grip", ammo="Savant's Treatise",
			neck="Colossus's Torque", lear="Andoaa Earring",
			body="Anhur Robe",
			back="Merciful Cape", waist="Cascade Belt", legs="Scholar's Pants", feet="Rubeus Boots"}
		sets.midcast.Embrava = set_combine(sets.midcast.Enhancing, {hands="Svnt. Bracers +2"})
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				back="Merciful Cape", })
		sets.midcast.Aspir = set_combine(sets.midcast.Dark, {
			head="Appetence Crown",
			waist="Fucho-no-Obi",})
			
		-- Stun - Alacrity Down
		sets.midcast.Stun = set_combine(sets.precast.Fastcast, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Argute M.board +2", neck="Eddy Necklace", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Acad. Loafers"})
		-- Stun - Alacrity Up
		sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Nahtirah Hat", neck="Eddy Necklace", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Argute's Loafers +2"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end