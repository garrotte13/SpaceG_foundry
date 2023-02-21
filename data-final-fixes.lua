local util = require("data-util")

-- Prevent production deadlock
if mods.Bio_Industries then
  util.remove_ingredient("foundry", "silica")
end



if data.raw.item["coke"] and not mods.Krastorio2 then
  if deadlock then
    deadlock.add_stack("coke", nil, "deadlock-stacking-1")
  end
  if deadlock_crating then
    deadlock_crating.add_crate("coke", "deadlock-crating-1")
  end
end

local c_recipe
local resource_autoplace = require('resource-autoplace');

if mods["bztungsten"] then
  -- Fixing piercing bullets ---
  c_recipe = data.raw.recipe["piercing-rounds-magazine"]
  for i, component in pairs(c_recipe.ingredients) do
   for _, value in pairs(component) do
    if value == "tungsten-plate" then
     c_recipe.ingredients[i] = {type="item", name="tungsten-plate", amount=1}
     break
    end
   end
  end
  table.insert(c_recipe.ingredients, {type="item", name="copper-plate", amount=4})
  c_recipe = data.raw.recipe["piercing-shotgun-shell"]
  for i, component in pairs(c_recipe.ingredients) do
   for _, value in pairs(component) do
    if value == "tungsten-plate" then
     c_recipe.ingredients[i] = {type="item", name="tungsten-plate", amount=1}
     break
    end
   end
  end
  table.insert(c_recipe.ingredients, {type="item", name="copper-plate", amount=4})
-- End fixing piercing bullets ---

  if settings.startup["bzsilicon-more-intermediates"] and settings.startup["bzsilicon-more-intermediates"].value == "more" then
    -- don't change anything
  else
    util.replace_some_ingredient("laser-turret", "steel-plate", 4, "tungsten-plate", 6)
  end

