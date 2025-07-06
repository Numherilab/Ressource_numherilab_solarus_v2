-- Lua script of map Information_à_l'ecran/04.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

local sprite = sol.sprite.create("menus/team_logo")

function map:on_draw(screen)
         sprite:draw(screen, 150, 80)
end
        
