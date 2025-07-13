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
