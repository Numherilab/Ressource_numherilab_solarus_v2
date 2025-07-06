-- Lua script of map tile_dynamic_npc_enemy.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

 

function julien:on_interaction()
    if game:get_value("first_dialog_julien") then
        if game:get_value("julien_paid") then
            game:start_dialog("tile_dynamic.julien.aurevoir")
        else
            game:start_dialog("tile_dynamic.julien.question", function(answer)
                if answer == 1 then
                    if game:get_money() >= 20 then
                        game:remove_money(20)
                        game:set_value("julien_paid", true)
                        game:start_dialog("tile_dynamic.julien.remerciement", function()
                            map:set_entities_enabled("rocher_", false)
                            game:start_dialog("tile_dynamic.julien.aurevoir")
                        end)
                    else
                        game:start_dialog("tile_dynamic.julien.devoir")
                    end
                elseif answer == 2 then
                    if game:get_money() >= 20 then
                        game:start_dialog("tile_dynamic.julien.mechant")
                    else
                        game:start_dialog("tile_dynamic.julien.devoir")
                    end
                end
            end)
        end
    else
        game:start_dialog("tile_dynamic.julien.snif")
        game:set_value("first_dialog_julien", true)
    end
end
