-- Lua script of map mouvement_npc_2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()

local mouvement = sol.movement.create("random_path")
local mouvement_1 = sol.movement.create("random_path")
local mouvement_2 = sol.movement.create("random_path")

mouvement:start(remy)
mouvement_1:start(remi)
mouvement_2:start(pomme)
end