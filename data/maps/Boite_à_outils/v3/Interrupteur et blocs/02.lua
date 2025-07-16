-- Lua script of map Les blocs/02.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function bouton_coffre:on_activated()
          sol.audio.play_sound("chest_appears")
          coffre: set_enabled(true)
end