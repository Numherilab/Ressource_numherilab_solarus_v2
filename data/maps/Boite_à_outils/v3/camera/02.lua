local map = ...
local game = map:get_game()
camera_shake = require("scripts/scripts_tutoriel/camera_shake")

function tremblementdeterre:on_activated()
camera_shake:shake(map:get_camera())
end