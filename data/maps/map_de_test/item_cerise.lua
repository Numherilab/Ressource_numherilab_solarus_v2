local map = ...
local game = map:get_game()


map:register_event("on_started", function()
  local hero = map:get_hero()
  
  -- Si l'allié doit déjà suivre, le créer directement
  if game:get_value("boubou_suit") then
  sol.timer.start(450 , function() 
 require("scripts/action/boubou_ally"):summon(hero)
 end)
  end
end)