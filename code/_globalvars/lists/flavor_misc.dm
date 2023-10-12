//Preferences stuff
	//Hairstyles
GLOBAL_LIST_EMPTY(hair_styles_list)			//stores /datum/sprite_accessory/hair indexed by name
GLOBAL_LIST_EMPTY(hair_styles_male_list)		//stores only hair names
GLOBAL_LIST_EMPTY(hair_styles_female_list)	//stores only hair names
GLOBAL_LIST_EMPTY(facial_hair_styles_list)	//stores /datum/sprite_accessory/facial_hair indexed by name
GLOBAL_LIST_EMPTY(facial_hair_styles_male_list)	//stores only hair names
GLOBAL_LIST_EMPTY(facial_hair_styles_female_list)	//stores only hair names
GLOBAL_LIST_EMPTY(hair_gradients_list) //stores /datum/sprite_accessory/hair_gradient indexed by name
	//Underwear
GLOBAL_LIST_EMPTY(underwear_list)		//stores /datum/sprite_accessory/underwear indexed by name
GLOBAL_LIST_EMPTY(underwear_m)	//stores only underwear name
GLOBAL_LIST_EMPTY(underwear_f)	//stores only underwear name
	//Undershirts
GLOBAL_LIST_EMPTY(undershirt_list) 	//stores /datum/sprite_accessory/undershirt indexed by name
GLOBAL_LIST_EMPTY(undershirt_m)	 //stores only undershirt name
GLOBAL_LIST_EMPTY(undershirt_f)	 //stores only undershirt name
	//Socks
GLOBAL_LIST_EMPTY(socks_list)		//stores /datum/sprite_accessory/socks indexed by name
	//Lizard Bits (all datum lists indexed by name)
GLOBAL_LIST_EMPTY(body_markings_list)
GLOBAL_LIST_EMPTY(tails_list_lizard)
GLOBAL_LIST_EMPTY(animated_tails_list_lizard)
GLOBAL_LIST_EMPTY(snouts_list)
GLOBAL_LIST_EMPTY(horns_list)
GLOBAL_LIST_EMPTY(frills_list)
GLOBAL_LIST_EMPTY(spines_list)
GLOBAL_LIST_EMPTY(legs_list)
GLOBAL_LIST_EMPTY(animated_spines_list)
	//Polysmorph
GLOBAL_LIST_EMPTY(tails_list_polysmorph)
GLOBAL_LIST_EMPTY(teeth_list)
GLOBAL_LIST_EMPTY(dome_list)
GLOBAL_LIST_EMPTY(dorsal_tubes_list)
	//Mutant Human bits
GLOBAL_LIST_EMPTY(tails_list_human)
GLOBAL_LIST_EMPTY(animated_tails_list_human)
GLOBAL_LIST_EMPTY(ears_list)
GLOBAL_LIST_EMPTY(wings_list)
GLOBAL_LIST_EMPTY(wings_open_list)
GLOBAL_LIST_EMPTY(moth_wings_list)
GLOBAL_LIST_EMPTY(moth_wingsopen_list)
GLOBAL_LIST_EMPTY(caps_list)
GLOBAL_LIST_EMPTY(ipc_screens_list)
GLOBAL_LIST_EMPTY(ipc_antennas_list)
GLOBAL_LIST_EMPTY(ipc_chassis_list)
GLOBAL_LIST_INIT(plasmaman_helmet_list, list(
	"None" = "",
	"Slit" = "slit",
	"Nyan" = "nyan",
	"Gassy" = "gassy",
	"Bane V1" = "banev1",
	"Bane V2" = "banev2",
	"Halo" = "halo",
	"Wizard" = "wizard",
	"Plate" = "plate",
	"Low" = "low")) //for icon making -> use "enviro" before this

GLOBAL_LIST_EMPTY(ethereal_mark_list) //ethereal face marks

GLOBAL_LIST_INIT(color_list_preternis, list(
	"Factory Default" = "#FFFFFF", 
	"Rust" = "#B7410E", 
	"Chrome" = "#B0C4DE", 
	"Overgrown" = "#b2ee69", 
	"Gunmetal Gray" = "#8D918D", 
	"Gold" = "#D4AF37"))

