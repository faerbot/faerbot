

do
local function run(msg,matches)
if is_sudo(msg) and matches[1]== "المطورين" then
local sajody = [[🔴افضل بوت لحماية الكروبات🔴
                  ┌─────────┐
             ┇ٌٖ بّــะُ้ৡ ﮩ๋͜‏ٖ❁ٱ﴿l﴾ﮩٰٖﮩٰ๋ـ❁رـكوbot
                  └─────────┘
   اوامر خاصة بالمطورين
 

✧عرض هاي القائمة
>> #المطورين

✧الخروج من الكروب
>> #باي

✧صناعة كروب جديد
>> #cg {اسم الكروب}

✧حظر عظو بشكل نهائي 
>> #gbn @user
>> #gbn {الآيدي}

✧رفع الحضر النهائي عن شخص
>> #gbndel {الآيدي

✧عرض قائمة المحضورين
>> #gbnlist

✧تفعيل الاكروب
>> #modadd

✧حذف الكروب
>> #modrem

✧ رفع مشرف
>> #sown

✧ جعل المجموعه سوبر
>> #super

✧ حذف الرسائل
>> #del [العدد]

✧وضع صلاحيه لنتها مدة الاكروب
>> #modadd [العدد]

✧عرض عدد ايام انتهاء صلاحيت الاكروب
>> #modlist



                 ┌─────────┐
             ┇ٌٖ بّــะُ้ৡ ﮩ๋͜‏ٖ❁ٱ﴿l﴾ﮩٰٖﮩٰ๋ـ❁رـكوbot
                 └─────────┘
]]
return reply_msg(msg.id, sajody, ok_cb, false)
end
if not is_sudo(msg) then
local sajody = "للمطورين فقط"
return reply_msg(msg.id, sajody, ok_cb, false)
end
end
return {
patterns ={
  "^#(المطورين)"
},
run = run
}
end
