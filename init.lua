-- 1. Load core settings (Leader key must be set first)
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 2. Bootstrap lazy.nvim & plugins
require("config.lazy")
