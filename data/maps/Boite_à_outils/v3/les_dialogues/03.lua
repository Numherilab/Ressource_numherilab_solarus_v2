-- Lua script of map les_dialogues/03.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function etagere_1:on_interaction()
      if game:get_value("livre_des_potion_recu", true) then
      etagere_1:remove()
      else
            game:start_dialog("les_dialogues.etagere.01", function()
                  game:start_dialog("les_dialogues.etagere.01_question", function (answer)
                         if answer == 1 then
                         game:start_dialog("les_dialogues.etagere.01_super")
                         game:set_value("livre_des_potion_recu", true)
                         elseif answer == 2 then
                         game:start_dialog("les_dialogues.etagere.01_regret")
                         end
                  end) 
            end)
       end
end


function david:on_interaction()
  if game:get_value("livre_des_potion_donne") then
    game:start_dialog("les_dialogues.david.maudit")
  elseif game:get_value("livre_des_potion_recu") then
    game:start_dialog("les_dialogues.david.merci")
    game:set_value("livre_des_potion_donne", true)
  elseif game:get_value("quete_de_la_potion") then
    game:start_dialog("les_dialogues.david.jattend")
  else
    game:start_dialog("les_dialogues.david.quete_de_la_potion ")
    game:set_value("quete_de_la_potion", true)
  end
end
























































function map:on_started()
  self.images = {
    sol.surface.create("Info/les_dialogues/map03_1.png"),
    sol.surface.create("Info/les_dialogues/map03_2.png"),
  }
  self.current_image_index = nil 
end

function info:on_interaction()
  map.current_image_index = 1
  game:set_hud_enabled(false)

  local function draw_current_image(dst_surface)
    if map.current_image_index and map.images[map.current_image_index] then
      map.images[map.current_image_index]:draw(dst_surface, 0, 0)
    end
  end

  -- Définir l'événement on_draw de sol.video pour dessiner sur la fenêtre entière.
  function sol.video:on_draw(dst_surface)
    draw_current_image(dst_surface)
  end
end

function map:on_command_pressed(command)
  if command == "action" then  
    if map.current_image_index then
      if map.current_image_index < #map.images then
        map.current_image_index = map.current_image_index + 1  
      else
        map.current_image_index = nil
        sol.video.on_draw = nil -- Désactive le dessin sur l'écran.
        game:set_hud_enabled(true)
      end
      return true
    end
  end
  return false
end