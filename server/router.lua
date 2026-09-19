Router = {}

function Router.addCallback(action, callback)
  Router[action] = callback
end

function Router.handle(action, peer, data)
  Router[action](peer, data)
end
