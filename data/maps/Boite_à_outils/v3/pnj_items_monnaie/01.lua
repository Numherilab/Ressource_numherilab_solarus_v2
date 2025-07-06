-- Lua script of map Boite_a_outils/pnj_items_monnaie/01.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function doc:on_interaction()
        game:start_dialog("pnj_items_monnaie.doc.10_monnaie", function()
                game:add_money(10) 
    end)
end


--function doc:on_interaction() 
    -- Démarre un dialogue avec l'identifiant "pnj_items_monnaie.doc.10_monnaie"
   -- game:start_dialog("pnj_items_monnaie.doc.10_monnaie", function()
        -- Ajoute 10 unités de monnaie au joueur après la fermeture du dialogue
       -- game:add_money(10)
  --  end)
--end