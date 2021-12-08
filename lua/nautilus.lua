local lush = require('lush')
local hsl = lush.hsl

local mode = "blue"

local function setup(opts)
  mode = opts.mode or "blue"
  vim.cmd [[ colorscheme nautilus ]]
end

local function theme(_mode)
  _mode = _mode or mode
  local baseAlt, base00, base01, base06

  if _mode == "grey" then
    --baseAlt = hsl('#181e2e')
    baseAlt = hsl('#1f283b')
    base00 = hsl('#1f283b')
    base01 = hsl('#2A354C')
    base06 = hsl('#354360')
  elseif _mode == "blue" then
    base00 = hsl('#091934')
    base01 = hsl('#0E274E')
    base06 = hsl('#213554')
    -- base00 = hsl('#0a1527')
    -- base01 = hsl('#11233e')
    -- base06 = hsl('#162d4b')
    baseAlt = base00.darken(30)
  end

  local base02 = hsl('#3a5488').darken(20)
  local base03 = hsl('#80b2d6')
  local base04 = hsl('#3aa3e9')
  local base05 = hsl('#abb2bf')
  local base07 = hsl('#c8ccd4')
  local base08 = hsl('#f04c75')
  local base09 = hsl('#ffae57')
  local base0A = hsl('#ffcc66')
  local base0B = hsl('#98c379')
  local base0C = hsl('#56b6c2')
  local base0D = hsl('#01bfef')
  local base0E = hsl('#c678dd')
  local base0F = hsl('#7a88cf')

  vim.g.terminal_color_0 = base00.hex
  vim.g.terminal_color_1 = base08.hex
  vim.g.terminal_color_2 = base0B.hex
  vim.g.terminal_color_3 = base0A.hex
  vim.g.terminal_color_4 = base0D.hex
  vim.g.terminal_color_5 = base0E.hex
  vim.g.terminal_color_6 = base0C.hex
  vim.g.terminal_color_7 = base05.hex
  vim.g.terminal_color_8 = base03.hex
  vim.g.terminal_color_9 = base08.hex
  vim.g.terminal_color_10 = base0B.hex
  vim.g.terminal_color_11 = base0A.hex
  vim.g.terminal_color_12 = base0D.hex
  vim.g.terminal_color_13 = base0E.hex
  vim.g.terminal_color_14 = base0C.hex
  vim.g.terminal_color_15 = base07.hex
  vim.g.terminal_color_background = base00.hex
  vim.g.terminal_color_foreground = base0E.hex

  return lush(function()
    return {
      Normal { fg = base05 },
      --Normal { fg = base05, bg = base00 },
      NormalFloat { fg = base05, bg = base01 },
      NormalAlt { fg = base05, bg = base00},
      FloatBorder { fg = base02, bg = baseAlt },
      --LineNr { fg = base02, bg = base00 },
      LineNr { fg = base02 },
      --CursorLineNr { fg = base0A, bg = base00 },
      CursorLineNr { fg = base0A },
      Bold { gui = 'bold' },
      Debug { fg = base08 },
      Directory { fg = base0D },
      Error { fg = base01, bg = base08 },
      ErrorMsg { fg = base08 },
      Exception { fg = base08 },
      FoldColumn { fg = base03 },
      Folded { fg = base03, bg = base00 },
      Italic { gui = 'italic' },
      Macro { fg = base08 },
      ModeMsg { fg = base0B },
      MoreMsg { fg = base0B },
      Question { fg = base0D },
      Search { fg = base00, bg = base04 },
      IncSearch { fg = base00, bg = base09 },
      Substitute { fg = base01, bg = base0A },
      SpecialKey { fg = base03 },
      TooLong { fg = base08 },
      Underlined { fg = base08 },
      Visual { bg = base02 },
      VisualNOS { fg = base08 },
      WarningMsg { fg = base08 },
      WildMenu { fg = base08, bg = base0A },
      Title { fg = base0D },
      Conceal { bg = base01.darken(20), fg = base0D },
      Cursor { fg = base00, bg = base05 },
      NonText { fg = base03 },
      LineNrNC { fg = base02, bg = base01 },
      QFLineNr { fg = base04 },
      SignColumn { fg = base01 },
      StatusLine { fg = base02, bg = base01 },
      StatusLineNC { fg = base02, bg = base01 },
      --VertSplit { fg = base02, bg = base00 },
      VertSplit { fg = base02 },
      ColorColumn { fg = base01, bg = base01 },
      CursorColumn { bg = base01 },
      CursorLine { bg = base06 },
      QuickFixLine { bg = base01 },
      QFFileName { fg = base0A },
      PMenu { fg = base05, bg = base01 },
      PMenuSel { fg = base00, bg = base0A },
      TabLine { fg = base03, bg = base00 },
      TabLineSel { fg = base00, bg = base0A },
      TabLineFill { fg = base03, bg = base00 },
      EndOfBuffer { fg = base01 },


      -- Standard syntax highlighting
      Boolean { fg = base09 },
      Character { fg = base08 },
      Comment { fg = base03 },
      Conditional { fg = base0E },
      Constant { fg = base09 },
      Define { fg = base0E },
      Delimiter { fg = base0F },
      Float { fg = base09 },
      Function { fg = base0D },
      Identifier { fg = base0A },
      Include { fg = base0D },
      Keyword { fg = base0E },
      Label { fg = base0A },
      Number { fg = base03 },
      Operator { fg = base03 },
      PreProc { fg = base0A },
      Repeat { fg = base0A },
      Special { fg = base0C },
      SpecialChar { fg = base0F },
      Statement { fg = base08 },
      StorageClass { fg = base0A },
      String { fg = base0B },
      Structure { fg = base0E },
      Tag { fg = base0A },
      Todo { fg = base0A, bg = base01 },
      Type { fg = base0A },
      Typedef { fg = base0A },

      ---
      -- Extra definitions
      ---

      -- Help
      HelpDoc { fg = base05, bg = base0D, gui = 'bold,italic' },
      HelpIgnore { fg = base0B, gui = 'bold,italic' },

      -- C highlighting
      cOperator { fg = base0C },
      cPreCondit { fg = base0E },

      -- C# highlighting
      csClass { fg = base0A },
      csAttribute { fg = base0A },
      csModifier { fg = base0E },
      csType { fg = base08 },
      csUnspecifiedStatement { fg = base0D },
      csContextualStatement { fg = base0E },
      csNewDecleration { fg = base08 },

      -- CSS highlighting
      cssBraces { fg = base05 },
      cssClassName { fg = base0E },
      cssColor { fg = base0C },

      -- Diff highlighting
      DiffAdd { bg = base0B.darken(70) },
      DiffAdded { bg = base0B.darken(70) },
      DiffNewFile { bg = base0B.darken(70) },

      DiffDelete { fg = base08, bg = base08.darken(80) },
      DiffRemoved { fg = base08, bg = base08.darken(80) },

      DiffChange { bg = base03.darken(60) },
      DiffFile { bg = base03.darken(60) },
      DiffLine { bg = base03.darken(60) },
      DiffText { bg = base03.darken(60) },

      -- Git highlighting
      gitcommitOverflow { fg = base08 },
      gitcommitSummary { fg = base0B },
      gitcommitComment { fg = base03 },
      gitcommitUntracked { fg = base03 },
      gitcommitDiscarded { fg = base03 },
      gitcommitSelected { fg = base03 },
      gitcommitHeader { fg = base0E },
      gitcommitSelectedType { fg = base0D },
      gitcommitUnmergedType { fg = base0D },
      gitcommitDiscardedType { fg = base0D },
      gitcommitBranch { fg = base09 },
      gitcommitUntrackedFile { fg = base0A },
      gitcommitUnmergedFile { fg = base08 },
      gitcommitDiscardedFile { fg = base08 },
      gitcommitSelectedFile { fg = base0B },

      -- GitGutter highlighting
      GitGutterAdd { fg = base0B, bg = base01 },
      GitGutterChange { fg = base0D, bg = base01 },
      GitGutterDelete { fg = base08, bg = base01 },
      GitGutterChangeDelete { fg = base0E, bg = base01 },

      -- HTML highlighting
      htmlBold { fg = base0A },
      htmlItalic { fg = base0E },
      htmlEndTag { fg = base05 },
      htmlTag { fg = base05 },
      htmlTagName { fg = base03 },

      -- JavaScript highlighting
      javaScript { fg = base05 },
      javaScriptBraces { fg = base05 },
      javaScriptNumber { fg = base09 },

      -- pangloss/vim-javascript highlighting
      jsOperator { fg = base0D },
      jsStatement { fg = base0E },
      jsReturn { fg = base0E },
      jsThis { fg = base08 },
      jsClassDefinition { fg = base0A },
      jsFunction { fg = base0E },
      jsFuncName { fg = base0D },
      jsFuncCall { fg = base0D },
      jsClassFuncName { fg = base0D },
      jsClassMethodType { fg = base0E },
      jsRegexpString { fg = base0C },
      jsGlobalObjects { fg = base0A },
      jsGlobalNodeObjects { fg = base0A },
      jsExceptions { fg = base0A },
      jsBuiltins { fg = base0A },

      -- Mail highlighting
      mailQuoted1 { fg = base0A },
      mailQuoted2 { fg = base0B },
      mailQuoted3 { fg = base0E },
      mailQuoted4 { fg = base0C },
      mailQuoted5 { fg = base0D },
      mailQuoted6 { fg = base0A },
      mailURL { fg = base0D },
      mailEmail { fg = base0D },

      -- Markdown highlighting
      markdownHeadingDelimiter { fg = base0F },
      markdownh1 { fg = base0A, gui = 'bold' },
      markdownh2 { fg = base0A, gui = 'bold' },
      markdownh3 { fg = base0A, gui = 'bold' },
      markdownh4 { fg = base0A, gui = 'bold' },
      markdownh5 { fg = base0A, gui = 'bold' },
      markdownh6 { fg = base0A, gui = 'bold' },
      --markdownRule { fg = markdownh2.bg, gui = 'bold' },
      markdownItalic { fg = base05, gui = 'italic' },
      markdownBold { fg = base0A, gui = 'bold' },
      markdownBoldItalic { fg = base05, gui = 'bold,italic' },
      markdownCodeDelimiter { fg = base0F, gui = 'bold' },
      markdownCode { fg = base0D },
      markdownCodeBlock { fg = base0F, bg = base00 },
      markdownFootnoteDefinition { fg = base05, gui = 'italic' },
      markdownListMarker { fg = base0F, gui = 'bold' },
      markdownLineBreak { fg = base08, gui = 'underline' },
      markdownError { fg = base05, bg = base00 },
      markdownFootnote { fg = base0E, gui = 'italic' },
      markdownBlockquote { fg = base0C, gui = 'italic' },
      markdownLinkText { fg = base0B },
      markdownUrl { fg = base05 },
      wikiLinkText { fg = base0B },
      markdownTaskDelimiter { fg = base0F },
      markdownTaskDONE { fg = base0F },
      markdownTaskTODO { fg = base0F },
      markdownLinkTextDelimiter { fg = base06},
      markdownLinkDelimiter { fg = base06},

      -- NERDTree highlighting
      NERDTreeDirSlash { fg = base0D },
      NERDTreeExecFile { fg = base05 },

      -- PHP highlighting
      phpMemberSelector { fg = base05 },
      phpComparison { fg = base05 },
      phpParent { fg = base05 },
      phpMethodsVar { fg = base0C },

      -- Python highlighting
      pythonOperator { fg = base0E },
      pythonRepeat { fg = base0E },
      pythonInclude { fg = base0E },
      pythonStatement { fg = base0E },

      -- Ruby highlighting
      rubyAttribute { fg = base0D },
      rubyConstant { fg = base0A },
      rubyInterpolationDelimiter { fg = base0F },
      rubyRegexp { fg = base0C },
      rubySymbol { fg = base0B },
      rubyStringDelimiter { fg = base0B },

      -- SASS highlighting
      sassidChar { fg = base08 },
      sassClassChar { fg = base09 },
      sassInclude { fg = base0E },
      sassMixing { fg = base0E },
      sassMixinName { fg = base0D },

      -- Signify highlighting
      -- SignifySignAdd { fg = base0B, bg = base00 },
      -- SignifySignChange { fg = base03, bg = base00 },
      -- SignifySignDelete { fg = base08, bg = base00 },

      -- Spelling highlighting
      SpellBad { gui = 'undercurl' }, --, base08)
      SpellLocal { gui = 'undercurl' }, --, base0C)
      SpellCap { gui = 'undercurl' }, --, base0D)
      SpellRare { gui = 'undercurl' }, --, base0E)

      -- Startify highlighting
      StartifyBracket { fg = base03 },
      StartifyFile { fg = base07 },
      StartifyFooter { fg = base03 },
      StartifyHeader { fg = base0B },
      StartifyNumber { fg = base09 },
      StartifyPath { fg = base03 },
      StartifySection { fg = base0E },
      StartifySelect { fg = base0C },
      StartifySlash { fg = base03 },
      StartifySpecial { fg = base03 },

      -- Java highlighting
      javaOperator { fg = base0D },

      -- Vim
      -- vimCommand { fg = hue_3, bg = none },
      -- vimCommentTitle { fg = mono_3, gui = 'bold' },
      -- vimFunction { fg = l.Function, bg =  none },
      -- vimFuncName { fg = hue_3, bg =  none },
      -- vimHighlight { fg = hue_2, bg =  none },
      -- vimLineComment { fg = mono_3, gui = 'italic' },
      -- vimParenSep { fg = mono_2 },
      -- vimSep { fg = mono_2 },
      -- vimUserFunc { fg = hue_1, bg =  none },
      -- vimUserCommand { fg = hue_1, bg =  none },
      -- vimVar { fg = hue_5, bg =  none },

      -- Telescope highlighting
      TelescopeNormal { fg = base05, bg = baseAlt },
      TelescopePreviewNormal { fg = base05, bg = baseAlt },

      TelescopePreviewBorder { fg = base02, bg = base00 },
      TelescopeResultsBorder { fg = base02, bg = baseAlt },
      TelescopePromptBorder { fg = base02, bg = base00},
      -- TelescopeBorder { fg = base02, bg = base01 },
      TelescopePromptPrefix { fg = base08 },
      TelescopeMatching { fg = base04 },
      TelescopeSelection { fg = base0A },
      TelescopeSelectionCaret { fg = base0A, bg = baseAlt },

      --LSP highlighting
      DiagnosticError { fg = base08 },
      DiagnosticWarn { fg = base09 },
      DiagnosticInfor { fg = base0B },
      DiagnostictHint { fg = base0A },

      -- XML highlighting
      xmlTagName { fg = base0D },
      xmlCdatastart { fg = base0A },
      xmlEndTag { fg = xmlTagName.bg },
      xmlCdataCdata { fg = xmlCdatastart.bg },

      -- MatchParen
      MatchParen { fg = base07, bg = base08 },

      -- CodeQL
      CodeqlAstFocus { fg = base00, bg = base03 },
      CodeQLWindowPicker { fg= base00, bg = base0D },

      -- TreeSitter
      TSError { fg = Error.bg },
      TSPunctDelimiter { fg = base05 },
      TSPunctBracket { fg = base05 },
      TSConstant { fg = Constant.fg },
      TSConstBuiltin { fg = Constant.fg },
      TSConstMacro { fg = Constant.fg },
      TSString { fg = String.fg },
      TSStringRegex { fg = base03 },
      TSStringEscape { fg = base03 },
      TSCharacter { fg = Character.fg },
      TSNumber { fg = Number.fg },
      TSBoolean { fg = Boolean.fg },
      TSFloat { fg = Number.fg },
      TSFunction { fg = Function.fg },
      TSFuncBuiltin { fg = Function.fg },
      TSFuncMacro { fg = Function.fg },
      TSParameter { fg = base0D },
      TSConstructor { fg = base0E },
      TSKeywordFunction { fg = base0E },
      TSLiteral { fg = base04 },
      TSVariable { fg = base03 },
      TSVariableBuiltin { fg = base0E },
      TSParameterReference { fg = TSParameter.fg },
      TSMethod { fg = Function.fg },
      TSConditional { fg = Conditional.fg },
      TSRepeat { fg = Repeat.fg },
      TSLabel { fg = Label.fg },
      TSOperator { fg = Operator.fg },
      TSKeyword { fg = Keyword.fg },
      TSException { fg = Exception.fg },
      TSType { fg = Type.fg },
      TSTypeBuiltin { fg = Type.fg },
      TSStructure { fg = Structure.fg },
      TSInclude { fg = Include.fg },
      TSAnnotation { fg = base03 },
      TSStrong { fg = base05, bg = base00, gui = 'bold' },
      TSTitle { fg = base0D },

      -- Diff highlighting
      GitSignsAdd { fg = base0B, },
      GitSignsDelete { fg = base08 },
      GitSignsChange { fg = base03 },

      -- Indent-Blank-Lines
      IndentGuide { fg = base01 },

      -- Octo,nvim
      OctoEditable { bg = base01.darken(20) },
      OctoUserViewer { bg = base01, fg = base0A },
      OctoUser { bg = base00, fg = base04 },
      OctoStateOpen { fg = base0B },
      OctoGreen { fg = base0B },

      -- IndentBlankline
      IndentBlanklineChar {fg = base01, gui="nocombine"},
      IndentBlanklineSpaceChar { fg = base08, gui="nocombine"},
      IndentBlanklineSpaceCharBlankline { fg = base0B, gui="nocombine"},

      -- LSP
      LspFloatWinBorder { fg = base02 },
      LspSagaDiagnosticBorder { fg = base02 },
      LspSagaRenameBorder { fg = base02 },
      LspSagaHoverBorder { fg = base02 },
      LspSagaSignatureHelpBorder { fg = base02 },
      LspSagaLspFinderBorder { fg = base02 },
      LspSagaCodeActionBorder { fg = base02 },
      LspSagaDefPreviewBorder { fg = base02 },
      LspSagaDiagnosticTruncateLine { fg = base02 },
      LspSagaShTruncateLine { fg = base02 },
      LspSagaDocTruncateLine { fg = base02 },

      -- DiffView
      DiffviewNormal { fg = base05, bg = base00 },

      -- Nvim
      -- NvimNotificationInfo { fg = base0A, bg = base00},
      -- NvimNotificationError { fg = base08, bg = base00},

      -- Neogit
      NeogitHunkHeader { bg = baseAlt},
      NeogitHunkHeaderHighlight { fg = base0A, bg = baseAlt},
      NeogitDiffContextHighlight { fg = base04, bg = baseAlt},
      NeogitDiffAddHighlight { fg = base0B, bg = baseAlt},
      NeogitDiffDeleteHighlight { fg = base08, bg = baseAlt},

      -- Nvim-tree
      NvimTreeOpenedFile { fg = base0A },
      NvimTreeNormal { fg = base05, bg = baseAlt },

      -- Copilot
      -- CopilotSuggestion {fg = Normal.bg},

      -- Notify
      -- NotifyERRORBody { fg = base05, bg = base08 },
      -- NotifyWARNBody { fg = base05, bg = base08 },
      -- NotifyINFOBody { fg = base05, bg = base08 },
      -- NotifyDEBUGBody { fg = base05, bg = base08 },
      -- NotifyTRACEBody { fg = base05, bg = base08 },
      --
      -- NotifyERRORTitle { fg = base05, bg = base08 },
      -- NotifyWARNTitle { fg = base05, bg = base08 },
      -- NotifyINFOTitle { fg = base05, bg = base08 },
      -- NotifyDEBUGTitle  { fg = base05, bg = base08 },
      -- NotifyTRACETitle { fg = base05, bg = base08 },
      --
      -- NotifyERRORIcon { fg = base05, bg = base08 },
      -- NotifyWARNIcon { fg = base05, bg = base08 },
      -- NotifyINFOIcon { fg = base05, bg = base08 },
      -- NotifyDEBUGIcon  { fg = base05, bg = base08 },
      -- NotifyTRACEIcon { fg = base05, bg = base08 },
      --
      -- NotifyERRORBorder { fg = base05, bg = base08 },
      -- NotifyWARNBorder { fg = base05, bg = base08 },
      -- NotifyINFOBorder { fg = base05, bg = base08 },
      -- NotifyDEBUGBorder  { fg = base05, bg = base08 },
      -- NotifyTRACEBorder { fg = base05, bg = base08 },

      -- CmpItemAbbr {fg = Comment.fg, bg = Comment.bg},
      -- CmpItemAbbrDeprecated { fg = Error.fg, bg = Error.bg },
      -- CmpItemKind { fg = Special.fg, bg = Special.bg},
      -- CmpItemMenu {fg = NonText.fg, bg = NonText.bg},
      -- CmpItemAbbrHatchFuzzy { fg = base01, g:dark(), nil, s.italic).!
      CmpGhostText { fg = base05.darken(30), bg = base00 },
    }
  end)
end

return {
  theme = theme,
  setup = setup
}
