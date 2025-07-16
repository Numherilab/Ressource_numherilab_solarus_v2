--[[
Created by Max Mraz, licensed MIT
--]]

local charms_menu = require("scripts/menus/checkpoint/charms")
local level_menu = require("scripts/menus/level_up/level_up")

--Create Options
local options_list = {
  "leave",
  "charms",
  "level_up",
}

local allowed_objects = {}
for _, option in pairs(options_list) do
  local object = {}
  object.name = option
  object.text_config = {text_key = "menu.checkpoint." .. option}
  object.text_offset = {x = 16, y = 8}
  table.insert(allowed_objects, object)
end

local config = {
  origin = {x = 8, y = 50},
  background_offset = {x = 0, y = -6},
  grid_size = {columns=1, rows=3},
  cell_size = {width=128, height=18},
  cell_spacing = 4,
  edge_spacing = 4,
  background_9slice_config = {
    width = 160, height = 160,
  },
  --background_png = "menus/inventory/options_background.png",
  --cell_png = "menus/checkpoint/choice_cell.png",
  cursor_style = "menus/arrow",
  cursor_offset = {x=4, y=5},
  cursor_sound = "cursor",
}
config.allowed_objects = allowed_objects

local menu = require"scripts/menus/trillium_menu_lib/grid_menu".create(config)


function menu:exit()
  sol.menu.stop(self)
  local game = sol.main.get_game()
  game:set_suspended(false)
  game:get_hud():set_enabled(true)
  game:save()
end

menu:register_event("on_command_pressed", function(self, command)
  local handled = false
  if command == "confirm" then
    local selection = menu:get_selected_object().name
    menu:process_selection(selection)
    handled = true
  elseif command == "cancel" or command == "attack" or command == "pause" then
    menu:exit()
    handled = true
  end
  return handled
end)


function menu:process_selection(selection)
  local game = sol.main.get_game()
  if selection == "leave" then
    menu:exit()

  elseif selection == "charms" then
    sol.menu.stop(self)
    charms_menu.parent_menu = self
    sol.menu.start(game, charms_menu)

  elseif selection == "level_up" then
    sol.menu.stop(self)
    level_menu.parent_menu = self
    sol.menu.start(game, level_menu)

  elseif selection == "eyes" then
    --game:start_dialog("menus.transocculurgy.no_tools", function() end)
    --
    sol.menu.stop(self)
    eyes_menu.parent_menu = self
    sol.menu.start(game, eyes_menu)

  end
end


menu:register_event("on_started", function(self)
  menu:update_surface()
  local game = sol.main.get_game()
  game:set_suspended(true)
  game:get_hud():set_enabled(false)
end)



return menu