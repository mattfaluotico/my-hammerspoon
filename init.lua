hyper = hs.hotkey.modal.new({}, "F19")

hyperBindings = {'left','right','up','down','f', 'o', 'p'}

for i,key in ipairs(hyperBindings) do
  hyper:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
    hyper.triggered = true
  end)
end

pressedF18 = function()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f19 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

require('watcher')
require('position')
