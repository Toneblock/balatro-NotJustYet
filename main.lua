--- STEAMODDED HEADER
--- MOD_NAME: NotJustYet
--- MOD_ID: NotJustYet
--- PREFIX: njy
--- MOD_AUTHOR: [toneblock]
--- MOD_DESCRIPTION: Prevents scoring from ending the round early
--- BADGE_COLOUR: ffffff
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1103a]
--- VERSION: 0.5.0

----------------------------------------------
------------MOD CODE -------------------------

-- The variable below defines the keybind used for ending the round. Feel free to change it to anything else, like 'w', or '9'

G.njy_keybind = 'lshift'

-- The variable below defines the colour used in most places, as long as it's defined in the global colour table. Good examples are 'GOLD', 'IMPORTANT', 'TAROT', and 'DARK_EDITION'

G.njy_colour = 'GREEN'





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
