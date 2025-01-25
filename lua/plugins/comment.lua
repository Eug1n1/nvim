return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ignore = "^$",
            mappings = {
                basic = false,
                extra = false,
            },
        })
    end
    -- opts = {
    --     ignore = "^$",
    --     mappings = {
    --         basic = false,
    --         extra = false,
    --     }
    -- }
}
