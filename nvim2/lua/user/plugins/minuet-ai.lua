return {
	{
		"milanglacier/minuet-ai.nvim",
		enabled = false,
		config = function()
			require("minuet").setup({
				provider = "openai_fim_compatible",
				provider_options = {
					openai_fim_compatible = {
						api_key = "SILICONFLOW_API_KEY",
						end_point = "https://api.siliconflow.cn/v1/completions",
						model = "deepseek-ai/DeepSeek-V2.5", -- 或其他支持 FIM 的模型
						name = "SiliconFlow",
						optional = {
							max_tokens = 256,
							top_p = 0.9,
						},
					},
				},
			})
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	-- optional, if you are using virtual-text frontend, nvim-cmp is not
	-- required.
	{ "hrsh7th/nvim-cmp" },
	-- optional, if you are using virtual-text frontend, blink is not required.
	{ "Saghen/blink.cmp" },
}
