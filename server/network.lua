
Server = {}
local enet = require "enet"
local address, port = "*", 1337
local connectedPeers = {}
local serverTime = 0

function Server.start()
  host = enet.host_create(address..':'..port)
  print('Server started at ', address..':'..port)
end

function Server.onReceive(event)
  -- event.data -> string
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer
  -- event.channel -> number
  print('received message: ', event.data, event.peer, event.channel)

  -- add actions for the service here
  -- TODO: a router for server actions
  -- TODO: State control for peers
end

function Server.onConnect(event)
  -- event.data -> number
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer

  connectedPeers[event.peer] = {
    updated_at = serverTime,
    uid = "User#"..math.random(1000, 9999)
  }
  print('new peer connected: ', connectedPeers[event.peer].uid, event.data)
end

function Server.onDisconnect(event)
  -- event.data -> number
  -- event.peer -> table "peer" https://love2d.org/wiki/enet.peer

  print('peer disconnected: ', connectedPeers[event.peer].uid, event.data)
  connectedPeers[event.peer] = nil
end

function Server.tick(dt)
  -- pass time per server tick
  serverTime = serverTime + dt

  event = host:service()
  while event do
    if event.type == "receive" then
      Server.onConnect(event)
      event.peer:send( "pong" )
    elseif event.type == "connect" then
      print(event.peer, "connected.")
    elseif event.type == "disconnect" then
      print(event.peer, "disconnected.")
    end
    event = host:service()
  end
end
