Constants = {}

Constants.BLANKLINE = "---"
Constants.HIDDEN_INFO = "?"

Constants.SCREEN = {
	HEIGHT = 160,
	WIDTH = 240,
	UP_GAP = 0,
	DOWN_GAP = 0,
	RIGHT_GAP = 150,
	BOTTOM_AREA = 70,
	MARGIN = 5,
	LINESPACING = 11,
}

Constants.Font = {
	SIZE = 9,
	HEADERSIZE = 15,
	FAMILY = "Franklin Gothic Medium",
	STYLE = "regular", -- Style options are: regular, bold, italic, strikethrough, underline
}

Constants.ButtonTypes = {
	FULL_BORDER = 1,
	NO_BORDER = 2,
	CHECKBOX = 3,
	COLORPICKER = 4,
	IMAGE = 5,
	PIXELIMAGE = 6,
	POKEMON_ICON = 7,
	STAT_STAGE = 8,
	CIRCLE = 9,
	ICON_BORDER = 10,
	CHEVRON = 11,
}

Constants.STAT_STATES = {
	[0] = { text = " ", textColor = "Default text" },
	[1] = { text = "+", textColor = "Positive text" },
	[2] = { text = "--", textColor = "Negative text" },
	[3] = { text = "=", textColor = "Default text" },
}

Constants.MoveTypeColors = {
	normal = 0xFFA8A878,
	fighting = 0xFFC03028,
	flying = 0xFFA890F0,
	poison = 0xFFA040A0,
	ground = 0xFFE0C068,
	rock = 0xFFB8A038,
	bug = 0xFFA8B820,
	ghost = 0xFF705898,
	steel = 0xFFB8B8D0,
	fire = 0xFFF08030,
	water = 0xFF6890F0,
	grass = 0xFF78C850,
	electric = 0xFFF8D030,
	psychic = 0xFFF85888,
	ice = 0xFF98D8D8,
	dragon = 0xFF7038F8,
	dark = 0xFF705848,
	fairy = 0xFFEE99AC,
	unknown = 0xFF68A090, -- For the "Curse" move in Gen 2 - 4
}

