minetest.register_privilege("lava", {description = "Allows a player to place lava anywhere", give_to_singleplayer = false})

local oldplace = minetest.item_place
minetest.item_place = function (itemstack, placer, pointed_thing, param2)
	if not pointed_thing.above then
			return
	end
	local player_name = placer:get_player_name()
	if itemstack:get_name() == "default:lava_source" and pointed_thing.above.y > -5 and not minetest.check_player_privs(player_name, {lava = true}) then
		minetest.chat_send_player(player_name, "You cannot place lava over -5m", true)
		return itemstack
	end
	return oldplace(itemstack, placer, pointed_thing, param2)
end

