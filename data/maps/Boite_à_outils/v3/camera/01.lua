local map = ...
local game = map:get_game()


function bouton_coffre:on_activated()
local camera = map:get_camera()
local movement = sol.movement.create("target")
 
game:set_suspended(true)
movement:set_target(camera:get_position_to_track(coffre))
movement:set_speed(200)
movement:start(camera, function()
sol.timer.start(map,800,function()
sol.audio.play_sound("chest_appears")
coffre:set_enabled(true)
sol.timer.start(map,500,function()
movement:set_target(camera:get_position_to_track(hero))
movement:start(camera, function()
game:set_suspended(false)
camera:start_tracking(hero)
          end)
        end)
    end)
 end)
end
