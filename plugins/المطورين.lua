

do
local function barko_b(msg,matches)
local barko_b = [[ للتحدث الى المطورين راسل احدهم...

1 _ @saski_x

2 _ @ABSOLUT_A

3 _ @Saski_Xx

4 _ @Ali_Reza_12

                 ┌─────────┐
             ┇ٌٖ بّــะُ้ৡ ﮩ๋͜‏ٖ❁ٱ﴿l﴾ﮩٰٖﮩٰ๋ـ❁رـكوbot
                 └─────────┘
]]
return reply_msg(msg.id, barko_b, ok_cb, false)
end
return {
patterns ={
  "^(المطورين)",
  "^(وين المطورين)",
  "^(اريد بوت)",
    "^(اريد بوت لكروبي)",
},
run = barko_b,
}
end