--[[ ATTEMPT TO SHORT COMPONENTS LIST OF midgame assemblers didn't look fun, but Electric Furnace recipe is really horrible
  c_recipe = data.raw.recipe["electric-furnace"]
  for i, component in pairs(c_recipe.ingredients) do
    for _, value in pairs(component) do
     if value == "tungsten-carbide" then
      c_recipe.ingredients[i] = {type="item", name="tungsten-carbide", amount=3}
      break
     end
    end
   end
   for i, component in pairs(c_recipe.ingredients) do
    for _, value in pairs(component) do
     if value == "tungsten-plate" then
      table.remove(c_recipe.ingredients, i)
      break
     end
    end
   end

   c_recipe = data.raw.recipe["chemical-plant"]
   for i, component in pairs(c_recipe.ingredients) do
     for _, value in pairs(component) do
      if value == "tungsten-plate" then
       c_recipe.ingredients[i] = {type="item", name="tungsten-plate", amount=6}
       break
      end
     end
    end
    for i, component in pairs(c_recipe.ingredients) do
     for _, value in pairs(component) do
      if value == "tungsten-carbide" then
       table.remove(c_recipe.ingredients, i)
       break
      end
     end
    end
--]]

    table.insert(data.raw.recipe["fire-torch-parts"].ingredients, {type="item", name="tungsten-plate", amount=2})
    table.insert(data.raw.technology["flamethrower"].effects, { type = "unlock-recipe", recipe = "fire-torch-parts"})
    table.insert(data.raw.recipe["tank"].normal.ingredients, {type="item", name="fire-torch-parts", amount=2})

    c_recipe = data.raw.recipe["flamethrower-turret"]
    for i, component in pairs(c_recipe.ingredients) do
     for _, value in pairs(component) do
      if value == "pipe" then c_recipe.ingredients[i] = {type="item", name="fire-torch-parts", amount=2}
        elseif value == "tungsten-plate" then c_recipe.ingredients[i] = {type="item", name="stone-brick", amount=5}
          elseif value == "steel-plate" then c_recipe.ingredients[i] = {type="item", name="steel-plate", amount=25}
      end
     end
    end
    
     c_recipe = data.raw.recipe["flamethrower"]
     for i, component in pairs(c_recipe.ingredients) do
      for _, value in pairs(component) do
       if value == "tungsten-plate" then
        c_recipe.ingredients[i] = {type="item", name="fire-torch-parts", amount=1}
        break
       end
      end
     end

     -- ***** Changing Recipe for Advanced FlameThrower Turret - better be DIVIDED into TWO parts - tungsten-dependent and general part
     c_recipe = data.raw.recipe["suppression-cannon-item-rampant-arsenal"]
     c_recipe.category = "advanced-crafting"
     for i, component in pairs(c_recipe.normal.ingredients) do
      for _, value in pairs(component) do
       if value == "steel-plate" then c_recipe.normal.ingredients[i] = {type="item", name="flamethrower-turret", amount=2}
         elseif value == "engine-unit" then c_recipe.normal.ingredients[i] = {type="item", name="fire-torch-parts", amount=3}
           elseif value == "tungsten-plate" then c_recipe.normal.ingredients[i] = {type="item", name="tungsten-plate", amount=12}
            elseif value == "concrete" then c_recipe.normal.ingredients[i] = {type="item", name="concrete", amount=20}
       end
      end
     end
     -- ***** End of Advanced FlameThrower Turret change.

     if mods["bzzirconium"] then     -- ***** Changing Recipes for Electric and Steel Furnaces, Zirconium processing *****
      c_recipe = data.raw.recipe["electric-furnace"]
      c_recipe.category = "advanced-crafting"
      c_recipe.energy_required = c_recipe.energy_required * 2
      c_recipe.result_count = 2
      for i, component in pairs(c_recipe.ingredients) do
        for _, value in pairs(component) do
         if value == "zirconia" then
          table.remove(c_recipe.ingredients, i)
          break
         end
        end
       end
       for i, component in pairs(c_recipe.ingredients) do
        for _, value in pairs(component) do
         if value == "stone-brick" then
          table.remove(c_recipe.ingredients, i)
          break
         end
        end
       end
      for i, ingredient in pairs(c_recipe.ingredients) do
        if ingredient.name then
          ingredient.amount = ingredient.amount * 2
        end
        if ingredient[1] then ingredient[2] = ingredient[2] * 2 end
      end

      for i, component in pairs(c_recipe.ingredients) do
        for _, value in pairs(component) do
          if value == "steel-plate" then
            c_recipe.ingredients[i] = {type="item", name="steel-furnace", amount=1}
            break
          end
        end
      end

      c_recipe = data.raw.recipe["steel-furnace"]
      for i, component in pairs(c_recipe.ingredients) do
        for _, value in pairs(component) do
         if value == "steel-plate" then c_recipe.ingredients[i] = {type="item", name="steel-plate", amount=10}
           elseif value == "stone-brick" then c_recipe.ingredients[i] = {type="item", name="stone-brick", amount=10}
             elseif value == "zircon" then c_recipe.ingredients[i] = {type="item", name="zirconia", amount=10}
         end
        end
      end

      c_recipe = data.raw.technology["advanced-material-processing-2"]
      for i, preq in pairs(c_recipe.prerequisites) do
        if preq == "zirconia-processing" then
          table.remove(c_recipe.prerequisites, i)
          break
        end
      end

      c_recipe = data.raw.technology["zirconia-processing"]
      for i, preq in pairs(c_recipe.prerequisites) do
        if preq == "automation-2" then
          c_recipe.prerequisites[i] = "logistic-science-pack"
          break
        end
      end

      c_recipe = data.raw.technology["advanced-material-processing"]
      for i, preq in pairs(c_recipe.prerequisites) do
        if preq == "logistic-science-pack" then
          c_recipe.prerequisites[i] = "zirconia-processing"
          break
        end
      end


     end -- ***** END of furnaces recipe change *****

end


