--[[
    signs_road mod for Minetest - Various road signs with text displayed
    on.
    (c) Pierre-Yves Rollo

    This file is part of signs_road.

    signs_road is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    signs_road is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with signs_road.  If not, see <http://www.gnu.org/licenses/>.
--]]

local S = signs_road.intllib

local models = {
	blue_street_sign = {
		depth = 1/16,
		width = 14/16,
		height = 12/16,
		entity_fields = {
			size = { x = 14/16, y = 10/16 },
			maxlines = 3,
			color = "#fff",
		},
		node_fields = {
			description = S("Blue street sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_blue_1.png" },
			inventory_image = "signs_road_blue_1.png",
		},
	},
	red_street_sign = {
		depth = 1/16,
		width = 1,
		height = 7/16,
		entity_fields = {
			size = { x = 1, y = 4/16 },
			maxlines = 1,
			color = "#000",
		},
		node_fields = {
			description = S("Red and white town sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_red_white.png" },
			inventory_image="signs_road_red_white.png",
		},
	},
	white_street_sign = {
		depth = 1/16,
		width = 1,
		height = 7/16,
		entity_fields = {
			size = { x = 1, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("White street sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_white.png" },
			inventory_image = "signs_road_white.png",
		},
	},
	green_street_sign = {
		depth = 1/16,
		width = 1,
		height = 7/16,
		entity_fields = {
			size = { x = 1, y = 6/16 },
			maxlines = 2,
			color = "#fff",
		},
		node_fields = {
			description = S("Green street sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_green.png" },
			inventory_image = "signs_road_green.png",
		},
	},
	yellow_street_sign = {
		depth = 1/16,
		width = 1,
		height = 7/16,
		entity_fields = {
			size = { x = 1, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("Yellow street sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_yellow.png" },
			inventory_image="signs_road_yellow.png",
		},
	},
	black_right_sign = {
		depth = 1/32,
		width = 1,
		height = 0.5,
		entity_fields = {
			aspect_ratio = 3/4,
			size = { x = 1, y = 3/16 },
			maxlines = 1,
			color = "#000",
		},
		node_fields = {
			description = S("Black direction sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_black_dir_right.png" },
			inventory_image = "signs_road_black_dir_inventory.png",
			signs_other_dir = "signs_road:black_left_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
		},
	},
	black_left_sign = {
		depth = 1/32,
		width = 1,
		height = 0.5,
		entity_fields = {
			aspect_ratio = 3/4,
			size = { x = 1, y = 3/16 },
			maxlines = 1,
			color = "#000",
		},
		node_fields = {
			description = S("Black direction sign"),
			tiles = { "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_sides.png",
			          "signs_road_sides.png", "signs_road_black_dir_left.png" },
			inventory_image = "signs_road_black_dir_inventory.png",
			signs_other_dir = "signs_road:black_right_sign",
			groups = { not_in_creative_inventory = 1 },
			drop = "signs_road:black_right_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
		},
	},

	green_right_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = -3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color = "#fff",
		},
		node_fields = {
			description = S("Green direction sign"),
			tiles = { "signs_road_green_direction.png" },
			inventory_image = "signs_road_green_dir_inventory.png",
			signs_other_dir = "signs_road:green_left_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_right.obj",
			selection_box = { type = "fixed", fixed = { -0.5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -0,5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
		},
	},
	green_left_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = 3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color="#fff",
		},
		node_fields = {
			description = S("Green direction sign"),
			tiles = { "signs_road_green_direction.png" },
			inventory_image = "signs_road_green_dir_inventory.png",
			signs_other_dir = "signs_road:green_right_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_left.obj",
			selection_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			groups = { not_in_creative_inventory = 1 },
			drop = "signs_road:green_right_sign",
		},
	},
	yellow_right_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = -3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("Yellow direction sign"),
			tiles = { "signs_road_yellow_direction.png" },
			inventory_image = "signs_road_yellow_dir_inventory.png",
			signs_other_dir = "signs_road:yellow_left_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_right.obj",
			selection_box = { type = "fixed", fixed = { -0.5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -0,5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
		},
	},
	yellow_left_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = 3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("Yellow direction sign"),
			tiles = { "signs_road_yellow_direction.png" },
			inventory_image = "signs_road_yellow_dir_inventory.png",
			signs_other_dir = "signs_road:yellow_right_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_left.obj",
			selection_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			groups = { not_in_creative_inventory = 1 },
			drop = "signs_road:yellow_right_sign",
		},
	},
	white_right_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = -3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("White direction sign"),
			tiles = { "signs_road_white_direction.png" },
			inventory_image = "signs_road_white_dir_inventory.png",
			signs_other_dir = "signs_road:white_left_sign",
			on_place = signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_right.obj",
			selection_box = { type = "fixed", fixed = { -0.5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -0,5, -7/32, 0.5, 7/16, 7/32, 7/16 } },
		},
	},
	white_left_sign = {
		depth = 1/16,
		width = 14/16,
		height = 7/16,
		entity_fields = {
			right = 3/32,
			size = { x = 12/16, y = 6/16 },
			maxlines = 2,
			color = "#000",
		},
		node_fields = {
			description = S("White direction sign"),
			tiles = { "signs_road_white_direction.png" },
			inventory_image = "signs_road_white_dir_inventory.png",
			signs_other_dir = "signs_road:white_right_sign",
			on_place=signs_api.on_place_direction,
			on_rightclick = signs_api.on_right_click_direction,
			drawtype = "mesh",
			mesh = "signs_dir_left.obj",
			selection_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			collision_box = { type = "fixed", fixed = { -7/16, -7/32, 0.5, 0.5, 7/32, 7/16 } },
			groups = { not_in_creative_inventory = 1 },
			drop = "signs_road:white_right_sign",
		},
	},
}

