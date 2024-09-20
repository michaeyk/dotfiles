return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      python = true,
      rust = true,
      lua = true,
      svelte = true,
      javascript = true,
      typescript = true,
      markdown = true,
      help = true,
      ["*"] = false,
    },
  },
}

