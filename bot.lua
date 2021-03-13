local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
    print('Logged in as '.. client.user.username)
        ohnosave = io.open("ohnocounter.txt","r+")
        counter = ohnosave:read()
        ohnosave:close()
    end)

--Main task--

client:on('messageCreate', function(message)
    local ohno = message.guild.emojis:find(function(e) return e.name == 'ohno' end)
        msg = message.content
        lowmsg = string.lower(msg)
            if string.find(lowmsg, "ohno") or string.find(lowmsg, "oh no") then
                message:addReaction(ohno)
                counter = counter + 1
                ohnosave = io.open ("ohnocounter.txt", "r+")
                ohnosave:write(counter)
                ohnosave:close()
                stat = tostring(counter) .. " ohnos"
                client:setGame(stat)
            end
    end)
         
--Other stuff--
     
client:on('messageCreate', function(stuff)
    local anuke = stuff.guild.emojis:find(function(a) return a.name == 'anuke' end)
        if stuff.content == "$anuke" then
            stuff:addReaction(anuke)
        end
    local router = stuff.guild.emojis:find(function(r) return r.name == 'router' end)
        if stuff.content == "$router" then
            stuff:addReaction(router)
        end
        if stuff.content == "$pingme" then
            stuff.channel:send(stuff.author.mentionString)
        end
        if lowmsg == "$do sk" then
            stuff.channel:send('do not the sk.')
        end
        
        if msg == "**iOS**" then
            stuff.channel:send('*1. You can\'t*')
        end
         
    end)

client:run("Bot "..io.open("./token.config"):read())
