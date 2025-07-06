-- Lua script of map npc_donne_money_items_09.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()
local player_money = game:get_money()
    game:remove_money(player_money)
end

function Leo:on_interaction()
    if game:get_value("received_money_from_Leo_2") then 
        game:start_dialog("npc_donne_money_items.leo.plusrien")
    else
        game:start_dialog("npc_donne_money_items.leo.10gem", function()
                game:add_money(10)
                game:set_value("received_money_from_Leo_2", true)   
        end)
    end
end


function Merik:on_interaction()
    if game:get_value("received_money_from_Merik_2") then
        game:start_dialog("npc_donne_money_items.Merik.plusrien")
    else
        game:start_dialog("npc_donne_money_items.Merik.30gem", function()
            game:add_money(30)
            game:set_value("received_money_from_Merik_2", true)
        end)
    end
end


function Ronan:on_interaction()
    if game:get_value("received_gems_from_ronan_2") then
        game:start_dialog("npc_donne_money_items.ronan.misere")
    else
        game:start_dialog("npc_donne_money_items.ronan.question", function(answer)
            if answer == 1 then
                hero:start_treasure("gem", 2, "received_gems_from_ronan_2")
            elseif answer == 2 then
                game:start_dialog("npc_donne_money_items.ronan.soupe")
            end
        end)
    end
end




function patrick:on_interaction()

    if game:get_value("variable_to_save_tunic_2_given") == true then
        game:start_dialog("npc_donne_money_items.patrick.random")

    elseif game:get_value("player_paid_patrick_1") == true then
        game:start_dialog("npc_donne_money_items.patrick.reconnaissance", function()
            hero:start_treasure("tunic", 2, "variable_to_save_tunic_2_given", function()
                game:start_dialog("npc_donne_money_items.patrick.tunic")
            end)
        end)

    elseif game:get_value("player_refused_to_pay_patrick_1") == true then
        game:start_dialog("npc_donne_money_items.patrick.vous_etes_sur", function(answer)
            if answer == 1 then
                if not game:get_value("player_paid_patrick_1") then
                    game:remove_money(45)
                    game:set_value("player_paid_patrick_1", true)
                end
                game:start_dialog("npc_donne_money_items.patrick.merci")
            elseif answer == 2 then
                game:start_dialog("npc_donne_money_items.patrick.snif")
            end
        end)

    elseif game:get_value("received_money_from_Leo_2") == true and 
          game:get_value("received_money_from_Merik_2") == true and 
          game:get_value("received_gems_from_ronan_2") == true then
        game:start_dialog("npc_donne_money_items.patrick.question", function(answer)
            if answer == 1 then
                if not game:get_value("player_paid_patrick") then
                    game:remove_money(45)
                    game:set_value("player_paid_patrick_1", true)
                end
                game:start_dialog("npc_donne_money_items.patrick.merci")
            elseif answer == 2 then
                game:start_dialog("npc_donne_money_items.patrick.dommage")
                game:set_value("player_refused_to_pay_patrick_1", true)
            end
        end)

    else
        game:start_dialog("npc_donne_money_items.patrick.random")
    end
end