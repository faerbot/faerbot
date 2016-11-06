--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    dev   @barko_b                    ▀▄ ▄▀ 
▀▄ ▄▀     welcome  : ترحيب                 ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
—]] 

do 
local function run(msg,matches) 
    if matches[1] == "chat_add_user"  then 
return "📳تمت اضافتك\n".."☸انت في مجموعة "..msg.to.title.."\n".."🆔ايدي المجموعة "..msg.to.id.."\n".."💟قام باضافتك "..(msg.from.first_name or " ").."\n".."♊️معرف الذي اضافك @"..(msg.from.username or " ").."\n".."♋️اهلاً بك @"..(msg.action.user.username or " ").."\n".."تابع قناة البوت وما هوه جديد 💕🌝 @barko_a".."\n".." تابع كروب المطورين https://telegram.me/joinchat/EM1MU0AXJZ2UuJQ4xnYotQ"
elseif matches[1] == "chat_add_user_link" then
return "☑️قمت بل دخول باستخدام رابط الدعوة \n".."💟انت في مجموعة: "..msg.to.title.."\n".."🆔ايدي المجموعة "..msg.to.id.."\n".."♈️الاسم الاول: "..msg.from.first_name.."\n⛎الاسم الثاني:"..(msg.from.last_name or " لايوجد" ).."\n ".. "♋️اهلاً بك: @"..(msg.from.username or "لايوجد " ).."\n".." 🆔"..msg.from.id.."\n".."تابع قناة البوت وما هوه جديد 💕🌝 @barko_a".."\n".." تابع كروب المطورين https://telegram.me/joinchat/EM1MU0AXJZ2UuJQ4xnYotQ"
elseif matches[1] == "chat_del_user" then
    local bye_name = msg.action.user.first_name
    return 'باي '..bye_name..'!'
    end 
end 
return { 
    patterns = { 
        "^!!tgservice (chat_add_user)$", 
        "^!!tgservice (chat_add_user_link)$",
        "^!!tgservice (chat_del_user)$",
    }, 
 run = run, 
} 
end