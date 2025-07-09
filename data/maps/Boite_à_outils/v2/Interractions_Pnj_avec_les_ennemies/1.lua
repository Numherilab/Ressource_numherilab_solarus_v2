-- Lua script of map npc_ennemie.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function robert:on_interaction()
    if game:get_value("map_2_slime_dead") then
        game:add_money(10)
    end
    if dragonosaure ~= nil and not dragonosaure:is_enabled() then
        dragonosaure:set_enabled(true)
    end
end
