-- Lua script of map mouvement_npc_10.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()


    -- Mouvement pour poulet_1: Est
    local mouvement_1 = sol.movement.create("straight")
    mouvement_1:set_speed(30)
    mouvement_1:set_angle(0)
    mouvement_1:start(poulet_1)

    -- Mouvement pour poulet_2: Nord-Est
    local mouvement_2 = sol.movement.create("straight")
    mouvement_2:set_speed(30)
    mouvement_2:set_angle(math.pi / 4)
    mouvement_2:start(poulet_2)

    -- Mouvement pour poulet_3: Nord
    local mouvement_3 = sol.movement.create("straight")
    mouvement_3:set_speed(30)
    mouvement_3:set_angle(math.pi / 2)
    mouvement_3:start(poulet_3)

    -- Mouvement pour poulet_4: Nord-Ouest
    local mouvement_4 = sol.movement.create("straight")
    mouvement_4:set_speed(30)
    mouvement_4:set_angle(3 * math.pi / 4)
    mouvement_4:start(poulet_4)

    -- Mouvement pour poulet_5: Ouest
    local mouvement_5 = sol.movement.create("straight")
    mouvement_5:set_speed(30)
    mouvement_5:set_angle(math.pi)
    mouvement_5:start(poulet_5)

    -- Mouvement pour poulet_6: Sud-Ouest
    local mouvement_6 = sol.movement.create("straight")
    mouvement_6:set_speed(30)
    mouvement_6:set_angle(-3 * math.pi / 4)
    mouvement_6:start(poulet_6)

    -- Mouvement pour poulet_7: Sud
    local mouvement_7 = sol.movement.create("straight")
    mouvement_7:set_speed(30)
    mouvement_7:set_angle(-math.pi / 2)
    mouvement_7:start(poulet_7)

    -- Mouvement pour poulet_8: Sud-Est
    local mouvement_8 = sol.movement.create("straight")
    mouvement_8:set_speed(30)
    mouvement_8:set_angle(-math.pi / 4)
    mouvement_8:start(poulet_8)

    -- Mouvement pour poulet_9: entre Est et Nord-Est
    local mouvement_9 = sol.movement.create("straight")
    mouvement_9:set_speed(30)
    mouvement_9:set_angle(math.pi / 8)
    mouvement_9:start(poulet_9)

    -- Mouvement pour poulet_10: entre Nord-Est et Nord
    local mouvement_10 = sol.movement.create("straight")
    mouvement_10:set_speed(30)
    mouvement_10:set_angle(3 * math.pi / 8)
    mouvement_10:start(poulet_10)

    -- Mouvement pour poulet_11: entre Nord et Nord-Ouest
    local mouvement_11 = sol.movement.create("straight")
    mouvement_11:set_speed(30)
    mouvement_11:set_angle(5 * math.pi / 8)
    mouvement_11:start(poulet_11)

    -- Mouvement pour poulet_12: entre Nord-Ouest et Ouest
    local mouvement_12 = sol.movement.create("straight")
    mouvement_12:set_speed(30)
    mouvement_12:set_angle(7 * math.pi / 8)
    mouvement_12:start(poulet_12)
end
