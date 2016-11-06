--@barko_b
do 
local function run(msg, matches) 
 if is_sudo(msg) then 
   local sajody = " اهلا عزيزي المطور 😻 ايديك هو 🆔  : "..msg.from.id
   return reply_msg(msg.id, sajody, ok_cb, false)
 end
 if is_owner(msg) then 
   local sajody = " اهلاً عزيزي مالك الكروب🙂 ايديك هو 🆔  : "..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if is_momod(msg) then 
   local sajody = " اهلا عزيزي الادمن 😊 ايديك هو 🆔  "..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if not is_momod(msg) then 
   local sajody = " اهلا عزيزي العضو 😐 ايديك هو 🆔  : "..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
end 
--@barko_b
return { 
 patterns = { 
   "^[!/#](id)$" 
 }, 
 run = run, 
} 

end
--@barko_b