do 
local function barko_b(msg, matches) 
    if matches[1] == 'نشرر' then
   		if is_sudo(msg) then
   		  if ( msg.text ) then
    local user = 'user#id'
    fwd_msg(user ,msg.id, ok_cb, false)
  end
end
end
end

	return {
 patterns = {
    "^(نشرر) +(.+)$",
  },
  run = barko_b
}
end
--by @barko_b