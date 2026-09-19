local enet = require "enet"
local TIMEOUT = 1000 -- 5s connection timeout
local MAX_RETRIES = 0
Client = {
  connected = false
}

function Client.startConnection()
  -- `startConnection` should be called once at love.load

  host = enet.host_create()
  peer_host = host:connect("localhost:1337")

  Client.connected = false
  local retries = 0
  while not Client.connected and retries < MAX_RETRIES do
    event = host:service(TIMEOUT)
    if event then
      print("Server detected")
      if event.type == "connect" then 
        print(event.peer, "connected.")
        Client.connected = true
        Client.peer = event.peer
      end
    else
      retries = retries + 1
    end
  end

  if(not Client.connected) then
      print("Failed to Connect: Time Out")
      peer_host:disconnect()
      host:flush()
  else
      print("Connection successful")
  end
end

function Client.tick(dt)
  -- `tick` should be called whenever love.update is called

  if not Client.connected then return end

  local event = host:service()
  while event do
      if(event.type == "receive") then
        print(event.peer, "-> Host:", event.data)
        Client.onMessageReceived(event)
      elseif(event.type == "disconnect") then
        print("Disconnected: Server Closed")
        Client.disconnect()
      end
      event = host:service() -- flush queue
  end
end

function Client.disconnect()
    if(peer_host) then peer_host:disconnect() end
    if(host) then host:flush() end
end

function Client.onMessageReceived(event)
  -- event.data -> string
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer
  -- event.channel -> number

  print("Message Received: ", event.data, event.peer)
end