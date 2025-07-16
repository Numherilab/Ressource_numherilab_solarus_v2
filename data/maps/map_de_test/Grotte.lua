local map = ...
local game = map:get_game()



function tonneau:on_activated()
  self:get_game():set_ability("swim", 1)
 hero:set_tunic_sprite_id("hero/tonneau")
map:set_entities_enabled("tonneautile",false)   

end

function tonneau_end:on_activated()
  self:get_game():set_ability("swim", 0)
 hero:set_tunic_sprite_id("hero/tunic1")
 map:set_entities_enabled("tonneautile",true)   

end
