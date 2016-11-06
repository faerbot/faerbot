do

local function check_member(cb_extra, success, result)
   local receiver = cb_extra.receiver
   local data = cb_extra.data
   local msg = cb_extra.msg
   for k,v in pairs(result.members) do
      local member_id = v.id
      if member_id ~= our_id then
          local username = v.username
          data[tostring(msg.to.id)] = {
              moderators = {[tostring(member_id)] = username},
              settings = {
                  set_name = string.gsub(msg.to.print_name, '_', ' '),
                  lock_name = 'no',
                  lock_photo = 'no',
                  lock_member = 'no'
                  }
            }
          save_data(_config.moderation.data, data)
          return send_large_msg(receiver, 'انت تعينت ادمن لهذا الكروب')
      end
    end
end

local function automodadd(msg)
    local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
      receiver = get_receiver(msg)
      chat_info(receiver, check_member,{receiver=receiver, data=data, msg = msg})
  else
      if data[tostring(msg.to.id)] then
        return 'الكروب هو مفعل'
      end
      if msg.from.username then
          username = msg.from.username
      else
          username = msg.from.print_name
      end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
          moderators ={[tostring(msg.from.id)] = username},
          settings = {
              set_name = string.gsub(msg.to.print_name, '_', ' '),
              lock_name = 'no',
              lock_photo = 'no',
              lock_member = 'no'
              }
          }
      save_data(_config.moderation.data, data)
      return 'Group has been added, and @'..username..' has been addd as moderator for this group.'
   end
end

local function modadd(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
        return "هذا الامر بس للمطورين"
    end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
    return 'الكروب هو مفعل'
  end
    -- create data array in moderation.json
  data[tostring(msg.to.id)] = {
      moderators ={},
      settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'no',
          lock_photo = 'no',
          lock_member = 'no'
          }
      }
  save_data(_config.moderation.data, data)

  return 'فعلت الكروب'
end

local function modrem(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
        return "هذا الامر بس للمطورين"
    end
    local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
  if not data[tostring(msg.to.id)] then
    return 'الكروب ممفعل'
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)

  return 'حذفت الكروب'
end

local function add(receiver, member_username, member_id)
    local data = load_data(_config.moderation.data)
    local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'الكروب ممفعل')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, 'العضو @'..member_username..' هو اصلا ادمن')
    end
    data[group]['moderators'][tostring(member_id)] = member_username
    save_data(_config.moderation.data, data)
    return send_large_msg(receiver, 'العضو @'..member_username..' صار ادمن')
end

local function rem(receiver, member_username, member_id)
    local data = load_data(_config.moderation.data)
    local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'الكروب ممفعل')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, 'العضو @'..member_username..' هو مو ادمن')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, 'العضو @'..member_username..' نزل من الادمنية')
end

local function admin_add(receiver, member_username, member_id)  
  local data = load_data(_config.moderation.data)
  if not data['admins'] then
    data['admins'] = {}
    save_data(_config.moderation.data, data)
  end

  if data['admins'][tostring(member_id)] then
    return send_large_msg(receiver, 'العضو @'..member_username..' هو اصلا مطور')
  end
  
  data['admins'][tostring(member_id)] = member_username
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, 'العضو @'..member_username..' صار مطور')
  end

local function admin_rem(receiver, member_username, member_id)
    local data = load_data(_config.moderation.data)
  if not data['admins'] then
    data['admins'] = {}
    save_data(_config.moderation.data, data)
  end

  if not data['admins'][tostring(member_id)] then
    return send_large_msg(receiver, 'العضو @'..member_username..' هو مو مطور')
  end

  data['admins'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)

  return send_large_msg(receiver, 'العضو @'..member_username..' نزل من قائمة المطورين')
end

