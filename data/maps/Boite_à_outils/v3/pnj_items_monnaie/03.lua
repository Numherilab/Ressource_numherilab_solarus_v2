-- Lua script of map Boite_a_outils/pnj_items_monnaie/03.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function jeanine:on_interaction()

  if game:get_value("carte_3_recu_50_rubis_jeanine") then
    game:start_dialog("pnj_items_monnaie.jeanine.plus_de_rubis")
  else
    game:add_money(50)
    game:set_value("carte_3_recu_50_rubis_jeanine", true)  
    game:start_dialog("pnj_items_monnaie.jeanine.donne_rubis")
  end
end














































function map:on_started()
  self.images = {
    sol.surface.create("Info/les_dialogues/Sans titre-2.png"),
  }
  self.current_image_index = nil
end

function info:on_interaction()
  map.current_image_index = 1
  game:set_hud_enabled(false)
  
  -- Create a surface to cover the entire game window
  local screen_surface = sol.surface.create(sol.video.get_quest_size())

  local function draw_current_image(dst_surface)
    if map.current_image_index and map.images[map.current_image_index] then
      local screen_width, screen_height = screen_surface:get_size()
      local image = map.images[map.current_image_index]
      local image_width, image_height = image:get_size()

      -- Clear the screen surface
      screen_surface:clear()

      -- Scale the image to fit the screen
      local scale_x = screen_width / image_width
      local scale_y = screen_height / image_height

      -- Set the scale of the image
      image:set_scale(scale_x, scale_y)

      -- Draw the image scaled to fit the screen surface
      image:draw(screen_surface, 0, 0)
      
      -- Draw the screen surface to the destination surface (fullscreen)
      screen_surface:draw(dst_surface, 0, 0)
    end
  end

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
        sol.video.on_draw = nil
        game:set_hud_enabled(true)
      end
      return true
    end
  end
  return false
end
