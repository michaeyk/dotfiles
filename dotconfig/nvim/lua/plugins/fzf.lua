 return {
  'ibhagwan/fzf-lua',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader><leader>",  function() require("fzf-lua").buffers() end,   desc = "Search buffers" },
    { "<leader>fb",  function() require("fzf-lua").blines() end,          desc = "Search buffer lines" },
    { "<leader>fc",  function() require("fzf-lua").colorschemes() end,    desc = "Search colorschemes" },
    { "<leader>fC",  function() require("fzf-lua").command_history() end, desc = "Search command history" },
    { "<leader>fg",  function() require("fzf-lua").live_grep() end,       desc = "ripgrep" },
    { "<leader>#",   function() require("fzf-lua").grep_cword() end,      desc = "grep current word" },
    { "<leader>ff",  function() require("fzf-lua").files() end,           desc = "Find files" },
    { "<leader>fr",  function() require("fzf-lua").oldfiles() end,        desc = "Find files" },
    { "<leader>fm",  function() require("fzf-lua").marks() end,           desc = "Search marks" },
    { "<leader>fy",  function() require("neoclip.fzf")() end,             desc = "Search clipboard" },
    { "<leader>fk",  function() require("fzf-lua").keymaps() end,         desc = "Search keymaps" },
    { "<leader>fs",  function() require("fzf-lua").spell_suggest() end,   desc = "Search spelling" },
    { "<leader>fh",  function() require("fzf-lua").helptags() end,        desc = "Search help" },
    { "<leader>/gf", function() require("fzf-lua").git_files() end,       desc = "Find git files" },
    { "<leader>/gb", function() require("fzf-lua").git_branches() end,    desc = "Search git branches" },
    { "<leader>/gc", function() require("fzf-lua").git_commits() end,     desc = "Search git commits" },
    { "<leader>/gC", function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    { "<leader>//",  function() require("fzf-lua").resume() end,          desc = "Resume FZF" },
    { "<leader>fN",  function() require("fzf-lua").live_grep({prompt='Neorg » ', cwd='~/notes'}) end, desc = "Search notes" },
    { "<leader>fn",  function() require("fzf-lua").files({cwd='~/notes'}) end, desc = "Search notes files" },
  },
  config = function()
    local fzf = require('fzf-lua')
		fzf.setup({
      keymap = {
        fzf = {
          ['CTRL-Q'] = 'select-all+accept',
        },
      },
    })
    fzf.register_ui_select()
  end,
}
