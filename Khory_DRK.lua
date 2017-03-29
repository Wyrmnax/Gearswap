	

    -------------------------------------------------------------------------------------------------------------------
    -- Initialization function that defines sets and variables to be used.
    -------------------------------------------------------------------------------------------------------------------
     
    -- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
     
    -- Initialization function for this job file.
    function get_sets()
            -- Load and initialize the include file.
            include('Mote-Include.lua')
    end
     
     
    -- Setup vars that are user-independent.
    function job_setup()
        --state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
        --buffactive['Aftermath: Lv.2'] or
        --buffactive['Aftermath: Lv.3']
        --or false
        state.Buff['Souleater'] = buffactive['Souleater'] or false
	    determine_haste_group()
    end
     
     
    -- Setup vars that are user-dependent.  Can override this function in a sidecar file.
    function user_setup()
            -- Options: Override default values
            options.OffenseModes = {'Normal', 'Acc', 'Multi'}
            options.DefenseModes = {'Normal', 'PDT', 'Reraise'}
            options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
            options.CastingModes = {'Normal'}
            options.IdleModes = {'Normal'}
            options.RestingModes = {'Normal'}
            options.PhysicalDefenseModes = {'PDT', 'Reraise'}
            options.MagicalDefenseModes = {'MDT'}
     
            state.Defense.PhysicalMode = 'PDT'
			
			--adjust_engaged_sets()
	 
            -- Additional local binds
            send_command('bind ^` input /ja "Hasso" <me>')
            send_command('bind !` input /ja "Seigan" <me>')
     
            select_default_macro_book()
    end
     
    -- Called when this job file is unloaded (eg: job change)
    function file_unload()
            if binds_on_unload then
                    binds_on_unload()
            end
     
            send_command('unbind ^`')
            send_command('unbind !-')
    end
     
           
    -- Define sets and vars used by this job file.
    function init_gear_sets()
            --------------------------------------
            -- Start defining the sets
            --------------------------------------
            -- Precast Sets
            -- Precast sets to enhance JAs
            sets.precast.JA['Diabolic Eye'] = {hands="Abyss Gauntlets +2"}
            sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets"}
            sets.precast.JA['Nether Void'] = {legs="Bale Flanchard +2"}
            sets.precast.JA['Souleater'] = {head="Ignominy burgeonet +1"}
     
                   
            -- Waltz set (chr and vit)
            sets.precast.Waltz = {
                    head="Yaoyotl Helm",
                    body="Mikinaak Breastplate",
                    legs="Cizin Breeches",feet="Whirlpool Greaves"}
                   
            -- Don't need any special gear for Healing Waltz.
            sets.precast.Waltz['Healing Waltz'] = {}
           
            -- Fast cast sets for spells
                     
            -- Midcast Sets
            sets.midcast.FastRecast = {
                    head="Cizin Helm"
                }
                   
            -- Specific spells
            sets.midcast.Utsusemi = {
                    head="Cizin Helm",
                    body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
                    waist="Zoran's Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}
     
            sets.midcast.DarkMagic = {
                    head="Ignominy burgeonet +1",
					neck="Sanctity Necklace",
					ear1="Hermetic Earring",
					ear2="Friomisi Earring",
                    body="Demon's harness",
					hands="Leyline Gloves",
					ring1="Diamond Ring",
					ring2="Evanescence Ring",
                    back="Abyss Cape",
					waist="Salire Belt",
					legs="Bale Flanchard +2",
					feet="Odyssean Greaves"}
           
		    sets.midcast.EnfeeblingMagic = set_combine(sets.midcast.DarkMagic, {
                head="Cizin Helm",hands="Mikinaak Gauntlets",ear1="Friomisi earring",ear2="Hecate's earring",
                neck="Atzintli Necklace",body="Abyss cuirass",legs="Cizin breeches",feet="Bale sollerets +2",
                back="Toro Cape",waist="Zoran's Belt"
            })
		   
            sets.midcast['Dread Spikes'] = {head="Yaoyotl Helm",body="Bale Cuirass +2",hands="Cizin Mufflers",ring2="K'ayres Ring"}
           
            sets.midcast.Stun = set_combine(sets.midcast.DarkMagic, {
                    head="Cizin Helm"
            })
                   
            sets.midcast.Drain = sets.midcast.DarkMagic 
                   
            sets.midcast.Aspir = sets.midcast.Drain
						                   
            -- Weaponskill sets
            -- Default set for any weaponskill that isn't any more specifically defined
            sets.precast.WS = {
			ammo="Amar Cluster",
			head={ name="Argosy Celata", augments={'DEX+10','Accuracy+15','"Dbl.Atk."+2',}},
			body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
			hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Argosy Sollerets", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Subtlety Spec.",
			waist="Grunfeld Rope",
			left_ear="Brutal Earring",
			right_ear="Mache Earring",
			left_ring="Ifrit Ring",
			right_ring="Petrov Ring",
			back="Atheling Mantle",
			}
			
            sets.precast.WS.Acc = set_combine(sets.precast.WS, {ear1="Bladeborn Earring",ear2="Steelflash Earring"})
     
            -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
            sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {neck="Shadow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring"})
            sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {neck="Shadow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring"})
            sets.precast.WS['Catastrophe'].Mod = set_combine(sets.precast.WS['Catastrophe'], {waist="Shadow Belt",ear1="Bladeborn Earring",ear2="Steelflash Earring"})
     
            sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {neck="Shadow Gorget",waist="Soil Belt",ring2="Diamond Ring"})
            sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget",waist="Soil Belt",ear1="Bladeborn Earring",ear2="Steelflash Earring"})
            sets.precast.WS['Entropy'].Mod = set_combine(sets.precast.WS['Entropy'], {waist="Soil Belt",legs="Cizin Breeches"})
     
            sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {neck="Breeze Gorget",legs="Mikinaak Cuisses",waist="Soil Belt"})
            sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {neck="Breeze Gorget",legs="Mikinaak Cuisses",waist="Soil Belt"})
            sets.precast.WS['Resolution'].Mod = set_combine(sets.precast.WS['Resolution'], {Breeze="Shadow Gorget",legs="Mikinaak Cuisses",waist="Soil Belt"})
			
			sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, 
			{
			ammo="Ginsen",
			neck="Breeze Gorget",
			head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','Accuracy+8',}},			
			legs={ name="Valor. Hose", augments={'VIT+15','Accuracy+2','Attack+13',}},
			hands="Sulevia's Gauntlets",
			feet="Sulevia's Leggings",
			waist="Ioskeha Belt"
			})
            sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {neck="Breeze Gorget",legs="Mikinaak Cuisses",waist="Soil Belt"})
            sets.precast.WS['Torcleaver'].Mod = set_combine(sets.precast.WS['Resolution'], {Breeze="Shadow Gorget",legs="Mikinaak Cuisses",waist="Soil Belt"})
     
     
           
            -- Sets to return to when not performing an action.
           
            -- Resting sets
            sets.resting = {}
           
     
            -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
            sets.idle.Town = {
			ammo="Amar Cluster",
			head="Loess Barbuta",
			body="Sulevia's Plate.",
			hands="Sulevia's Gauntlets",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulevia's Leggings",
			neck="Loricate Torque",
			waist="Flume Belt +1",
			left_ear="Brutal Earring",
			right_ear="Mache Earring",
			left_ring="Vocane Ring",
			right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
			back="Atheling Mantle",
			}
           
            sets.idle.Field = {
            ammo="Amar Cluster",
			head="Loess Barbuta",
			body="Sulevia's Plate.",
			hands="Sulevia's Gauntlets",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulevia's Leggings",
			neck="Loricate Torque",
			waist="Flume Belt +1",
			left_ear="Brutal Earring",
			right_ear="Mache Earring",
			left_ring="Vocane Ring",
			right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
			back="Atheling Mantle",
			}
     
            sets.idle.Weak = {
                    head="Twilight Helm",neck="Bale Choker",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
                    back="Atheling Mantle",waist="Windbuffet Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}
           
            -- Defense sets
            sets.defense.PDT = {
                    head="Cizin Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Dark Ring",
                    back="Atheling Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
     
            sets.defense.Reraise = {
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Paguroidea Ring",
                    back="Atheling Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
     
            sets.defense.MDT = {
                    head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Dark Ring",
                    back="Atheling Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
     
            sets.Kiting = {legs="Carmine Cuisses +1"}
     
            sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
     
            -- Engaged sets
            sets.engaged = {
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','Accuracy+8',}},
			body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+24','"Store TP"+1','AGI+6','Attack+11',}},
			neck="Subtlety Spec.",
			waist="Ioskeha Belt",
			left_ear="Brutal Earring",
			right_ear="Mache Earring",
			left_ring="Fortified Ring",
			right_ring="Begrudging Ring",
			back="Atheling Mantle",
			}

	        sets.engaged.Acc = set_combine(sets.engaged, {
	        	neck="Bale Choker",
	        	hands="Mikinaak Gauntlets",
	        	waist="Dynamic Belt",
                feet="Whirlpool Greaves"
            })
	        sets.engaged.Multi = set_combine(sets.engaged, {
                head="Quauhpilli Helm",
                ear1="Brutal Earring",
                ear2="Trux Earring",
                waist="Windbuffet Belt",
                legs="Cizin Breeches"
            })
	        sets.engaged.Reraise = set_combine(sets.engaged, {
	        	head="Twilight Helm",neck="Twilight Torque",
	        	body="Twilight Mail"
            })

            sets.engaged.HighHaste = set_combine(sets.engaged.Multi, {
                    head="Yaoyotl Helm"
            })

            sets.engaged.MaxHaste = sets.engaged.HighHaste
            sets.engaged.EmbravaHaste = sets.engaged.HighHaste
	
	 
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion
           
            -- Normal melee group
            --sets.engaged.Apocalypse = {ammo="Hagneia Stone",
            --        head="Otomi Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
            --        back="Atheling Mantle",waist="Goading Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            --sets.engaged.Apocalypse.Acc = {ammo="Hagneia Stone",
            --        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            --sets.engaged.Apocalypse.AM = {ammo="Hagneia Stone",
            --        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
            --        back="Atheling Mantle",waist="Windbuffet Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            --sets.engaged.Apocalypse.Multi = {ammo="Hagneia Stone",
            --        head="Otomi Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
            --        back="Atheling Mantle",waist="Windbuffet Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            --sets.engaged.Apocalypse.Multi.PDT = {ammo="Hagneia Stone",
            --        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Graves"}
            --sets.engaged.Apocalypse.Multi.Reraise = {ammo="Hagneia Stone",
            --        head="Twilight Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Twilight Breastplate",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Mars's Ring",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            --sets.engaged.Apocalypse.PDT = {ammo="Fire Bomblet",
            --        head="Cizin Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
            --        back="Mollusca Mantle",waist="Nierenschutz",legs="Cizin Breeches",feet="Cizin Greaves"}
            --sets.engaged.Apocalypse.Acc.PDT = {ammo="Fire Bomblet",
            --        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
            --sets.engaged.Apocalypse.Reraise = {ammo="Fire Bomblet",
            --        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Twilight Mail",hands="Cizin Muffler",ring1="Dark Ring",ring2="Dark Ring",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
            --sets.engaged.Apocalypse.Acc.Reraise = {ammo="Fire Bomblet",
            --        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --        body="Twilight Mail",hands="Cizin Muffler",ring1="Dark Ring",ring2="DarkRing",
            --        back="Atheling Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
					

            -- Custom Melee Group
            --sets.engaged['Anahera Scythe'] = {
            --    ammo="Hagneia Stone",
            --    head="Yaoyotl Helm",
            --    neck="Asperity Necklace",
            --    ear1="Bladeborn Earring",
            --    ear2="Steelflash Earring",
            --    body="Pak Corselet",
            --    hands="Cizin Mufflers",
            --    ring1="Rajas Ring",
            --    ring2="K'ayres Ring",
            --    back="Atheling Mantle",
            --    waist="Cetl Belt",
            --    legs="Cizin Breeches",
            --    feet="Mikinaak Greaves"
            --}

            --sets.engaged['Anahera Scythe'].Acc = set_combine(sets.engaged['Anahera Scythe'], {
            --    neck="Bale Choker",
            --    body="Mikinaak Breastplate",
            --    waist="Dynamic Belt",
            --    feet="Whirlpool Greaves"
            --})

            --sets.engaged['Senbaak Nagan'].Multi = set_combine(sets.engaged['Anahera Scythe'], {
            --    head="Quauhpilli Helm",
            --    ear1="Brutal Earring",
            --    ear2="Trux Earring",
            --    waist="Windbuffet Belt"
            --})

            --sets.engaged['Anahera Scythe'].Multi.PDT = set_combine(sets.engaged['Anahera Scythe'].Multi, {
            --    body="Cizin Mail",
            --    feet="Cizin Greaves"
            --})

            --sets.engaged['Anahera Scythe'].Multi.Reraise = set_combine(sets.engaged['Anahera Scythe'].Multi, {
            --    head="Twilight Helm",
            --    neck="Bale Choker",
            --    body="Twilight Mail"
            --})

            --sets.engaged['Anahera Scythe'].PDT = set_combine(sets.engaged['Anahera Scythe'], {
            --    neck="Twilight Torque",
            --    body="Cizin Mail",
            --    ring2="Dark Ring",
            --    feet="Cizin Greaves"
            --})

            --sets.engaged['Anahera Scythe'].Acc.PDT = set_combine(sets.engaged['Anahera Scythe'].PDT, {
            --    waist="Dynamic Belt",
            --    feet="Whirlpool Greaves"
            --})

            --sets.engaged['Anahera Scythe'].Acc.Reraise = set_combine(sets.engaged['Anahera Scythe'].Acc, {
            --    head="Twilight Helm",
            --    body="Twilight Mail"
            --})

            --sets.engaged['Anahera Scythe'].MaxHaste = set_combine(sets.engaged['Anahera Scythe'].Multi, {
            --    head="Yaoyotl Helm"
            --})
            --sets.engaged['Anahera Scythe'].EmbravaHaste = sets.engaged['Anahera Scythe'].MaxHaste	        
            --sets.engaged['Anahera Scythe'].HighHaste = sets.engaged['Anahera Scythe'].MaxHaste	        
            
            sets.buff.Souleater = {head="Ignominy burgeonet +1"}
     
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Job-specific hooks that are called to process player actions at specific points in time.
    -------------------------------------------------------------------------------------------------------------------
     
  
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    -- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
    function job_precast(spell, action, spellMap, eventArgs)
            if spell.action_type == 'Magic' then
            equip(sets.precast.FC)
            end
    end
     
 
     
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_midcast(spell, action, spellMap, eventArgs)
            if spell.action_type == 'Magic' then
                equip(sets.midcast.FastRecast)
            end
    end
     
    -- Run after the default midcast() is done.
    -- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
    function job_post_midcast(spell, action, spellMap, eventArgs)
            if state.DefenseMode == 'Reraise' or
                    (state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
                    equip(sets.Reraise)
            end
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
  --  function job_aftercast(spell, action, spellMap, eventArgs)
  --      if not spell.interrupted then
  --              if state.Buff[spell.english] ~= nil then
  --                      state.Buff[spell.english] = true
  --              end
  --       end
  --  end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Customization hooks for idle and melee sets, after they've been automatically constructed.
    -------------------------------------------------------------------------------------------------------------------
    -- Modify the default idle set after it was constructed.
    function customize_idle_set(idleSet)
	    if state.Buff.Souleater then
	    	idleSet = set_combine(idleSet, sets.buff.Souleater)
	    end
        return idleSet
    end
     
    -- Modify the default melee set after it was constructed.
    function customize_melee_set(meleeSet)
	    if state.Buff.Souleater then
	    	meleeSet = set_combine(meleeSet, sets.buff.Souleater)
	    end
        return meleeSet
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- General hooks for other events.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called when the player's status changes.
    function job_status_change(newStatus, oldStatus, eventArgs)
     
    end
     
    -- Called when a player gains or loses a buff.
    -- buff == buff gained or lost
    -- gain == true if the buff was gained, false if it was lost.
    function job_buff_change(buff, gain)
	    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
	    	determine_haste_group()
	    	handle_equipping_gear(player.status)
       -- elseif buff:startswith('Aftermath') then
       --     state.Buff.Aftermath = gain
       --     adjust_melee_groups()
       --     handle_equipping_gear(player.status)
	    elseif state.Buff[buff] ~= nil then
	    	state.Buff[buff] = gain
	    	handle_equipping_gear(player.status)
	    end

    end
     
     
    -------------------------------------------------------------------------------------------------------------------
    -- User code that supplements self-commands.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called by the 'update' self-command, for common needs.
    -- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	--adjust_engaged_sets()
	determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

--function adjust_engaged_sets()
--	state.CombatWeapon = player.equipment.main
--	adjust_melee_groups()
--end

--function adjust_melee_groups()
--	classes.CustomMeleeGroups:clear()
--	if state.Buff.Aftermath then
--		classes.CustomMeleeGroups:append('AM')
--	end
--end
     
function determine_haste_group()

    -- This section only applies to LR being up
    --
    -- 1) uncapped delay reduction: 26% gear haste + LR's 25% JA haste
    -- 2) HighHaste - Marches: 16% gear haste with march+3, 14% with march+4, 12% with march+5
    -- 3) EmbravaHaste - embrava: 21% gear haste if sch is naked alt, 17% if it's capped potency
    -- 4) MaxHaste - capped magic haste: 12% gear haste
	
	classes.CustomMeleeGroups:clear()
	
	if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
		classes.CustomMeleeGroups:append('MaxHaste')
	elseif buffactive.march == 2 and buffactive.haste then
		classes.CustomMeleeGroups:append('MaxHaste')
	elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
		classes.CustomMeleeGroups:append('EmbravaHaste')
	elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
		classes.CustomMeleeGroups:append('HighHaste')
	elseif buffactive.march == 1 and buffactive['Last Resort'] then
		classes.CustomMeleeGroups:append('HighHaste')
	end
end

function select_default_macro_book()
        -- Default macro set/book
	    if player.sub_job == 'DNC' then
	    	set_macro_page(2, 6)
	    elseif player.sub_job == 'SAM' then
	    	set_macro_page(1, 6)
	    else
	    	set_macro_page(1, 6)
	    end
end