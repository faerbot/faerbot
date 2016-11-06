--[[BOT CHANNEL : - @zeoon3
..
..
  BOT CHANNEL : - @zeoon3
]]

do
local function pre_process(msg)

    local fwd = 'mate:'..msg.to.id
    if redis:get(fwd) and not is_momod(msg) and msg.fwd_from then
            delete_msg(msg.id, ok_cb, true)
            return "ok"
end
        return msg
    end
    
 local function zeoone(msg, matches)
     chat_id = msg.to.id
local reply_id = msg['id']
     if is_momod(msg) and matches[1]== 'l' and matches[2]== 'fwd' then
         local fwd = 'mate:'..msg.to.id
         redis:set(fwd, true)
         local text = "تم قفل اعادة التوجية"
         return reply_msg(reply_id, text, ok_cb, false)
         end
local reply_id = msg['id']
    if not is_momod(msg) and matches[1]== 'l' and matches[2]== 'fwd' then
    local text = "للمشرفين فقط"
 return reply_msg(reply_id, text, ok_cb, false)
end
local reply_id = msg['id']
if is_momod(msg) and matches[1]== 'un' and matches[2]== 'fwd' then
    local fwd = 'mate:'..msg.to.id
    redis:del(fwd)
    local text = "تم فتح اعادة التوجية"
    return reply_msg(reply_id, text, ok_cb, false)
end

local reply_id = msg['id']
if not is_momod(msg) and matches[1]== 'un' and matches[2]== 'fwd' then
local text = "للمشرفين فقط"
 return reply_msg(reply_id, text, ok_cb, false)
 end

end
return {
    patterns ={
        '^[!/#](l)(fwd)$',
        '^[!/#](un)(fwd)$'
    },
run = zeoone,
pre_process = pre_process 
}
end

--[[BOT CHANNEL : - @zeoon3
..
..
  BOT CHANNEL : - @zeoon3
]]