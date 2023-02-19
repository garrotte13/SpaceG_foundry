require("foundry-updates")
require("refractory-updates")

if mods["bzzirconium"] then
    for _, e in pairs(data.raw["simple-entity"]) do
        if (e.subgroup == "grass" or e.subgroup == "wrecks") and e.name:match("rock%-") then
            local adjusted_max = e.name:match("huge") and 6 or 3
            local adjusted_min = e.name:match("huge") and 2 or 1
            if data.raw["simple-entity"] and data.raw["simple-entity"][e.name] and data.raw["simple-entity"][e.name].minable then
                if data.raw["simple-entity"][e.name].minable.results then
                    for i, component in pairs(data.raw["simple-entity"][e.name].minable.results) do
                        for _, value in pairs(component) do
                         if value == "zircon" then
                            data.raw["simple-entity"][e.name].minable.results[i] = {name="zircon", amount_min=adjusted_min, amount_max=adjusted_max}
                            break
                         end
                        end
                    end
                end
            end
        end
    end

end
