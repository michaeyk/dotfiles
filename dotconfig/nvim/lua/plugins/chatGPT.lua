return {
  "jackMort/ChatGPT.nvim",
  cmd = "ChatGPT",
  keys = {
    { "<leader>cc", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = "n" },
    { "<leader>aa", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT acts as", mode = "n" },
    { "<leader>ce", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with instruction", mode = { "n", "v" } },
    { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
    { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
    { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
    { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
    { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
    { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
    { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
    { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
    { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
    { "<leader>cr", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", mode = { "n", "v" } },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = true,
}
