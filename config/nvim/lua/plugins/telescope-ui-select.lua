return {
  'nvim-telescope/telescope-ui-select.nvim',
  config = function()
    -- This is your opts table
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {

          -- {
          --   -- theme = "dropdown",

          --   results_title = false,

          --   sorting_strategy = "ascending",
          --   -- layout_strategy = "center",
          --   layout_config = {
          --     -- preview_cutoff = 1, -- Preview should always show (unless previewer = false)
          --     prompt_position = "top",


          --     width = function(_, max_columns, _)
          --       return math.min(max_columns, 80)
          --     end,

          --     height = function(_, _, max_lines)
          --       return math.min(max_lines, 15)
          --     end,
          --   },

          --   border = true,
          --   -- borderchars = {
          --   --   prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
          --   --   results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          --   --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          --   -- },
          -- }

          require("telescope.themes").get_dropdown {
            layout_strategy = "vertical",
            layout_config = {
              prompt_position = "top",
            }
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      }
    }
    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("ui-select")
  end
}
