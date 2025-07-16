-- Lua script of enemy tuto/globul-jaune.
-- This script is executed every time an enemy with this model is created.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local sprite
local movement
local going_hero = false

-- Event called when the enemy is initialized.
function enemy:on_created()

  -- Initialize the properties of your enemy here,
  -- like the sprite, the life and the damage.
  sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_life(1)
  enemy:set_damage(1)
end

-- Event called when the enemy should start or restart its movements.
-- This is called for example after the enemy is created or after
-- it was hurt or immobilized.
function enemy:on_restarted()
sol.timer.start(enemy, 100, function()
local close_to_hero = enemy:get_distance(hero) < 96 and enemy:get_direction4_to(hero) == sprite:get_direction()
if close_to_hero and not going_hero then
enemy:go_hero()
elseif not close_to_hero and going_hero then
enemy:go_random()
end
return true
end)

enemy:go_random() 
end

function enemy:go_random()
  movement = sol.movement.create("random_path")
  movement:set_speed(32)
  movement:start(enemy)
  going_hero = false
end

function enemy:go_hero()
  movement = sol.movement.create("target")
  movement:set_target(hero)
  movement:set_speed(64)
  movement:start(enemy)
  going_hero = true
end

function enemy:on_movement_changed()
 sprite:set_direction(movement:get_direction4())
end