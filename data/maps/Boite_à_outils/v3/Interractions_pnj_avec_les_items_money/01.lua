-- Lua script of map money_items.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest


-- -----------------------------------------------------------------

local map = ...
local game = map:get_game()
local text_1 = sol.text_surface.create({
  text = "Un PNJ te donne 10 pièces"
})

function map:on_draw(screen)
  text_1:draw(screen, 60, 180)
end



function Leo:on_interaction()
    if game:get_value("received_money_from_Leo_1") then 
        game:start_dialog("npc_donne_money_items.leo.plusrien")
    else
        game:start_dialog("npc_donne_money_items.leo.10gem", function()
                game:add_money(10)
                game:set_value("received_money_from_Leo_1", true)   
        end)
    end
end

-- -------------------------------------------------------------------

