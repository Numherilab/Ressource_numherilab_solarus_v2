-- Déclaration de la fonction d'interaction pour le PNJ nommé "doc"
function doc:on_interaction()
    -- Démarre un dialogue avec l'identifiant "pnj_items_monnaie.doc.10_monnaie"
    game:start_dialog("pnj_items_monnaie.doc.10_monnaie", function()
        -- Ajoute 10 unités de monnaie au joueur après la fermeture du dialogue
        game:add_money(10)
    end)
end

Le script 
game:add_money(nombre) 
permet de donner autant d'argent 
que vous le souhaitez, 
cependant ce PNJ donne de 
l'argent à chaque fois que vous lui 
parlez. Allez voir la map 2 
pour régler ce problème.
