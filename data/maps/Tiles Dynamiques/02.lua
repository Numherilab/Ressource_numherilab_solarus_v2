-- Lua script of map tile dynamic_script_désactivation_tile.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- au lieu de désactiver les tiles un à un sur l'éditeur de map nous allons le coder pour que sa soit plus rapide

function map:on_started()
map:set_entities_enabled("map_tile_tile_dynamic_escalier",false)
end

function map_tile_switch_1:on_activated()

sol.audio.play_sound("treasure")
map:set_entities_enabled("map_tile_tile_dynamic_escalier",true)   -- toute les entités qui commence par map_tile_tile_dynqmic... s'active
end