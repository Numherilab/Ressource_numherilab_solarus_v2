function jeanine:on_interaction()
  -- Cette fonction est appelée lorsque le joueur interagit avec Jeanine.

  -- Vérifie si la variable "carte_3_recu_50_rubis_jeanine" est définie et est vraie.
  if game:get_value("carte_3_recu_50_rubis_jeanine") then
    -- Si la variable est vraie, cela signifie que le joueur a déjà reçu les 50 rubis.
    -- Démarre un dialogue pour informer le joueur que Jeanine n'a plus de rubis à donner.
    game:start_dialog("pnj_items_monnaie.jeanine.plus_de_rubis")
  else
    -- Si la variable est fausse ou non définie, cela signifie que le joueur n'a pas encore reçu les 50 rubis.
    -- Ajoute 50 rubis à l'inventaire du joueur.
    game:add_money(50)
    -- Définit la variable "carte_3_recu_50_rubis_jeanine" à vraie pour enregistrer que le joueur a reçu les rubis.
    game:set_value("carte_3_recu_50_rubis_jeanine", true)
    -- Démarre un dialogue pour informer le joueur que Jeanine lui donne les 50 rubis.
    game:start_dialog("pnj_items_monnaie.jeanine.donne_rubis")
  end
end





Le joueur parle à Jeanine :

Lorsque le joueur interagit avec Jeanine, elle vérifie si elle a déjà donné 50 rubis au joueur auparavant.
Jeanine a déjà donné les rubis :

Si Jeanine a déjà donné 50 rubis au joueur, elle dit quelque chose comme "Désolé, je n'ai plus de rubis à te donner."
Jeanine n'a pas encore donné les rubis :

Si Jeanine n'a pas encore donné de rubis au joueur, elle lui donne 50 rubis.
Ensuite, elle enregistre cette action pour se souvenir qu'elle a déjà donné les rubis.
Enfin, elle dit quelque chose comme "Voici 50 rubis pour toi !"

Cela garantit que chaque joueur ne peut recevoir les 50 rubis qu'une seule fois de la part de Jeanine.







