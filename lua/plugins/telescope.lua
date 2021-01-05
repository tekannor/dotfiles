local builtin = require('telescope.builtin')

vimp.nnoremap({'silent'}, '<Leader>ff', function() builtin.find_files() end)
vimp.nnoremap({'silent'}, '<Leader>fp', function() builtin.git_files() end)
vimp.nnoremap({'silent'}, '<Leader>fg', function() builtin.live_grep() end)
vimp.nnoremap({'silent'}, '<Leader>fb', function() builtin.buffers() end)
vimp.nnoremap({'silent'}, '<Leader>fh', function() builtin.help_tags() end)
vimp.nnoremap({'silent'}, '<Leader>fm', function() builtin.oldfiles() end)
vimp.nnoremap({'silent'}, '<Leader>fc', function() builtin.command_history() end)
