-- Lua script of map Grotte.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()



function sensor_light:on_activated()
  map:set_entities_enabled("fagot_",true)

end
function sensor_dialog:on_activated()
    game:start_dialog("Grotte.AutoQuestion")
    sensor_dialog:remove()
end


function tonneau:on_activated()
  self:get_game():set_ability("swim", 1)
 hero:set_tunic_sprite_id("hero/tonneau")
map:set_entities_enabled("tonneautile",false)   
game:set_value("tonneau", true)

end

function tonneau_end:on_activated()
  if game:get_value("tonneau") then
  self:get_game():set_ability("swim", 0)
 hero:set_tunic_sprite_id("hero/tunic1")

end
end