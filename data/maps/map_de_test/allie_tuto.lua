--Bonjour les solarien 

Nous allons comprendre comment réalisé un allié qui nous suis 
pour cela nous allons importer le custom entities ally
et creer dans un dossier scripts un fichier avec le nom de votre pnj_ally.lua 
et ecrire un code pour délimitter le buffer de votre héro 


voici le code de boubou_ally.lua 
n'oublier pas de nommer le npc mis sur la carte le mien s'apelle boubou 

local boubou_ally = {}

function boubou_ally:summon(hero)
  local map = hero:get_map()
  local x, y, layer = hero:get_position()
  
  -- Créer l'allié à côté du héros
  map:create_custom_entity{
    x = x , 
    y = y, 
    layer = layer, 
    direction = 3, 
    width = 16, 
    height = 16,
    sprite = "npc/billy",  -- Utilisez le même sprite que dans allie.dat
    model = "ally",
    name = "boubou_ally"
  }
end

return boubou_ally


voici le custom entities de ally

---An entity that follows right behind the hero, like your allies in Earthbound

local entity = ...
local game = entity:get_game()
local map = entity:get_map()
local hero = map:get_hero()
local sprite
local in_water
local step_delay = 24 --This is how far away the ally will walk
-- local SPEED = 120
-- local following_hero

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


et voici le scripts hero 
-- Extension du héros pour gérer le buffer de positions
-- Utilisé par les alliés pour suivre le héros

local hero_meta = sol.main.get_metatable("hero")

-- Taille maximale du buffer de positions
local MAX_BUFFER_SIZE = 50

-- Événement appelé à chaque changement de position du héros
function hero_meta:on_position_changed(x, y, layer)
  local hero = self
  
  -- Initialiser le buffer s'il n'existe pas
  if not hero.position_buffer then 
    hero.position_buffer = {} 
  end
  
  -- Récupérer la direction actuelle du héros
  local direction = hero:get_sprite():get_direction()
  
  -- Ajouter la nouvelle position au début du buffer
  table.insert(hero.position_buffer, 1, {
    x = x,
    y = y,
    layer = layer,
    direction = direction
  })
  
  -- Limiter la taille du buffer pour éviter une consommation mémoire excessive
  if #hero.position_buffer > MAX_BUFFER_SIZE then
    table.remove(hero.position_buffer)
  end
end

return true

n'oublier pas d'appeler ce scripts dans le fichier featers