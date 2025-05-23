return {
  "braxtons12/blame_line.nvim",
  config = function()
    local blameline = require('blame_line')

    blameline.setup {
      -- whether the blame line should be shown in visual modes
      show_in_visual = false,

      -- whether the blame line should be shown in insert mode
      show_in_insert = false,

      -- the string to prefix the blame line with
      prefix = "  ",

      -- String specifying the the blame line format.
      -- Any combination of the following specifiers, along with any additional text.
      --     - `"<author>"` - the author of the change.
      --     - `"<author-mail>"` - the email of the author.
      --     - `"<author-time>"` - the time the author made the change.
      --     - `"<committer>"` - the person who committed the change to the repository.
      --     - `"<committer-mail>"` - the email of the committer.
      --     - `"<committer-time>"` - the time the change was committed to the repository.
      --     - `"<summary>"` - the commit summary/message.
      --     - `"<commit-short>"` - short portion of the commit hash.
      --     - `"<commit-long>"` - the full commit hash.
      template = "<author>, <author-time>   <summary>",

      -- The highlight group to highlight the blame line with.
      -- The highlight of this group defaults to `Comment`.
      hl_group = "BlameLineNvim",

      -- keymap
      vim.keymap.set('n', '<leader>b', ':BlameLineToggle<cr>', {}),

      delay = 100,
    }

    blameline.disable()
  end
}
