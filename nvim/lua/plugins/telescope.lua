local builtin = require'telescope.builtin'

vimp.nnoremap('<Leader>ff', builtin.find_files)
vimp.nnoremap('<Leader>fp', builtin.git_files)
vimp.nnoremap('<Leader>fg', builtin.live_grep)
vimp.nnoremap('<Leader>fb', builtin.buffers)
vimp.nnoremap('<Leader>fh', builtin.help_tags)
vimp.nnoremap('<Leader>fm', builtin.oldfiles)
vimp.nnoremap('<Leader>fc', builtin.command_history)
