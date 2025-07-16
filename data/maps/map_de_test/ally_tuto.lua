--[[
🤖 Créer un PNJ allié qui suit le héros pas à pas
📌 Objectif
Dans ce tutoriel, nous allons apprendre à faire apparaître un allié qui suit le héros en file indienne, comme dans Earthbound ou Secret of Mana. Ce système utilise un buffer de position du héros pour que notre allié imite ses mouvements avec un léger décalage.

1️⃣ Préparer les fichiers
A. Fichier de l’allié
Crée un fichier dans scripts/ avec le nom de ton pnj.lua  le mien est dans le dossier scripts/action/boubou_ally.lua

Colle ce script :


local boubou_ally = {}

function boubou_ally:summon(hero)
  local map = hero:get_map()
  local x, y, layer = hero:get_position()
  
  map:create_custom_entity{
    x = x,
    y = y,
    layer = layer,
    direction = 3,
    width = 16,
    height = 16,
    sprite = "npc/billy",  -- Le sprite utilisé pour ton allié
    model = "ally",        -- Modèle que l’on définira juste après
    name = "boubou_ally"
  }
end

return boubou_ally


📝 Pense à bien nommer ton NPC sur la carte exactement comme le champ name.

📁 scripts/action/boubou_ally.lua — Le script d’invocation de l’allié
Ce fichier sert à créer l’allié (un custom entity) à côté du héros quand on le souhaite, par exemple pendant un événement ou via une commande.

📌 Contenu du script

local boubou_ally = {}

function boubou_ally:summon(hero)
  local map = hero:get_map()
  local x, y, layer = hero:get_position()
  
  map:create_custom_entity{
    x = x,
    y = y,
    layer = layer,
    direction = 3,
    width = 16,
    height = 16,
    sprite = "npc/billy",  -- Le sprite visuel du PNJ
    model = "ally",        -- Le comportement défini dans custom_entities/ally.lua
    name = "boubou_ally"   -- Nom de l'entité sur la carte
  }
end

return boubou_ally

🔍 Ligne par ligne
1. local boubou_ally = {}
On crée une table Lua pour encapsuler le comportement de notre allié.

2. function boubou_ally:summon(hero)
Cette fonction permet d’invoquer l’allié sur la carte à partir du héros.

3. local map = hero:get_map()
On récupère la carte où se trouve actuellement le héros.

4. local x, y, layer = hero:get_position()
On récupère la position actuelle du héros.

5. map:create_custom_entity{ ... }
On crée un custom entity sur la carte avec :

x, y, layer : à la même position que le héros

sprite = "npc/billy" : sprite à afficher (à adapter à ton projet)

model = "ally" : modèle qui définit le comportement (dans custom_entities/ally.lua)

name = "boubou_ally" : nom de l'entité (important si tu veux l'appeler ailleurs !)

🧪 En pratique
Tu peux appeler ce fichier depuis un autre script ou une action :


require("scripts/boubou_ally"):summon(hero)
Cela creera automatiquement l'entities custom. tu n'auras donc pas à la mettre toi même sur la carte

Et hop ✨ ton petit compagnon apparaît juste derrière toi, prêt à te suivre !

Tu veux que je t’aide à rédiger une partie 2 du tuto pour ajouter un déclencheur (comme une touche ou un événement de carte) ?







Demander à ChatGPT





ChatGPT peut commettre des erreurs. Il est recommandé de vérifier les informations importantes. Voir les préf

2️⃣ Créer le modèle ally dans custom_entities
Dans le fichier custom_entities/ally.lua, insère ce script :

lua
Copier
Modifier
local entity = ...
local game = entity:get_game()
local map = entity:get_map()
local hero = map:get_hero()
local sprite
local in_water
local step_delay = 24

function entity:on_created()
  sprite = entity:get_sprite()
  sprite:set_animation("walking")
  entity:set_drawn_in_y_order(true)
  entity:set_can_traverse_ground("shallow_water", true)
  entity:follow_hero_single_file()
  sol.timer.start(map, 20, function()
    entity:follow_hero_single_file()
    return true
  end)
end

function entity:follow_hero_single_file()
  if not hero.position_buffer then hero.position_buffer = {} end
  if #hero.position_buffer >= step_delay then
    entity:set_position(
      hero.position_buffer[step_delay].x,
      hero.position_buffer[step_delay].y,
      hero.position_buffer[step_delay].layer)
    entity:get_sprite():set_direction(hero.position_buffer[step_delay].direction)
  end
end

function entity:on_position_changed()
  local ground = entity:get_ground_below()
  if not in_water and ground == "shallow_water" then
    in_water = true 
    entity:create_sprite("hero/ground2", "water_sprite")
  elseif in_water and ground ~= "shallow_water" then
    in_water = false
    entity:remove_sprite(entity:get_sprite("water_sprite"))
  end
end
3️⃣ Étendre le héros pour fournir sa position à l’allié
Dans scripts/hero.lua, ajoute ce code :

lua
Copier
Modifier
local hero_meta = sol.main.get_metatable("hero")

local MAX_BUFFER_SIZE = 50

function hero_meta:on_position_changed(x, y, layer)
  local hero = self
  
  if not hero.position_buffer then 
    hero.position_buffer = {} 
  end
  
  local direction = hero:get_sprite():get_direction()
  
  table.insert(hero.position_buffer, 1, {
    x = x,
    y = y,
    layer = layer,
    direction = direction
  })
  
  if #hero.position_buffer > MAX_BUFFER_SIZE then
    table.remove(hero.position_buffer)
  end
end

return true
4️⃣ N’oublie pas !
Active le script du héros dans scripts/features.lua :

lua
Copier
Modifier
require("scripts/hero")
Et appelle ton fichier boubou_ally.lua quand tu veux faire apparaître l’allié (par exemple dans une cinématique, une action, ou un test via un interrupteur). --]]

