-- vimwiki
vim.g.vimwiki_list = {{path = '~/documents/vimwiki', syntax = 'markdown', ext = '.md', auto_generate_tags = 1, auto_generated_links = 1}}
vim.g.calendar_options = 'nornu'
vim.cmd [[command! Diary VimwikiDiaryIndex]] 
vim.cmd [[
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
]]
