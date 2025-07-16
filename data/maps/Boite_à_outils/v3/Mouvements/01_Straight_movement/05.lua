-- Lua script of map mouvement_npc_8.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()
local mouvement = sol.movement.create("straight")
mouvement:set_max_distance(170)
mouvement:start(poulet, function()
game:start_dialog("mouvement_npc_1.poulet.poulet_stupide")
    end)

end
