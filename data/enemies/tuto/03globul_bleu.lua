-- Lua script of enemy tuto/globul_bleu.
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

local function tire_de_flame()

local flame = enemy:create_enemy({
breed = "flame"
})
local flame_movement = sol.movement.create("straight")
flame_movement:set_angle(flame:get_angle(hero))
flame_movement:set_speed(96)
flame_movement:set_smooth(false)
flame_movement:set_ignore_obstacles(false)

function flame_movement:on_obstacle_reached()
flame:remove()
end

flame_movement:start(flame)
local delay = math.random(1, 5) * 1000 -- temps aléatoire entre 1 et 5 secondes entre les tir de flamme
return delay
end




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

  movement = sol.movement.create("random_path")
  movement:set_speed(48)
  movement:start(enemy)

sol.timer.start(enemy, 2000, tire_de_flame)
end

function enemy:on_movement_changed()
 sprite:set_direction(movement:get_direction4())
end

