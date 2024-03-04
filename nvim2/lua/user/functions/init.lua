-- load all dir lua files
local function load_files()
	local files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/user/functions", "*.lua", true, true)
	for _, file in ipairs(files) do
		if file:find("init.lua") == nil then
			local ok, err = pcall(dofile, file)
			if not ok then
				print("Error loading " .. file .. ": " .. err)
			end
		end
	end
end

load_files()
