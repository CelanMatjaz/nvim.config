local whichKey = require("which-key")

whichKey.register(require "plugins.utils".whichKeyMappings, { prefix = "" })
