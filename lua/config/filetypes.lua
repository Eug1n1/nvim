vim.filetype.add({
    pattern = {
        [".*playbooks/.*%.yaml"] = "yaml.ansible",
        [".*/templates/.*%.ya?ml"] = "helm",
        [".*%.ya?ml%.gotmpl"] = function(path)
            local dir = vim.fn.fnamemodify(path, ":p:h")
            local helmfiles = { "helmfile.yaml", "helmfile.yaml.gotmpl" }

            while dir ~= "/" do
                for _, fname in ipairs(helmfiles) do
                    if vim.fn.glob(dir .. "/" .. fname) ~= "" then
                        return "helm"
                    end
                end
                dir = vim.fn.fnamemodify(dir, ":h")
            end

            return nil
        end,
    },
    filename = {
        [".gitlab-ci.yml"] = "yaml.gitlab",
    },
    extension = {
        gotmpl = 'gotmpl',
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'helm' },
    callback = function() vim.treesitter.start() end,
})
