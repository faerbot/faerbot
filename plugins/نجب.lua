--@barko_b
do 
local function run(msg, matches) 
 if is_sudo(msg) then 
   local sajody = "صار😍❤️حبي"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end
 if is_owner(msg) then 
   local sajody = "لخاطرك راح اسكت😌"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if is_momod(msg) then 
   local sajody = "🌝فوك مرافعك ادمن انت نجب😒"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if not is_momod(msg) then 
   local sajody = "انت نجب😒😒"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
end 
--@barko_b
return { 
 patterns = { 
   "^(انجب)(.*)$",
   "^(نجب)(.*)$",
 }, 
 run = run, 
} 

end
--@barko_b