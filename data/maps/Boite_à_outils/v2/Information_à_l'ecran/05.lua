-- Lua script of map Information_à_l'ecran/05.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local text_de_map = sol.text_surface.create({
text = "afficher du texte sur l'écran"
})

function map:on_draw(screen)
         text_de_map:draw(screen, 40, 170)
end
    




