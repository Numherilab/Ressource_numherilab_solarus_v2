-- Lua script of map porte3.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function bertrand:on_interaction()
    if game:get_value("bertrand_paid") then
        game:start_dialog("porte.bertrand.porte_ouverte", function()
            local door1 = map:get_entity("porte_script_2")
            if door1 ~= nil then
                door1:set_enabled(false)
            end
        end)
    else
        game:start_dialog("porte.bertrand.porte_verouillee", function(answer)
            if answer == 1 then
                if game:get_money() >= 10 then
                    game:remove_money(10)
                    game:set_value("bertrand_paid", true)
                    game:start_dialog("porte.bertrand.porte_ouverte", function()
                        local door1 = map:get_entity("porte_script_2")
                        if door1 ~= nil then
                            door1:set_enabled(false)
                        end
                    end)
                else
                    game:start_dialog("porte.bertrand.pauvrete")
                end
            elseif answer == 2 then
                game:start_dialog("porte.bertrand.tombeau")
            end
        end)
    end
end
