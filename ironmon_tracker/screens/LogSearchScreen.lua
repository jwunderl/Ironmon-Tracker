LogSearchScreen = {
	Colors = {
		upperText = "Default text",
		upperBorder = "Upper box border",
		upperBoxFill = "Upper box background",
		lowerText = "Lower box text",
		lowerBorder = "Lower box border",
		lowerBoxFill = "Lower box background",
	},
	KeyboardCharacters = {
		{ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" },
		{ "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P" },
		{ "A", "S", "D", "F", "G", "H", "J", "K", "L" },
		{ "Z", "X", "C", "V", "B", "N", "M" },
	},
	padding = 2,
	searchText = "",
	currentSortOrder = nil, -- Set later in initialize()
	currentFilter = nil, -- Set later in initialize()
	sortDropDownOpen = false,
	filterDropDownOpen = false,
}

LogSearchScreen.SortBy = {
	Alphabetical = {
		getText = function() return Resources.LogSearchScreen.SortAlphabetical end,
		sortFunc = function(a, b)
			local name1, name2 = a:getText(), b:getText()
			return name1 < name2 or (name1 == name2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, [LogOverlay.Tabs.TRAINER] = true, },
		orderedIndex = 1,
	},
	PokedexNum = {
		getText = function() return Resources.LogSearchScreen.SortPokedexNum end,
		sortFunc = function(a, b)
			return a.id < b.id
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 2,
	},
	BST = {
		getText = function() return Resources.LogSearchScreen.SortBST end,
		sortFunc = function(a, b)
			return PokemonData.Pokemon[a.id].bst > PokemonData.Pokemon[b.id].bst or
				(PokemonData.Pokemon[a.id].bst == PokemonData.Pokemon[b.id].bst and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 3,
	},
	HP = {
		getText = function() return Resources.LogSearchScreen.SortHP end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["hp"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["hp"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 4,
	},
	ATK = {
		getText = function() return Resources.LogSearchScreen.SortATK end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["atk"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["atk"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 5,
	},
	DEF = {
		getText = function() return Resources.LogSearchScreen.SortDEF end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["def"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["def"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 6,
	},
	SPA = {
		getText = function() return Resources.LogSearchScreen.SortSPA end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["spa"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["spa"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 7,
	},
	SPD = {
		getText = function() return Resources.LogSearchScreen.SortSPD end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["spd"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["spd"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 8,

	},
	SPE = {
		getText = function() return Resources.LogSearchScreen.SortSPE end,
		sortFunc = function(a, b)
			local p1, p2 = RandomizerLog.Data.Pokemon[a.id].BaseStats["spe"],
				RandomizerLog.Data.Pokemon[b.id].BaseStats["spe"]
			return p1 > p2 or (p1 == p2 and a.id < b.id)
		end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 9,
	},
}

LogSearchScreen.FilterBy = {
	PokemonName = {
		getText = function() return Resources.LogSearchScreen.FilterName end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 1,
	},
	PokemonAbility = {
		getText = function() return Resources.LogSearchScreen.FilterAbility end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 2,
	},
	PokemonMove = {
		getText = function() return Resources.LogSearchScreen.FilterMove end,
		contexts = { [LogOverlay.Tabs.POKEMON] = true, },
		orderedIndex = 3,
	},
	TrainerName = {
		getText = function() return Resources.LogSearchScreen.FilterTrainerName end,
		contexts = { [LogOverlay.Tabs.TRAINER] = true, },
		orderedIndex = 10,
	},
	TrainerCustomName = {
		getText = function() return Resources.LogSearchScreen.FilterTrainerCustomName end,
		contexts = { [LogOverlay.Tabs.TRAINER] = true, },
		orderedIndex = 11,
	},
}

LogSearchScreen.Buttons = {}
LogSearchScreen.DropdownButtonsSortBy = {}
LogSearchScreen.DropdownButtonsFilterBy = {}

--- Initializes the LogSearchScreen
--- @return nil
function LogSearchScreen.initialize()
	LogSearchScreen.currentSortOrder = LogSearchScreen.SortBy.Alphabetical
	LogSearchScreen.currentFilter = LogSearchScreen.FilterBy.PokemonName
	LogSearchScreen.clearSearch()
	LogSearchScreen.createButtons()
end

function LogSearchScreen.createButtons()
	local LSS = LogSearchScreen
	local topBox = {
		x = Constants.SCREEN.WIDTH + Constants.SCREEN.MARGIN,
		y = Constants.SCREEN.MARGIN + 10,
		width = Constants.SCREEN.RIGHT_GAP - (Constants.SCREEN.MARGIN * 2),
		height = Constants.SCREEN.HEIGHT - (Constants.SCREEN.MARGIN * 2) - 10,
	}

	-- =====KEYBOARD BUTTONS=====
	LSS.createKeyboardButtons()

	-- =====CLEAR SEARCH BUTTON=====
	local imageSize = #Constants.PixelImages.CLOSE
	-- To the right of the backspace button
	LSS.Buttons.ClearSearch = {
		type = Constants.ButtonTypes.FULL_BORDER,
		image = Constants.PixelImages.CLOSE,
		padding = 2,
		clicked = 0,
		box = {
			topBox.x + topBox.width - imageSize - LSS.padding * 3,
			LSS.KeyboardBox.y - imageSize - LSS.padding * 3,
			imageSize + LSS.padding + 1,
			imageSize + LSS.padding + 1,
		},
		boxColors = { LSS.Colors.upperBorder, LSS.Colors.upperBoxFill, },
		textColor = LSS.Colors.upperText,
		onClick = function(self)
			if #LSS.searchText > 0 and not LSS.filterDropDownOpen then
				self.clicked = 2
				LSS.clearSearch()
				LSS.updateSearchResults()
				Program.redraw(true)
			end
		end,
		draw = function(self)
			Drawing.drawImageAsPixels(self.image, self.box[1] + self.padding, self.box[2] + self.padding,
				Theme.COLORS[self.textColor], LSS.Colors.upperShadowcolor)
			self.clicked = LSS.reactOnClick(self.clicked, self.box,
				{ LSS.Colors.upperShadowcolor, LSS.Colors.upperShadowcolor, })
		end

	}

	-- =====BACKSPACE BUTTON=====
	LSS.Buttons.Backspace = {
		type = Constants.ButtonTypes.FULL_BORDER,
		image = Constants.PixelImages.LEFT_ARROW,
		padding = 2,
		clicked = 0,
		-- To the left of the clear search button
		box = {
			LSS.Buttons.ClearSearch.box[1] - LSS.Buttons.ClearSearch.box[3] - LSS.padding - 1,
			LSS.Buttons.ClearSearch.box[2],
			LSS.Buttons.ClearSearch.box[3],
			LSS.Buttons.ClearSearch.box[4],
		},
		boxColors = { LSS.Colors.upperBorder, LSS.Colors.upperBoxFill, },
		textColor = LSS.Colors.upperText,
		onClick = function(self)
			if #LSS.searchText > 0 and not LSS.filterDropDownOpen then
				self.clicked = 2
				LSS.searchText = LSS.searchText:sub(1, #LSS.searchText - 1)
				LSS.updateSearchResults()
				Program.redraw(true)
			end
		end,
		draw = function(self)
			Drawing.drawImageAsPixels(self.image, self.box[1] + self.padding, self.box[2] + self.padding - 1,
				Theme.COLORS[self.textColor], LSS.Colors.upperShadowcolor)
			self.clicked = LSS.reactOnClick(self.clicked, self.box,
				{ LSS.Colors.upperShadowcolor, LSS.Colors.upperShadowcolor, })
		end
	}

	-- =====SEARCH TEXT DISPLAY BUTTON=====
	LSS.Buttons.SearchTextField = {
		maxLetters = 10,
		letterSize = 7,
		type = Constants.ButtonTypes.FULL_BORDER,
		searchText = {},
		box = {
			topBox.x + LSS.padding + 1,
			LSS.Buttons.Backspace.box[2],
			LSS.Buttons.Backspace.box[1] - LSS.padding * 3 - topBox.x,
			LSS.Buttons.Backspace.box[4],
		},
		boxColors = { LSS.Colors.upperBorder, LSS.Colors.upperBoxFill, },
		textColor = LSS.Colors.upperText,
		-- TODO: @Aeiry Make blinking work properly, adjusting for speed-ups
		--blink = 0,
		draw = function(self)
			self.shadowcolor = LSS.Colors.upperShadowcolor
			-- Split searchText into an array of characters
			for i = 1, #LSS.searchText do
				self.searchText[i] = LSS.searchText:sub(i, i)
			end
			-- Clear the rest of the array
			for i = #LSS.searchText + 1, self.maxLetters do
				self.searchText[i] = nil
			end
			-- Custom draw function to draw the text
			-- Draw horizontal lines equal to maxLetters to indicate the max length of the text
			for i = 1, self.maxLetters do
				local x = self.box[1] + (i - 1) * (self.letterSize + 3) + 2
				x = x + (self.box[3] / 2) - (self.maxLetters * (self.letterSize + 3)) / 2
				local y = self.box[2] + self.box[4] - 2
				if i <= #self.searchText then
					-- Center the character
					local textOffsetX = Utils.centerTextOffset(self.searchText[i],
						Constants.charWidth(self.searchText[i]), 10) - 3
					y = y - self.letterSize - 3
					Drawing.drawText(x + textOffsetX, y, self.searchText[i], Theme.COLORS[self.textColor],
						LSS.Colors.upperTextShadow)
				else
					--[[local lineColor = 0
					-- If the current line is the first empty line, blink it
					if i == #self.searchText + 1 and self.blink > 0 then
						lineColor = Theme.COLORS["Intermediate text"]
					else
						lineColor = Theme.COLORS[LSS.Colors.upperText]
					end]]
					gui.drawLine(x, y, x + self.letterSize, y, Theme.COLORS[self.textColor])
				end
			end
			--[[self.blink = self.blink - 1
			if self.blink < -2 then
				self.blink = 3
			end ]]
		end,
	}

	LogSearchScreen.refreshDropDowns()
end

function LogSearchScreen.refreshDropDowns()
	LogSearchScreen.createUpdateFilterDropdown()
	LogSearchScreen.createUpdateSortOrderDropdown()
end

function LogSearchScreen.createUpdateSortOrderDropdown()
	local LSS = LogSearchScreen

	local topBox = {
		x = Constants.SCREEN.WIDTH + Constants.SCREEN.MARGIN,
		y = Constants.SCREEN.MARGIN + 10,
		width = Constants.SCREEN.RIGHT_GAP - (Constants.SCREEN.MARGIN * 2),
		height = Constants.SCREEN.HEIGHT - (Constants.SCREEN.MARGIN * 2) - 10,
	}

	local dropdownBox = {
		x = topBox.x + 35,
		y = topBox.y + LSS.padding + 1,
		width = 90,
		height = 13,
	}

	-- Create the dropdown buttons, first is the label/top level button. This will be the only one visible when the dropdown is closed
	LSS.Buttons.SortBySelected = {
		image = Constants.PixelImages.TRIANGLE_DOWN,
		type = Constants.ButtonTypes.FULL_BORDER,
		box = { dropdownBox.x, dropdownBox.y, dropdownBox.width, dropdownBox.height, },
		boxColors = { LSS.Colors.lowerBorder, LSS.Colors.lowerBoxFill, },
		textColor = LSS.Colors.lowerText,
		onClick = function(self)
			-- Don't expand this dropdown menu if another one is open
			if not LSS.filterDropDownOpen then
				LSS.sortDropDownOpen = not LSS.sortDropDownOpen
				Program.redraw(true)
			end
		end,
		draw = function(self)
			local x, y, w, h = self.box[1], self.box[2], self.box[3], self.box[4]
			local size = #self.image + LSS.padding

			-- Draw Image
			Drawing.drawImageAsPixels(self.image, x + w - size + 1, y + 1, Theme.COLORS[self.textColor], LSS.Colors.lowerShadowcolor)
			-- Vertical line
			gui.drawLine(x + w - size - 1, y + 1, x + w - size - 1, y + h - 1, Theme.COLORS[self.boxColors[1]])
			-- Text w/ shadow
			if LSS.currentSortOrder ~= nil then
				local text = LSS.currentSortOrder:getText()
				Drawing.drawText(self.box[1] + 1, self.box[2] + 1, text, Theme.COLORS[self.textColor], LSS.Colors.lowerTextShadow)
			end
		end
	}

	-- Rest of the buttons are hidden until the dropdown is opened
	local orderedSortBys = {}
	for _, sortby in pairs(LSS.SortBy) do
		if sortby.contexts[LogOverlay.currentTab] then
			table.insert(orderedSortBys, sortby)
		end
	end
	table.sort(orderedSortBys, function(a, b) return a.orderedIndex < b.orderedIndex end)

	LSS.DropdownButtonsSortBy = {}
	for _, sortby in ipairs(orderedSortBys) do
		local sortbyButton = {
			type = Constants.ButtonTypes.FULL_BORDER,
			textColor = LSS.Colors.lowerText,
			dimensions = { width = dropdownBox.width, height = dropdownBox.height, },
			boxColors = { LSS.Colors.lowerBorder, LSS.Colors.lowerBoxFill, },
			isVisible = function(self) return LSS.sortDropDownOpen and self.pageVisible ~= -1 end,
			includeInGrid = function(self) return sortby.contexts[LogOverlay.currentTab] end,
			onClick = function(self)
				LSS.sortDropDownOpen = not LSS.sortDropDownOpen
				LSS.currentSortOrder = sortby
				LSS.createUpdateSortOrderDropdown()
				LSS.updateSearchResults()
				Program.redraw(true)
			end,
			draw = function(self)
				-- Individual draw function to draw text shadows but not a shadow for the whole box
				Drawing.drawText(self.box[1] + 1, self.box[2] + 1, sortby:getText(), Theme.COLORS[self.textColor],
					LSS.Colors.lowerTextShadow)
				if LSS.currentSortOrder == sortby then
					Drawing.drawImageAsPixels(Constants.PixelImages.LEFT_ARROW, self.box[1] + self.box[3] - 11, self.box[2] + 2,
					Theme.COLORS["Intermediate text"], LSS.Colors.lowerTextShadow)
				end
			end
		}
		table.insert(LSS.DropdownButtonsSortBy, sortbyButton)
	end

	Utils.gridAlign(LSS.DropdownButtonsSortBy, dropdownBox.x, dropdownBox.y + dropdownBox.height, 0, 0, true)

	-- If the current sortby doesn't exist within the current context, replace it
	if not LSS.currentSortOrder.contexts[LogOverlay.currentTab] then
		LSS.currentSortOrder = orderedSortBys[1] or LSS.currentSortOrder
	end
end

--- Updates the filter dropdown buttons
function LogSearchScreen.createUpdateFilterDropdown()
	local LSS = LogSearchScreen

	local topBox = {
		x = Constants.SCREEN.WIDTH + Constants.SCREEN.MARGIN,
		y = Constants.SCREEN.MARGIN + 10,
		width = Constants.SCREEN.RIGHT_GAP - (Constants.SCREEN.MARGIN * 2),
		height = Constants.SCREEN.HEIGHT - (Constants.SCREEN.MARGIN * 2) - 10,
	}

	local dropdownBox = {
		x = topBox.x + 35,
		y = LSS.Buttons.SearchTextField.box[2] - Constants.SCREEN.LINESPACING - LSS.padding * 2 - 1,
		width = 90,
		height = 13,
	}

	-- Create the dropdown buttons, first is the label/top level button.
	LSS.Buttons.FilterBySelected = {
		image = Constants.PixelImages.TRIANGLE_DOWN,
		type = Constants.ButtonTypes.FULL_BORDER,
		textColor = LSS.Colors.lowerText,
		box = { dropdownBox.x, dropdownBox.y, dropdownBox.width, dropdownBox.height, },
		boxColors = { LSS.Colors.lowerBorder, LSS.Colors.lowerBoxFill, },
		onClick = function(self)
			-- Don't expand this dropdown menu if another one is open
			if not LSS.sortDropDownOpen then
				LSS.filterDropDownOpen = not LSS.filterDropDownOpen
				Program.redraw(true)
			end
		end,
		draw = function(self)
			local x, y, w, h = self.box[1], self.box[2], self.box[3], self.box[4]
			local size = #self.image + LSS.padding

			-- Draw Image
			Drawing.drawImageAsPixels(self.image, x + w - size + 1, y + 1, Theme.COLORS[self.textColor], LSS.Colors.lowerShadowcolor)
			-- Vertical line
			gui.drawLine(x + w - size - 1, y + 1, x + w - size - 1, y + h - 1, Theme.COLORS[self.boxColors[1]])
			-- Text w/ shadow
			if LSS.currentFilter ~= nil then
				local text = LSS.currentFilter:getText()
				Drawing.drawText(self.box[1] + 1, self.box[2] + 1, text, Theme.COLORS[self.textColor], LSS.Colors.lowerTextShadow)
			end
		end
	}

	-- Rest of the buttons are hidden until the dropdown is opened
	local orderedFilters = {}
	for _, filter in pairs(LSS.FilterBy) do
		if filter.contexts[LogOverlay.currentTab] then
			table.insert(orderedFilters, filter)
		end
	end
	table.sort(orderedFilters, function(a, b) return a.orderedIndex < b.orderedIndex end)

	LSS.DropdownButtonsFilterBy = {}
	for _, filter in ipairs(orderedFilters) do
		local filterButton = {
			type = Constants.ButtonTypes.FULL_BORDER,
			textColor = LSS.Colors.lowerText,
			dimensions = { width = dropdownBox.width, height = dropdownBox.height, },
			boxColors = { LSS.Colors.lowerBorder, LSS.Colors.lowerBoxFill, },
			isVisible = function(self) return LSS.filterDropDownOpen and self.pageVisible ~= -1 end,
			includeInGrid = function(self) return filter.contexts[LogOverlay.currentTab] end,
			onClick = function(self)
				LSS.currentFilter = filter
				LSS.filterDropDownOpen = not LSS.filterDropDownOpen
				LSS.createUpdateFilterDropdown()
				LSS.updateSearchResults()
				Program.redraw(true)
			end,
			draw = function(self)
				-- Individual draw function to draw text shadows but not a shadow for the whole box
				Drawing.drawText(self.box[1] + 1, self.box[2] + 1, filter:getText(), Theme.COLORS[self.textColor],
					LSS.Colors.lowerTextShadow)
				if LSS.currentFilter == filter then
					Drawing.drawImageAsPixels(Constants.PixelImages.LEFT_ARROW, self.box[1] + self.box[3] - 11, self.box[2] + 2,
					Theme.COLORS["Intermediate text"], LSS.Colors.lowerTextShadow)
				end
			end
		}
		table.insert(LSS.DropdownButtonsFilterBy, filterButton)
	end
	Utils.gridAlign(LSS.DropdownButtonsFilterBy, dropdownBox.x, dropdownBox.y + dropdownBox.height, 0, 0, true)

	-- If the current filter doesn't exist within the current context, replace it
	if not LSS.currentFilter.contexts[LogOverlay.currentTab] then
		LSS.currentFilter = orderedFilters[1] or LSS.currentFilter
	end
end

function LogSearchScreen.clearSearch()
	LogSearchScreen.searchText = ""
end

function LogSearchScreen.updateSearchResults()
	local filter, sort
	if LogSearchScreen.searchText ~= "" then
		filter = LogSearchScreen.searchText
		sort = LogSearchScreen.currentSortOrder.sortFunc
	end
	-- local filter = LogSearchScreen.searchText
	-- local sort = LogSearchScreen.currentSortOrder.sortFunc

	if LogOverlay.currentTab == LogOverlay.Tabs.POKEMON then
		LogOverlay.realignPokemonGrid(filter, sort)
	elseif LogOverlay.currentTab == LogOverlay.Tabs.TRAINER then
		LogOverlay.realignTrainerGrid(filter, sort)
	elseif LogOverlay.currentTab == LogOverlay.Tabs.TMS then
		-- LogOverlay.realignTMGrid(filter, sort)
	end
	LogOverlay.refreshInnerButtons()
end

function LogSearchScreen.tryDisplayOrHide()
	local allowedTabViews = {
		[LogOverlay.Tabs.POKEMON] = true,
		[LogOverlay.Tabs.TRAINER] = true,
		[LogOverlay.Tabs.TMS] = true,
	}

	-- Check if it's contextually correct to show the search screen; otherwise, hide the search screen
	if allowedTabViews[LogOverlay.currentTab] then
		LogSearchScreen.refreshDropDowns()
		LogSearchScreen.updateSearchResults()
		if Program.currentScreen ~= LogSearchScreen then
			Program.changeScreenView(LogSearchScreen)
		end
	elseif Program.currentScreen == LogSearchScreen then
		-- For any other tab, show Bulbasaur by default (prevents search box from appearing)
		InfoScreen.changeScreenView(InfoScreen.Screens.POKEMON_INFO, 1)
	end
end

--- Builds a set of keyboard buttons in qwerty layout, the buttons are stored in LogSearchScreen.KeyboardButtons
function LogSearchScreen.createKeyboardButtons()
	local LSS = LogSearchScreen

	local height = 60
	local botBox = {
		x = Constants.SCREEN.WIDTH + Constants.SCREEN.MARGIN,
		y = Constants.SCREEN.HEIGHT - Constants.SCREEN.MARGIN - height,
		width = Constants.SCREEN.RIGHT_GAP - (Constants.SCREEN.MARGIN * 2),
		height = height,
		paddingX = 2, -- The padding between keys on the x axis
		paddingY = 2, -- The padding between keys on the y axis
		paddingBoard = 4, -- The padding between the keyboard keys and box drawn around it
	}

	-- Calculate key and keyboard dimensions
	local width = botBox.width
	local autosizeHeight = false

	local keysByRow = LSS.KeyboardCharacters

	-- Calculate key size to fit within the keyboard with padding between keys and the keyboard border
	local keyWidth = math.floor((width - (botBox.paddingX * (#keysByRow[1] - 1) + botBox.paddingBoard * 2)) / #keysByRow[1])
	-- Calculate keyboard height to fit all keys with uniform height
	if autosizeHeight then
		height = botBox.paddingY * (#keysByRow - 1) + botBox.paddingBoard * 2 + keyWidth * #keysByRow
	end
	-- Calculate key height to fit within the keyboard with padding between keys and the keyboard border
	local keyHeight = math.floor((height - (botBox.paddingY * (#keysByRow - 1) + botBox.paddingBoard * 2)) / #keysByRow)

	-- Update the keyboard box in global scope to the actual size of the keyboard
	LSS.KeyboardBox = {}
	LSS.KeyboardBox.x = botBox.x
	LSS.KeyboardBox.y = botBox.y
	LSS.KeyboardBox.width = width
	LSS.KeyboardBox.height = height

	-- Define keyboard layout
	LSS.KeyboardButtons = {}
	local keyRowX = LSS.KeyboardBox.x + math.floor((width - (keyWidth * #keysByRow[1] + botBox.paddingX * (#keysByRow[1] - 1))) / 2)
	local keyRowY = LSS.KeyboardBox.y + math.floor((height - (keyHeight * #keysByRow + botBox.paddingY * (#keysByRow - 1))) / 2)

	-- ==================== Build keyboard buttons ====================
	for index, keyRow in ipairs(keysByRow) do
		local keyX = keyRowX
		-- After the first and second rows, offset with a pyramid effect
		if index > 2 then
			keyX = keyX + math.floor((index - 2) * (0.5 * keyWidth) + 0.5)
		end
		for _, key in ipairs(keyRow) do
			-- ===== KEYS =====
			-- Center the character in the box
			local textOffsetX = Utils.centerTextOffset(key, Constants.charWidth(key), 10) - 2
			local button = {
				type = Constants.ButtonTypes.FULL_BORDER,
				keyText = key,
				textToAdd = key,
				textOffsetX = textOffsetX,
				-- 1 pixel smaller to account for the border
				clickableArea = { keyX + 1, keyRowY + 1, keyWidth - 2, keyHeight - 2, },
				box = { keyX, keyRowY, keyWidth, keyHeight },
				boxColors = { LSS.Colors.lowerBorder, LSS.Colors.lowerBoxFill, },
				keyTextColor = LSS.Colors.lowerText,
				clicked = 0,
				onClick = function(self)
					-- Don't accept keyboard button input while another dropdown is open
					if LSS.filterDropDownOpen or LSS.sortDropDownOpen then
						return
					end
					self.clicked = 2
					-- Append the text of the button to the search text if the search text is not full
					if LSS.searchText and #LSS.searchText < LSS.Buttons.SearchTextField.maxLetters then
						LSS.searchText = LSS.searchText .. self.textToAdd
					end
					LSS.updateSearchResults()
					Program.redraw(true)
				end,
				draw = function(self)
					Drawing.drawText(self.box[1] + self.textOffsetX + 1, self.box[2], self.keyText,
						Theme.COLORS[self.keyTextColor], LSS.Colors.lowerShadowcolor)
					self.clicked = LSS.reactOnClick(self.clicked, self.box,
						{ LSS.Colors.lowerShadowcolor, LSS.Colors.upperShadowcolor })
				end,
			}
			LSS.KeyboardButtons[key] = button
			keyX = keyX + keyWidth + botBox.paddingX
		end
		keyRowY = keyRowY + keyHeight + botBox.paddingY
	end

	-- Reuse the 'M' key to help clone the spacebar button
	local lastKeyBtn = LSS.KeyboardButtons["M"]
	local spaceKeyBox = {}
	for i, v in ipairs(lastKeyBtn.box) do
		spaceKeyBox[i] = v
	end
	-- modify the copy
	spaceKeyBox[3] = (spaceKeyBox[3] * 2) + botBox.paddingX
	spaceKeyBox[1] = spaceKeyBox[1] + keyWidth + botBox.paddingX

	local spaceKeyTextOffset = Utils.getCenteredTextX("_", spaceKeyBox[3]) - 2

	LSS.KeyboardButtons["_"] = {
		type = lastKeyBtn.type,
		keyText = "_",
		textToAdd = " ",
		textOffsetX = spaceKeyTextOffset,
		-- 1 pixel smaller to account for the border
		clickableArea = { spaceKeyBox[1] + 1, spaceKeyBox[2] + 1, spaceKeyBox[3] - 2, spaceKeyBox[4] - 2, },
		box = spaceKeyBox,
		boxColors = lastKeyBtn.boxColors,
		keyTextColor = lastKeyBtn.keyTextColor,
		clicked = 0,
		onClick = lastKeyBtn.onClick,
		draw = lastKeyBtn.draw,
	}
end

function LogSearchScreen.checkInput(xmouse, ymouse)
	Input.checkButtonsClicked(xmouse, ymouse, LogSearchScreen.KeyboardButtons)
	Input.checkButtonsClicked(xmouse, ymouse, LogSearchScreen.Buttons)
	Input.checkButtonsClicked(xmouse, ymouse, LogSearchScreen.DropdownButtonsFilterBy)
	Input.checkButtonsClicked(xmouse, ymouse, LogSearchScreen.DropdownButtonsSortBy)
end

--- Draws the LogSearchScreen, automatically called by the main draw loop if this screen is active
--- @return nil
function LogSearchScreen.drawScreen()
	local LSS = LogSearchScreen

	-- Define colors which are used for several individual drawing functions
	LSS.Colors.upperShadowcolor = Utils.calcShadowColor(Theme.COLORS[LSS.Colors.upperBoxFill])
	LSS.Colors.lowerShadowcolor = Utils.calcShadowColor(Theme.COLORS[LSS.Colors.lowerBoxFill])
	if Theme.DRAW_TEXT_SHADOWS then
		LSS.Colors.lowerTextShadow = LSS.Colors.lowerShadowcolor
		LSS.Colors.upperTextShadow = LSS.Colors.upperShadowcolor
	else
		LSS.Colors.lowerTextShadow = nil
		LSS.Colors.upperTextShadow = nil
	end

	local topBox = {
		x = Constants.SCREEN.WIDTH + Constants.SCREEN.MARGIN,
		y = Constants.SCREEN.MARGIN + 10,
		width = Constants.SCREEN.RIGHT_GAP - (Constants.SCREEN.MARGIN * 2),
		height = Constants.SCREEN.HEIGHT - (Constants.SCREEN.MARGIN * 2) - 10,
		text = Theme.COLORS[LSS.Colors.upperText],
		border = Theme.COLORS[LSS.Colors.upperBorder],
		fill = Theme.COLORS[LSS.Colors.upperBoxFill],
		shadow = LSS.Colors.upperShadowcolor,
	}
	local botBox = {
		x = LSS.KeyboardBox.x,
		y = LSS.KeyboardBox.y,
		width = LSS.KeyboardBox.width,
		height = LSS.KeyboardBox.height,
		-- For now, the bottom box uses the top box colors, so the buttons pop within the entire screen
		text = topBox.text or Theme.COLORS[LSS.Colors.lowerTextText],
		border = topBox.border or Theme.COLORS[LSS.Colors.lowerBorder],
		fill = topBox.fill or Theme.COLORS[LSS.Colors.lowerBoxFill],
		shadow = topBox.shadow or LSS.Colors.lowerShadowcolor,
	}

	-- Draw the screen background
	Drawing.drawBackgroundAndMargins() -- Draw the search box
	gui.defaultTextBackground(Theme.COLORS[LSS.Colors.lowerBoxFill])

	-- Draw top border box
	gui.drawRectangle(topBox.x, topBox.y, topBox.width, topBox.height, topBox.border, topBox.fill)

	-- Draw header
	local headerText = Utils.toUpperUTF8(Resources.LogSearchScreen.Title)
	local headerShadow = Utils.calcShadowColor(Theme.COLORS["Main background"])
	Drawing.drawText(topBox.x, Constants.SCREEN.MARGIN - 2, headerText, Theme.COLORS["Header text"], headerShadow)

	-- Draw sort and filter labels
	local sortByText = Resources.LogSearchScreen.LabelSortBy .. ":"
	Drawing.drawText(topBox.x + 3, LSS.Buttons.SortBySelected.box[2] + 1, sortByText, topBox.text, topBox.shadow)
	local filterByText = Resources.LogSearchScreen.LabelFilter .. ":"
	Drawing.drawText(topBox.x + 3, LSS.Buttons.FilterBySelected.box[2] + 1, filterByText, topBox.text, topBox.shadow)

	-- Draw bottom border box for keyboard
	gui.drawRectangle(botBox.x, botBox.y, botBox.width, botBox.height, botBox.border, botBox.fill)

	-- Draw top box buttons. These include text labels, backspace, and top level dropdown buttons
	for _, button in pairs(LSS.Buttons) do
		-- Each of these buttons appear in the areas that use lower box background
		Drawing.drawButton(button, topBox.shadow)
	end
	-- Draw keyboard
	for _, button in pairs(LSS.KeyboardButtons) do
		Drawing.drawButton(button)
	end
	-- Draw dropdowns last so they are on top of everything else
	for _, button in pairs(LSS.DropdownButtonsSortBy) do
		Drawing.drawButton(button)
	end
	for _, button in pairs(LSS.DropdownButtonsFilterBy) do
		Drawing.drawButton(button)
	end
end

--- Draws a shadow on the edges of the given rectangle, either inside or outside
--- @param box table<integer,integer,integer,integer> Table containing the x, y, width, and height of the rectangle
--- @param shadowcolor integer Color of the shadow, current theme colors can be accessed via Theme.COLORS
--- @param edges table<string> Table containing the edges to draw the shadow on, can contain any of the following values: "top", "bottom", "left", "right"
--- @param inside boolean Whether to draw the shadow inside the rectangle or outside, defaults to false
--- @return nil
function LogSearchScreen.drawShadow(box, shadowcolor, edges, inside)
	inside = inside or false

	-- Determine the coordinates of lines to draw
	local cornerX, cornerY, lengthX, lengthY = box[1], box[2], box[3], box[4]

	if inside then
		cornerX = cornerX + 1
		cornerY = cornerY + 1
		lengthX = lengthX - 2
		lengthY = lengthY - 2
	end

	-- Find the edges to draw the shadow on
	local top, bottom, left, right = false, false, false, false
	for _, edge in ipairs(edges) do
		if edge == "top" then
			top = true
		elseif edge == "bottom" then
			bottom = true
		elseif edge == "left" then
			left = true
		elseif edge == "right" then
			right = true
		end
	end

	-- Draw the shadow
	if top then
		gui.drawLine(cornerX, cornerY, cornerX + lengthX, cornerY, shadowcolor)
	end

	if left then
		gui.drawLine(cornerX, cornerY, cornerX, cornerY + lengthY, shadowcolor)
	end

	if bottom then
		gui.drawLine(cornerX + 1, cornerY + 1 + lengthY, cornerX + 1 + lengthX, cornerY + 1 + lengthY, shadowcolor)
	end

	if right then
		gui.drawLine(cornerX + 1 + lengthX, cornerY + 1, cornerX + 1 + lengthX, cornerY + 1 + lengthY, shadowcolor)
	end
end

--- Helper function for .draw functions on buttons so they can react when clicked
--- @param clickedTimer integer Timer that is used to determine if the button was clicked recently
--- @param box table<integer,integer,integer,integer> Table containing the x, y, width, and height of the button
--- @param shadowcolors table<integer,integer> Table containing the colors of the shadows of the button, current theme colors can be accessed via Theme.COLORS
--- @return nil
function LogSearchScreen.reactOnClick(clickedTimer, box, shadowcolors)
	if clickedTimer ~= nil and clickedTimer > 0 then
		LogSearchScreen.drawShadow(box, shadowcolors[1], { "top", "left" }, true)
		clickedTimer = clickedTimer - 1
	else
		LogSearchScreen.drawShadow(box, shadowcolors[2], { "bottom", "right" }, false)
	end
	return clickedTimer
end
