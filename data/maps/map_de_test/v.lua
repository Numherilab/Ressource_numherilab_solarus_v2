local map = ...
local game = map:get_game()


local bobo = map:get_entity("bobo")
local hero = game:get_hero()

if bobo then
  function bobo:on_interaction()
    hero:set_tunic_sprite_id("hero/caspiantunic1")
  end
end