local function username_id(cb_extra, success, result)
   local mod_cmd = cb_extra.mod_cmd
   local receiver = cb_extra.receiver
   local member = cb_extra.member
   local text = 'مموجود  @'..member..' بهذا الكروب'
   for k,v in pairs(result.members) do
      vusername = v.username
      if vusername == member then
        member_username = member
        member_id = v.id
        if mod_cmd == 'add' then
            return add(receiver, member_username, member_id)
        elseif mod_cmd == 'rem' then
            return rem(receiver, member_username, member_id)
        elseif mod_cmd == 'prom' then
            return admin_add(receiver, member_username, member_id)
        elseif mod_cmd == 'dem' then
            return admin_rem(receiver, member_username, member_id)
        end
      end
   end
   send_large_msg(receiver, text)
end

local function admin(msg)
    local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)] then
    return 'الكروب ممفعل'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'ماكو ادمنية بهذا الكروب'
  end
  local message = 'الادمنية' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message .. '- '..v..' [' ..k.. '] \n'
  end

  return message
end

local function admin_list(msg)
    local data = load_data(_config.moderation.data)
  if not data['admins'] then
    data['admins'] = {}
    save_data(_config.moderation.data, data)
  end
  if next(data['admins']) == nil then --fix way
    return 'ماكو مطورين'
  end
  local message = 'قائمة المطورين:\n'
  for k,v in pairs(data['admins']) do
    message = message .. '- ' .. v ..' ['..k..'] \n'
  end
  return message
end

function run(msg, matches)
  if matches[1] == 'debug' then
    return debugs(msg)
  end
  if not is_chat_msg(msg) then
    return "هذا الامر ميشتغل بس بالكروب"
  end
  local mod_cmd = matches[1]
  local receiver = get_receiver(msg)
  if matches[1] == 'modadd' then
    return modadd(msg)
  end
  if matches[1] == 'modrem' then
    return modrem(msg)
  end
  if matches[1] == 'add' and matches[2] then
    if not is_momod(msg) then
        return "بس الادمن يكدر يرفع"
    end
  local member = string.gsub(matches[2], "@", "")
    chat_info(receiver, username_id, {mod_cmd= mod_cmd, receiver=receiver, member=member})
  end
  if matches[1] == 'rem' and matches[2] then
    if not is_momod(msg) then
        return "بس الادمن يكدر ينزل"
    end
    if string.gsub(matches[2], "@", "") == msg.from.username then
        return "متكدر تنزل نفسك"
    end
  local member = string.gsub(matches[2], "@", "")
    chat_info(receiver, username_id, {mod_cmd= mod_cmd, receiver=receiver, member=member})
  end
  if matches[1] == 'admin' then
    return admin(msg)
  end
  if matches[1] == 'prom' then
    if not is_admin(msg) then
        return "بس المطور يكدر يرفع"
    end
  local member = string.gsub(matches[2], "@", "")
    chat_info(receiver, username_id, {mod_cmd= mod_cmd, receiver=receiver, member=member})
  end
  if matches[1] == 'dem' then
    if not is_admin(msg) then
        return "بس المطور يكدر ينزل"
    end
    local member = string.gsub(matches[2], "@", "")
    chat_info(receiver, username_id, {mod_cmd= mod_cmd, receiver=receiver, member=member})
  end
  if matches[1] == 'devs' then
    if not is_admin(msg) then
        return 'بس للمطورين'
    end
    return admin_list(msg)
  end
  if matches[1] == 'chat_add_user' and msg.action.user.id == our_id then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 then
    return automodadd(msg)
  end
end

return {
  description = "Moderation plugin", 
  usage = {
      moderator = {
          "#add <username> : add user as moderator",
          "#rem <username> : rem user from moderator",
          "#admin : List of moderators",
          },
      admin = {
          "#modadd : Add group to moderation list",
          "#modrem : Remove group from moderation list",
          },
      sudo = {
          "#prom <username> : add user as admin (must be done from a group)",
          "#dem <username> : rem user from admin (must be done from a group)",
          },
      },
  patterns = {
    "^#(modadd)$",
    "^#(modrem)$",
    "^#(add) (.*)$",
    "^#(rem) (.*)$",
    "^#(admin)$",
    "^#(prom) (.*)$", -- sudoers only
    "^#(dem) (.*)$", -- sudoers only
    "^#(devs)$",
    "^!!tgservice (chat_add_user)$",
    "^!!tgservice (chat_created)$",
  }, 
  run = run,
}

end
