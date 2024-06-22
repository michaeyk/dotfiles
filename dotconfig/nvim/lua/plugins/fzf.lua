 return {
  'ibhagwan/fzf-lua',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader>/b",  function() require("fzf-lua").buffers() end,         desc = "Search buffers" },
    { "<leader>/B",  function() require("fzf-lua").blines() end,          desc = "Search buffer lines" },
    { "<leader>/l",  function() require("fzf-lua").blines() end,          desc = "Search buffer lines" },
    { "<leader>/c",  function() require("fzf-lua").colorschemes() end,    desc = "Search colorschemes" },
    { "<leader>/C",  function() require("fzf-lua").command_history() end, desc = "Search command history" },
    { "<leader>/r",  function() require("fzf-lua").live_grep() end,       desc = "ripgrep" },
    { "<leader>#",   function() require("fzf-lua").grep_cword() end,      desc = "grep current word" },
    { "<leader>/f",  function() require("fzf-lua").files() end,           desc = "Find files" },
    { "<leader>/o",  function() require("fzf-lua").oldfiles() end,        desc = "Find files" },
    { "<leader>/h",  function() require("fzf-lua").highlights() end,      desc = "Search highlights" },
    { "<leader>/m",  function() require("fzf-lua").marks() end,           desc = "Search marks" },
    { "<leader>/k",  function() require("fzf-lua").keymaps() end,         desc = "Search keymaps" },
    { "<leader>/s",  function() require("fzf-lua").spell_suggest() end,   desc = "Search spelling" },
    { "<leader>/t",  function() require("fzf-lua").treesitter() end,      desc = "Search treesitter" },
    { "<leader>/gf", function() require("fzf-lua").git_files() end,       desc = "Find git files" },
    { "<leader>/gb", function() require("fzf-lua").git_branches() end,    desc = "Search git branches" },
    { "<leader>/gc", function() require("fzf-lua").git_commits() end,     desc = "Search git commits" },
    { "<leader>/gC", function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    { "<leader>bc",  function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    { "<leader>//",  function() require("fzf-lua").resume() end,          desc = "Resume FZF" },
    { "<leader>/n",  function() require("fzf-lua").live_grep({prompt='Note', cwd='~/notes'}) end, desc = "Search notes" },
    { "<leader>/N",  function() require("fzf-lua").files({cwd='~/notes'}) end, desc = "Search notes files" },
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





