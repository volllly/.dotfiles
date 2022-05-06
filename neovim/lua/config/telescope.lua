local utils = require'../utils'

require'telescope'.setup {
  extensions = {
    project = {
      base_dirs = {
        '~/source',
      }
		}
  }
}
require'telescope'.load_extension'project'

utils.key_mapper('n', '<A-p>', ':lua require"telescope".extensions.project.project{}<CR>')
utils.key_mapper('n', '<C-;>', ':lua require"telescope.builtin".commands{}<CR>')
utils.key_mapper('n', '<C-p>', [[:lua require'telescope.builtin'.find_files{}<CR>]])
utils.key_mapper('n', '<leader>f.', [[:lua require'telescope.builtin'.find_files{find_command={'rg','--files','--iglob','!.git','--hidden','--no-ignore'}}<CR>]])
utils.key_mapper('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>')
utils.key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
utils.key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')


