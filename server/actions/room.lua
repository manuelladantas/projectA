require("game.room")

RoomService = {
  rooms = {}
}

function RoomService.joinRoom(peer, data)
  for _, room in ipairs(RoomService.rooms) do
    if room:hasSeats() then
      room:addPeer(peer)
      return room.rid
    end
  end

  newRoom = Room:new()
  newRoom.addPeer(peer)
  table.insert(RoomService.rooms, newRoom)
  return newRoom.rid
end