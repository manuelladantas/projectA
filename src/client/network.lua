local enet = require "enet"
local TIMEOUT = 5000 -- 5s connection timeout
local MAX_RETRIES = 3
Client = {
  connected = false
}

function Client.startConnection(self)
  -- `startConnection` should be called once at love.load

  host = enet.host_create()
  peer_host = host:connect("localhost:1337")

  self.connected = false
  local retries = 0
  while not self.connected and retries < MAX_RETRIES do
    event = host:service(TIMEOUT)
    if event then
      print("Server detected")
      if event.type == "connect" then 
        print(event.peer, "connected.")
        self.connected = true
        self.peer = event.peer
        Client.onConnected(event)
      end
    else
      retries = retries + 1
    end
  end

  if(not Client.connected) then
      print("Failed to Connect: Time Out")
      Client.disconnect(nil)
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
        Client.disconnect(event)
      end
      event = host:service() -- flush queue
  end
end

function Client.disconnect(event)
  if(peer_host) then peer_host:disconnect() end
  if(host) then host:flush() end
  if event then Client.onDisconnect(event) end
end

function Client.onMessageReceived(event)
  -- event.data -> string
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer
  -- event.channel -> number

  print("Message Received: ", event.data, event.peer)
end

function Client.onConnected(event)
  -- event.data -> number
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer

  print("Client Connected to Server: ", event.data, event.peer)
end

function Client.onDisconnect(event)
  -- event.data -> number
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer

  print("Client Disconnected from Server: ", event.data, event.peer)
end