--Tag ppl with username and a msg after it
--Thanks to @shayansoft for this idea
local function tagall(cb_extra, success, result)
    local receiver = cb_extra.receiver
    local chat_id = "chat#id"..result.id
    local text = ''
    for k,v in pairs(result.members) do
        if v.username then
			text = text.."@"..v.username.."\n"
		end
    end
	text = text.."\n"..cb_extra.msg_text
	send_large_msg(receiver, text)
end
local function run(msg, matches)
    local receiver = get_receiver(msg)
	if not is_mod(msg) then 
		return "For moderators only !"
	end
	if matches[1] then
		chat_info(receiver, tagall, {receiver = receiver,msg_text = matches[1]})
	end
	return
end


return {
  description = "اعضای حاضر در گروه را تگ میکند",
  usage = {
    "/tagall msg"
  },
  patterns = {
    "^[!/]tagall +(.+)$"
  },
  run = run
}
