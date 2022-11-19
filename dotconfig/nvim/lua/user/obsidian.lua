require("obsidian").setup({
  dir = "~/documents/Notes",
  daily_notes = {
    folder = "Daily/current",
  },
  disable_frontmatter = true, 
  -- note_frontmatter_func = function(note)
  --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
  --   -- `note.metadata` contains any manually added fields in the frontmatter.
  --   -- So here we just make sure those fields are kept in the frontmatter.
  --   -- if note.metadata ~= nil and util.table_length(note.metadata) > 0 then
  --   if note.metadata ~= nil then
  --     for k, v in pairs(note.metadata) do
  --       out[k] = v
  --     end
  --   end
  --   return out
  -- end,
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
})

vim.keymap.set('n', '<Leader>ot', ':ObsidianToday<CR>', {noremap = false})
vim.keymap.set('n', '<Leader>fo', ':ObsidianSearch<CR>', {noremap = false})

vim.keymap.set(
  "n",
  "<CR>",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return ":ObsidianFollowLink<cr>"
    else
      return "<CR>"
    end
  end,
  { noremap = false, expr = true}
)

