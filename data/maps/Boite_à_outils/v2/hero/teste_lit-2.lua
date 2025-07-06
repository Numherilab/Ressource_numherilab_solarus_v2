-- Lua script of map hero/teste_lit-2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()
  local hero = map:get_hero()
  
  -- Positionner le héros sur un lit ou une position spécifique
  hero:set_position(160, 120)  -- Changez ces coordonnées pour correspondre à votre carte
  
  -- Figer le héros et le mettre en animation de sommeil
  hero:freeze()
  hero:set_animation("sleeping")

  -- Après 6000 ms (6 secondes), maintenir l'animation de sommeil
  sol.timer.start(map, 6000, function()
    hero:set_animation("sleeping")
    
    -- Après encore 6000 ms (6 secondes), effectuer les actions de réveil
    sol.timer.start(map, 6000, function()
      map:set_entities_enabled("couverture", false)
      hero:set_animation("walking")
      hero:unfreeze()
      hero:start_jumping(6, 48, true)
    end)
  end)
end
