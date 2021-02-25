local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
local ohno = message.guild.emojis:find(function(e) return e.name == 'ohno' end)
	if message.content == "ohno" then
		message:addReaction(ohno)
	end
end)

client:run("Bot "..io.open("./token.config"):read())
