-- Lua script of map tile dynamic.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Mettre ses tiles sur sa map 
-- clique droit
-- séléctionner tiles dynamic
-- Mettre un nom au tiles
-- si on veut faire apparaitre des tiles en même temps alors choisir le même nom pour l'ensemble de tiles
-- choisir de ne pas les afficher au démarrage de la map 

function map_tile_switch_1:on_activated()

sol.audio.play_sound("treasure")
map:set_entities_enabled("map_tile_tile_dynamic_escalier",true)   
end
