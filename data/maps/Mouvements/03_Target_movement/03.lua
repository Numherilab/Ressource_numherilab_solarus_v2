-- Lua script of map Mouvements/03_Target_movement/03.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

--
function map:on_started()
local mouvement = sol.movement.create("target")
mouvement:set_speed(40)
mouvement:start(gabriel)
end

function sensor1:on_activated()
         mouvement:stop()
end