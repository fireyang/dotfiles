local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end
comment.setup({
	ignore = "^$",
	toggler = {
		line = "<leader>cc",
		block = "<leader>cb",
	},
	opleader = {
		line = "<leader>cc",
		block = "<leader>cb",
	},
})

local ft = require("Comment.ft")
ft.set("sdp", "//%s")
