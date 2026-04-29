vim.cmd('set background=dark')
vim.cmd('hi clear')
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd('syntax reset')
end
vim.g.colors_name = "frood"

local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

hi('String',                   { fg='#60c080',    bg='none'                    })
hi('Constant',                 { fg='Magenta',    bg='none'                    })
hi('Comment',                  { fg='Cyan',       bg='none'                    })
hi('Todo',                     { fg='Black',      bg='Cyan',    bold = true    })
hi('Special',                  { fg='DarkGray',   bg='none'                    })
hi('Delimiter',                { fg='DarkGray',   bg='none'                    })
hi('NormalFloat',              { fg='none',       bg='none'                    })

hi('IncSearch',                { fg='Black',      bg='Yellow'                  })
hi('Search',                   { fg='Black',      bg='Orange'                  })
hi('Visual',                   { fg='White',      bg='DarkBlue'                })
hi('VisualNos',                { fg='White',      bg='DarkBlue'                })
hi('CursorLine',               { fg='White',      bg='DarkBlue'                })

hi('StatusLine',               { fg='Black',      bg='LightGray'                })
hi('StatusLineNC',             { fg='Black',      bg='Gray'                    })

hi('LineNrAbove',              { fg='Gray',       bg='none'                    })
hi('LineNrBelow',              { fg='Gray',       bg='none'                    })

hi('Directory',                { fg='LightBlue',  bg='none'                    })

hi('ModeMsg',                  { fg='White',      bg='none'                    })
hi('ErrorMsg',                 { fg='White',      bg='Red'                     })
hi('MatchParen',               { fg='White',      bg='Blue'                    })
hi('Type',                     { fg='LightBlue',  bg='none'                    })
hi('EndOfBuffer',              { fg='Gray',       bg='none'                    })

-- left as regular
hi('PreProc',                  { fg='LightGray',  bg='none'                    })
hi('LineNr',                   { fg='White',      bg='none'                    })
hi('Statement',                { fg='LightGray',  bg='none'                    })
hi('Identifier',               { fg='LightGray',  bg='none'                    })
hi('Function',                 { fg='LightGray',  bg='none'                    })
hi('SpecialKey',               { fg='LightGray',  bg='none'                    })
hi('NonText',                  { fg='LightGray',  bg='none'                    })
hi('MoreMsg',                  { fg='LightGray',  bg='none'                    })
hi('Question',                 { fg='LightGray',  bg='none'                    })
hi('VertSplit',                { fg='LightGray',  bg='none'                    })
hi('WarningMsg',               { fg='LightGray',  bg='none'                    })
hi('WildMenu',                 { fg='LightGray',  bg='none'                    })
hi('Folded',                   { fg='LightGray',  bg='none'                    })
hi('FoldColumn',               { fg='LightGray',  bg='none'                    })
hi('DiffAdd',                  { fg='LightGray',  bg='none'                    })
hi('DiffChange',               { fg='LightGray',  bg='none'                    })
hi('DiffDelete',               { fg='LightGray',  bg='none'                    })
hi('DiffText',                 { fg='LightGray',  bg='none'                    })
hi('SignColumn',               { fg='LightGray',  bg='none'                    })
hi('Conceal',                  { fg='LightGray',  bg='none'                    })
hi('TabLine',                  { fg='LightGray',  bg='none'                    })
hi('TabLineSel',               { fg='LightGray',  bg='none'                    })
hi('TabLineFill',              { fg='LightGray',  bg='none'                    })
hi('CursorColumn',             { fg='LightGray',  bg='none'                    })
hi('ColorColumn',              { fg='LightGray',  bg='none'                    })
hi('Normal',                   { fg='LightGray',  bg='none'                    })
hi('Ignore',                   { fg='LightGray',  bg='none'                    })
hi('Error',                    { fg='LightGray',  bg='none'                    })

-- popup menu
hi('Pmenu',                    { fg='LightGray',  bg='none'                    })
hi('PmenuKind',                { fg='LightGray',  bg='none'                    })
hi('PmenuExtra',               { fg='LightGray',  bg='none'                    })
hi('PmenuSel',                 { fg='Black',      bg='LightGray'               })
hi('PmenuKindSel',             { fg='Black',      bg='LightGray'               })
hi('PmenuExtraSel',            { fg='Black',      bg='LightGray'               })
hi('PmenuSbar',                { fg='LightGray',  bg='none'                    })
hi('PmenuThumb',               { fg='LightGray',  bg='none'                    })

-- diagnostic highlights
hi('DiagnosticError',          { fg='Red',        bg='none'                    })
hi('DiagnosticWarn',           { fg='Yellow',     bg='none'                    })
hi('DiagnosticInfo',           { fg='Cyan',       bg='none'                    })
hi('DiagnosticHint',           { fg='LightBlue',  bg='none'                    })
hi('DiagnosticUnderlineError', { fg='none',       bg='none',       underline = true, sp = 'Red'       })
hi('DiagnosticUnderlineWarn',  { fg='none',       bg='none',       underline = true, sp = 'Yellow'    })
hi('DiagnosticUnderlineInfo',  { fg='none',       bg='none',       underline = true, sp = 'Cyan'      })
hi('DiagnosticUnderlineHint',  { fg='none',       bg='none',       underline = true, sp = 'LightBlue' })
