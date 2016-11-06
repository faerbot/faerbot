do
    
local function barko_b(msg)
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

  return  msg
end 
local function barko_b(msg, matches)
    local jalal = msg['id']
chat_id =  msg.to.id
      if is_momod(msg) and matches[1] == 'l' then
            
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return "bb"
  elseif is_momod(msg) and matches[1] == 'un' then
                    local hash = 'mate:'..msg.to.id
                    redis:del(hash)
                    return "hh"
end

end

return {
    patterns = {
 
        '^[/!#](l)b$',
        '^[/!#](un)b$'
    },
    run = barko_b,
    barko_b = barko_b
}
en