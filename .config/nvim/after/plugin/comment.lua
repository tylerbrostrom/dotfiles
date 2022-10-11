require("Comment").setup {
	-- Add JSX/TSX support
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}
