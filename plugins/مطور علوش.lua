do 

local function run(msg, matches) 
if msg.text then
  if  msg.to.type == "channel" then
  --by @barko_b
  send_large_msg("user#id"..281889875, "🎴 هناك شخص 👤 بحاجة اليك 🔷✔️\n\n ".."⛔️ المعرف : @"..(msg.from.username or "Error!")..
  "\n الاسم : "..msg.from.first_name
  .."\n 🔋 الايدي : "..msg.from.id
  .."\n 📋 اسم المجموعة : "..msg.to.title
  .."\n 🆔 ايدي المجموعة : "..msg.from.id
  .."\n 🚁 نص الرساله : "..matches[2]
  ..'\n 🕚 الوقت : '..os.date(' %T*', os.time())
  ..'\n 📅 التاريخ : '..os.date('!%A, %B %d, %Y*\n', timestamp))
 
 local sajody = "اصبر ☹️🖐🏿 هسة اصيحلكياه 🌝🍷"
return reply_msg(msg.id, sajody, ok_cb, false)
end 
end
end
return { 
  patterns = { 
     "^(@[Bb][Aa][Rr][Kk][Oo][_]b) (.*)$",
     "^(@[Bb][Aa][Rr][Kk][Oo][_]b)(.*)$",
  }, 
  run = run, 
} 

end
--Dev By @barko_b