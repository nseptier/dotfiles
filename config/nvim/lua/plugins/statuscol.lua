return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local builtin = require("statuscol.builtin")

    local ffi = require("statuscol.ffidef")
    local C = ffi.C

    function foldfunc(args)
      local width = args.fold.width
      if width == 0 then return "" end

      local foldinfo = C.fold_info(args.wp, args.lnum)
      local string = args.cul and args.relnum == 0 and "%#CursorLineFold#" or "%#FoldColumn#"
      local closestring = args.cul and args.relnum == 0 and "%#CursorLineFoldClose#" or "%#FoldColumnClose#"
      local openstring = args.cul and args.relnum == 0 and "%#CursorLineFoldOpen#" or "%#FoldColumnOpen#"
      local level = foldinfo.level

      if level == 0 then return string .. (" "):rep(width) .. "%*" end

      local closed = foldinfo.lines > 0
      local first_level = level - width - (closed and 1 or 0) + 1
      if first_level < 1 then first_level = 1 end

      -- For each column, add a foldopen, foldclosed, foldsep or padding char
      local range = level < width and level or width
      for col = 1, range do
        if args.virtnum ~= 0 then
          string = string .. args.fold.sep
        elseif closed and (col == level or col == width) then
          string = closestring .. args.fold.close
        elseif foldinfo.start == args.lnum and first_level + col > foldinfo.llevel then
          string = openstring .. args.fold.open
        else
          string = string .. args.fold.sep
        end
      end
      if range < width then string = string .. (" "):rep(width - range) end

      return string .. "%*"
    end

    require("statuscol").setup({
      -- setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
      -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
      -- Although I recommend just using the segments field below to build your
      -- statuscolumn to benefit from the performance optimizations in this plugin.
      -- builtin.lnumfunc number string options
      thousands = false,  -- or line number thousands separator string ("." / ",")
      relculright = true, -- whether to right-align the cursor line number with 'relativenumber' set
      -- Builtin 'statuscolumn' options
      ft_ignore = nil,    -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
      bt_ignore = nil,    -- Lua table with 'buftype' values for which 'statuscolumn' will be unset
      -- Default segments (fold -> sign -> line number + separator), explained below
      segments = {
        {
          text = { " " },
        },
        {
          text = {
            foldfunc,
          },
          sign = {
            maxwidth = 99,
            colwidth = 99,
          },
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        {
          text = { " " },
        },
      },
      -- clickmod = "c",   -- modifier used for certain actions in the builtin clickhandlers:
      -- -- "a" for Alt, "c" for Ctrl and "m" for Meta.
      -- clickhandlers = { -- builtin click handlers, keys are pattern matched
      --   Lnum                   = builtin.lnum_click,
      --   FoldClose              = builtin.foldclose_click,
      --   FoldOpen               = builtin.foldopen_click,
      --   FoldOther              = builtin.foldother_click,
      --   DapBreakpointRejected  = builtin.toggle_breakpoint,
      --   DapBreakpoint          = builtin.toggle_breakpoint,
      --   DapBreakpointCondition = builtin.toggle_breakpoint,
      --   ["diagnostic/signs"]   = builtin.diagnostic_click,
      --   gitsigns               = builtin.gitsigns_click,
      -- },
    })
  end,
}
