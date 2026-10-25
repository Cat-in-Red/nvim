require('core.configs')
require('core.mappings')
require('core.lazy')

-- Определяем группу выделения
vim.cmd([[highlight TrailingSpaces guibg=red ctermbg=red]])

function startsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

-- Функция для установки выделения пробелов в конце строк
local function highlight_trailing_spaces()
	-- if (not vim.bo.filetype == 'neo-tree') or (not startsWith(vim.bo.filetype, "term://")) then
	if (not (vim.bo.filetype == "neo-tree")) and (not (vim.bo.filetype == "toggleterm")) then
        vim.fn.matchadd('TrailingSpaces', '\\s\\+$')
    end
end

-- Устанавливаем автокоманду для применения выделения при открытии буфера
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = highlight_trailing_spaces,
})

