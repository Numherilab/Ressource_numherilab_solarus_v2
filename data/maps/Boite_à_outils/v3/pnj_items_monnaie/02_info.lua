

function marty:on_interaction()
    -- Vérifie si le joueur a déjà reçu l'argent de Marty
    if not game:get_value("carte_2_recu_30_rubis_marty") then
        -- Démarre un dialogue avec l'identifiant "pnj_items_monnaie.marty.30_monnaie"
        game:start_dialog("pnj_items_monnaie.marty.30_monnaie", function()
            -- Ajoute 30 unités de monnaie au joueur
            game:add_money(30)
            -- Marque que l'argent a été donné
            game:set_value("carte_2_recu_30_rubis_marty", true)
        end)
    end
end


on pourrait aussi le coder comme ceci





function marty:on_interaction()
    -- Vérifie si le joueur n'a pas encore reçu l'argent de Marty
    if game:get_value("carte_2_recu_30_rubis_marty") then
        return
    end
    
    -- Démarre un dialogue avec l'identifiant "pnj_items_monnaie.marty.30_monnaie"
    game:start_dialog("carte_2_recu_30_rubis_marty", function()
        -- Ajoute 30 unités de monnaie au joueur
        game:add_money(30)
        -- Marque que l'argent a été donné
        game:set_value("carte_2_recu_30_rubis_marty", true)
    end)
end



Nous voulons créer un personnage dans notre jeu qui donne 30 rubis la première fois que tu lui parles, mais ne donne plus rien après. Pour cela, nous allons ajouter une variable pour enregistrer si le joueur a déjà reçu les rubis ou non.

"Comment ça fonctionne"

Donner les rubis :
Quand tu parles au personnage pour la première fois, il te donne 30 rubis en utilisant game:add_money(30).

"Enregistrer l'action :"

Une fois que tu reçois les 30 rubis, nous utilisons game:set_value pour enregistrer que tu as déjà pris l'argent. Cela crée une sorte de marque dans le jeu qui dit ce joueur a déjà reçu les rubis.

"Vérifier l'état :"

Chaque fois que tu parles au personnage, le script vérifie avec game:get_value si tu as déjà pris les rubis ou non.

"Comportement du personnage"

Si tu n'as pas encore reçu les rubis :
Le personnage te donne les 30 rubis.

Si tu as déjà reçu les rubis :
Le personnage ne te donne rien.


"Importance du Nom de la Variable"

Lorsque tu crées une variable, il est crucial de lui donner un nom unique pour éviter les conflits avec d autres parties du jeu. Un bon moyen d y parvenir est d inclure dans le nom de la variable le nom de la carte où se déroule l action ainsi qu'une description de ce qui se passe.

"Exemple de Nom de Variable"

Imaginons que notre personnage se trouve sur la carte numéro 2 et qu'il donne 30 rubis. Nous pourrions nommer notre variable ainsi :

Nom de la carte : "carte_2"
Description de l'action : "recu_30_rubis_pnj"
En combinant ces éléments, le nom de la variable pourrait être : game:set_value("carte_2_recu_30_rubis_marty", true) 

"Explication des Valeurs Booléennes"

Les valeurs booléennes sont un type de données qui peuvent seulement avoir deux valeurs : true (vrai) ou false (faux). Ces valeurs sont souvent utilisées pour indiquer l'état de quelque chose ou pour prendre des décisions dans un programme. 


"Qu'est-ce qu'une Valeur Booléenne ?"

Une valeur booléenne est un peu comme un interrupteur :

true : L'interrupteur est allumé (vrai).
false : L'interrupteur est éteint (faux)

.game:set_value("carte_2_recu_30_rubis_marty", true) 

Le true ici indique que l'on active la variable. On dit au programme que désormais la variable est active, elle est vraie, true !