-- Node registration
for name, model in pairs(models)
do
	signs_api.register_sign("signs_road", name, model)
end

local bannercolor = {
	{"black", "Black"},
	{"red", "Red"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},
	{"brown", "Brown"},
	{"white", "White"},
 	{"yellow", "Yellow"},
	{"grey", "Grey"},
}

local color = {
	{"black", "Black"},
	{"red", "Red"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},
	{"brown", "Brown"},
}

local color_blacktext = {
	{"white", "White"},
 	{"yellow", "Yellow"},
	{"grey", "Grey"},
}

for _, color in pairs(color) do

	local models_color = {
		[("large_street_sign_" .. color[1])] = {
		  depth = 1/16,
		  width = 64/16,
		  height = 12/16,
		  entity_fields = {
		    resolution = { x = 2.5, y = 1.5 },
		    maxlines = 1,
		    color = "#FFFFFF",
		  },
		  node_fields = {
		     visual_scale = 1,
		    description = color[2] .. " Street Banner",
		    tiles = {"baked_clay_" .. color[1] ..".png"},
		    inventory_image = "signs_road_" .. color[1] ..".png",
				groups = {large_banner = 1},
		  },
		},
	}

	for name, model in pairs(models_color) do
	signs_api.register_sign("signs_road", name, model)
	end
end

for _, color_blacktext in pairs(color_blacktext) do
	local models_colorblacktext = {
		[("large_street_sign_" .. color_blacktext[1])] = {
			depth = 1/16,
			width = 64/16,
			height = 12/16,
			entity_fields = {
				resolution = { x = 2.5, y = 1.5 },
				maxlines = 1,
				color = "#000000",
			},
			node_fields = {
				 visual_scale = 1,
				description = color_blacktext[2] .. " Street Banner",
				tiles = {"baked_clay_" .. color_blacktext[1] ..".png"},
				inventory_image = "signs_road_" .. color_blacktext[1] ..".png",
				groups = {large_banner = 1},
			},
		},
	}

	for name, model in pairs(models_colorblacktext) do
	signs_api.register_sign("signs_road", name, model)
	end
end


for _, color in pairs(color) do

	local models_color = {
		[("large_street_sign_" .. color[1])] = {
		  depth = 1/16,
		  width = 64/16,
		  height = 12/16,
		  entity_fields = {
		    resolution = { x = 2.5, y = 1.5 },
		    maxlines = 1,
		    color = "#FFFFFF",
		  },
		  node_fields = {
		     visual_scale = 1,
		    description = color[2] .. " Street Banner",
		    tiles = {"baked_clay_" .. color[1] ..".png"},
		    inventory_image = "signs_road_" .. color[1] ..".png",
				groups = {large_banner = 1},
		  },
		},
	}

	for name, model in pairs(models_color) do
	signs_api.register_sign("signs_road", name, model)
	end
end

for _, color_blacktext in pairs(color_blacktext) do
	local models_colorblacktext = {
		[("large_street_sign_" .. color_blacktext[1])] = {
			depth = 1/16,
			width = 64/16,
			height = 12/16,
			entity_fields = {
				resolution = { x = 2.5, y = 1.5 },
				maxlines = 1,
				color = "#000000",
			},
			node_fields = {
				 visual_scale = 1,
				description = color_blacktext[2] .. " Street Banner",
				tiles = {"baked_clay_" .. color_blacktext[1] ..".png"},
				inventory_image = "signs_road_" .. color_blacktext[1] ..".png",
				groups = {large_banner = 1},
			},
		},
	}

	for name, model in pairs(models_colorblacktext) do
	signs_api.register_sign("signs_road", name, model)
	end
end

for _, bannercolor in pairs(bannercolor) do

	minetest.register_craft({
		output = "signs_road:large_street_sign_" .. bannercolor[1] .. " 1",
		type = "shapeless",
		recipe = { "group:large_banner", "dye:" .. bannercolor[1] },
	})

end
