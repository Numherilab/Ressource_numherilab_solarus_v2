-- Lua script of map Information_à_l'ecran/02.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

local png_dormir = sol.surface.create("images_tuto/dormir.png")

function map:on_draw(screen)
         png_dormir:draw(screen, 190, 130)
end
         