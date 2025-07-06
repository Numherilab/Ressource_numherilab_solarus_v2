-- Lua script of map Boite_a_outils/pnj_items_monnaie/04.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function caroline:on_interaction()
    if game:get_value("carte_4_recu_potion_de_vie_caroline") then
        game:start_dialog("pnj_items_monnaie.caroline.plus_de_potion")
    else
        game:start_dialog("pnj_items_monnaie.caroline.potion")
                hero:start_treasure("potion_de_vie", 1, "carte_4_recu_potion_de_vie_caroline")
    end
end