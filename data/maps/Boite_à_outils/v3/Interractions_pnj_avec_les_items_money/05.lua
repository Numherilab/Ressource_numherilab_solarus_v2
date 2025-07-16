-- Lua script of map npc_donne_money_items_05.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local text_1 = sol.text_surface.create({
  text = "Un PNJ reprend 45 pièces"
})

function map:on_draw(screen)
  text_1:draw(screen, 60, 180)
end


function marion:on_interaction()
    game:start_dialog("npc_donne_money_items.marion.remove_money")
    game:remove_money(45)
end