-- Lua script of map npc_donne_money_items_04.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

local text_1 = sol.text_surface.create({
  text = "Un PNJ lance un dialogue"
})
local text_2 = sol.text_surface.create({
  text = "et te donne un item"
})

function map:on_draw(screen)
  text_1:draw(screen, 60, 180)
  text_2:draw(screen, 70, 195)
end

-- ---------------------------------------------------------------

function Gabriel:on_interaction()
    if game:get_value("received_heart_from_gabriel") then
        game:start_dialog("npc_donne_money_items.gabriel.reçus")
    else
        game:start_dialog("npc_donne_money_items.gabriel.coeur", function()
            hero:start_treasure("heart", 1, "received_heart_from_gabriel")
                game:start_dialog("npc_donne_money_items.gabriel.coeurdonné")          
        end)
    end
end

-- -----------------------------------------------------------------