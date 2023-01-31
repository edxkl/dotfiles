local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- Use "all" or a list of languages
  ensure_installed = {
    "javascript",
    "html",
    "css",
    "lua",
    "bash",
    "c",
    "cpp",
    "rust"
  },
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- False will disable the whole extension
    disable = { "" }, -- List of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
