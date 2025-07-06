-- Lua script of map les_dialogues/05.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function jo:on_interaction()
  if game:get_value("premier_dialogue_valide") then
    game:start_dialog("deuxieme_dialogue")
  else
    game:start_dialog("les_dialogues.jo.quete_de_la_potion ")
    game:set_value("premier_dialogue_valide", true)
  end
end
