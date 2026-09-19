require("game.room")

RoomService = {
  rooms = {}
}

function JoinRoom(peer, data)
  for _, room in ipairs(RoomService.rooms) do
    if room:hasSeats() then
      room:addPeer(peer)
      return room.rid
    end
  end

  newRoom = Room:new()
  newRoom:addPeer(peer)
  table.insert(RoomService.rooms, 1, newRoom)
  return newRoom.rid
end