local utils = require "nautilus.utils"

local M = {}

local colors = {
  default = {
    bg = "#181e2e",
    bg_alt = "#141824",
    cobalt = "#354360",
    red = "#f04c75",
    orange = "#d2ac5c",
    yellow = "#c7c463",
    green = "#a5c96e",
    magenta = "#a974ab",
    purple = "#7a88cf",
    white = "#c8ccd4",
    grey = "#abb2bf",
    blue = "#719CD6", --"#3aa3e9",
    blue_dim = "#80b2d6",
    blue_bright = "#01bfef",
    cyan = "#56b6c2",
    none = "NONE",
  },
  octonauts = {
    bg = "#2f343f",
    bg_alt = "#252931",
    cobalt = "#3f5d7a", --#d38391
    red = "#cb7165",
    orange = "#ffae57",
    yellow = "#ffcc66",
    green = "#98c379",
    magenta = "#c678dd",
    purple = "#7a88cf",
    white = "#c8ccd4",
    grey = "#abb2bf",
    blue = "#719CD6",
    blue_dim = "#9bbdcb",
    blue_bright = "#5E81AC",
    cyan = "#3a8096",
    none = "NONE",
  }
}

function M.apply(opts)
  opts.mode = opts.mode or "default"
  local c = colors[opts.mode]
  local theme = {
    colors = c,
    config = opts,
    mode = opts.mode
  }
  theme.groups = {
    Normal = { fg = c.grey, bg = opts.transparent and c.none or c.bg },
    NormalFloat = { fg = c.grey, bg = c.bg_alt },
    NormalAlt = { fg = c.grey, bg = c.bg_alt },
    FloatBorder = { fg = c.bg, bg = c.bg_alt },
    LineNr = { fg = c.cobalt },
    CursorLine = {},
    CursorLineNr = { fg = c.yellow },
    Bold = { style = "bold" },
    Debug = { fg = c.red },
    Directory = { fg = c.blue_bright },
    Error = { fg = c.bg_alt, bg = c.red },
    ErrorMsg = { fg = c.red },
    Exception = { fg = c.red },
    FoldColumn = { fg = c.blue_dim },
    Folded = { fg = c.blue_dim, bg = c.bg_alt },
    Italic = { style = "italic" },
    Macro = { fg = c.red },
    ModeMsg = { fg = c.green },
    MoreMsg = { fg = c.green },
    Question = { fg = c.blue_bright },
    Search = { fg = c.bg_alt, bg = c.blue },
    IncSearch = { fg = c.bg_alt, bg = c.orange },
    Substitute = { fg = c.bg_alt, bg = c.yellow },
    SpecialKey = { fg = c.blue_dim },
    TooLong = { fg = c.red },
    Underlined = { fg = c.red },
    Visual = { bg = c.cobalt },
    VisualNOS = { fg = c.red },
    WarningMsg = { fg = c.red },
    WildMenu = { fg = c.red, bg = c.yellow },
    Title = { fg = c.blue_bright },
    Conceal = { bg = c.cobalt, fg = c.blue_bright },
    Cursor = { fg = c.bg_alt, bg = c.grey },
    NonText = { fg = c.blue_dim },
    LineNrNC = { fg = c.cobalt, bg = c.bg_alt },
    QFLineNr = { fg = c.blue },
    SignColumn = { fg = c.bg_alt },
    -- if StatusLine and StatusLineNC have equal values, then Vim will use ^^^ in the status line of the current window
    StatusLine = { fg = c.cobalt, bg = c.bg_alt },
    StatusLineNC = { fg = c.bg_alt, bg = c.bg_alt },
    VertSplit = { fg = c.bg_alt },
    WinSeparator = { fg = c.cobalt },
    ColorColumn = { fg = c.bg_alt, bg = c.bg_alt },
    CursorColumn = { bg = c.bg },
    QuickFixLine = { bg = c.bg_alt },
    QFFileName = { fg = c.yellow },
    PMenu = { fg = c.grey, bg = c.bg_alt },
    PMenuSel = { fg = c.bg_alt, bg = c.yellow },
    TabLine = { fg = c.blue_dim, bg = c.bg_alt },
    TabLineSel = { fg = c.bg_alt, bg = c.yellow },
    TabLineFill = { fg = c.blue_dim, bg = c.bg_alt },
    EndOfBuffer = { fg = c.bg_alt },

    -- Standard syntax highlighting
    Boolean = { fg = c.orange },
    Character = { fg = c.red },
    Comment = { fg = c.blue_dim },
    Conditional = { fg = c.magenta },
    Constant = { fg = c.orange },
    Define = { fg = c.magenta },
    Delimiter = { fg = c.purple },
    Float = { fg = c.orange },
    Function = { fg = c.blue_bright },
    Identifier = { fg = c.yellow },
    Include = { fg = c.blue_bright },
    Keyword = { fg = c.magenta },
    Label = { fg = c.yellow },
    Number = { fg = c.blue_dim },
    Operator = { fg = c.blue_dim },
    PreProc = { fg = c.yellow },
    Repeat = { fg = c.yellow },
    Special = { fg = c.cyan },
    SpecialChar = { fg = c.purple },
    Statement = { fg = c.red },
    StorageClass = { fg = c.yellow },
    String = { fg = c.green },
    Structure = { fg = c.magenta },
    Tag = { fg = c.yellow },
    Todo = { fg = c.yellow, bg = c.bg_alt },
    Type = { fg = c.yellow },
    Typedef = { fg = c.yellow },

    ---
    -- Extra definitions
    ---

    -- Help
    HelpDoc = { fg = c.grey, bg = c.blue_bright, style = "bold,italic" },
    HelpIgnore = { fg = c.green, style = "bold,italic" },

    -- C highlighting
    cOperator = { fg = c.cyan },
    cPreCondit = { fg = c.magenta },

    -- C# highlighting
    csClass = { fg = c.yellow },
    csAttribute = { fg = c.yellow },
    csModifier = { fg = c.magenta },
    csType = { fg = c.red },
    csUnspecifiedStatement = { fg = c.blue_bright },
    csContextualStatement = { fg = c.magenta },
    csNewDecleration = { fg = c.red },

    -- CSS highlighting
    cssBraces = { fg = c.grey },
    cssClassName = { fg = c.magenta },
    cssColor = { fg = c.cyan },

    -- Diff highlighting
    DiffAdd = { fg = c.green, bg = utils.darken(c.green, 0.3) },
    DiffAdded = { fg = c.green, bg = utils.darken(c.green, 0.3) },
    DiffNewFile = { fg = c.green, bg = utils.darken(c.green, 0.3) },

    DiffDelete = { fg = c.red, bg = utils.darken(c.red, 0.2) },
    DiffRemoved = { fg = c.red, bg = utils.darken(c.red, 0.2) },

    DiffChange = { bg = utils.darken(c.blue_dim, 0.4) },
    DiffFile = { bg = utils.darken(c.blue_dim, 0.4) },
    DiffLine = { bg = utils.darken(c.blue_dim, 0.4) },
    DiffText = { bg = utils.darken(c.blue_dim, 0.4) },

    -- Git highlighting
    gitcommitOverflow = { fg = c.red },
    gitcommitSummary = { fg = c.green },
    gitcommitComment = { fg = c.blue_dim },
    gitcommitUntracked = { fg = c.blue_dim },
    gitcommitDiscarded = { fg = c.blue_dim },
    gitcommitSelected = { fg = c.blue_dim },
    gitcommitHeader = { fg = c.magenta },
    gitcommitSelectedType = { fg = c.blue_bright },
    gitcommitUnmergedType = { fg = c.blue_bright },
    gitcommitDiscardedType = { fg = c.blue_bright },
    gitcommitBranch = { fg = c.orange },
    gitcommitUntrackedFile = { fg = c.yellow },
    gitcommitUnmergedFile = { fg = c.red },
    gitcommitDiscardedFile = { fg = c.red },
    gitcommitSelectedFile = { fg = c.green },

    -- GitGutter highlighting
    GitGutterAdd = { fg = c.green, bg = c.bg_alt },
    GitGutterChange = { fg = c.blue_bright, bg = c.bg_alt },
    GitGutterDelete = { fg = c.red, bg = c.bg_alt },
    GitGutterChangeDelete = { fg = c.magenta, bg = c.bg_alt },

    -- HTML highlighting
    htmlBold = { fg = c.yellow },
    htmlItalic = { fg = c.magenta },
    htmlEndTag = { fg = c.grey },
    htmlTag = { fg = c.grey },
    htmlTagName = { fg = c.blue_dim },

    -- JavaScript highlighting
    javaScript = { fg = c.grey },
    javaScriptBraces = { fg = c.grey },
    javaScriptNumber = { fg = c.orange },

    -- pangloss/vim-javascript highlighting
    jsOperator = { fg = c.blue_bright },
    jsStatement = { fg = c.magenta },
    jsReturn = { fg = c.magenta },
    jsThis = { fg = c.red },
    jsClassDefinition = { fg = c.yellow },
    jsFunction = { fg = c.magenta },
    jsFuncName = { fg = c.blue_bright },
    jsFuncCall = { fg = c.blue_bright },
    jsClassFuncName = { fg = c.blue_bright },
    jsClassMethodType = { fg = c.magenta },
    jsRegexpString = { fg = c.cyan },
    jsGlobalObjects = { fg = c.yellow },
    jsGlobalNodeObjects = { fg = c.yellow },
    jsExceptions = { fg = c.yellow },
    jsBuiltins = { fg = c.yellow },

    -- Mail highlighting
    mailQuoted1 = { fg = c.yellow },
    mailQuoted2 = { fg = c.green },
    mailQuoted3 = { fg = c.magenta },
    mailQuoted4 = { fg = c.cyan },
    mailQuoted5 = { fg = c.blue_bright },
    mailQuoted6 = { fg = c.yellow },
    mailURL = { fg = c.blue_bright },
    mailEmail = { fg = c.blue_bright },

    -- Markdown highlighting
    markdownHeadingDelimiter = { fg = c.purple },
    markdownh1 = { fg = c.yellow, style = "bold" },
    markdownh2 = { fg = c.yellow, style = "bold" },
    markdownh3 = { fg = c.yellow, style = "bold" },
    markdownh4 = { fg = c.yellow, style = "bold" },
    markdownh5 = { fg = c.yellow, style = "bold" },
    markdownh6 = { fg = c.yellow, style = "bold" },
    --markdownRule = { fg = c.markdownh2.bg, style ='bold' },
    markdownItalic = { fg = c.grey, style = "italic" },
    markdownBold = { fg = c.yellow, style = "bold" },
    markdownBoldItalic = { fg = c.grey, style = "bold,italic" },
    markdownCodeDelimiter = { fg = c.purple, style = "bold" },
    -- markdownCode = { fg = c.blue_bright },
    -- markdownCodeBlock = { fg = c.purple, bg = c.bg_alt },
    markdownCodeBlock = { bg = c.bg_alt },
    markdownFootnoteDefinition = { fg = c.grey, style = "italic" },
    markdownListMarker = { fg = c.purple, style = "bold" },
    markdownLineBreak = { fg = c.red, style = "underline" },
    markdownError = { fg = c.grey, bg = c.bg_alt },
    markdownFootnote = { fg = c.magenta, style = "italic" },
    markdownBlockquote = { fg = c.cyan, style = "italic" },
    markdownLinkText = { fg = c.green },
    markdownUrl = { fg = c.grey },
    wikiLinkText = { fg = c.green },
    markdownTaskDelimiter = { fg = c.purple },
    markdownTaskDONE = { fg = c.purple },
    markdownTaskTODO = { fg = c.purple },
    markdownLinkTextDelimiter = { fg = c.cobalt },
    markdownLinkDelimiter = { fg = c.cobalt },

    -- NERDTree highlighting
    NERDTreeDirSlash = { fg = c.blue_bright },
    NERDTreeExecFile = { fg = c.grey },

    -- PHP highlighting
    phpMemberSelector = { fg = c.grey },
    phpComparison = { fg = c.grey },
    phpParent = { fg = c.grey },
    phpMethodsVar = { fg = c.cyan },

    -- Python highlighting
    pythonOperator = { fg = c.magenta },
    pythonRepeat = { fg = c.magenta },
    pythonInclude = { fg = c.magenta },
    pythonStatement = { fg = c.magenta },

    -- Ruby highlighting
    rubyAttribute = { fg = c.blue_bright },
    rubyConstant = { fg = c.yellow },
    rubyInterpolationDelimiter = { fg = c.purple },
    rubyRegexp = { fg = c.cyan },
    rubySymbol = { fg = c.green },
    rubyStringDelimiter = { fg = c.green },

    -- SASS highlighting
    sassidChar = { fg = c.red },
    sassClassChar = { fg = c.orange },
    sassInclude = { fg = c.magenta },
    sassMixing = { fg = c.magenta },
    sassMixinName = { fg = c.blue_bright },

    -- Signify highlighting
    -- SignifySignAdd = { fg = c.green, bg = c.bg_alt },
    -- SignifySignChange = { fg = c.blue_dim, bg = c.bg_alt },
    -- SignifySignDelete = { fg = c.red, bg = c.bg_alt },

    -- Spelling highlighting
    SpellBad = { style = "undercurl" }, --, red)
    SpellLocal = { style = "undercurl" }, --, cyan)
    SpellCap = { style = "undercurl" }, --, blue_bright)
    SpellRare = { style = "undercurl" }, --, magenta)

    -- Startify highlighting
    StartifyBracket = { fg = c.blue_dim },
    StartifyFile = { fg = c.white },
    StartifyFooter = { fg = c.blue_dim },
    StartifyHeader = { fg = c.green },
    StartifyNumber = { fg = c.orange },
    StartifyPath = { fg = c.blue_dim },
    StartifySection = { fg = c.magenta },
    StartifySelect = { fg = c.cyan },
    StartifySlash = { fg = c.blue_dim },
    StartifySpecial = { fg = c.blue_dim },

    -- Java highlighting
    javaOperator = { fg = c.blue_bright },

    -- Vim
    -- vimCommand = { fg = c.hue_3, bg = c.none },
    -- vimCommentTitle = { fg = c.mono_3, style ='bold' },
    -- vimFunction = { fg = c.l.Function, bg = c. none },
    -- vimFuncName = { fg = c.hue_3, bg = c. none },
    -- vimHighlight = { fg = c.hue_2, bg = c. none },
    -- vimLineComment = { fg = c.mono_3, style ='italic' },
    -- vimParenSep = { fg = c.mono_2 },
    -- vimSep = { fg = c.mono_2 },
    -- vimUserFunc = { fg = c.hue_1, bg = c. none },
    -- vimUserCommand = { fg = c.hue_1, bg = c. none },
    -- vimVar = { fg = c.hue_5, bg = c. none },

    -- Telescope highlighting
    TelescopeNormal = { fg = c.grey, bg = c.bg_alt },
    TelescopePreviewNormal = { fg = c.grey, bg = c.bg_alt },

    TelescopePreviewBorder = { fg = c.bg, bg = c.bg_alt },
    TelescopeResultsBorder = { fg = c.bg, bg = c.bg_alt },
    TelescopePromptBorder = { fg = c.bg, bg = c.bg_alt },
    -- TelescopeBorder = { fg = c.cobalt, bg = c.bg_alt },
    TelescopePromptPrefix = { fg = c.red },
    TelescopeMatching = { fg = c.blue },
    TelescopeSelection = { fg = c.yellow },
    TelescopeSelectionCaret = { fg = c.yellow, bg = c.bg_alt },

    --LSP highlighting
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfor = { fg = c.green },
    DiagnostictHint = { fg = c.yellow },

    -- XML highlighting
    xmlTagName = { fg = c.blue_bright },
    xmlCdatastart = { fg = c.yellow },
    --xmlEndTag = { fg = c.xmlTagName.bg },
    --xmlCdataCdata = { fg = c.xmlCdatastart.bg },

    -- MatchParen
    MatchParen = { fg = c.white, bg = c.red },

    -- CodeQL
    CodeqlAstFocus = { fg = c.bg_alt, bg = c.blue_dim },
    CodeQLWindowPicker = { fg = c.bg_alt, bg = c.blue_bright },

    -- TreeSitter
    TSError = { fg = c.red },
    TSConstant = { fg = c.orange },
    TSConstBuiltin = { fg = c.orange },
    TSConstMacro = { fg = c.orange },
    TSString = { fg = c.green },
    TSStringRegex = { fg = c.blue_dim },
    TSStringEscape = { fg = c.blue_dim },
    TSCharacter = { fg = c.red },
    TSNumber = { fg = c.blue_dim },
    TSBoolean = { fg = c.orange },
    TSFloat = { fg = c.blue_dim },
    TSFunction = { fg = c.blue_bright },
    TSFuncBuiltin = { fg = c.blue_bright },
    TSFuncMacro = { fg = c.blue_bright },
    TSParameter = { fg = c.blue_bright },
    TSConstructor = { fg = c.magenta },
    TSKeywordFunction = { fg = c.magenta },
    TSVariable = { fg = c.blue_dim },
    TSVariableBuiltin = { fg = c.magenta },
    TSParameterReference = { fg = c.blue_bright },
    TSMethod = { fg = c.blue_bright },
    TSConditional = { fg = c.magenta },
    TSRepeat = { fg = c.yellow },
    TSLabel = { fg = c.yellow },
    TSOperator = { fg = c.blue_dim },
    TSKeyword = { fg = c.magenta },
    TSException = { fg = c.red },
    TSType = { fg = c.yellow },
    TSTypeBuiltin = { fg = c.yellow },
    TSStructure = { fg = c.magenta },
    TSInclude = { fg = c.blue_bright },
    TSAnnotation = { fg = c.blue_dim },
    TSStrong = { fg = c.grey, bg = c.bg_alt, style = "bold" },
    TSTitle = { fg = c.yellow },
    TSLiteral = { fg = c.blue_bright },
    TSPunctBracket = { fg = utils.darken(c.grey, 0.8) },
    TSPunctDelimiter = { fg = utils.darken(c.grey, 0.6) },

    -- TreeSitter Markdown
    -- TSTitle
    -- TSLiteral
    -- TSStrong
    -- TSStringEscape
    TSEmphasis = { fg = c.blue_bright },
    TSURI = { fg = c.grey },
    TSTextReference = { fg = c.green },
    TSPunctSpecial = { fg = c.purple },

    -- Diff highlighting
    GitSignsAdd = { fg = c.green },
    GitSignsDelete = { fg = c.red },
    GitSignsChange = { fg = c.blue_dim },

    -- Indent-Blank-Lines
    IndentGuide = { fg = c.bg_alt },

    -- Octo,nvim
    OctoUserViewer = { bg = c.bg, fg = c.yellow },
    OctoUser = { bg = c.bg_alt, fg = c.blue },
    OctoStateOpen = { fg = c.green },
    OctoGreen = { fg = c.green },

    -- IndentBlankline
    IndentBlanklineChar = { fg = c.bg_alt, style = "nocombine" },
    IndentBlanklineSpaceChar = { fg = c.red, style = "nocombine" },
    IndentBlanklineSpaceCharBlankline = { fg = c.green, style = "nocombine" },

    -- LSP
    LspFloatWinBorder = { fg = c.cobalt },
    LspSagaDiagnosticBorder = { fg = c.cobalt },
    LspSagaRenameBorder = { fg = c.cobalt },
    LspSagaHoverBorder = { fg = c.cobalt },
    LspSagaSignatureHelpBorder = { fg = c.cobalt },
    LspSagaLspFinderBorder = { fg = c.cobalt },
    LspSagaCodeActionBorder = { fg = c.cobalt },
    LspSagaDefPreviewBorder = { fg = c.cobalt },
    LspSagaDiagnosticTruncateLine = { fg = c.cobalt },
    LspSagaShTruncateLine = { fg = c.cobalt },
    LspSagaDocTruncateLine = { fg = c.cobalt },

    -- DiffView
    DiffviewNormal = { fg = c.grey, bg = c.bg_alt },

    -- Nvim
    -- NvimNotificationInfo = { fg = c.yellow, bg = c.bg_alt},
    -- NvimNotificationError = { fg = c.red, bg = c.bg_alt},

    -- Neogit
    NeogitHunkHeader = { bg = c.bg_alt },
    NeogitHunkHeaderHighlight = { fg = c.yellow, bg = c.bg_alt },
    NeogitDiffContextHighlight = { fg = c.blue, bg = c.bg_alt },
    NeogitDiffAddHighlight = { fg = c.green, bg = c.bg_alt },
    NeogitDiffDeleteHighlight = { fg = c.red, bg = c.bg_alt },

    -- Copilot
    -- CopilotSuggestion = {fg = c.Normal.bg},

    -- nvim-cmp
    CmpGhostText = { fg = utils.darken(c.grey, 0.8), bg = c.bg_alt },
    CmpFloat = { bg = c.bg_alt },
    CmpBorder = { fg = c.bg, bg = c.bg_alt },
    PmenuThumb = { bg = c.yellow },

    -- Mini
    MiniIndentscopeSymbol = { fg = c.cobalt, style = "nocombine" },
    MiniCursorword = { fg = c.blue_dim, style = "nocombine" },
    MiniCursorCurrent = { fg = c.grey, bg = opts.transparent and c.none or c.bg },

    -- NeoTree
    NeoTreeNormal = { bg = c.bg_alt },
    NeoTreeNormalNC = { bg = c.bg_alt },
    NeoTreeDirectoryName = { fg = c.blue },
    NeoTreeDirectoryIcon = { fg = c.blue },
    NeoTreeFileIcon = { fg = c.blue },
    NeoTreeFileName = { fg = c.grey, bg = opts.transparent and c.none or c.bg_alt },
    NeoTreeRootName = { fg = c.yellow },
    NeoTreeCursorLine = { fg = c.yellow },

  }

  return theme
end

return M
