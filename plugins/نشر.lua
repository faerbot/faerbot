do
local function barko_b(msg, matches) 
    if matches[1] == 'نشر' then
		if is_sudo(msg) then
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local users = 'users'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				 fwd_msg(chat ,msg.id, ok_cb, false)
				 fwd_msg(channel ,msg.id, ok_cb, false)
			end
		end
	end
end
	return {
 patterns = {
    "^(نشر) +(.+)$",
  },
  run = barko_b
}
end