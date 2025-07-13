local map = ...
local game = map:get_game()

function map:on_started()
  if game:get_value("boubou_suit") then
      boubou:set_enabled(false)
      sol.timer.start(450 , function() 
 require("scripts/action/boubou_ally"):summon(hero)
end)
end
  end

function boubou:on_interaction()  
  game:start_dialog("maptest.boubou.suivre", function(answer)
    if answer == 1 then
      -- Réponse "Oui"
      game:start_dialog("maptest.boubou.oui")
      game:set_value("boubou_suit", true)
      boubou:set_enabled(false)  -- Cacher le PNJ original
      require("scripts/action/boubou_ally"):summon(hero)            
    elseif answer == 2 then
      -- Réponse "Non"
      game:start_dialog("maptest.boubou.non")
    end
  end)
end