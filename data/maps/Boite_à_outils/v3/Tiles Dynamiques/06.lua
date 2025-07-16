-- Lua script of map tile_dynamic_salle_passage_secret.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function map:on_started()
game:start_dialog("tile_dynamic.salle_secrete.intro")
end

function bois_interaction:on_interaction()
    game:start_dialog("tile_dynamic.salle_secrete.bois", function(answer)
        if answer == 1 then
            map:set_entities_enabled("bois", false)
            map:set_entities_enabled("bois_interaction", false)
            game:start_dialog("tile_dynamic.salle_secrete.bois_2")
        end
    end)
end

function switch_lit:on_activated()
sol.audio.play_sound("treasure")
map:set_entities_enabled("lit_1",false)
map:set_entities_enabled("lit_2",true)  -- toute les entités qui commence par map_tile_tile_dynqmic... s'active
end