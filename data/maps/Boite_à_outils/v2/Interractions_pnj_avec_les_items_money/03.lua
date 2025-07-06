-- Lua script of map npc_donne_money_items_03.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local text_1 = sol.text_surface.create({
  text = "Un PNJ te pose une question"
})
local text_2 = sol.text_surface.create({
  text = "et te donne un rubi (item)"
})

function map:on_draw(screen)
  text_1:draw(screen, 60, 180)
  text_2:draw(screen, 70, 195)
end



-- ---------------------------------------------------------------------

function Ronan:on_interaction()
    if game:get_value("received_gems_from_ronan") then
        game:start_dialog("npc_donne_money_items.ronan.misere")
    else
        game:start_dialog("npc_donne_money_items.ronan.question", function(answer)
            if answer == 1 then
                hero:start_treasure("gem", 2, "received_gems_from_ronan")
            elseif answer == 2 then
                game:start_dialog("npc_donne_money_items.ronan.soupe")
            end
        end)
    end
end

-- ------------------------------------------------------------------------

