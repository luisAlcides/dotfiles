-- plugins.lua
return {
  -- Otros plugins
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_bracketed_paste = 1
      vim.api.nvim_set_keymap("n", "<localleader>c", ":SlimeSendCell<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "goerz/jupytext.vim",
    config = function()
      vim.g.jupytext_fmt = "py"
      vim.cmd([[
        autocmd BufRead,BufNewFile *.ipynb,JupytextPreSave *.ipynb call jupytext#formats()
      ]])
    end,
  },
}
