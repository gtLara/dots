require("telescope").setup {
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["<CR>"] = "select_tab",
        },
      },
    },
  },
}
