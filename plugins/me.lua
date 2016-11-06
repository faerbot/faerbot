do 
local function run(msg,matches)
if is_sudo(msg) then
   local sajody = "انت المطور مالتي😍معرفك  @"..(msg.from.username or " ")..". ايديك ."..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if is_owner(msg) then
   local sajody = "انت مالك المجموعه😍معرفك  @"..(msg.from.username or " ")..". ايديك ."..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if is_momod(msg) then
   local sajody = "انت ادمن المجموعه😍معرفك  @"..(msg.from.username or " ")..". ايديك ."..msg.from.id 
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if not is_momod(msg) then
    local sajody = "انت مجرد عضو😔معرفك  @"..(msg.from.username or " ")..". ايديك ."..msg.from.id 
    return reply_msg(msg.id, sajody, ok_cb, false)
 end
 
end 
return { 
 patterns = { 
   "^[#](me)$" 
 }, 
 run = run, 
} 

end