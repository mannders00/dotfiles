-- 1) define a global helper to fetch counts
function _G.lsp_diag_status()
  local buf = 0  -- current buffer
  local errs = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.ERROR   })
  local warns = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.WARN    })
  local infos = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.INFO    })
  local hints = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.HINT    })
  if errs + warns + infos + hints == 0 then
    return ""  -- no diagnostics → empty
  end
  -- only show non-zero categories
  local parts = {}
  if errs  > 0 then table.insert(parts, "E:"..errs)   end
  if warns > 0 then table.insert(parts, "W:"..warns)  end
  if infos > 0 then table.insert(parts, "I:"..infos)  end
  if hints > 0 then table.insert(parts, "H:"..hints) end
  return table.concat(parts, " ")
end

-- 2) wire it into your statusline
--    %< … left-side, %= split, … right-side
vim.o.statusline = table.concat({
  "%<%f",                -- file path, cut off if too long
  "%m%r%h",              -- modified/read-only/help flags
  -- "%=",                  -- right align from here
  "%{v:lua.lsp_diag_status()}",  -- << your diagnostics <<
  "%=",
  "%l:%c %p%%",          -- line:col and percent through file
}, " ")

