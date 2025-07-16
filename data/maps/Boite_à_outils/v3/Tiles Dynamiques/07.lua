-- Lua script of map tile_dynamic_exemple_2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function capteur_effondrement:on_activated()     
    capteur_effondrement:remove()               
    local index = 1                            
    hero:save_solid_ground()                     
    sol.timer.start(200, function()                
        local tile = map:get_entity("Effondrement_du_sol_" .. index)   
                 if tile == nil then            
            return false
        end                                     
        tile:set_enabled(false)                      
        sol.audio.play_sound("falling_rock")        
        index = index + 1                       
        return true                             
    end)                                        
end                                             
