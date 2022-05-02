local util = require("data-util")

require("prototypes/categories")

if util.me.enable() then
  if util.me.carbon() == "coke" and mods["SpaceG"] then require("prototypes/entity/coke-plant") end
  require("prototypes/coke")
  require("prototypes/foundry")
  if mods["SpaceG"] then require("prototypes/entity/foundry_3tiles")  else require("prototypes/entity/foundry") end
  require("prototypes/entity/electric-foundry")
  --if mods["SpaceG"] then require("prototypes/entity/alt-electric-foundry")  else require("prototypes/entity/electric-foundry") end
end
