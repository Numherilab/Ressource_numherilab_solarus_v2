-- Lua script of map Cinematique/02.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- You can initialize the movement and sprites of various
  -- map entities here.
end

function sensor_1:on_activated()
    sensor_1:remove()
    hero:freeze()
     sol.timer.start(map, 1000, function()
        local mouvement = sol.movement.create("path")
        mouvement:set_speed(90)
        mouvement:set_path{4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}
        mouvement:start(Rob, function()
            game:start_dialog("cinematique.rob.papa")
            sol.timer.start(map, 1000, function ()
            game:start_dialog("cinematique.billy.cache_toi")
            sol.timer.start(map, 1000, function()
            local mouvement_2 = sol.movement.create("target")
             mouvement_2:set_target(hero,0,-32)
             mouvement_2:start(billy, function()
                   game:start_dialog("cinematique.billy.monstre")  
                   mouvement_2:stop()
                   hero:unfreeze()
                       
                    end)
                end)   
            end)
        end)
    end)
end
