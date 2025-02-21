local gui = require("gui")

local Settings = {}

local settings = {
   enabled = false,
   -- armors_toggle = false,
   isArmor = false ,
   behavior = 0,
   rarity = 0,
   distance = 2,
   skip_dropped = false,
   loot_priority = 0,
   ga_count = 0,
   unique_ga_count = 0,
   uber_unique_ga_count = 0,
   quest_items = false,
   crafting_items = false,
   cinders = false,
   boss_items = false,
   rare_elixirs = false,
   advanced_elixirs = false,
   sigils = false,
   event_items = true,
   legendary_amulet_ga_count = nil,
   legendary_ring_ga_count = nil,
   unique_amulet_ga_count = nil,
   legendary_helm_ga_count = nil,
   legendary_chest_ga_count = nil,
   legendary_gloves_ga_count = nil,
   legendary_boots_ga_count = nil,
   draw_wanted_items = false
}

function Settings.update()
   settings = {
      enabled = gui.elements.main_toggle:get(),

      -- General Settings
      behavior = gui.elements.general.behavior_combo:get(),
      rarity = gui.elements.general.rarity_combo:get(),
      distance = gui.elements.general.distance_slider:get(),
      skip_dropped = gui.elements.general.skip_dropped_toggle:get(),
      loot_priority = gui.elements.general.loot_priority_combo:get(),

      -- Affix Settings
      ga_count = gui.elements.affix_settings.greater_affix_slider:get(),
      unique_ga_count = gui.elements.affix_settings.unique_greater_affix_slider:get(),
      uber_unique_ga_count = gui.elements.affix_settings.uber_unique_greater_affix_slider:get(),
      legendary_amulet_ga_count = gui.elements.affix_settings.legendary_amulet_slider:get(),
      unique_amulet_ga_count = gui.elements.affix_settings.unique_amulet_slider:get(),
      legendary_ring_ga_count = gui.elements.affix_settings.legendary_ring_slider:get(),
      
      -- Armors Settings
      -- armors_toggle = gui.elements.affix_settings.armors_toggle:get(),
      legendary_helm_ga_count = gui.elements.affix_settings.legendary_helm_slider:get(),
      legendary_chest_ga_count = gui.elements.affix_settings.legendary_chest_slider:get(),
      legendary_gloves_ga_count = gui.elements.affix_settings.legendary_gloves_slider:get(),
      legendary_pants_ga_count = gui.elements.affix_settings.legendary_pants_slider:get(),
      legendary_boots_ga_count = gui.elements.affix_settings.legendary_boots_slider:get(),

      -- Item Types
      quest_items = gui.elements.item_types.quest_items_toggle:get(),
      crafting_items = gui.elements.item_types.crafting_items_toggle:get(),
      boss_items = gui.elements.item_types.boss_items_toggle:get(),
      rare_elixirs = gui.elements.item_types.rare_elixir_items_toggle:get(),
      advanced_elixirs = gui.elements.item_types.advanced_elixir_items_toggle:get(),
      sigils = gui.elements.item_types.sigil_items_toggle:get(),
      cinders = gui.elements.item_types.cinders_toggle:get(),
      event_items = gui.elements.item_types.event_items_toggle:get(),

      -- Debug
      draw_wanted_items = gui.elements.debug.draw_wanted_toggle:get()
   }
end

function Settings.get()
   return settings
end

function Settings.should_execute()
   return settings.behavior == 0 or
       (settings.behavior == 1 and orbwalker.get_orb_mode() == orb_mode.clear)
end

return Settings