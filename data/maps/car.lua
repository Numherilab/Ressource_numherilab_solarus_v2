-- Lua script of map car.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()



function bonton_1:on_activated()
sol.audio.play_sound("treasure")
map:set_entities_enabled("map_tile_tile_dynamic_cascade",false)
   -- toute les entités qui commence par map_tile_tile_dynqmic... s'active
end

function sensor_bed:on_activated()
  game:start_dialog("voulez_vous_dormir")
end