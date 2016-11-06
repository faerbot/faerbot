-- @Alialhashme
do
local function run(msg, matches)
  if is_momod(msg) then
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text..'  💦خخخ تفو'
    text,b = text:gsub('^!+','')
  end
  return text
	end
 if not is_momod(msg) then 
   local sajody = "للمشرفين فقط"
   return reply_msg(msg.id, sajody, ok_cb, false)
end
end
return {
patterns ={
      "^#اتفل +(.*)$"
},
run = run
}
end
-- @Alialhashme