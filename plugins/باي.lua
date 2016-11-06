local function run(msg, matches)
if matches[1] == 'باي' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      local ali2 = '🔖عزيزي ( '..(msg.from.first_name or '----')..')\nهل انك متأكد من مغادره المجموعه للخروج اكتب #اي وللبقاء اكتب #لا '
      return reply_msg(msg.id, ali2, ok_cb, false)
    end

    if msg.text then
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^#اي$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^#لا$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "شعندك باقي يله ولي")
	  redis:del(hash, true)

      end
    end
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         local ali2 = '❌طبك مرض ('..(msg.from.first_name or '----')..') روحه بلا رجعه بحق بنات المنطقه'
             return reply_msg(msg.id, ali2, ok_cb, false)
        end
      end
    end

return {
  patterns = {
  "^[#](باي)(.*)$",
  "^[#](اي)(.*)$",
  "^[#](لا)(.*)$",
  },
  run = run,
}
