
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax off


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

" Make cursor line more obvious
set cursorline

" Make drawing better
set lazyredraw

" Install Vim Plug plugins
call plug#begin()
" Lsp stuffs
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-lua/plenary.nvim'

Plug 'numToStr/Comment.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'lervag/vimtex'
Plug 'kyazdani42/nvim-web-devicons'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'lukas-reineke/indent-blankline.nvim', { 'main': 'ibl' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sindrets/diffview.nvim'
Plug 'TimUntersberger/neogit'
Plug 'akinsho/bufferline.nvim'
Plug 'sainnhe/sonokai'

" Auto detect indentation
Plug 'tpope/vim-sleuth'

" sessions
Plug 'rmagatti/auto-session'

" Plug 'nvim-telescope/telescope.nvim'

" Initialize plugin system
call plug#end()

"------------------------------------------------------------
" Mappings
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" remap :w save to space button in normal mode
nnoremap <space> :w<CR>

" cutlass.vim: map m to move
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

xnoremap p P

"------------------------------------------------------------
" Commands 
"

command! SV :source ~/.config/nvim/init.vim 
command! EV :e ~/.config/nvim/init.vim 

"------------------------------------------------------------

lua require('Comment').setup()

"------------------------------------------------------------
" fzf
"

let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=? -complete=dir F call fzf#vim#files(<q-args>, <bang>0)

"------------------------------------------------------------
" Config Vim Appearance
"

hi clear SignColumn
" hi StatusLine ctermfg=15 guifg=#ffffff ctermbg=4 guibg=#4e4e4e cterm=bold gui=bold
" hi StatusLine ctermfg=white guifg=#ffffff ctermbg=13 guibg=#4e4e4e cterm=bold gui=bold
" hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

" hi MatchParen cterm=none ctermbg=green ctermfg=black
set noshowmode

lua require('nvim-web-devicons').setup()
lua require('lualine').setup()

" Important!!
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai

"------------------------------------------------------------
" treesitter
"

lua <<EOF
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
EOF

"------------------------------------------------------------
" indent-blankline
"

lua <<EOF
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("ibl").setup()
EOF

"------------------------------------------------------------
" neogit + diffview
"

lua <<EOF
    local cb = require'diffview.config'.diffview_callback
    require'diffview'.setup {
        file_panel = {
            win_config = {
                position = "bottom",
                height = 16,
            }
        }
    }

    local neogit = require('neogit')
    neogit.setup {}
EOF

nnoremap <leader>gg :Neogit<CR>
nnoremap <leader>dv :DiffviewOpen<CR>
nnoremap <leader>tc :tabclose<CR>

"------------------------------------------------------------
" bufferline
"

lua << EOF
    require("bufferline").setup {
        options = {
            mode = "tabs",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }
            }
        }
    }
EOF

"------------------------------------------------------------
" lsp
"

lua << EOF
    local servers = { 'clangd', 'cmake', 'marksman', 'pyright', 'solc', 'gopls', 'tsserver', 'texlab', 'vimls', 'rust_analyzer' }
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    require("mason-lspconfig").setup {
        ensure_installed = servers,
        automatic_installation = true,
    }

    
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Set up nvim-cmp.
    local cmp = require'cmp'

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
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }),
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

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
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

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- local on_attach = function(client, bufnr)
    --     -- Enable completion triggered by <c-x><c-o>
    --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    --     -- Mappings.
    --     -- See `:help vim.lsp.*` for documentation on any of the below functions
    --     local bufopts = { noremap=true, silent=true, buffer=bufnr }
    --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --     vim.keymap.set('n', '<space>wl', function()
    --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --     end, bufopts)
    --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    --     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    --     vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    -- end

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end,
    })

    local nvim_lsp = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, server in ipairs(servers) do 
        nvim_lsp[server].setup {
            capabilities = capabilities
        }
    end 
EOF

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"------------------------------------------------------------
" tab keybinds
"

nnoremap <leader>tj :tabprevious<CR>                                                                            
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tn :tabnew<CR>

"------------------------------------------------------------
" nvim-tree
"

nnoremap <C-n> :NvimTreeFocus<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>

lua << EOF
    require'nvim-tree'.setup {
        open_on_tab = true,
    }
EOF

"------------------------------------------------------------
" relative line number
"

set rnu!
nnoremap <leader>rn :set rnu!<CR>

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"------------------------------------------------------------
" relative line number
"
lua << EOF
require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
}
EOF

source ~/.config/nvim/custom.vim
