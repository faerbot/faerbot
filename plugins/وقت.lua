do 
local function pre_process(msg) 
 local hash = 'muteall:'..msg.to.id 
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then 
   delete_msg(msg.id, ok_cb, false) 
       end 
    return msg 
 end 
local function run(msg, matches) 
 if matches[1] == 'muteall' and is_momod(msg) then 
       local hash = 'muteall:'..msg.to.id 
       if not matches[2] then 
              redis:set(hash, true) 
             return "تم قفل المحادثه" 
 else 
local hour = string.gsub(matches[2], ':', '') 
 local num1 = tonumber(hour) * 3600 
local minutes = string.gsub(matches[3], '', '') 
 local num2 = tonumber(minutes) * 60 
local num4 = tonumber(num1 + num2 ) 
redis:setex(hash, num4, true) 
 return "سيتم فتح المحادثه بعد 👇🏻 \n⏱ ساعه(h] :  ("..matches[2].."]\n⏱ دقيقه(m] : ("..matches[3].."]"
 end 
 end 
if matches[1] == 'unmuteall' and is_momod(msg) then 
               local hash = 'muteall:'..msg.to.id 
        redis:del(hash) 
          return "تم الغاء قفل المحادثه" 
  end 
end 
return { 
   patterns = { 
      '^[/!#](muteall)$', 
      '^[/!#](unmuteall)$', 
   '^[/!#](muteall) (.*) (.*)', 
 }, 
run = run, 
  pre_process = pre_process 
} 
end