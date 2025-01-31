require("config")
require("autocmds")

vim.filetype.add({
    pattern = {
        ['.*/playbooks/.*'] = 'yaml.ansible',
        ['.*/docker-compose.yaml'] = 'yaml.docker-compose',
    },
})
