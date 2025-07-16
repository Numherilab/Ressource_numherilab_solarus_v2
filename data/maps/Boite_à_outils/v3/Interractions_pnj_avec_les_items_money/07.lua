-- Lua script of map npc_donne_money_items_06.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function florian:on_interaction()
    local player_money = game:get_money()

    if player_money < 5 then
        game:start_dialog("npc_donne_money_items.florian.not_enough_money")

    elseif player_money >= 5 and player_money <= 9 then
        game:remove_money(5)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_5")

    elseif player_money >= 10 and player_money <= 19 then
        game:remove_money(10)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_10")

    else
        game:remove_money(20)
        game:start_dialog("npc_donne_money_items.florian.gems_taken_20")
    end

end
