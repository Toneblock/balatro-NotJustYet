--- STEAMODDED HEADER
--- MOD_NAME: NotJustYet
--- MOD_ID: NotJustYet
--- PREFIX: njy
--- MOD_AUTHOR: [toneblock]
--- MOD_DESCRIPTION: Prevents scoring from ending the round early
--- PRIORITY: 0
--- DISPLAY_NAME: NotJustYet
--- BADGE_COLOUR: ffffff

----------------------------------------------
------------MOD CODE -------------------------

G.FUNCS.njy_can_endround = function(e)	-- wtf is this talisman check?
	if SMODS.Mods['Talisman'] and (Talisman.config_file.break_infinity == true) then
		if Big:new(G.GAME.chips) >= Big:new(G.GAME.blind.chips) then
			e.config.colour = G.C.GREEN
			e.config.button = 'njy_endround'
		else
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			e.config.button = nil
		end
	else
		if G.GAME.chips - G.GAME.blind.chips >= 0 then
			e.config.colour = G.C.GREEN
			e.config.button = 'njy_endround'
		else
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			e.config.button = nil
		end
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
