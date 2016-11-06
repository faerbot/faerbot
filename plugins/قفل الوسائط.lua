
 local function pre_process(msg) 
  local jalal = msg['id']
  local user = msg.from.id
  local chat = msg.to.id
  local hash = 'mate:'..chat..':'..user
  if msg.media and not is_momod(msg) then
    if redis:get(hash) and msg.media and not is_momod(msg) then 
      delete_msg(msg.id, ok_cb, false) 
    else
      local q = "عزيزي~["..msg.from.first_name.."]".."ممنوع نشر الوسائط  لا تكرر الامر مره ثانيه سوف تجبرني ع طردك".."\n".."معرفك: @"..(msg.from.username or " ")
      reply_msg(jalal, q, ok_cb, true) 
      redis:set(hash, true)
    end
end
  return  msg
end 

local function run(msg, matches) 
  local jalal = msg['id'] 
  if matches[1] == 'lpicc' then
    if is_momod(msg) then 
      local hash = 'mate:'..msg.to.id 
      redis:set(hash, true) 
      local x = "☺️ اهلا "..msg.from.first_name.."\n".."تم قفل الوسائط مع التحذير ✅"
      reply_msg(jalal, x, ok_cb, true) 
    else 
      local asdy = 'للمشرفين فقط️' 
      reply_msg(jalal, asdy, ok_cb, true) 
    end
  end
  if matches[1] == 'unpic' then
    if is_momod(msg) then 
      local hash = 'mate:'..msg.to.id 
      redis:del(hash) 
      local don = "☺️ اهلاً "..msg.from.first_name.."\n".."تم الغاء قفل الوسائط ✅"
      reply_msg(jalal, don, ok_cb, true) 
    else
      local jalal_aldon = 'للمشرفين فقط️' 
      reply_msg(jalal, jalal_aldon, ok_cb, true) 
    end 
  end 
end
return { 
    patterns = {
"^#(lpicc)$",
"^#(unpic)$",

    }, 
     
run = run, 
    pre_process = pre_process 
}
-- by @JALAL_ALDON