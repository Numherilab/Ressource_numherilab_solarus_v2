-- Lua script of map teste lit.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
map:set_entities_enabled("couverture",false)

end



function sensor_bed:on_activated()
  game:start_dialog("voulez_vous_dormir", function(answer)
    if answer == 1 then
      map:set_entities_enabled("couverture",true)
      hero:teleport("hero/teste lit", "destination_2") 
      sol.timer.start(1240, function() 
        hero:freeze()    
        hero:set_animation("sleeping")
        sol.timer.start(6000, function() 
          map:set_entities_enabled("couverture",false)
          hero:set_animation("walking")  
          hero:unfreeze() 
          hero:start_jumping(6, 48, true) 
        end)
      end)
    elseif answer == 2 then
      local mouvement_1 = sol.movement.create("straight")
      mouvement_1:set_max_distance(24)  
      mouvement_1:set_angle(0)  
      mouvement_1:start(hero, function()
        
        hero:unfreeze()  
      end)

     
    end
  end)
end





