return {
  'mrjones2014/smart-splits.nvim',
  build = './kitty/install-kittens.bash',
  keys = {
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    {
      '<A-h>',
      function ()
        require('smart-splits').resize_left()
      end,
    },
    {
      '<A-j>',
      function()
        require('smart-splits').resize_down()
      end
    },
    {
      '<A-k>',
      function()
        require('smart-splits').resize_up()
      end
    },
    {
      '<A-l>',
      function()
        require('smart-splits').resize_right()
      end
    },

    -- moving between splits
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end
    },

    -- swapping buffers between windows
    {
      '<leader><leader>h',
      function()
        require('smart-splits').swap_buf_left()
      end
    },
    {
      '<leader><leader>j',
      function()
        require('smart-splits').swap_buf_down()
      end
    },
    {
      '<leader><leader>k',
      function()
        require('smart-splits').swap_buf_up()
      end
    },
    {
      '<leader><leader>l',
      function()
        require('smart-splits').swap_buf_right()
      end
    },

  },
}
-- '', require('smart-splits').swap_buf_left)
-- '<leader><leader>j', require('smart-splits').swap_buf_down)
-- '<leader><leader>k', require('smart-splits').swap_buf_up)
-- '<leader><leader>l', require('smart-splits').swap_buf_right)
