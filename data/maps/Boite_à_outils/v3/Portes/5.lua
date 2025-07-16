-- Lua script of map porte 5.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

for enemy in map:get_entities_by_type("enemy") do
  function enemy:on_dead()
    if not map:has_entities("goblin_a_") then
      sol.audio.play_sound("eduardo/secret")
      map:open_doors("porte_a_")
    end
  end
end
