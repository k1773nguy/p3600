require 'p3600'

return function(dt)
  local pc = p3600.gstate.entity[0]
  local saoi = p3600.gstate.entity[1]

  do
    local s_main = {
      [0] = function()
        saoi.progress.main = 1
        pc.can_move = true
        require('p3600.sp_entity.1.dialog.init_clearing.0')()
      end,

      [1] = function()
        saoi.progress.main = 2
        saoi.following = {
          id = 0,
          distance = 3,
        }
        if (pc.followers == nil) then
          pc.followers = {}
        end
        pc.followers[#pc.followers + 1] = 1
        require('p3600.save_game')()
      end,
    }

    if not (s_main[saoi.progress.main] == nil) then
      s_main[saoi.progress.main]()
    end
  end
end
