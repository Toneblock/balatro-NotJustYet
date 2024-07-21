--- STEAMODDED HEADER
--- MOD_NAME: NotJustYet
--- MOD_ID: NotJustYet
--- PREFIX: njy
--- MOD_AUTHOR: [toneblock]
--- MOD_DESCRIPTION: Prevents scoring from ending the round early
--- PRIORITY: 0
--- DISPLAY_NAME: NotJustYet
--- BADGE_COLOUR: ffffff
--- VERSION: 0.4.2

----------------------------------------------
------------MOD CODE -------------------------

-- The variable below defines the keybind used for ending the round. Feel free to change it to anything else, like 'w', or '9'

G.njy_keybind = 'lshift'








G.FUNCS.njy_can_endround = function(e)	-- wtf is this talisman check? [[Fixed it! -Math]]
	if not to_big then
		function to_big(x) return x end
	end
	if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) then
		e.config.colour = G.C.GREEN
		e.config.button = 'njy_endround'
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

G.FUNCS.njy_endround = function(e)
	stop_use()
	G.STATE = G.STATES.NEW_ROUND
	end_round()
end

SMODS.Atlas({
    key = "modicon",
    path = "njy_icon.png",
    px = 34,
    py = 34
}):register()


----------------------------------------------
------------MOD CODE END----------------------
