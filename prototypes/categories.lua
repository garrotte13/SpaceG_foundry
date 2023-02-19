local util = require("data-util")
if util.me.carbon() == "coke" and not data.raw.item["coke"] then
  data:extend({
    { type = "recipe-category", name = "coking"}
  })
end
data:extend({
  { type = "recipe-category", name = "founding"},
  { type = "item-subgroup", name = "founding-machines", group = "production"},
  { type = "item-subgroup", name = "foundry-intermediate", group = "intermediate-products"},
  { type = "recipe-category", name = "crushing" },

})
