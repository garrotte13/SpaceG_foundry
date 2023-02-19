local smoke_burner = {}
local smoke_position = {0.32, -2.15}
smoke_burner[1] = {}
smoke_burner[1].name = "apm_dark_smoke"
smoke_burner[1].deviation = {0.1, 0.1}
smoke_burner[1].frequency = 10
smoke_burner[1].position = nil
smoke_burner[1].north_position = smoke_position
smoke_burner[1].south_position = smoke_position
smoke_burner[1].east_position = smoke_position
smoke_burner[1].west_position = smoke_position
smoke_burner[1].starting_vertical_speed = 0.08
smoke_burner[1].starting_frame_deviation = 60
smoke_burner[1].slow_down_factor = 1


data:extend({

	{
		type = "recipe",
		name = "y_crusher",
		--icon_size = 128, icon =  "__SpaceG__/graphics/apm_crusher_machine_2.png",
		enabled = "false",
		ingredients = {
      {"steel-plate", 5},
      {"iron-gear-wheel", 3},
      {"electronic-circuit", 4},
      {"stone-brick", 5},
      {"crusher_0", 1},
    },
		results=
		{
			{type="item", name="y_crusher", amount=1, }
		},
		-- subgroup = "y_line1",
	},

	{
		type = "item",
		name = "y_crusher",
		icon_size = 64, icon =  "__bzfoundry__/graphics/icons/crusher_icon.png",
    icon_mipmaps = 4,
--		group = "productivity",
		subgroup = "production-machine",
		order = "c1",
		place_result = "y_crusher",
		stack_size = 50,
	},

	{
		type = "recipe",
		name = "crusher_0",
		icon_size = 128, icon =  "__bzfoundry__/graphics/entity/apm_crusher_machine_0.png",
		enabled = "true",
		ingredients = {
      {"burner-mining-drill", 2},
      {"iron-gear-wheel", 3},
      {"copper-cable", 12},
      {"wood", 5},
      (data.raw.item["lead-plate"] and {"lead-plate", 5} or nil)
    },
		results=
		{
			{type="item", name="crusher_0", amount=1, }
		},
	},

	{
		type = "item",
		name = "crusher_0",
		icon_size = 128, icon =  "__bzfoundry__/graphics/entity/apm_crusher_machine_0.png",
		subgroup = "production-machine",
		order = "c0",
		place_result = "crusher_0",
		stack_size = 50,
	},


--[[
	{
		type = "assembling-machine",
		name = "y_crusher",
		icon_size = 32, icon =  "__SpaceG__/graphics/crusher33_icon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.5, mining_time = 1, result = "y_crusher"},
		max_health = 200,
		resistances = {{type = "physical",percent = 50}},
		collision_box = {{-1.2,-1.2},{1.2,1.2}},
		selection_box = {{-1.5,-1.5},{1.5,1.5}},
		animation = {
			filename = "__SpaceG__/graphics/crusher33_sheet.png",
			priority = "medium", width = 128, height = 128, frame_count = 12, shift = {0.5, 0}, animation_speed=0.5,
		},
        working_sound = {
            sound = {
                filename = "__SpaceG__/sounds/crusher.ogg",
                volume = 0.8,
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg" },
            max_sounds_per_type = 2,
        },

		crafting_categories = {"crushing"},
		crafting_speed = 1.5,
		energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions_per_minute = 3.0, },
		energy_usage = "250kW",
		ingredient_count = 1,
		module_specification =
		{
			module_slots = 2
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
	},
--]]

	{
		type = "furnace",
		name = "y_crusher",
		icon_size = 128, icon =  "__bzfoundry__/graphics/entity/apm_crusher_machine_2.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.5, mining_time = 0.7, result = "y_crusher"},
		max_health = 300,
        light = nil,
        collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
        selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
        entity_info_icon_shift = {0, 0.5},
        working_sound = {
            sound = {
            filename = "__bzfoundry__/sounds/crusher.ogg",
            volume = 0.6,
        },
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        max_sounds_per_type = 2,
        },
    crafting_categories = {"crushing"},
    crafting_speed = 4,
    energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions_per_minute = 2.5, },
    energy_usage = "280kW",
    source_inventory_size = 1,
    result_inventory_size = 2,
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
        layers =
        {
          {
            filename = "__bzfoundry__/graphics/entity/crusher_apm/crusher_2.png",
            priority = "high",
            width = 160,
            height = 128,
            frame_count = 32,
            line_length = 8,
            scale = 1.3334,
            shift = {0.5615, -0.70125},
            animation_speed = 0.666667,
            hr_version =
            {
              filename = "__bzfoundry__/graphics/entity/crusher_apm/hr_crusher_2.png",
              priority = "high",
              width = 320,
              height = 256,
              frame_count = 32,
              line_length = 8,
              --shift = {0.4375, -0.28125},
              shift = {0.5615, -0.70125},
              animation_speed = 0.666667,
              scale = 0.6667
            }
          },

            {
              filename = "__bzfoundry__/graphics/entity/crusher_apm/crusher_shadow_electric.png",
              priority = "high",
              draw_as_shadow = true,
              width = 160,
              height = 128,
              frame_count = 32,
              line_length = 8,
              shift = {0.5615, -0.70125},
              animation_speed = 0.666667,
              scale = 1.3334,
              hr_version =
              {
                filename = "__bzfoundry__/graphics/entity/crusher_apm/hr_crusher_shadow_electric.png",
                priority = "high",
                draw_as_shadow = true,
                width = 320,
                height = 256,
                frame_count = 32,
                line_length = 8,
                shift = {0.5615, -0.70125},
                animation_speed = 0.666667,
                scale = 0.6667
              }
            },
        },
    },

  },

    {
      type = "furnace",
      --type = "assembling-machine",
      name = "crusher_0",
      icon_size = 128, icon =  "__bzfoundry__/graphics/entity/apm_crusher_machine_0.png",
      flags = {"placeable-neutral","player-creation"},
      minable = {hardness = 0.5, mining_time = 0.5, result = "crusher_0"},
      max_health = 250,
          light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}} ,
          collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
          selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
          entity_info_icon_shift = {0, 0.4},
          working_sound = {
              sound = {
              filename = "__base__/sound/burner-mining-drill.ogg",
              volume = 0.8,
          },
          idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
          max_sounds_per_type = 2,
          },
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      crafting_categories = {"crushing"},
      crafting_speed = 2,
      energy_source = {
        type = "burner",
        fuel_categories = {"chemical"},
        emissions_per_minute = 4,
        effectivity = 1,
        fuel_inventory_size = 1,
        smoke = smoke_burner
      },
      energy_usage = "90kW",
      source_inventory_size = 1,
      result_inventory_size = 1,
      module_specification = nil,
      animation =
      {
          layers =
          {
            {
              filename = "__bzfoundry__/graphics/entity/crusher_apm/crusher_0.png",
              priority = "high",
              width = 160,
              height = 128,
              frame_count = 32,
              line_length = 8,
              shift = {0.4375, -0.28125},
              animation_speed = 1.0666667,
              hr_version =
              {
                filename = "__bzfoundry__/graphics/entity/crusher_apm/hr_crusher_0.png",
                priority = "high",
                width = 320,
                height = 256,
                frame_count = 32,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 1.0666667,
                scale = 0.5
              }
            },
          
            {

                filename = "__bzfoundry__/graphics/entity/crusher_apm/crusher_shadow.png",
                priority = "high",
                draw_as_shadow = true,
                width = 160,
                height = 128,
                frame_count = 32,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 1.0666667,
                hr_version =
                {
                  filename = "__bzfoundry__/graphics/entity/crusher_apm/hr_crusher_shadow.png",
                  priority = "high",
                  draw_as_shadow = true,
                  width = 320,
                  height = 256,
                  frame_count = 32,
                  line_length = 8,
                  shift = {0.4375, -0.28125},
                  animation_speed = 1.0666667,
                  scale = 0.5
                }
            },

          }
      },

    },

})