GLOBAL_LIST_EMPTY(pod_hair_list) //ethereal face marks
GLOBAL_LIST_EMPTY(pod_flower_list) //ethereal face marks
GLOBAL_LIST_INIT(ghost_forms_with_directions_list, list("ghost")) //stores the ghost forms that support directional sprites
GLOBAL_LIST_INIT(ghost_forms_with_accessories_list, list("ghost")) //stores the ghost forms that support hair and other such things

GLOBAL_LIST_INIT(ai_core_display_screens, list(
	":thinking:",
	"Alien",
	"Angel",
	"Banned",
	"Bliss",
	"Blob",
	"Blue",
	"Cat",
	"Clown",
	"Database",
	"Dorf",
	"Firewall",
	"Fuzzy",
	"Gentoo",
	"Glitchman",
	"Gondola",
	"Goon",
	"Hades",
	"Heartline",
	"Helios",
	"House",
	"Inverted",
	"Malicious",
	"Matrix",
	"Monochrome",
	"Murica",
	"Nanotrasen",
	"Not Malf",
	"Plain",
	"Portrait",
	"President",
	"Random",
	"Rainbow",
	"Red",
	"Red October",
	"Static",
	"Syndicat Meow",
	"Text",
	"Too Deep",
	"Triumvirate",
	"Triumvirate-M",
	"Weird"))

/// A form of resolve_ai_icon that is guaranteed to never sleep.
/// Not always accurate, but always synchronous.
/proc/resolve_ai_icon_sync(input)
	SHOULD_NOT_SLEEP(TRUE)

	if(!input || !(input in GLOB.ai_core_display_screens))
		return "ai"
	else
		if(input == "Random")
			input = pick(GLOB.ai_core_display_screens - "Random")
		return "ai-[lowertext(input)]"

/proc/resolve_ai_icon(input)
	if (input == "Portrait")
		var/datum/portrait_picker/tgui = new(usr)//create the datum
		tgui.ui_interact(usr)//datum has a tgui component, here we open the window
		return "ai-portrait" //just take this until they decide

	return resolve_ai_icon_sync(input)

GLOBAL_LIST_INIT(security_depts_prefs, list(SEC_DEPT_RANDOM, SEC_DEPT_NONE, SEC_DEPT_ENGINEERING, SEC_DEPT_MEDICAL, SEC_DEPT_SCIENCE, SEC_DEPT_SUPPLY, SEC_DEPT_SERVICE))

GLOBAL_LIST_INIT(engineering_depts_prefs, list(ENG_DEPT_RANDOM, ENG_DEPT_NONE, ENG_DEPT_MEDICAL, ENG_DEPT_SCIENCE, ENG_DEPT_SUPPLY, ENG_DEPT_SERVICE))

	//Backpacks
#define GBACKPACK "Grey Backpack"
#define GSATCHEL "Grey Satchel"
#define GDUFFELBAG "Grey Duffel Bag"
#define LSATCHEL "Leather Satchel"
#define DBACKPACK "Department Backpack"
#define DSATCHEL "Department Satchel"
#define DDUFFELBAG "Department Duffel Bag"
GLOBAL_LIST_INIT(backbaglist, list(DBACKPACK, DSATCHEL, DDUFFELBAG, GBACKPACK, GSATCHEL, GDUFFELBAG, LSATCHEL))

// Suits/Skirts
#define PREF_SUIT "Jumpsuit"
#define PREF_SKIRT "Jumpskirt"
GLOBAL_LIST_INIT(jumpsuitlist, list(PREF_SUIT, PREF_SKIRT))

//Uplink spawn loc
#define UPLINK_PDA		"PDA"
#define UPLINK_RADIO	"Radio"
#define UPLINK_PEN		"Pen" //like a real spy!
#define UPLINK_IMPLANT  "Implant"
GLOBAL_LIST_INIT(uplink_spawn_loc_list, list(UPLINK_PDA, UPLINK_RADIO, UPLINK_PEN, UPLINK_IMPLANT))

	//Female Uniforms
GLOBAL_LIST_EMPTY(female_clothing_icons)

	//Skinny Uniforms
GLOBAL_LIST_EMPTY(skinny_clothing_icons)

	//radical shit
GLOBAL_LIST_INIT(hit_appends, list("-OOF", "-ACK", "-UGH", "-HRNK", "-HURGH", "-GLORF"))

