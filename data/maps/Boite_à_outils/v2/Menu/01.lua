-- Lua script of map Menu/01.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

local image_menu_indication = sol.surface.create("images_tuto/image_menus.png")
local menu = {}

function map:on_started()
sol.menu.start(map, menu)
end

function menu:on_draw(dst_surface)
image_menu_indication:draw(dst_surface, 0, 0)
end

function menu:on_key_pressed(key)
  if key == "i" then
  sol.audio.play_sound("frost1")
  sol.menu.stop(menu)
  end
end