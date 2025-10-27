vim.filetype.add({
    pattern = {
        [".*playbooks/.*%.yaml"] = "yaml.ansible",
    },
    filename = {
        [".gitlab-ci.yml"] = "yaml.gitlab",
    },
})
