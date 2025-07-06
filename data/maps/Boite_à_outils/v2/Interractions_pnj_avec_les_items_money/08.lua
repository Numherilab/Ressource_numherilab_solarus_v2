-- Lua script of map npc_donne_money_items_05.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function map:on_started()
    game:add_money(100)
end


function patrick:on_interaction()
local player_money = game:get_money()
    game:remove_money(player_money)
    game:start_dialog("npc_donne_money_items.patrick.merci_2")
end