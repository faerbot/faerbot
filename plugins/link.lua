--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ لتحذف حقوق بذمتك🚶🏻
      #CODS CREATED By ~ @JALAL_ALDON 
      please join to Channel Oscar Team @OSCARBOTv2 
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]
 local function pre_process(msg) 
  local jalal = msg['id']
  local user = msg.from.id
  local chat = msg.to.id
  local hash = 'mate:'..chat..':'..user
  if msg.media.type== "webpage" and not is_momod(msg) then
    if redis:get(hash) and msg.media.type== "webpage" and not is_momod(msg) then 
      delete_msg(msg.id, ok_cb, false) 
      redis:del(hash) 
      kick_user(user, chat)
    else
      local q = "عزيزي~["..msg.from.first_name.."]".."\n".."تنبية : لا تقم بمشاركة الروابط في هاذة المجموعة.❗️ هاذا تحذير في المرة القادمة سوف اطردك من المجموعة ⛔️".."\n".."#username: @"..(msg.from.username or " ")
      reply_msg(jalal, q, ok_cb, true) 
      redis:set(hash, true)
    end
  end
  return  msg
end
       

local function run(msg, matches) 
  local jalal = msg['id'] 
  if matches[1] == 'llink' then
    if is_momod(msg) then 
      local hash = 'mate:'..msg.to.id 
      redis:set(hash, true) 
      local x = ' تم تفعيل خاصية منع الروابط #بلتحذير. ❗️⛔️'
      reply_msg(jalal, x, ok_cb, true) 
    else 
      local asdy = 'هاذ الامر للمشرفين #فقط❗️⛔️' 
      reply_msg(jalal, asdy, ok_cb, true) 
    end
  end
  if matches[1] == 'unlink' then
    if is_momod(msg) then 
      local hash = 'mate:'..msg.to.id 
      redis:del(hash) 
      local don = ' تم الغاء تفعيل خاصية منع  الروابط #بلتحذير. ❗️⛔️' 
      reply_msg(jalal, don, ok_cb, true) 
    else
      local jalal_aldon = 'هاذ الامر للمشرفين #فقط❗️⛔️' 
      reply_msg(jalal, jalal_aldon, ok_cb, true)
    end 
  end 
end
return { 
    patterns = {
"^[#!/](llinks)$",
"^[#!/](unlinks)$"
 
    }, 
     
run = run, 
    pre_process = pre_process 
}
-- by @JALAL_ALDON