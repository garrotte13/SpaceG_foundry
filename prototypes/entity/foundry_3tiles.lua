require('util')
local futil = require("data-util")

local smoke_puddling_furnace = {}
local smoke_puddling_furnace_position_a = {0, -0.55}
local smoke_puddling_furnace_position_b = {0, -1.15}
local smoke_puddling_furnace_position_c = {0, -1.75}

smoke_puddling_furnace[1] = {}
smoke_puddling_furnace[1].name = "apm_dark_light_smoke"
smoke_puddling_furnace[1].deviation = {0.1, 0.1}
smoke_puddling_furnace[1].frequency = 4
smoke_puddling_furnace[1].north_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].south_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].east_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].west_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].starting_vertical_speed = 0.08
smoke_puddling_furnace[1].starting_frame_deviation = 60
smoke_puddling_furnace[1].slow_down_factor = 1
smoke_puddling_furnace[2] = {}
smoke_puddling_furnace[2].name = "apm_dark_light_smoke"
smoke_puddling_furnace[2].deviation = {0.1, 0.1}
smoke_puddling_furnace[2].frequency = 3.4
smoke_puddling_furnace[2].north_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].south_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].east_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].west_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].starting_vertical_speed = 0.08
smoke_puddling_furnace[2].starting_frame_deviation = 60
smoke_puddling_furnace[2].slow_down_factor = 1
smoke_puddling_furnace[3] = {}
smoke_puddling_furnace[3].name = "apm_dark_light_smoke"
smoke_puddling_furnace[3].deviation = {0.1, 0.1}
smoke_puddling_furnace[3].frequency = 2.8
smoke_puddling_furnace[3].north_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].south_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].east_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].west_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].starting_vertical_speed = 0.08
smoke_puddling_furnace[3].starting_frame_deviation = 60
smoke_puddling_furnace[3].slow_down_factor = 1

local trivial_smoke = function(opts)
	return
	{
	  type = "trivial-smoke",
	  name = opts.name,
	  duration = opts.duration or 600,
	  fade_in_duration = opts.fade_in_duration or 0,
	  fade_away_duration = opts.fade_away_duration or ((opts.duration or 600) - (opts.fade_in_duration or 0)),
	  spread_duration = opts.spread_duration or 600,
	  start_scale = opts.start_scale or 0.20,
	  end_scale = opts.end_scale or 1.0,
	  color = opts.color,
	  cyclic = true,
	  affected_by_wind = opts.affected_by_wind or true,
	  animation =
	  {
		width = 152,
		height = 120,
		line_length = 5,
		frame_count = 60,
		shift = {-0.53125, -0.4375},
		priority = "high",
		animation_speed = 0.25,
		filename = "__base__/graphics/entity/smoke/smoke.png",
		flags = { "smoke" }
	  }
	}
  end

data:extend({
    trivial_smoke{name = "apm_dark_light_smoke", color = {r = 0.32, g = 0.32, b = 0.32, a = 0.4}, duration=1000},

    {
      type = "assembling-machine",
      name = "foundry",
      fast_replaceable_group = "foundry",
      icon = "__bzfoundry__/graphics/icons/spaceG/apm_puddling_furnace.png",
      icon_size = 128,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "foundry"},
      max_health = 300,
      corpse = "big-remnants",
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = { filename = "__base__/sound/furnace.ogg" }
      },
      resistances =
      {
        {type = "impact", percent = 40},
        {
          type = "fire",
          percent = 90
        },

      },
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      crafting_categories = {"founding", futil.me.smelt() and "smelting" or nil},
      entity_info_icon_shift = {0, 0.4},
      energy_usage = "90kW",
      crafting_speed = 2,
      energy_source =
      {
        type = "burner",
        fuel_categories = {"chemical"},
        effectivity = 1,
        emissions_per_minute = 4,
        fuel_inventory_size = 1,
        light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}},
        smoke = smoke_puddling_furnace,
--[[    {
            {
                name = "apm_dark_light_smoke",
                deviation = {0.1, 0.1},
                frequency = 4,
                north_position = {0, -0.55},
                south_position = {0, -0.55},
                east_position = {0, -0.55},
                west_position = {0, -0.55},
                starting_vertical_speed = 0.08,
                starting_frame_deviation = 60,
                slow_down_factor = 1
            },
        }
        --]]
      },
      animation =
      {
        layers =
        {
          {
            filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/puddling_furnace_0.png",
            priority = "high",
            width = 160,
            height = 128,
            frame_count = 16,
            line_length = 8,
            shift = {0.4375, -0.28125},
            animation_speed = 0.133333335,
            hr_version =
            {
              filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/hr_puddling_furnace_0.png",
              priority = "high",
              width = 320,
              height = 256,
              frame_count = 16,
              line_length = 8,
              shift = {0.4375, -0.28125},
              animation_speed = 0.133333335,
              scale = 0.5
            }
          },

            {
              filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/puddling_furnace_shadow.png",
              priority = "high",
              draw_as_shadow = true,
              width = 160,
              height = 128,
              frame_count = 16,
              line_length = 8,
              shift = {0.4375, -0.28125},
              animation_speed = 0.133333335,
              hr_version =
              {
                filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/hr_puddling_furnace_shadow.png",
                priority = "high",
                draw_as_shadow = true,
                width = 320,
                height = 256,
                frame_count = 16,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 0.133333335,
                scale = 0.5
              }
            },
        },
      },
      idle_animation =
      {
          layers =
          {
            {
                filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/puddling_furnace_idle_0.png",
                priority = "high",
                width = 160,
                height = 128,
                frame_count = 16,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 0.133333335,
                hr_version =
                {
                  filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/hr_puddling_furnace_idle_0.png",
                  priority = "high",
                  width = 320,
                  height = 256,
                  frame_count = 16,
                  line_length = 8,
                  shift = {0.4375, -0.28125},
                  animation_speed = 0.133333335,
                  --animation_speed = 0.26666667,
                  scale = 0.5
                }
              },
              {
                filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/puddling_furnace_shadow.png",
                priority = "high",
                draw_as_shadow = true,
                width = 160,
                height = 128,
                frame_count = 16,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 0.133333335,
                hr_version =
                {
                  filename = "__bzfoundry__/graphics/entity/spaceG/foundry_chem/hr_puddling_furnace_shadow.png",
                  priority = "high",
                  draw_as_shadow = true,
                  width = 320,
                  height = 256,
                  frame_count = 16,
                  line_length = 8,
                  shift = {0.4375, -0.28125},
                  animation_speed = 0.133333335,
                  scale = 0.5
                }
              },
          }
      },

    },
  })