Constants.GAME_STATS = { -- Enums for in-game stats
	-- https://github.com/pret/pokefirered/blob/master/include/constants/game_stat.h
	SAVED_GAME = 0, -- Number of times the player saved the game
	STEPS = 5, -- Total number of steps the player has taken
	TOTAL_BATTLES = 7, -- Total battles (trainer + wild), also useful for checking when Battle.inBattle should be true
	WILD_BATTLES = 8, -- Total number of wild encounters
	TRAINER_BATTLES = 9, -- Total number of unique trainer battles
	POKEMON_CAPTURES = 11, -- Total number of Pokemon caught
	FISHING_CAPTURES = 12, -- Deceptive name, gets incremented when fishing encounter happens
	USED_POKECENTER = 15,
	RESTED_AT_HOME = 16,
	USED_ROCK_SMASH = 19,
	USED_STRUGGLE = 27, -- Total number of times the player has had to use Struggle
	SHOPPED = 38, -- Total number of bulk purchases made from a shop (# individual interactions with an npc)
}

Constants.PreloadedThemes = {
	["Fire Red"] = "FFFFFF FFFFFF 55CB6B 62C7FE FEFA69 FEFA69 FF1920 81000E FF1920 81000E 58050D 0 1",
	["Leaf Green"] = "FFFFFF FFFFFF 62C7FE FE7573 FEFA69 FEFA69 55CB6B 006200 55CB6B 006200 053A04 0 1",
	["Beach Getaway"] = "222222 222222 5463FF E78EA9 A581E6 444444 E78EA9 B9F8D3 E78EA9 FFFBE7 40DFEF 0 0",
	["Blue Da Ba Dee"] = "FFFFFF FFFFFF 2EB5FF E04DBA FEFA69 55CB6B 198BFF 004881 198BFF 004881 072557 1 1",
	["Calico Cat"] = "4A3432 4A3432 E07E3D 8A9298 E07E3D FCFCF0 8A9298 FCFCF0 E07E3D FBCA8C 0F0601 0 0",
	["Calico Cat v2"] = "4A3432 4A3432 E07E3D 8A9298 E07E3D FCFCF0 FCFCF0 FCFCF0 FBCA8C FBCA8C E07E3D 0 0",
	["Cotton Candy"] = "000000 000000 1A85FF D41159 9155D9 EEEEEE D35FB7 FFCBF3 1A85FF A0D3FF 5D3A9B 0 0",
	["GameCube"] = "C8C8C8 C8C8C8 2ACA38 FE4A4A EBE31A CBCCC4 000000 342A54 000000 342A54 000000 1 1",
	["Item Bag"] = "636363 636363 017BC4 DF2800 DE8C4A 636363 D7B452 FEFFCF D7B452 FEFFCF F6CF73 0 0",
	["Neon Lights"] = "FFFFFF FFFFFF 38FF12 FF00E3 FFF100 FFFFFF 00F5FB 000000 001EFF 000000 000000 1 1",
	["Simple Monotone"] = "222222 222222 01B910 FE5958 555555 FFFFFF 000000 FFFFFF 000000 FFFFFF 555555 0 0",
	["Team Rocket"] = "EEF5FE EEF5FE 8F7DEB D6335E F4E7BA F4E7BA 8F7DEB 333333 D6335E 333333 333333 1 1",
	["USS Galactic"] = "EEEEEE EEEEEE 00ADB5 DFBB9D B6C8EF 00ADB5 222831 393E46 222831 393E46 000000 1 1",
	["Cozy Fall Leaves"] = "2C432C 2C432C FA8223 9C7456 307940 307940 7D5D1E 9ED4B0 7D5D1E 9ED4B0 9ED4B0 0 0",
}

Constants.OrderedLists = {
	STATSTAGES = {
		"hp",
		"atk",
		"def",
		"spa",
		"spd",
		"spe",
	},
	OPTIONS = {
		"Language",
		"Autodetect language from game",
		"Disable mainscreen carousel",
		"Auto swap to enemy",
		"Show random ball picker",
		"Hide stats until summary shown",
		"Right justified numbers",
		"Show physical special icons",
		"Show move effectiveness",
		"Calculate variable damage",
		"Determine friendship readiness",
		"Count enemy PP usage",
		"Track PC Heals",
		"PC heals count downward",
		"Auto save tracked game data",
		"Pokemon icon set",
		"Show last damage calcs",
		"Reveal info if randomized",
		"Show experience points bar",
		"Animated Pokemon popout",
		"Refocus emulator after load",
		"Use premade ROMs",
		"Generate ROM each time",
		"Display repel usage",
		"Startup Pokemon displayed",
		"Display pedometer",
		"Display play time",
		"Game timer location",
		"Dev branch updates",
		"Welcome message",
		"Startup favorites",
		"Show on new game screen",
		"Enable restore points",
		"Enable crash recovery",
		"Enable custom extensions",
		"Show Team View",
		"Show Pre Evolutions",
	},
	CONTROLS = {
		"Load next seed",
		"Toggle view",
		"Cycle through stats",
		"Mark stat",
	},
	THEMECOLORS = {
		"Default text",
		"Lower box text",
		"Positive text",
		"Negative text",
		"Intermediate text",
		"Header text",
		"Upper box border",
		"Upper box background",
		"Lower box border",
		"Lower box background",
		"Main background",
	},
	PRELOADED_THEMES = {
		"Fire Red",
		"Leaf Green",
		"Beach Getaway",
		"Blue Da Ba Dee",
		"Calico Cat",
		"Calico Cat v2",
		"Cotton Candy",
		"GameCube",
		"Item Bag",
		"Neon Lights",
		"Simple Monotone",
		"Team Rocket",
		"USS Galactic",
		"Cozy Fall Leaves",
	},
}

Constants.PixelImages = {
	BLANK = { { 0 } }, -- Helpful for padding out certain buttons
	GEAR = { -- 8x8
		{0,0,0,1,1,0,0,0},
		{0,1,1,1,1,1,1,0},
		{0,1,1,1,1,1,1,0},
		{1,1,1,0,0,1,1,1},
		{1,1,1,0,0,1,1,1},
		{0,1,1,1,1,1,1,0},
		{0,1,1,1,1,1,1,0},
		{0,0,0,1,1,0,0,0},
	},
	PHYSICAL = { -- 7x7
		{1,0,0,1,0,0,1},
		{0,1,0,1,0,1,0},
		{0,0,1,1,1,0,0},
		{1,1,1,1,1,1,1},
		{0,0,1,1,1,0,0},
		{0,1,0,1,0,1,0},
		{1,0,0,1,0,0,1},
	},
	SPECIAL = { -- 7x7
		{0,0,1,1,1,0,0},
		{0,1,0,0,0,1,0},
		{1,0,0,1,0,0,1},
		{1,0,1,0,1,0,1},
		{1,0,0,1,0,0,1},
		{0,1,0,0,0,1,0},
		{0,0,1,1,1,0,0},
	},
	NOTEPAD = { -- 11x11
		{0,0,0,0,0,0,0,0,0,1,1},
		{0,0,0,0,0,0,0,0,1,0,1},
		{1,1,1,1,1,1,1,1,1,1,0},
		{1,0,0,0,0,0,0,1,1,0,0},
		{1,0,1,1,1,0,1,0,1,0,0},
		{1,0,0,0,0,0,0,0,1,0,0},
		{1,0,1,1,1,1,1,0,1,0,0},
		{1,0,0,0,0,0,0,0,1,0,0},
		{1,0,1,1,1,1,1,0,1,0,0},
		{1,0,0,0,0,0,0,0,1,0,0},
		{1,1,1,1,1,1,1,1,1,0,0},
	},
	TRIANGLE_DOWN = { -- 11x11
		{0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0},
		{0,1,1,1,1,1,1,1,1,1,0},
		{0,0,1,1,1,1,1,1,1,0,0},
		{0,0,0,1,1,1,1,1,0,0,0},
		{0,0,0,0,1,1,1,0,0,0,0},
		{0,0,0,0,0,1,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0},
	},
	MAGNIFYING_GLASS = { -- 10x10
		{0,0,1,1,1,0,0,0,0,0},
		{0,1,0,0,0,1,0,0,0,0},
		{1,0,0,0,0,0,1,0,0,0},
		{1,0,0,0,0,0,1,0,0,0},
		{1,0,0,0,0,0,1,0,0,0},
		{0,1,0,0,0,1,0,0,0,0},
		{0,0,1,1,1,0,1,0,0,0},
		{0,0,0,0,0,0,0,1,1,0},
		{0,0,0,0,0,0,0,1,1,1},
		{0,0,0,0,0,0,0,0,1,1},
	},
	CLOCK = { -- 10x10
		{0,0,1,1,1,1,1,1,0,0},
		{0,1,0,0,0,0,0,0,1,0},
		{1,0,0,0,1,0,0,0,0,1},
		{1,0,0,0,1,0,0,0,0,1},
		{1,0,0,0,1,0,0,0,0,1},
		{1,0,0,0,1,1,1,0,0,1},
		{1,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,1},
		{0,1,0,0,0,0,0,0,1,0},
		{0,0,1,1,1,1,1,1,0,0},
	},
	WARNING = { -- 9x9
		{0,0,0,1,1,1,0,0,0},
		{0,1,1,1,1,1,1,1,0},
		{0,1,1,1,0,1,1,1,0},
		{1,1,1,1,0,1,1,1,1},
		{1,1,1,1,0,1,1,1,1},
		{1,1,1,1,1,1,1,1,1},
		{0,1,1,1,0,1,1,1,0},
		{0,1,1,1,1,1,1,1,0},
		{0,0,0,1,1,1,0,0,0},

	},
	INSTALL_BOX = { -- 9x9
		{0,0,0,0,1,0,0,0,0},
		{0,0,0,0,1,0,0,0,0},
		{0,0,0,0,1,0,0,0,0},
		{0,0,1,0,1,0,1,0,0},
		{0,0,0,1,1,1,0,0,0},
		{0,0,0,0,1,0,0,0,0},
		{1,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,0,0,1},
		{1,1,1,1,1,1,1,1,1},
	},
	LANGUAGE_LETTERS = { -- 12x11
		{0,0,1,0,0,0,0,0,0,0,0,0},
		{0,1,0,1,0,0,0,0,0,0,0,0},
		{0,1,0,1,0,0,0,0,0,0,0,0},
		{0,1,0,1,0,0,0,0,0,0,0,0},
		{1,1,1,1,1,0,0,1,0,0,0,0},
		{1,0,0,0,1,1,1,1,1,1,1,0},
		{0,0,0,0,0,0,0,1,0,0,0,0},
		{0,0,0,0,0,0,1,1,1,1,1,0},
		{0,0,0,0,0,1,0,1,0,1,0,1},
		{0,0,0,0,0,1,0,1,1,0,0,1},
		{0,0,0,0,0,1,1,1,0,0,1,0},
	},
	LEFT_ARROW = { -- 10x10
		{0,0,0,0,0,0,0,0,0,0},
		{0,0,0,1,1,0,0,0,0,0},
		{0,0,1,1,0,0,0,0,0,0},
		{0,1,1,0,0,0,0,0,0,0},
		{1,1,1,1,1,1,1,1,1,0},
		{1,1,1,1,1,1,1,1,1,0},
		{0,1,1,0,0,0,0,0,0,0},
		{0,0,1,1,0,0,0,0,0,0},
		{0,0,0,1,1,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0},
	},
	RIGHT_ARROW = { -- 10x10
		{0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,1,1,0,0,0},
		{0,0,0,0,0,0,1,1,0,0},
		{0,0,0,0,0,0,0,1,1,0},
		{0,1,1,1,1,1,1,1,1,1},
		{0,1,1,1,1,1,1,1,1,1},
		{0,0,0,0,0,0,0,1,1,0},
		{0,0,0,0,0,0,1,1,0,0},
		{0,0,0,0,0,1,1,0,0,0},
		{0,0,0,0,0,0,0,0,0,0},
	},
	UP_ARROW = { -- 10x10
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,1,1,1,1,0,0,0},
		{0,0,1,1,1,1,1,1,0,0},
		{0,1,1,0,1,1,0,1,1,0},
		{0,1,0,0,1,1,0,0,1,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0},
	},
	DOWN_ARROW = { -- 10x10
		{0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
		{0,1,0,0,1,1,0,0,1,0},
		{0,1,1,0,1,1,0,1,1,0},
		{0,0,1,1,1,1,1,1,0,0},
		{0,0,0,1,1,1,1,0,0,0},
		{0,0,0,0,1,1,0,0,0,0},
	},
	BACK_ARROW = { -- 16x12, larger than normal for easier clicking
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0},
		{0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0},
		{0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0},
		{0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	},
	MAP_PINDROP = { -- 8x12
		{0,0,1,1,1,1,0,0},
		{0,1,1,1,1,1,1,0},
		{1,1,1,0,0,1,1,1},
		{1,1,0,0,0,0,1,1},
		{1,1,0,0,0,0,1,1},
		{1,1,1,0,0,1,1,1},
		{0,1,1,1,1,1,1,0},
		{0,1,1,1,1,1,1,0},
		{0,0,1,1,1,1,0,0},
		{0,0,1,1,1,1,0,0},
		{0,0,0,1,1,0,0,0},
		{0,0,0,1,1,0,0,0},
	},
	SWORD_ATTACK = { -- 14x13
		{0,0,0,0,0,0,0,0,0,0,0,1,1,0},
		{0,0,0,0,0,0,0,0,0,0,1,0,1,0},
		{0,0,0,0,0,0,0,0,0,1,0,1,1,0},
		{0,0,0,0,0,0,0,0,1,0,1,1,0,0},
		{0,0,0,0,0,0,0,1,0,1,1,0,0,0},
		{0,0,0,0,0,0,1,0,1,1,0,0,0,0},
		{1,0,0,0,0,1,0,1,1,0,0,0,0,0},
		{1,1,0,0,1,0,1,1,0,0,0,0,0,0},
		{0,1,1,1,0,1,1,0,0,0,0,0,0,0},
		{0,0,1,1,1,1,0,0,0,0,0,0,0,0},
		{0,1,0,1,1,0,0,0,0,0,0,0,0,0},
		{1,0,1,0,1,1,0,0,0,0,0,0,0,0},
		{1,1,0,0,0,1,1,0,0,0,0,0,0,0},
	},
	CHECKMARK = { -- 12x11
		{0,0,0,0,0,0,0,0,0,0,1,1},
		{0,0,0,0,0,0,0,0,0,1,1,1},
		{0,0,0,0,0,0,0,0,1,1,1,0},
		{0,0,0,0,0,0,0,0,1,1,0,0},
		{0,0,0,0,0,0,0,1,1,1,0,0},
		{0,0,0,0,0,0,1,1,1,0,0,0},
		{1,1,0,0,0,0,1,1,0,0,0,0},
		{1,1,1,0,0,1,1,1,0,0,0,0},
		{0,1,1,1,1,1,1,0,0,0,0,0},
		{0,0,1,1,1,1,0,0,0,0,0,0},
		{0,0,0,1,1,0,0,0,0,0,0,0},
	},
	CROSS = { -- 11x11
		{1,1,0,0,0,0,0,0,0,1,1},
		{1,1,1,0,0,0,0,0,1,1,1},
		{0,1,1,1,0,0,0,1,1,1,0},
		{0,0,1,1,1,0,1,1,1,0,0},
		{0,0,0,1,1,1,1,1,0,0,0},
		{0,0,0,0,1,1,1,0,0,0,0},
		{0,0,0,1,1,1,1,1,0,0,0},
		{0,0,1,1,1,0,1,1,1,0,0},
		{0,1,1,1,0,0,0,1,1,1,0},
		{1,1,1,0,0,0,0,0,1,1,1},
		{1,1,0,0,0,0,0,0,0,1,1},
	},
	CLOSE = { -- 9x9
		{1,1,0,0,0,0,0,1,1},
		{1,1,1,0,0,0,1,1,1},
		{0,1,1,1,0,1,1,1,0},
		{0,0,1,1,1,1,1,0,0},
		{0,0,0,1,1,1,0,0,0},
		{0,0,1,1,1,1,1,0,0},
		{0,1,1,1,0,1,1,1,0},
		{1,1,1,0,0,0,1,1,1},
		{1,1,0,0,0,0,0,1,1},
	},
	POKEBALL = { -- 12x12
		{0,0,0,0,1,1,1,1,0,0,0,0},
		{0,0,1,1,2,2,2,2,1,1,0,0},
		{0,1,2,2,2,3,2,2,2,2,1,0},
		{0,1,2,2,3,2,2,2,2,2,1,0},
		{1,2,2,2,2,2,2,2,2,2,2,1},
		{1,2,2,2,2,1,1,2,2,2,2,1},
		{1,1,2,2,1,3,3,1,2,2,1,1},
		{1,3,1,1,1,3,3,1,1,1,3,1},
		{0,1,3,3,3,1,1,3,3,3,1,0},
		{0,1,3,3,3,3,3,3,3,3,1,0},
		{0,0,1,1,3,3,3,3,1,1,0,0},
		{0,0,0,0,1,1,1,1,0,0,0,0},
	},
	POKEBALL_SMALL = { -- 9x9
		{0,0,0,1,1,1,0,0,0},
		{0,1,1,2,2,2,1,1,0},
		{0,1,2,2,2,2,2,1,0},
		{1,2,2,2,1,2,2,2,1},
		{1,1,1,1,3,1,1,1,1},
		{1,3,3,3,1,3,3,3,1},
		{0,1,3,3,3,3,3,1,0},
		{0,1,1,3,3,3,1,1,0},
		{0,0,0,1,1,1,0,0,0},
	},
	DICE = { -- 13x14
		{0,0,0,0,0,1,1,1,0,0,0,0,0},
		{0,0,0,1,1,0,0,0,1,1,0,0,0},
		{0,1,1,0,0,0,0,0,0,0,1,1,0},
		{1,0,0,0,0,0,1,0,0,0,0,0,1},
		{1,1,1,0,0,0,0,0,0,0,1,1,1},
		{1,0,0,1,1,0,0,0,1,1,0,0,1},
		{1,0,0,0,0,1,1,1,0,0,1,0,1},
		{1,0,1,0,0,0,1,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,1},
		{1,0,0,0,0,0,1,0,0,0,0,0,1},
		{1,0,0,0,1,0,1,0,1,0,0,0,1},
		{0,1,1,0,0,0,1,0,0,0,1,1,0},
		{0,0,0,1,1,0,1,0,1,1,0,0,0},
		{0,0,0,0,0,1,1,1,0,0,0,0,0},
	},
	GBA = { -- 22x13
		{2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2},
		{2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,2},
		{1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1},
		{1,1,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,1,1,1,1,1},
		{1,1,1,2,1,1,2,1,2,1,2,1,2,1,2,1,1,1,1,1,1,1},
		{1,1,2,2,2,1,1,2,1,2,1,2,1,2,1,2,1,1,1,2,2,1},
		{1,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,1},
		{1,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,1,2,2,1,1,1},
		{1,1,1,1,2,1,2,2,2,2,2,2,2,2,2,2,1,2,2,1,1,1},
		{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
		{2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
		{2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2},
		{2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2},
	},
	SPARKLES = { -- 12x12
		{0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,1,0,0,0,0,1,0,0,0,0},
		{0,1,0,1,0,0,0,1,0,0,0,0},
		{0,0,1,0,0,0,1,0,1,0,0,0},
		{0,0,0,0,1,1,0,0,0,1,1,0},
		{1,0,0,0,0,0,1,0,1,0,0,0},
		{0,0,0,0,0,0,0,1,0,0,0,0},
		{0,0,0,1,0,0,0,1,0,0,0,0},
		{0,0,0,1,0,0,0,0,0,0,0,0},
		{0,1,1,0,1,1,0,0,0,1,0,0},
		{0,0,0,1,0,0,0,0,0,0,0,0},
		{0,0,0,1,0,0,0,0,0,0,0,0},
	},
	EXTENSIONS = { -- 12x12
		{0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0},
		{1,0,0,1,1,0,0,1,1,0,0,0},
		{1,1,0,0,1,1,0,0,1,1,0,0},
		{0,1,1,0,0,1,1,0,0,1,1,0},
		{0,0,1,1,0,0,1,1,0,0,1,1},
		{0,0,1,1,0,0,1,1,0,0,1,1},
		{0,1,1,0,0,1,1,0,0,1,1,0},
		{1,1,0,0,1,1,0,0,1,1,0,0},
		{1,0,0,1,1,0,0,1,1,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0},
	},
}

-- Table of special characters to return based on whether emulator supports those special characters [true/false]
Constants.Char = {
	[" "] = {
		width = 1,
	},
	["%"] = {
		width = 7,
	},
	["0"] = {
		width = 4,
	},
	["1"] = {
		width = 4,
	},
	["2"] = {
		width = 4,
	},
	["3"] = {
		width = 4,
	},
	["4"] = {
		width = 4,
	},
	["5"] = {
		width = 4,
	},
	["6"] = {
		width = 4,
	},
	["7"] = {
		width = 4,
	},
	["8"] = {
		width = 4,
	},
	["9"] = {
		width = 4,
	},
	["="] = {
		width = 4,
	},
	[","] = {
		width = 2,
	},
	["-"] = {
		width = 2,
	},
	["_"] = {
		width = 5,
	},
	["."] = {
		width = 1,
	},
	["("] = {
		width = 2,
	},
	[")"] = {
		width = 2,
	},
	["#"] = {
		width = 5,
	},
	["&"] = {
		width = 5,
	},
	["?"] = {
		width = 4,
	},
	["<"] = {
		width = 4,
	},
	[">"] = {
		width = 4,
	},
	["/"] = {
		width = 4,
	},
	[":"] = {
		width = 1,
	},
	["a"] = {
		width = 4,
	},
	["A"] = {
		width = 5,
	},
	["b"] = {
		width = 4,
	},
	["B"] = {
		width = 4,
	},
	["c"] = {
		width = 3,
	},
	["C"] = {
		width = 4,
	},
	["d"] = {
		width = 4,
	},
	["D"] = {
		width = 5,
	},
	["e"] = {
		width = 4,
	},
	["E"] = {
		width = 4,
	},
	["f"] = {
		width = 2,
	},
	["F"] = {
		width = 4,
	},
	["g"] = {
		width = 4,
	},
	["G"] = {
		width = 5,
	},
	["h"] = {
		width = 4,
	},
	["H"] = {
		width = 5,
	},
	["i"] = {
		width = 1,
	},
	["I"] = {
		width = 1,
	},
	["j"] = {
		width = 2,
	},
	["J"] = {
		width = 2,
	},
	["k"] = {
		width = 4,
	},
	["K"] = {
		width = 5,
	},
	["l"] = {
		width = 1,
	},
	["L"] = {
		width = 3,
	},
	["m"] = {
		width = 7,
	},
	["M"] = {
		width = 6,
	},
	["n"] = {
		width = 4,
	},
	["N"] = {
		width = 5,
	},
	["o"] = {
		width = 4,
	},
	["O"] = {
		width = 5,
	},
	["p"] = {
		width = 4,
	},
	["P"] = {
		width = 4,
	},
	["q"] = {
		width = 3,
	},
	["Q"] = {
		width = 5,
	},
	["r"] = {
		width = 2,
	},
	["R"] = {
		width = 5,
	},
	["s"] = {
		width = 3,
	},
	["S"] = {
		width = 4,
	},
	["t"] = {
		width = 2,
	},
	["T"] = {
		width = 3,
	},
	["u"] = {
		width = 4,
	},
	["U"] = {
		width = 4,
	},
	["v"] = {
		width = 3,
	},
	["V"] = {
		width = 5,
	},
	["w"] = {
		width = 5,
	},
	["W"] = {
		width = 7,
	},
	["x"] = {
		width = 3,
	},
	["X"] = {
		width = 4,
	},
	["y"] = {
		width = 3,
	},
	["Y"] = {
		width = 5,
	},
	["z"] = {
		width = 3,
	},
	["Z"] = {
		width = 4,
	},
	["♂"] = {
		encoded = "?",
	},
	["♀"] = {
		encoded = "?",
	},
	["…"] = {
		encoded = '..',
		plain = "...",
	},
	["“"] = {
		encoded = '"',
		plain = "\"",
	},
	["”"] = {
		encoded = '"',
		plain = "\"",
	},
	["‘"] = {
		encoded = "'",
		plain = "'",
	},
	["À"] = {
		encoded = "\192",
		lower = "à",
		plain = "A",
		width = 5,
	},
	["Á"] = {
		encoded = "\193",
		lower = "á",
		plain = "A",
		width = 5,
	},
	["Â"] = {
		encoded = "\194",
		lower = "â",
		plain = "A",
		width = 5,
	},
	["Ã"] = {
		encoded = "\195",
		lower = "ã",
		plain = "A",
		width = 5,
	},
	["Ä"] = {
		encoded = "\196",
		lower = "ä",
		plain = "A",
		width = 5,
	},
	["Å"] = {
		encoded = "\197",
		lower = "å",
		plain = "A",
		width = 5,
	},
	["Æ"] = {
		encoded = "\198",
		lower = "æ",
		plain = "AE",
		width = 6, -- Untested
	},
	["Ç"] = {
		encoded = "\199",
		lower = "ç",
		plain = "C",
		width = 4,
	},
	["È"] = {
		encoded = "\200",
		lower = "è",
		plain = "E",
		width = 4,
	},
	["É"] = {
		encoded = "\201",
		lower = "é",
		plain = "E",
		width = 4,
	},
	["Ê"] = {
		encoded = "\202",
		lower = "ê",
		plain = "E",
		width = 4,
	},
	["Ë"] = {
		encoded = "\203",
		lower = "ë",
		plain = "E",
		width = 4,
	},
	["Ì"] = {
		encoded = "\204",
		lower = "ì",
		plain = "I",
		width = 1,
	},
	["Í"] = {
		encoded = "\205",
		lower = "í",
		plain = "I",
		width = 1,
	},
	["Î"] = {
		encoded = "\206",
		lower = "î",
		plain = "I",
		width = 1,
	},
	["Ï"] = {
		encoded = "\207",
		lower = "ï",
		plain = "I",
		width = 1,
	},
	["Ð"] = {
		encoded = "\208",
		lower = "ð",
		plain = "D",
		width = 5,
	},
	["Ñ"] = {
		encoded = "\209",
		lower = "ñ",
		plain = "N",
		width = 5,
	},
	["Ò"] = {
		encoded = "\210",
		lower = "ò",
		plain = "O",
		width = 5,
	},
	["Ó"] = {
		encoded = "\211",
		lower = "ó",
		plain = "O",
		width = 5,
	},
	["Ô"] = {
		encoded = "\212",
		lower = "ô",
		plain = "O",
		width = 5,
	},
	["Õ"] = {
		encoded = "\213",
		lower = "õ",
		plain = "O",
		width = 5,
	},
	["Ö"] = {
		encoded = "\214",
		lower = "ö",
		plain = "O",
		width = 5,
	},
	["Ø"] = {
		encoded = "\216",
		lower = "ø",
		plain = "O",
		width = 5,
	},
	["Ù"] = {
		encoded = "\217",
		lower = "ù",
		plain = "U",
		width = 4,
	},
	["Ú"] = {
		encoded = "\218",
		lower = "ú",
		plain = "U",
		width = 4,
	},
	["Û"] = {
		encoded = "\219",
		lower = "û",
		plain = "U",
		width = 4,
	},
	["Ü"] = {
		encoded = "\220",
		lower = "ü",
		plain = "U",
		width = 4,
	},
	["Ý"] = {
		encoded = "\221",
		lower = "ý",
		plain = "Y",
		width = 5,
	},
	["Þ"] = {
		encoded = "\222",
		lower = "þ",
		plain = "P",
		width = 4,
	},
	["Ÿ"] = {
		-- encoded = nil, -- \376 not available
		lower = "ÿ",
		plain = "y",
		width = 5,
	},
	["ß"] = {
		encoded = "\223",
		plain = "B",
		width = 5,
	},
	["à"] = {
		encoded = "\224",
		upper = "À",
		plain = "a",
		width = 4,
	},
	["á"] = {
		encoded = "\225",
		upper = "Á",
		plain = "a",
		width = 4,
	},
	["â"] = {
		encoded = "\226",
		upper = "Â",
		plain = "a",
		width = 4,
	},
	["ã"] = {
		encoded = "\227",
		upper = "Ã",
		plain = "a",
		width = 4,
	},
	["ä"] = {
		encoded = "\228",
		upper = "Ä",
		plain = "a",
		width = 4,
	},
	["å"] = {
		encoded = "\229",
		upper = "Å",
		plain = "a",
		width = 4,
	},
	["æ"] = {
		encoded = "\230",
		upper = "Æ",
		plain = "ae",
		width = 6, -- Untested
	},
	["ç"] = {
		encoded = "\231",
		upper = "Ç",
		plain = "c",
		width = 3,
	},
	["è"] = {
		encoded = "\232",
		upper = "È",
		plain = "e",
		width = 4,
	},
	["é"] = {
		encoded = "\233",
		upper = "É",
		plain = "e",
		width = 4,
	},
	["ê"] = {
		encoded = "\234",
		upper = "Ê",
		plain = "e",
		width = 4,
	},
	["ë"] = {
		encoded = "\235",
		upper = "Ë",
		plain = "e",
		width = 4,
	},
	["ì"] = {
		encoded = "\236",
		upper = "Ì",
		plain = "i",
		width = 1,
	},
	["í"] = {
		encoded = "\237",
		upper = "Í",
		plain = "i",
		width = 1,
	},
	["î"] = {
		encoded = "\238",
		upper = "Î",
		plain = "i",
		width = 1,
	},
	["ï"] = {
		encoded = "\239",
		upper = "Ï",
		plain = "i",
		width = 1,
	},
	["ð"] = {
		encoded = "\240",
		upper = "Ð",
		plain = "o",
		width = 4,
	},
	["ñ"] = {
		encoded = "\241",
		upper = "Ñ",
		plain = "n",
		width = 4,
	},
	["ò"] = {
		encoded = "\242",
		upper = "Ò",
		plain = "o",
		width = 4,
	},
	["ó"] = {
		encoded = "\243",
		upper = "Ó",
		plain = "o",
		width = 4,
	},
	["ô"] = {
		encoded = "\244",
		upper = "Ô",
		plain = "o",
		width = 4,
	},
	["õ"] = {
		encoded = "\245",
		upper = "Õ",
		plain = "o",
		width = 4,
	},
	["ö"] = {
		encoded = "\246",
		upper = "Ö",
		plain = "o",
		width = 4,
	},
	["ø"] = {
		encoded = "\248",
		upper = "Ø",
		plain = "o",
		width = 4,
	},
	["ù"] = {
		encoded = "\249",
		upper = "Ù",
		plain = "u",
		width = 4,
	},
	["ú"] = {
		encoded = "\250",
		upper = "Ú",
		plain = "u",
		width = 4,
	},
	["û"] = {
		encoded = "\251",
		upper = "Û",
		plain = "u",
		width = 4,
	},
	["ü"] = {
		encoded = "\252",
		upper = "Ü",
		plain = "u",
		width = 4,
	},
	["ý"] = {
		encoded = "\253",
		upper = "Ý",
		plain = "y",
		width = 3,
	},
	["þ"] = {
		encoded = "\254",
		upper = "Þ",
		plain ="p",
		width = 4,
	},
	["ÿ"] = {
		encoded = "\255",
		upper = "Ÿ",
		plain = "y",
		width = 3,
	},
}

if not Main.supportsSpecialChars then
	-- Create a redundant character entry for each escape/encoded character
	local encodedCharsToAdd = {}
	for _, characterInfo in pairs(Constants.Char) do
		if characterInfo.encoded and (characterInfo.lower or characterInfo.upper) then
			-- Copy over the character information, and update it accordingly
			local encodedChar = {}
			encodedChar.encoded = characterInfo.encoded
			if characterInfo.upper then
				encodedChar.upper = Constants.Char[characterInfo.upper].encoded
			end
			if characterInfo.lower then
				encodedChar.lower = Constants.Char[characterInfo.lower].encoded
			end
			encodedChar.plain = characterInfo.plain
			encodedChar.width = characterInfo.width
			table.insert(encodedCharsToAdd, encodedChar)
		end
	end
	for _, encodedChar in pairs(encodedCharsToAdd) do
		Constants.Char[encodedChar.encoded] = encodedChar
		encodedChar.encoded = nil
	end
	encodedCharsToAdd = nil
end

Constants.CharCategories = {
	ToLower = {},
	ToUpper = {},
	Special = {},
	Plain = {},
}

for c, characterInfo in pairs(Constants.Char) do
	if characterInfo.encoded then
		table.insert(Constants.CharCategories.Special, c)
	end
	if characterInfo.lower then
		table.insert(Constants.CharCategories.ToLower, c)
	end
	if characterInfo.upper then
		table.insert(Constants.CharCategories.ToUpper, c)
	end
	if characterInfo.plain then
		table.insert(Constants.CharCategories.Plain, c)
	end
end

function Constants.charToCategory(c, category)
	local characterInfo = Constants.Char[c or ""] or {}
	return characterInfo[category or ""] or c
end

function Constants.charWidth(c)
	local characterInfo = Constants.Char[c or ""] or {}
	return characterInfo.width or 1
end

-- Returns a renderable character for the appropriate emulator
function Constants.getC(character)
	if Main.supportsSpecialChars then
		return character
	end
	return Constants.charToCategory(character, "encoded")
end

-- Deprecated. No longer in use, but leaving in for old extensions
Constants.Words = {
	POKEMON = "Pok" .. Constants.getC("é") .. "mon",
	POKE = "Pok" .. Constants.getC("é"),
}