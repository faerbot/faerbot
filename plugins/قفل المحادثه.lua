function pre_process(msg)
local saeco = "mate"..msg.to.id
if redis:get(saeco) and msg.text and not is_momod(msg) then
delete_msg(msg.id, ok_cb, false) 
local sajody = "🙂 اهلاً "..msg.from.first_name.."\n".."لا ترسل اي شيئ الكروب الان في وضع الصامت 🔇 \n انتضر قليلاً 😌".."\n".."معرفك @"..(msg.from.username or " ")
return reply_msg(msg.id, sajody, ok_cb, false)
end
return msg
end
local function saeco(msg,matches)
if matches[1] == "lall" and is_momod(msg) then
local saeco = "mate"..msg.to.id
redis:set(saeco, true)
local wathiq = "☺️ اهلا "..msg.from.first_name.."\n".."تم قفل المحادثه مع التحذير✅"
return reply_msg(msg.id, wathiq, ok_cb, false)
end
if matches[1] == "unall" and is_momod(msg) then
local saeco = "mate"..msg.to.id
redis:del(saeco)
local mustafaip = "☺️ اهلاً "..msg.from.first_name.."\n".."تم الغاء قفل المحادثة ✅"
return reply_msg(msg.id, mustafaip, ok_cb, false)
end
if matches[1] == "unall" and not is_momod(msg) then
local ali = "🙁 اسف جداً "..msg.from.first_name.."\n".."🙂 فقط الادمنز يستطيعون استخدام هذا الامر"
return reply_msg(msg.id, ali, ok_cb, false)
end
if matches[1] == "lall" and not is_momod(msg) then
local ali = "🙁 اسف جداً "..msg.from.first_name.."\n".."🙂 فقط الادمنز يستطيعون استخدام هذا الامر"
return reply_msg(msg.id, ali, ok_cb, false)
end
end

return { 
patterns = { 
"^#(lall)$", 
"^#(unall)$" 
}, 
run = saeco, 
pre_process = pre_process 
}