if mods["bzsilicon"] then
  local sil = data.raw.recipe["silica"]
  sil.category = "crushing"
  sil.normal.ingredients[1] = {type="item", name="stone", amount=2}
  sil.normal.result_count = nil
  sil.normal.result = nil
  sil.normal.results = {
    { type = "item", name = "silica", amount_min = 4, amount_max = 6 },
  }
  data.raw.recipe["stone-brick"].ingredients = {{type="item", name="silica", amount=5}}
  table.insert(data.raw.recipe["red-wire"].ingredients, {type="item", name="electronic-circuit", amount=1})
  table.insert(data.raw.recipe["green-wire"].ingredients, {type="item", name="electronic-circuit", amount=1})
  table.insert(data.raw.recipe["low-density-structure"].normal.ingredients, {type="item", name="copper-plate", amount=12})

  table.insert(data.raw.recipe["repair-pack"].ingredients, {type="item", name="silica", amount=3})

  table.insert(data.raw.recipe["substation"].ingredients, {type="item", name="cermet", amount=5})
  table.insert(data.raw.technology["electric-energy-distribution-2"].prerequisites, "cermet")

  if settings.startup["bzsilicon-more-intermediates"].value == "yes" or settings.startup["bzsilicon-more-intermediates"].value == "more" then
    -- ***** fixing solar cells balance
    util.set_ingredient("solar-panel-equipment", "solar-cell", 5)
    util.set_ingredient("solar-panel", "solar-cell", 10)

  -- ***** fixing wafers balance (removing hard earned sulphuric acid)
    util.set_ingredient("advanced-circuit", "electronic-circuit", 6) -- put back 2 green circuits per red one
    c_recipe = data.raw.recipe["silicon-wafer"].ingredients
    for i, component in pairs(c_recipe) do
      for _, value in pairs(component) do
        if value == "sulfuric-acid" then
          c_recipe[i] = {type="fluid", name="water", amount=50}    -- replace expensive strong acid by simple water
          break
        end
      end
    end
  end

  if settings.startup["bzsilicon-more-intermediates"].value == "more" then
    util.add_ingredient("advanced-tank-vehicle-rampant-arsenal", "gyro", 2)
    util.add_ingredient("advanced-car-vehicle-rampant-arsenal", "gyro", 2)
    util.add_ingredient("nuclear-train-vehicle-rampant-arsenal", "gyro", 2)
  end
end

if mods["bztitanium"] then
  c_recipe = data.raw.recipe["low-density-structure"]
 for i, component in pairs(c_recipe.normal.ingredients) do
  for _, value in pairs(component) do
    if value == "titanium-plate" then c_recipe.normal.ingredients[i] = {type="item", name="titanium-plate", amount=4}
      elseif value == "cermet" then c_recipe.normal.ingredients[i] = {type="item", name="cermet", amount=15}
    end
  end
 end
 c_recipe = data.raw.recipe["cermet"]
 for i, component in pairs(c_recipe.ingredients) do
  for _, value in pairs(component) do
   if value == "titanium-plate" then
    table.remove(c_recipe.ingredients, i)
    break
   end
  end
 end

 if mods["TurretPod"] then
  table.insert(data.raw.recipe["turret-pod-gun-t1-empty-equipment"].ingredients, {type="item", name="titanium-plate", amount=15})
  table.insert(data.raw.recipe["turret-pod-gun-t2-empty-equipment"].ingredients, {type="item", name="titanium-plate", amount=10})
  table.insert(data.raw.recipe["turret-pod-flame-t1-empty-equipment"].ingredients, {type="item", name="titanium-plate", amount=15})
  table.insert(data.raw.recipe["turret-pod-shotgun-t1-empty-equipment"].ingredients, {type="item", name="titanium-plate", amount=15})
  table.insert(data.raw.recipe["turret-pod-shotgun-t2-empty-equipment"].ingredients, {type="item", name="titanium-plate", amount=10})
 end
  if mods["SchallSuit"] then
    c_recipe = data.raw.recipe["Schall-engineering-suit-mk1"]
    for i, component in pairs(c_recipe.ingredients) do
      for _, value in pairs(component) do
       if value == "steel-plate" then
        c_recipe.ingredients[i] = {type="item", name="titanium-plate", amount=30}
        break
       end
      end
     end
     c_recipe = data.raw.recipe["Schall-engineering-suit-mk2"]
     for i, component in pairs(c_recipe.ingredients) do
      for _, value in pairs(component) do
       if value == "processing-unit" then
        c_recipe.ingredients[i] = {type="item", name="processing-unit", amount=20}
        break
       end
      end
     end
     for i, component in pairs(c_recipe.ingredients) do
      for _, value in pairs(component) do
       if value == "electric-engine-unit" then
        c_recipe.ingredients[i] = {type="item", name="electric-engine-unit", amount=20}
        break
       end
      end
     end
     table.insert(c_recipe.ingredients, {type="item", name="Schall-engineering-suit-mk1", amount=1})
     --table.insert(c_recipe.ingredients, {type="item", name="titanium-plate", amount=10})
  end

end

