--@barko_b
do
local function run(msg,matches)
if is_momod(msg) and matches[1]== "اهووو" then 
local x = " منو مضوجك😱"
  return reply_msg(msg.id, x, ok_cb, false)
end
if is_momod(msg) and matches[1]== "هذا" then 
local x = "اليوم انعل والديه🌝👌"
  return reply_msg(msg.id, x, ok_cb, false)
end
if not is_momod(msg) then
local x = "سوالف بال كبار بحي🌝👌"
  return reply_msg(msg.id, x, ok_cb, false)
end
end
return {
patterns ={
  "^(اهووو)(.*)$",
  "^(هذا)(.*)$",
},
run = run
}
end
--@barko_b