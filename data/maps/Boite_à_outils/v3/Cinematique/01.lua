-- Lua script of map Cinematique/0.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()

-- You can initialize the movement and sprites of various
-- "ap entities here.
 map:set_doors_open("boss_door", true)
end

function boss_sensor:on_activated()
    boss_sensor:remove()
    hero:freeze()
    sol.audio.stop_music()
    map:close_doors("boss_door")
    hero:set_animation("walking")

    local movement = sol.movement.create("straight")
    movement:set_angle(math.pi / 2)
    movement:set_speed(hero:get_walking_speed())
    movement:set_max_distance(86)
    movement:start(hero, function()
        hero:set_animation("stopped")
        sol.timer.start(map, 500, function()
            game:start_dialog("boss_example_intro", function()
                sol.audio.play_music("eduardo/boss")
                boss:set_enabled(true)
                hero:unfreeze()
            end)
        end)
    end)
end

function boss:on_dying()
  sol.audio.stop_music()
  hero:freeze()
end

function boss:on_dead()
  hero:start_victory()
 map:open_doors("boss_door")
end