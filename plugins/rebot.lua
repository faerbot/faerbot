
do 
local function run(msg, matches) 
  if not is_sudo(msg) then
if ( msg.text ) then
  if ( msg.to.type == "user" ) then
     return " اهلاً وسهلاً بكم في  بوت الحمايه #┇ٌٖ بّــะُ้ৡ ﮩ๋͜‏ٖ❁ٱ﴿l﴾ﮩٰٖﮩٰ๋ـ❁رـكوbot لطلب المساعدة او الاستفسار يمكنكم مراجعة المطورين او المبرمجين من خلال ارسال امر المطورين , المبرمجين"
end
end
end
end
return { 
  patterns = { 
     "(.*)$"
  }, 
  run = run 
} 

end 