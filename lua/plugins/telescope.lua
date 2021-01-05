local builtin = require('telescope.builtin')

vimp.nnoremap({'silent'}, '<Leader>ff', builtin.find_files)
vimp.nnoremap({'silent'}, '<Leader>fp', builtin.git_files)
vimp.nnoremap({'silent'}, '<Leader>fg', builtin.live_grep)
vimp.nnoremap({'silent'}, '<Leader>fb', builtin.buffers)
vimp.nnoremap({'silent'}, '<Leader>fh', builtin.help_tags)
vimp.nnoremap({'silent'}, '<Leader>fm', builtin.oldfiles)
vimp.nnoremap({'silent'}, '<Leader>fc', builtin.command_history)