GLOBAL_LIST_INIT(scarySounds, list('sound/weapons/thudswoosh.ogg','sound/weapons/taser.ogg','sound/weapons/armbomb.ogg','sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg','sound/voice/hiss5.ogg','sound/voice/hiss6.ogg','sound/effects/glassbr1.ogg','sound/effects/glassbr2.ogg','sound/effects/glassbr3.ogg','sound/items/welder.ogg','sound/items/welder2.ogg','sound/machines/airlock.ogg','sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg'))


// Reference list for disposal sort junctions. Set the sortType variable on disposal sort junctions to
// the index of the sort department that you want. For example, sortType set to 2 will reroute all packages
// tagged for the Cargo Bay.

/* List of sortType codes for mapping reference
0 Waste
1 Disposals - All unwrapped items and untagged parcels get picked up by a junction with this sortType. Usually leads to the recycler.
2 Cargo Bay
3 QM Office
4 Engineering
5 CE Office
6 Atmospherics
7 Security
8 HoS Office
9 Medbay
10 CMO Office
11 Chemistry
12 Research
13 RD Office
14 Robotics
15 HoP Office
16 Library
17 Chapel
18 Theatre
19 Bar
20 Kitchen
21 Hydroponics
22 Janitor
23 Genetics
24 Testing Range
25 Toxins
26 Dormitories
27 Virology
28 Xenobiology
29 Law Office
30 Detective's Office
*/

//The whole system for the sorttype var is determined based on the order of this list,
//disposals must always be 1, since anything that's untagged will automatically go to disposals, or sorttype = 1 --Superxpdude

//If you don't want to fuck up disposals, add to this list, and don't change the order.
//If you insist on changing the order, you'll have to change every sort junction to reflect the new order. --Pete

GLOBAL_LIST_INIT(TAGGERLOCATIONS, list("Disposals",
	"Cargo Bay", "QM Office", "Engineering", "CE Office",
	"Atmospherics", "Security", "HoS Office", "Medbay",
	"CMO Office", "Chemistry", "Research", "RD Office",
	"Robotics", "HoP Office", "Library", "Chapel", "Theatre",
	"Bar", "Kitchen", "Hydroponics", "Janitor Closet","Genetics",
	"Testing Range", "Toxins", "Dormitories", "Virology",
	"Xenobiology", "Law Office","Detective's Office"))

GLOBAL_LIST_INIT(TAGGERLOCATIONS_DEPARTMENTAL, list(
	"Security" = list("Security", "Detective's Office", "HoS Office"),
	"Medical" = list("Medbay", "Chemistry", "Genetics", "Virology", "CMO Office"),
	"Science" = list("Research", "Robotics", "Xenobiology", "Toxins", "Testing Range", "RD Office"),
	"Engineering" = list("Engineering", "Atmospherics", "CE Office"),
	"Cargo" = list("Disposals", "Cargo Bay", "QM Office"),
	"Service" = list("Bar", "Kitchen", "Hydroponics", "Janitor Closet", "HoP Office"),
	"Civilian" = list("Dormitories", "Theatre", "Chapel", "Law Office", "Library")
))

GLOBAL_LIST_INIT(station_prefixes, world.file2list("strings/station_prefixes.txt") + "")

GLOBAL_LIST_INIT(station_names, world.file2list("strings/station_names.txt") + "")

GLOBAL_LIST_INIT(station_suffixes, world.file2list("strings/station_suffixes.txt"))

GLOBAL_LIST_INIT(greek_letters, world.file2list("strings/greek_letters.txt"))

GLOBAL_LIST_INIT(phonetic_alphabet, world.file2list("strings/phonetic_alphabet.txt"))

GLOBAL_LIST_INIT(numbers_as_words, world.file2list("strings/numbers_as_words.txt"))

/proc/generate_number_strings()
	var/list/L[198]
	for(var/i in 1 to 99)
		L += "[i]"
		L += "\Roman[i]"
	return L

GLOBAL_LIST_INIT(station_numerals, greek_letters + phonetic_alphabet + numbers_as_words + generate_number_strings())

GLOBAL_LIST_INIT(admiral_messages, list("Do you know how expensive these stations are?","Stop wasting my time.","I was sleeping, thanks a lot.","Stand and fight you cowards!","You knew the risks coming in.","Stop being paranoid.","Whatever's broken just build a new one.","No.", "<i>null</i>","<i>Error: No comment given.</i>", "It's a good day to die!"))
