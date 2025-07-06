-- Lua script of map Boite_a_outils/pnj_items_monnaie/02.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()





function marty:on_interaction()
    if not game:get_value("carte_2_recu_30_rubis_marty") then
        game:start_dialog("pnj_items_monnaie.marty.30_monnaie", function()
            game:add_money(30)
            game:set_value("carte_2_recu_30_rubis_marty", true)
        end)
    end
end
































function map:on_started()
  self.images = {
    sol.surface.create("Info/pnj_items_monnaie/map02_1.png"),
    sol.surface.create("Info/pnj_items_monnaie/map02_2.png"),
    sol.surface.create("Info/pnj_items_monnaie/map02_3.png"),
    sol.surface.create("Info/pnj_items_monnaie/map02_4.png"),
    sol.surface.create("Info/pnj_items_monnaie/map02_5.png"),
  }
  self.current_image_index = nil  -- Indicateur d'image actuelle (nil signifie pas d'image affichée)
end

function info:on_interaction()
  -- Réinitialiser l'index de l'image actuelle
  map.current_image_index = 1
  game:set_hud_enabled(false)  -- Désactiver le HUD

  -- Fonction pour dessiner l'image actuelle
  local function draw_current_image(dst_surface)
    if map.current_image_index and map.images[map.current_image_index] then
      map.images[map.current_image_index]:draw(dst_surface, 0, 0)
    end
  end

  -- Ajouter la fonction de dessin à la map
  function map:on_draw(dst_surface)
    draw_current_image(dst_surface)
  end
end

function map:on_command_pressed(command)
  if command == "action" then  -- "attack" est généralement mappé à la touche Espace
    if map.current_image_index then
      if map.current_image_index < #map.images then
        map.current_image_index = map.current_image_index + 1  -- Passer à l'image suivante
      else
        map.current_image_index = nil  -- Arrêter d'afficher les images
        map.on_draw = nil
        game:set_hud_enabled(true)  -- Réactiver le HUD
      end
      return true
    end
  end
  return false
end
