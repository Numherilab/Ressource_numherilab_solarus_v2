-- Lua script of map npc_donne_money_items_06.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local text_1 = sol.text_surface.create({
  text = "Un PNJ reprend des pièces suivant ce que tu as\n dans ta bourse (code en dur)"
})

function map:on_draw(screen)
  text_1:draw(screen, 60, 180)
end


function florian:on_interaction()

    if game:get_money() < 5 then
        game:start_dialog("npc_donne_money_items.florian.not_enough_money")

    elseif game:get_money() >= 5 and game:get_money() <= 9 then
        game:remove_money(5)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_5")

    elseif game:get_money() >= 10 and game:get_money() <= 19 then
        game:remove_money(10)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_10")

    else
        game:remove_money(20)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_20")
    end


end
