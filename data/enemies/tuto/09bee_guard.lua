-- Lua script of enemy tuto/bee_guard.
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
local body_sprite
local weapon_sprite
local movement

function enemy:on_created()

  -- Initialize the properties of your enemy here,
  -- like the sprite, the life and the damage.
  body_sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  weapon_sprite = enemy:create_sprite("enemies/" .. enemy:get_breed() .. "_weapon")
  enemy:set_life(3)
  enemy:set_damage(1)

enemy:set_attack_consequence_sprite(weapon_sprite, "sword", function()
if being_pushed then
return
end
being_pushed = true
sol.audio.play_sound("sword_tapping")
movement = sol.movement.create("straight")
  movement:set_speed(96)
  movement:set_angle(hero:get_angle(enemy))
  movement:set_max_distance (48)
  movement:start(enemy, function()
    enemy:restart()
    end)
  end)
end


function enemy:on_restarted()

  being_pushed=false
  movement = sol.movement.create("target")
  movement:set_target(hero)
  movement:set_speed(32)
  movement:start(enemy)
end

function enemy:on_movement_changed()

if not being_pushed then
 body_sprite:set_direction(movement:get_direction4())
 weapon_sprite:set_direction(movement:get_direction4())

end
end