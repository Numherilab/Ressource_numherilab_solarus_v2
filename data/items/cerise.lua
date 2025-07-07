local item = ...

-- Item cerise : objet de soin stocké dans l'inventaire
function item:on_created()
  -- Configuration de base de l'objet
  self:set_shadow("small")                    -- Ombre petite
  self:set_can_disappear(true)               -- Peut disparaître après un temps
  self:set_sound_when_picked("picked_item")  -- Son d'objet ramassé
  
  -- Configuration de l'inventaire
  self:set_assignable(true)                  -- Peut être assigné à un bouton
  self:set_savegame_variable("cerise")       -- Variable principale de sauvegarde
  self:set_amount_savegame_variable("cerise_amount") -- Variable pour stocker la quantité
  self:set_max_amount(99)                   -- Maximum 99 cerises
  
  -- Par défaut, pas de brandissement
  self:set_brandish_when_picked(false)
end

-- Fonction appelée quand le héros touche l'objet (avant ramassage)
function item:on_pickable_interaction_item(pickable, hero_item)
  -- Vérifier si c'est la première fois qu'on trouve une cerise
  local game = self:get_game()
  if not game:get_value("cerise_found_once") then
    -- Première fois : activer le brandissement
    self:set_brandish_when_picked(true)
  else
    -- Pas la première fois : pas de brandissement
    self:set_brandish_when_picked(false)
  end
end

-- Fonction appelée quand le joueur obtient l'objet
function item:on_obtaining(variant, savegame_variable)
  local game = self:get_game()
  local current_amount = self:get_amount()
  
  -- Vérifier si c'est la première fois que le joueur trouve une cerise
  if not game:get_value("cerise_found_once") then
    -- Première fois : marquer comme trouvé et afficher le dialogue
    game:set_value("cerise_found_once", true)
    game:start_dialog("cerise_obtained")
  end
  -- Sinon : pas de dialogue, ramassage silencieux
  
  -- Ajouter une cerise à l'inventaire
  self:set_amount(current_amount + 1)
end

-- Fonction appelée quand le joueur utilise l'objet depuis l'inventaire
function item:on_using()
  local game = self:get_game()
  local hero = game:get_hero()
  
  -- Vérifier si le héros a besoin de vie
  if game:get_life() < game:get_max_life() then
    -- Consommer une cerise
    local current_amount = self:get_amount()
    if current_amount > 0 then
      self:set_amount(current_amount - 1)
      -- Ajouter 1 point de vie (4 unités = 1 cœur)
      game:add_life(1)
      -- Son de guérison
      sol.audio.play_sound("heart")
      
      -- Afficher le message seulement la première fois qu'on mange une cerise
      if not game:get_value("cerise_used_once") then
        game:set_value("cerise_used_once", true)
        game:start_dialog("cerise_used")
      end
    end
  else
    -- Le héros a déjà sa vie au maximum (toujours afficher ce message)
    game:start_dialog("cerise_full_life")
  end
  
  self:set_finished()
end


