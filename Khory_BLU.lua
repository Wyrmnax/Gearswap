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
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind !` input /ja "Efflux" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')

    update_combat_form()
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
end


-- Set up gear sets.
function init_gear_sets()
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
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah +1"}
    sets.buff.Efflux = {legs="Mavi Tayt +2"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Uk'uxkaj Cap",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
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
		feet = "Carmine Greaves +1"}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Jukukik Feather",
		head = "Adhemar Bonnet",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Adhemar jacket",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Ramuh Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
		}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {feet="Luhlaza Charuqs +1"})

    sets.precast.WS['Sanguine Blade'] = {
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Mavi Bazubands +2",ring1="Acumen Ring",ring2="Strendu Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Haruspex Hat",ear2="Loquacious Earring",
        body="Luhlaza Jubbah +1",hands="Mavi Bazubands +2",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Iuitl Gaiters +1"}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {
		ammo="Mavi Tathlum",
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
		feet = "Amalric Nails"}

    sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Jukukik Feather",
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
		feet = "Amalric Nails"}

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {
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
		feet = "Amalric Nails"}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
        {head = "Amalric Coif",
		ear1 = "Hermetic Earring",
		legs = "Amalric Slops"})
    
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
        {})

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
        {})

    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicAccuracy = {
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
		feet = "Hashishin Basmak"}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",neck="Ej Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vanir Cotehardie",hands="Assimilator's Bazubands +1",ring1="K'ayres Ring",ring2="Beeline Ring",
        back="Refraction Cape",legs="Enif Cosciales",feet="Iuitl Gaiters +1"}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
        {})
        
    sets.midcast['Blue Magic']['White Wind'] = {
        head="Whirlpool Mask",neck="Lavalier +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Meridian Ring",
        back="Fravashi Mantle",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Hagondes Sabots"}

    sets.midcast['Blue Magic'].Healing = {
        head="Uk'uxkaj Cap",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Aquasoul Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",
        body="Assimilator's Jubbah",
        back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs +1"}

    sets.midcast['Blue Magic'].Buff = {}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    

    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ammo="Mavi Tathlum",hands="Assimilator's Bazubands +1"}
        --head="Luhlaza Keffiyeh",  
        --body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
        --back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs +1"}


    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {
        head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",feet="Chelona Boots +1"}
    
    -- Idle sets
    sets.idle = {
		ammo = "Ginsen",
		head = "Rawhide Mask",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Amalric Doublet",
		hands = "Herculean Gloves",
		ring1 = "Defending Ring",
		ring2 = "Vocane Ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Carmine Cuisses +1",
		feet = "Aya. Gambieras +1"}

    sets.idle.PDT = {
		ammo = "Ginsen",
		head = "Aya. Zucchetto +1",
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza",
		hands = "Herculean Gloves",
		ring1 = "Defending Ring",
		ring2 = "Vocane Ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Ayanmo Cosciales",
		feet = "Aya. Gambieras +1"}

    sets.idle.Town = {
		ammo = "Ginsen",
		head = HerculeanHelm.TP,
		neck = "Loricate Torque",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Herculean Vest",
		hands = "Herculean Gloves",
		ring1 = "Defending Ring",
		ring2 = "Vocane Ring",
		back = "Cheviot Cape",
		waist = "Flume belt +1",
		legs = "Herculean Trousers",
		feet = HerculeanFeet.TA}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Bloodgem Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
        body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.Kiting = {legs="Crimson Cuisses"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Adhemar jacket",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.Acc = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Adhemar jacket",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.Refresh = {
		ammo = "Ginsen",
		head = "Rawhide Mask",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Amalric Doublet",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.DW = {ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Adhemar jacket",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.DW.Acc = {ammo = "Ginsen",
		head = "Adhemar Bonnet",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Adhemar jacket",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.DW.Refresh = {ammo = "Ginsen",
		head = "Rawhide Mask",
		neck = "Subtlety spectacles",
		ear1 = "Suppanomimi",
		ear2 = "Brutal earring",
		body = "Amalric Doublet",
		hands = HerculeanGloves.TP,
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.Crit,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.TA}

    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(2, 2)
    else
        set_macro_page(1, 2)
    end
end


