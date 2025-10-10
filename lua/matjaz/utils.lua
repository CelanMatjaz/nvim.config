function file_exists(filename)
	local stat = vim.loop.fs_stat(filename)
	return stat ~= nil
end
