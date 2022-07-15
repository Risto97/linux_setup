local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.setup({
  window = {
    winblend = 10,
  }
})

which_key.register({
 ["<leader>"] = {
    f = {
      name = "+file",
      f   = { "Find File" },
      r   = { "Open Recent File" },
      F =   { "Search for file" },
      R   = { "Rename file" },
      D   = { "Delete file" },
      s   = { "Save file" },
      e   = {
        name = "+config",
            d = { "Open vim config file"},
            R = { "Reload config"}
            },

    }, -- f

    h = {
      name = "+settings",
      p   = {
        name = "+package manager",
            i = {"Install Packages"},
            c = {"Uninstall Packages"},
            u = {"Update Packages"},
            l = {"Packer Status"},
            }, -- p
    }, -- h

    b = {
      name = "+buffers",
        n = {"Next Buffer"},
        p = {"Previous Buffer"},
        b = {"List buffers"},
        d = {"Delete Buffer"},
        Y = {"Copy buffer content"},
        P = {"Replace buffer content with clipboard"},
    }, -- b

    d = {
      name = "+diff",
        b = {"Diff buffer"},
        w = {"Diff opened vertical buffers"},
        q = {"Quit Diff mode"},
    }, -- d

    g = {
      name = "+git",
        s = {"LazyGit"},
        b = {
            name = "+blame",
            l = {"Blame line"},
            t = {"Toggle line blame"},
            d = {"Toggle deleted lines"},
        }, -- b
        h = {
            name = "+hunk",
            u = {"Undo stage hunk"},
            s = {"Stage hunk"},
            r = {"Reset hunk"},
            p = {"Preview hunk"},
        }, -- h
        f = {
            name = "+buffer",
            s = {"Stage buffer"},
            R = {"Reset buffer"},
        }, -- f
        d = {
            name = "+diff",
            d = {"Diff buffer"},
            D = {"Diff buffer"},
        }, -- f
    }, -- g

    q = {
      name = "+quit",
        q = {"Quit nvim"},
        Q = {"Force quit nvim"},
    }, -- q

    s = {
      name = "+search/cursor",
        e = {"Multiple Cursor"},
        c = {"Clear search highlight"},
        p = {"Grep project"},
        s = {"Swoop pattern"},
    }, -- s

    t = {
      name = "+theme/appearance",
        n = {"Toggle line number"},
        ["<BS>"] = {"Toggle split shade"},
    }, -- t

    w = {
      name = "+splits",
        d = {"Close split"},
        ["/"] = {"Split vertically"},
        ["_"] = {"Split horizontally"},
        ["="] = {"Reset sizes"},
        ["<DOWN>"] = {"Focus below"},
        ["<UP>"] = {"Focus above"},
        ["<LEFT>"] = {"Focus left"},
        ["<RIGHT>"] = {"Focus right"},
        ["w"] = {"Pick window"},
    }, -- w


  }, -- <LEADER>

  ["<leader><CR>"] = {"Open terminal"},
  ["<leader>_"] = "which_key_ignore",

    -- END <LEADER>
    --
 [","] = {
    c = {
      name = "+compile",
      a   = { "Code actions" },
      c   = { "QuickRun" },

    }, -- c

    g = {
      name = "+goto",
        D = {"Goto declaration"},
        d = {"Goto definition"},
        g = {"Goto definition"},
        i = {"Goto implementation"},
        r = {"List references"},
    }, -- g

    w = {
      name = "+workspace",
        a = {"Add workspace folder"},
        r = {"Remove workspace folder"},
        l = {"List workspace folder"},
    }, -- w

    d = {
      name = "+diagnostics",
        d = {"Document diagnostics"},
        w = {"Workspace diagnostics"},
    }, -- d

    ["="] = {"Format buffer"},          -- =
    ["f"] = {"Format buffer"},          -- =
    D =     {"Goto type definition"},   -- D
  }, -- <LEADER>

  [",rn"] = {"Rename in buffer"},

})
