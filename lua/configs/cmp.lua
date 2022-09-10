-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- local snip_status_ok, luasnip = pcall(require, "luasnip")

-- if cmp_status_ok and snip_status_ok then
--   local setup = cmp.setup
--   local kind_icons = {
--     Text = "",
--     Method = "",
--     Function = "",
--     Constructor = "",
--     Field = "ﰠ",
--     Variable = "",
--     Class = "",
--     Interface = "",
--     Module = "",
--     Property = "",
--     Unit = "",
--     Value = "",
--     Enum = "",
--     Keyword = "",
--     Snippet = "",
--     Color = "",
--     File = "",
--     Reference = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "פּ",
--     Event = "",
--     Operator = "",
--     TypeParameter = "",
--   }

--   -- local function has_words_before()
--   --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
--   -- end

--   setup {
--     preselect = cmp.PreselectMode.None,
--     formatting = {
--       fields = { "kind", "abbr", "menu" },
--       format = function(_, vim_item)
--         vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--         return vim_item
--       end,
--     },
--     snippet = {
--       expand = function(args)
--         luasnip.lsp_expand(args.body)
--       end,
--     },
--     duplicates = {
--       nvim_lsp = 1,
--       luasnip = 1,
--       cmp_tabnine = 1,
--       buffer = 1,
--       path = 1,
--     },
--     confirm_opts = {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     },
--     window = {
--       documentation = {
--         border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--       },
--     },
--     mapping = {
--       ["<Up>"] = cmp.mapping.select_prev_item(),
--       ["<Down>"] = cmp.mapping.select_next_item(),
--       ["<C-p>"] = cmp.mapping.select_prev_item(),
--       ["<C-n>"] = cmp.mapping.select_next_item(),
--       ["<C-k>"] = cmp.mapping.select_prev_item(),
--       -- ["<C-j>"] = cmp.mapping.select_next_item(),
--       -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--       -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--       ["<C-y>"] = cmp.config.disable,
--       ["<C-e>"] = cmp.mapping {
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       },
--       -- CR Shouldn't go to next thing, it should just select stuff
--       ["<CR>"] = cmp.mapping.confirm { select = false },
--       -- Was originally <Tab> -> remap to enter for ultisnps conflict
--       -- ["<CR>"] = cmp.mapping(function(fallback)
--       --   if cmp.visible() then
--       --     cmp.select_next_item()
--       --   elseif luasnip.expandable() then
--       --     luasnip.expand()
--       --   elseif luasnip.expand_or_jumpable() then
--       --     luasnip.expand_or_jump()
--       --   elseif has_words_before() then
--       --     cmp.complete()
--       --   else
--       --     fallback()
--       --   end
--       -- end, {
--       --   "i",
--       --   "s",
--       -- }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
--   }
-- end


-- call plug#begin(s:plug_dir)
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-cmdline'
-- Plug 'hrsh7th/nvim-cmp'

-- " For vsnip users.
-- Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip'

-- " For luasnip users.
-- " Plug 'L3MON4D3/LuaSnip'
-- " Plug 'saadparwaiz1/cmp_luasnip'

-- " For ultisnips users.
-- " Plug 'SirVer/ultisnips'
-- " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- " For snippy users.
-- " Plug 'dcampos/nvim-snippy'
-- " Plug 'dcampos/cmp-snippy'

-- call plug#end()

-- set completeopt=menu,menuone,noselect


-- Set up nvim-cmp.
local cmp_avail, cmp = pcall(require, "cmp")
if cmp_aviail then
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
end