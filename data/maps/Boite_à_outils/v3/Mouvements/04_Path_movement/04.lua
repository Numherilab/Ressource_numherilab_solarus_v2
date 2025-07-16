-- Lua script of map mouvement_15.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function capteur_1:on_activated()
          hero:freeze()
          local movement = sol.movement.create("path")
          movement:set_path{6, 6, 6, 6, 6, 6}
          movement:set_speed(80)
          movement:start(brigitte, function()
        game:start_dialog("mouvement_npc_1.brigitte.coucou", function()
            hero:unfreeze()
            capteur_1:remove()
        end)
    end)
end
