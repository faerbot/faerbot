
local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '⛔️ "'..#result..'" تم حذف رساله', ok_cb, false)
  else
    send_msg(extra.chatid, '⛔️ تم حذف الرسائل', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'del' and is_sudo(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 5000 or tonumber(matches[2]) < 1 then
        return "لا يمكنك حذف اكثر من 5000"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "للمطوررين فقط"
    end
  else
    return "للمطوررين فقط"
  end
end

return {
    patterns = {
        '^[!/#](del) (%d*)$'
    },
    run = run
}