--- STEAMODDED HEADER
--- MOD_NAME: NotJustYet
--- MOD_ID: NotJustYet
--- PREFIX: njy
--- MOD_AUTHOR: [toneblock]
--- MOD_DESCRIPTION: Prevents scoring from ending the round early
--- BADGE_COLOUR: ffffff
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1103a]
--- VERSION: 0.5.0
--- PRIORITY: 1

----------------------------------------------
------------MOD CODE -------------------------

-- The variable below defines the keybind used for ending the round. Feel free to change it to anything else, like 'w', or '9'

G.njy_keybind = 'lshift'

-- The variable below defines the colour used in most places, as long as it's defined in the global colour table. Good examples are 'GOLD', 'IMPORTANT', 'TAROT', and 'DARK_EDITION'

G.njy_colour = 'GREEN'





--[[

-- attempt at dynamic actions compat... it "works" but occasionally the button loses clickability so it's just permanently in different pos now

if SMODS.Mods["ACT"] then GLOBAL_njy_action = true end

local old_buttons = create_UIBox_buttons
local end_button = {n=G.UIT.C, config={id = 'njy_end_button',align = "tm", padding = 0.3, r = 0.1, minw = 1.3, minh = 1.3, hover = true, colour = G.C.GREEN, button = "njy_attempt_endround", one_press = true, shadow = true, func = 'njy_can_endround'}, nodes={
	{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
		{n=G.UIT.T, config={text = "End", scale = 0.45, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
	}}
}}
function create_UIBox_buttons()
	local t = old_buttons()
	if not GLOBAL_njy_action then
		table.insert(t.nodes, 1, end_button) 
	end
	return t
end

]]

GLOBAL_njy_action = true

G.FUNCS.njy_can_endround = function(e)	-- wtf is this talisman check? [[Fixed it! -Math]] ty for fix
	if not to_big then
		function to_big(x) return x end
	end
	if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) then
		e.config.colour = G.C[G.njy_colour]
		e.config.button = 'njy_attempt_endround'
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

G.FUNCS.njy_attempt_endround = function(e)
	if G.STATE ~= G.STATES.NEW_ROUND then
		stop_use()
		G.STATE = G.STATES.NEW_ROUND
		end_round()
	end
end

SMODS.Atlas({
    key = "modicon",
    path = "njy_icon.png",
    px = 34,
    py = 34
}):register()

----------------------------------------------
------------MOD CODE END----------------------
