return {
  -- Añadir el tema gruvbox-material
  { "sainnhe/gruvbox-material" },

  -- Configurar LazyVim para cargar el tema gruvbox-material
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
