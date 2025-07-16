-- Lua script of map npc_donne_money_items_10.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function laura:on_interaction()
    local player_money = game:get_money()

    if game:get_value("received_sword_from_laura") == true then
        game:start_dialog("npc_donne_money_items.laura.plus_rien")
    else
       voulez vous acheter cette tunic?
non
oui

                            
                            game:start_dialog("npc_donne_money_items.laura.aventure")
                        end)
                    end)
                end 
            elseif answer == 2 then
                game:start_dialog("npc_donne_money_items.laura.non")
            end
        end)
    end
end
