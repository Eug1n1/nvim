require("blink.cmp").setup({
    fuzzy = {
        implementation = "rust"
    },
    keymap = {
        preset = "none",

        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
})
