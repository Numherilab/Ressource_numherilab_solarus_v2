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
