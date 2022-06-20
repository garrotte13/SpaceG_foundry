local util = require("data-util")

if util.me.carbon() == "coke" and not data.raw.item["coke"] then
data:extend({
  {
    type = "item",
    name = "coke",
    icon = "__bzfoundry__/graphics/icons/coke-icon.png",
    icon_size = 128,
    pictures = {
      {size = 128, filename = "__bzfoundry__/graphics/icons/coke.png",   scale = 0.125},
      {size = 128, filename = "__bzfoundry__/graphics/icons/coke-1.png", scale = 0.125},
      {size = 128, filename = "__bzfoundry__/graphics/icons/coke-2.png", scale = 0.125},
      {size = 128, filename = "__bzfoundry__/graphics/icons/coke-3.png", scale = 0.125},
    },
    fuel_category = "chemical",
    fuel_value = "7.95MJ",
    fuel_emissions_multiplier = settings.startup["rampant-industry--enableFuelEmissions"] and settings.startup["rampant-industry--enableFuelEmissions"].value and 2 or 1,
    fuel_acceleration_multiplier = 1.1,
    fuel_top_speed_multiplier = 1,
    subgroup = "raw-material",
    order = "c[coke]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "coke",
    icon = "__bzfoundry__/graphics/icons/coke-icon.png",
    icon_size = 128,
    results =
    {
      {name="coke", amount=1},
    },
    category = "coking",
    ingredients = {{"coal", 2}},
    subgroup = "raw-material",
    order = "c[coke]",
    energy_required = 3.2,
    enabled=false,
  },
})
if mods["Warmonger"] then table.insert( data.raw.recipe["coke"].results, {name="wm-bio-remains", amount=1, probability=.05}) end

elseif util.me.carbon() == "solid-fuel" then
data:extend({
  {
    type = "recipe",
    name = "solid-fuel-from-coal",
    result = "solid-fuel",
    category = "founding",
    ingredients = {{"coal", 4}},
    energy_required = 3.2,
    enabled=false,
  },
})
end
