local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local sprite
local movement

-- Ajout d'une instruction d'impression pour vérifier que la fonction est appelée
local function tire_de_big_rock()

  local big_rock = enemy:create_enemy({
    breed = "gooseberry_enemies/projectiles/big_rock"
  })
  local big_rock_movement = sol.movement.create("straight")
  big_rock_movement:set_angle(big_rock:get_angle(hero))
  big_rock_movement:set_speed(96)
  big_rock_movement:set_smooth(false)
  big_rock_movement:set_ignore_obstacles(false)

  function big_rock_movement:on_obstacle_reached()
    big_rock:remove()
  big_rock_movement:start(big_rock)
  local delay = math.random(1, 5) * 1000
  return delay
end

-- Event called when the enemy is initialized.
function enemy:on_created()
  sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_life(1)
  enemy:set_damage(1)
end

-- Event called when the enemy should start or restart its movements.
function enemy:on_restarted()
  movement = sol.movement.create("random_path")
  movement:set_speed(48)
  movement:start(enemy)

  sol.timer.start(enemy, 2000, tire_de_big_rock)
end

function enemy:on_movement_changed()
  sprite:set_direction(movement:get_direction4())
end

