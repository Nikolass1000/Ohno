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
    
    ohno = message.guild.emojis:find(function(e) return e.name == 'ohno' end)
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
         
--Commands--

client:on('messageCreate', function(help)
          
          if help.content == "~help" then
         help.channel:send{
            embed = {
            title = "Available commands:",
            fields = {
                {name = "Use ~ prefix", value = "anuke \n router \n pingme \n do sk \n ohno \n pfp \n brazil \n \\**iOS** (no ~)", inline = false},                      
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
         end
         end)

--Other stuff--
     
client:on('messageCreate', function(stuff)
    
    anuke = stuff.guild.emojis:find(function(a) return a.name == 'anuke' end)
        if stuff.content == "~anuke" then
            stuff.channel:send("<:anuke:".. anuke.id .. ">")
        end
    router = stuff.guild.emojis:find(function(r) return r.name == 'router' end)
        if stuff.content == "~router" then
            stuff.channel:send("<:router:" .. router.id .. ">")
        end
         if stuff.content == "~ohno" then
            stuff.channel:send("<:ohno:" .. ohno.id .. ">")
        end
        if stuff.content == "~pingme" then
            stuff.channel:send(stuff.author.mentionString)
        end
        if stuff.content == "~do sk" then
            stuff.channel:send('do not the sk.')
        end
        
        if stuff.content == "**iOS**" then
            stuff.channel:send('*1. You can\'t*')
        end
        if stuff.content == "~brazil" then
            stuff.channel:send(stuff.author.mentionString .. ' is going to ' .. ':flag_br:')
        end

         end)

--Get profile picture--

client:on('messageCreate', function(profile)
          
          profilemsg = profile.content
        mentioneduser = profile.mentionedUsers.first 
         
         if profilemsg == "~pfp" then
         pfp = profile.author.avatarURL
         profile.channel:send{
            embed = {
            title = "Searching for " .. profile.author.name .. "'s profile picture...",
            fields = {
                {name = "Found:", value = pfp, inline = false},                      
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
         elseif mentioneduser ~= nil then
         
         if string.find(profilemsg, "~pfp") then
         pfp = mentioneduser.avatarURL
         profile.channel:send{
            embed = {
            title = "Searching for " .. mentioneduser.name .. "'s profile picture...",
            fields = {
                {name = "Found:", value = pfp, inline = false},                      
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
            end
         end
    end)

client:run("Bot "..io.open("./token.config"):read())
