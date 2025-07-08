return {
	"huggingface/llm.nvim",
	enabled = false,
	-- event = "VeryLazy",
	-- keys = {
	-- 	{
	-- 		"<c-j>",
	-- 		function()
	-- 			require("llm.completion").complete()
	-- 		end,
	-- 		mode = "i",
	-- 		desc = "complete",
	-- 	},
	-- },
	-- config = function()
	-- 	vim.keymap.set("i", "<C-j>", function()
	-- 		require("llm.completion").complete()
	-- 		-- 这里写你的功能代码
	-- 		print("Insert mode shortcut triggered!")
	-- 	end, { noremap = true, silent = true })
	-- end,
	opts = {
		-- api_token = "",
		-- model = "Qwen/Qwen2-7B-Instruct",
		-- backend = "openai",
		backend = "ollama",
		model = "qwen2.5-coder:7b",
		-- model = "Qwen/Qwen2.5-Coder-7B-Instruct",
		-- url = "http://localhost:11434", -- llm-ls uses "/api/generate"
		url = "https://api.siliconflow.cn/v1", -- llm-ls uses "/api/generate"
		-- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
		lsp = {
			bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
			-- 	host = nil,
			-- 	port = nil,
			cmd_env = { LLM_LOG_LEVEL = "DEBUG" },
			-- version = "0.5.3",
		},
		fim = {
			enabled = true,
			prefix = "<｜fim▁begin｜>",
			suffix = "<｜fim▁hole｜>",
			middle = "<｜fim▁end｜>",
		},
		request_body = {
			-- Modelfile options for the model you use
			options = {
				temperature = 0.2,
				top_p = 0.95,
			},
		},
	},
}
