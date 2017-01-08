p3600_version = '$Id$'

require('package_gc')

require('game')

game.init = function(argv)
  arg = nil -- not using it anymore

  require('p3600.main_menu.top')() -- enter main menu
end
