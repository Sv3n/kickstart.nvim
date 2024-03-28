return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon').setup { settings = {
      sync_on_ui_close = true,
      save_on_toggle = true,
    } }
  end,
  init = function()
    local harpoon = require 'harpoon'
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end)
    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '5', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '6', function()
      harpoon:list():select(6)
    end)
  end,
}
