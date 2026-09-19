Room = {
  rid = nil,
  peers = {nil,nil},
}
MAX_PEERS = 2

function Room:new(room)
  room = room or {}
  setmetatable(room, self)
  self.__index = self
  room.rid = "Room#"..math.random(1000, 9999)
  return room
end

function Room:addPeer(peer)
  -- `addPeer` returns true if the room if connection is successful, returns false if theres no seat left

  if not self:hasSeats() then return false end

  table.insert(self.peers, peer)
  print('Client assigned to the room: ', self.rid)
  return true
end

function Room:hasSeats()
  return #self.peers < MAX_PEERS
end
