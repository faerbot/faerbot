--@barko_b
do

  local function action_by_reply(extra, success, result)
    if result.from.username then
      user_name = '@'..result.from.username
    else
      user_name = ''
    end
    local text = 'الايدي  : '..result.from.peer_id..'\n'
               ..' المعرف: '..user_name..'\n'
    send_large_msg(extra, text)
  end

-------------------------------------------------------------------------------

  local function barko_b(msg)
    if msg.text == '#in' and msg.reply_id then
      get_message(msg.reply_id, action_by_reply, get_receiver(msg))
    end
  end

-------------------------------------------------------------------------------

  return {
    decription = 'اضهار معرف و ايدي الشخص بل رد',
    usage = 'بل رد اكتب : #in',
    patterns = {
      "^#(in)$"
    },
    run = barko_b
  }
--@barko_b
end