if mods["bzzirconium"] then

  table.insert(data.raw.recipe["y_crusher"].ingredients, {type="item", name="zirconium-plate", amount=10})
  table.insert(data.raw.recipe["stack-inserter"].ingredients, {type="item", name="zirconium-plate", amount=3})
  table.insert(data.raw.recipe["car"].ingredients, {type="item", name="zirconium-plate", amount=10})
  table.insert(data.raw.recipe["tank"].normal.ingredients, {type="item", name="zirconium-plate", amount=30})
  table.insert(data.raw.recipe["locomotive"].ingredients, {type="item", name="zirconium-plate", amount=50})
  table.insert(data.raw.recipe["cargo-wagon"].ingredients, {type="item", name="zirconium-plate", amount=20})
  table.insert(data.raw.recipe["fluid-wagon"].ingredients, {type="item", name="zirconium-plate", amount=20})
  table.insert(data.raw.recipe["artillery-wagon"].ingredients, {type="item", name="zirconium-plate", amount=20})
  table.insert(data.raw.recipe["vehicle-wagon"].ingredients, {type="item", name="zirconium-plate", amount=20})

  table.insert(data.raw.recipe["defender-capsule"].ingredients, {type="item", name="zirconium-plate", amount=1})

  data.raw.resource["zircon"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "zircon",
    order = "b-z",
    base_density = 4,
    has_starting_area_placement = true,
    regular_rq_factor_multiplier = 1.1,
    starting_rq_factor_multiplier = 1.2,
  }

  c_recipe = data.raw.recipe["repair-capsule-rampant-arsenal"]
  for i, component in pairs(c_recipe.normal.ingredients) do
   for _, value in pairs(component) do
    if value == "steel-plate" then
     c_recipe.normal.ingredients[i] = {type="item", name="zirconia", amount=5}
     break
    end
   end
  end
  c_recipe = data.raw.recipe["gun-item-rampant-arsenal"]
  for i, component in pairs(c_recipe.normal.ingredients) do
   for _, value in pairs(component) do
    if value == "steel-plate" then
     c_recipe.normal.ingredients[i] = {type="item", name="steel-plate", amount=12}
     break
    end
   end
  end
  table.insert(c_recipe.normal.ingredients, {type="item", name="zirconium-plate", amount=10})

  c_recipe = data.raw.recipe["advanced-beam-item-rampant-arsenal"]
  for i, component in pairs(c_recipe.normal.ingredients) do
    for _, value in pairs(component) do
     if value == "steel-plate" then
      c_recipe.normal.ingredients[i] = {type="item", name="titanium-plate", amount=10}
      break
     end
    end
  end
  table.insert(c_recipe.normal.ingredients, {type="item", name="zirconium-plate", amount=10})

  if mods["bztungsten"] then table.insert(data.raw.recipe["fire-torch-parts"].ingredients, {type="item", name="zirconia", amount=20}) end

end

if mods["bzlead"] then
  c_recipe = data.raw.recipe["firearm-magazine"]
  for i, component in pairs(c_recipe.ingredients) do
   for _, value in pairs(component) do
    if value == "lead-plate" then
     c_recipe.ingredients[i] = {type="item", name="lead-plate", amount=3}
     break
    end
   end
  end
  table.insert(c_recipe.ingredients, {type="item", name="copper-plate", amount=1})

  data.raw.recipe["lead-plate"].normal.results = {
    {type="item", name = "lead-plate", amount=2, probability=0.9},
    {type="item", name = "copper-ore", amount=1, probability=0.2},
  }

  util.multiply_recipe("pipe", 2)
  c_recipe = data.raw.recipe["pipe"].normal.ingredients
  for i, component in pairs(c_recipe) do
    for _, value in pairs(component) do
     if value == "lead-plate" then
      c_recipe[i] = {type="item", name="lead-plate", amount=1}
      break
     end
    end
   end
   table.insert(c_recipe, {type="item", name="iron-plate", amount=1})

   c_recipe = data.raw.recipe["battery"].normal.ingredients
   for i, component in pairs(c_recipe) do
    for _, value in pairs(component) do
     if value == "copper-plate" then
      table.remove(c_recipe, i)
      break
     end
    end
   end
   for i, component in pairs(c_recipe) do
     for _, value in pairs(component) do
      if value == "lead-plate" then
       c_recipe[i] = {type="item", name="lead-plate", amount=2}
       break
      end
     end
   end
   table.insert(data.raw.recipe["nuclear-fuel-reprocessing"].results, {"lead-plate", 1})
   table.insert(data.raw.recipe["uranium-processing"].results, {name = "lead-ore", amount=2, probability=.05})
   


end