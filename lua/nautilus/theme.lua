local utils = require "nautilus.utils"

local M = {}

M.colors = {
  brightynauts = {
    bg = "#181e2e",
    bg_alt = "#141824",
    red = "#f04c75",
    orange = "#d2ac5c",
    yellow = "#c7c463",
    green = "#a5c96e",
    magenta = "#a974ab",
    purple = "#7a88cf",
    blue = "#719CD6",
    blue2 = "#80b2d6",
    blue3 = "#01bfef",
    blue4 = "#354360",
    blue5 = "#56b6c2",
    white = "#c8ccd4",
    grey = "#abb2bf",
    grey2 = "#898E99",
    grey3 = "#676B73",
    none = "NONE",
  },
  octonauts = {
    bg = "#2f343f",
    bg_alt = "#252931",
    red = "#d38391",
    orange = "#ffae57",
    yellow = "#ffcc66",
    green = "#98c379",
    magenta = "#c678dd",
    purple = "#7a88cf",
    blue = "#719CD6",
    blue2 = "#9bbdcb",
    blue3 = "#5E81AC",
    blue4 = "#3f5d7a",
    blue5 = "#3a8096",
    blue6 = "#3a84cc",
    white = "#c8ccd4",
    grey = "#abb2bf",
    grey2 = "#898E99",
    grey3 = "#676B73",
    none = "NONE",
  },
  blueynauts = {
    bg = "#222637",
    bg_alt = "#171c28",
    red = "#d38391",
    orange = "#ffae57",
    yellow = "#ffcc66",
    green = "#98c379",
    magenta = "#c678dd",
    purple = "#7a88cf",
    blue = "#719CD6",
    blue2 = "#9bbdcb",
    blue3 = "#5E81AC",
    blue4 = "#3f5d7a",
    blue5 = "#3a8096",
    white = "#c8ccd4",
    grey = "#abb2bf",
    grey2 = "#898E99",
    grey3 = "#676B73",
    none = "NONE",
  }
}

M.colors.default = M.colors.blueynauts

function M.apply(opts)
  opts.mode = opts.mode or "default"
  local c = M.colors[opts.mode]
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
    LineNr = { fg = c.blue4 },
    CursorLine = {},
    CursorLineNr = { fg = c.yellow },
    Bold = { style = "bold" },
    Debug = { fg = c.red },
    Directory = { fg = c.blue3 },
    Error = { fg = c.bg_alt, bg = c.red },
    ErrorMsg = { fg = c.red },
    Exception = { fg = c.red },
    FoldColumn = { fg = c.blue2 },
    Folded = { fg = c.blue2, bg = c.bg_alt },
    Italic = { style = "italic" },
    Macro = { fg = c.red },
    ModeMsg = { fg = c.green },
    MoreMsg = { fg = c.green },
    Question = { fg = c.blue3 },
    Search = { fg = c.bg_alt, bg = c.blue },
    IncSearch = { fg = c.bg_alt, bg = c.orange },
    Substitute = { fg = c.bg_alt, bg = c.yellow },
    SpecialKey = { fg = c.blue2 },
    TooLong = { fg = c.red },
    Underlined = { fg = c.red },
    Visual = { bg = c.blue4 },
    VisualNOS = { fg = c.red },
    WarningMsg = { fg = c.red },
    WildMenu = { fg = c.red, bg = c.yellow },
    Title = { fg = c.blue3 },
    Conceal = { bg = c.blue4, fg = c.blue3 },
    Cursor = { fg = c.bg_alt, bg = c.grey },
    NonText = { fg = c.blue2 },
    LineNrNC = { fg = c.blue4, bg = c.bg_alt },
    QFLineNr = { fg = c.blue },
    SignColumn = { fg = c.bg_alt },
    -- if StatusLine and StatusLineNC have equal values, then Vim will use ^^^ in the status line of the current window
    StatusLine = { fg = c.blue4, bg = c.bg_alt },
    StatusLineNC = { fg = c.bg_alt, bg = c.bg_alt },
    VertSplit = { fg = c.bg_alt },
    WinSeparator = { fg = c.blue4 },
    ColorColumn = { fg = c.bg_alt, bg = c.bg_alt },
    CursorColumn = { bg = c.bg },
    QuickFixLine = { bg = c.bg_alt },
    QFFileName = { fg = c.yellow },
    PMenu = { fg = c.grey, bg = c.bg_alt },
    PMenuSel = { fg = c.bg_alt, bg = c.yellow },
    TabLine = { fg = c.blue2, bg = c.bg_alt },
    TabLineSel = { fg = c.bg_alt, bg = c.yellow },
    TabLineFill = { fg = c.blue2, bg = c.bg_alt },
    EndOfBuffer = { fg = c.bg_alt },

    -- Standard syntax highlighting
    Boolean = { fg = c.orange },
    Character = { fg = c.red },
    Comment = { fg = c.blue3 },
    Conditional = { fg = c.magenta },
    Constant = { fg = c.orange },
    Define = { fg = c.magenta },
    Delimiter = { fg = c.purple },
    Float = { fg = c.orange },
    Function = { fg = c.blue3 },
    Identifier = { fg = c.yellow },
    Include = { fg = c.blue3 },
    Keyword = { fg = c.magenta },
    Label = { fg = c.yellow },
    Number = { fg = c.blue2 },
    Operator = { fg = c.blue2 },
    PreProc = { fg = c.yellow },
    Repeat = { fg = c.yellow },
    Special = { fg = c.blue5 },
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
    HelpDoc = { fg = c.grey, bg = c.blue3, style = "bold,italic" },
    HelpIgnore = { fg = c.green, style = "bold,italic" },

    -- C highlighting
    cOperator = { fg = c.blue5 },
    cPreCondit = { fg = c.magenta },

    -- C# highlighting
    csClass = { fg = c.yellow },
    csAttribute = { fg = c.yellow },
    csModifier = { fg = c.magenta },
    csType = { fg = c.red },
    csUnspecifiedStatement = { fg = c.blue3 },
    csContextualStatement = { fg = c.magenta },
    csNewDecleration = { fg = c.red },

    -- CSS highlighting
    cssBraces = { fg = c.grey },
    cssClassName = { fg = c.magenta },
    cssColor = { fg = c.blue5 },

    -- Diff highlighting
    DiffAdd = { fg = c.green, bg = utils.darken(c.green, 0.3) },
    DiffAdded = { fg = c.green, bg = utils.darken(c.green, 0.3) },
    DiffNewFile = { fg = c.green, bg = utils.darken(c.green, 0.3) },

    DiffDelete = { fg = c.red, bg = utils.darken(c.red, 0.2) },
    DiffRemoved = { fg = c.red, bg = utils.darken(c.red, 0.2) },

    DiffChange = { bg = utils.darken(c.blue2, 0.4) },
    DiffFile = { bg = utils.darken(c.blue2, 0.4) },
    DiffLine = { bg = utils.darken(c.blue2, 0.4) },
    DiffText = { bg = utils.darken(c.blue2, 0.4) },

    -- Git highlighting
    gitcommitOverflow = { fg = c.red },
    gitcommitSummary = { fg = c.green },
    gitcommitComment = { fg = c.blue2 },
    gitcommitUntracked = { fg = c.blue2 },
    gitcommitDiscarded = { fg = c.blue2 },
    gitcommitSelected = { fg = c.blue2 },
    gitcommitHeader = { fg = c.magenta },
    gitcommitSelectedType = { fg = c.blue3 },
    gitcommitUnmergedType = { fg = c.blue3 },
    gitcommitDiscardedType = { fg = c.blue3 },
    gitcommitBranch = { fg = c.orange },
    gitcommitUntrackedFile = { fg = c.yellow },
    gitcommitUnmergedFile = { fg = c.red },
    gitcommitDiscardedFile = { fg = c.red },
    gitcommitSelectedFile = { fg = c.green },

    -- GitGutter highlighting
    GitGutterAdd = { fg = c.green, bg = c.bg_alt },
    GitGutterChange = { fg = c.blue3, bg = c.bg_alt },
    GitGutterDelete = { fg = c.red, bg = c.bg_alt },
    GitGutterChangeDelete = { fg = c.magenta, bg = c.bg_alt },

    -- HTML highlighting
    htmlBold = { fg = c.yellow },
    htmlItalic = { fg = c.magenta },
    htmlEndTag = { fg = c.grey },
    htmlTag = { fg = c.grey },
    htmlTagName = { fg = c.blue2 },

    -- JavaScript highlighting
    javaScript = { fg = c.grey },
    javaScriptBraces = { fg = c.grey },
    javaScriptNumber = { fg = c.orange },

    -- pangloss/vim-javascript highlighting
    jsOperator = { fg = c.blue3 },
    jsStatement = { fg = c.magenta },
    jsReturn = { fg = c.magenta },
    jsThis = { fg = c.red },
    jsClassDefinition = { fg = c.yellow },
    jsFunction = { fg = c.magenta },
    jsFuncName = { fg = c.blue3 },
    jsFuncCall = { fg = c.blue3 },
    jsClassFuncName = { fg = c.blue3 },
    jsClassMethodType = { fg = c.magenta },
    jsRegexpString = { fg = c.blue5 },
    jsGlobalObjects = { fg = c.yellow },
    jsGlobalNodeObjects = { fg = c.yellow },
    jsExceptions = { fg = c.yellow },
    jsBuiltins = { fg = c.yellow },

    -- Mail highlighting
    mailQuoted1 = { fg = c.yellow },
    mailQuoted2 = { fg = c.green },
    mailQuoted3 = { fg = c.magenta },
    mailQuoted4 = { fg = c.blue5 },
    mailQuoted5 = { fg = c.blue3 },
    mailQuoted6 = { fg = c.yellow },
    mailURL = { fg = c.blue3 },
    mailEmail = { fg = c.blue3 },

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
    -- markdownCode = { fg = c.blue3 },
    -- markdownCodeBlock = { fg = c.purple, bg = c.bg_alt },
    markdownCodeBlock = { bg = c.bg_alt },
    markdownFootnoteDefinition = { fg = c.grey, style = "italic" },
    markdownListMarker = { fg = c.purple, style = "bold" },
    markdownLineBreak = { fg = c.red, style = "underline" },
    markdownError = { fg = c.grey, bg = c.bg_alt },
    markdownFootnote = { fg = c.magenta, style = "italic" },
    markdownBlockquote = { fg = c.blue5, style = "italic" },
    markdownLinkText = { fg = c.green },
    markdownUrl = { fg = c.grey },
    wikiLinkText = { fg = c.green },
    markdownTaskDelimiter = { fg = c.purple },
    markdownTaskDONE = { fg = c.purple },
    markdownTaskTODO = { fg = c.purple },
    markdownLinkTextDelimiter = { fg = c.blue4 },
    markdownLinkDelimiter = { fg = c.blue4 },

    -- NERDTree highlighting
    NERDTreeDirSlash = { fg = c.blue3 },
    NERDTreeExecFile = { fg = c.grey },

    -- PHP highlighting
    phpMemberSelector = { fg = c.grey },
    phpComparison = { fg = c.grey },
    phpParent = { fg = c.grey },
    phpMethodsVar = { fg = c.blue5 },

    -- Python highlighting
    pythonOperator = { fg = c.magenta },
    pythonRepeat = { fg = c.magenta },
    pythonInclude = { fg = c.magenta },
    pythonStatement = { fg = c.magenta },

    -- Ruby highlighting
    rubyAttribute = { fg = c.blue3 },
    rubyConstant = { fg = c.yellow },
    rubyInterpolationDelimiter = { fg = c.purple },
    rubyRegexp = { fg = c.blue5 },
    rubySymbol = { fg = c.green },
    rubyStringDelimiter = { fg = c.green },

    -- SASS highlighting
    sassidChar = { fg = c.red },
    sassClassChar = { fg = c.orange },
    sassInclude = { fg = c.magenta },
    sassMixing = { fg = c.magenta },
    sassMixinName = { fg = c.blue3 },

    -- Signify highlighting
    -- SignifySignAdd = { fg = c.green, bg = c.bg_alt },
    -- SignifySignChange = { fg = c.blue2, bg = c.bg_alt },
    -- SignifySignDelete = { fg = c.red, bg = c.bg_alt },

    -- Spelling highlighting
    SpellBad = { sp = c.red, style = "undercurl" },
    SpellLocal = { sp = c.blue5, style = "undercurl" },
    SpellCap = { sp = c.blue3, style = "undercurl" },
    SpellRare = { sp = c.magenta, style = "undercurl" },

    -- Startify highlighting
    StartifyBracket = { fg = c.blue2 },
    StartifyFile = { fg = c.white },
    StartifyFooter = { fg = c.blue2 },
    StartifyHeader = { fg = c.green },
    StartifyNumber = { fg = c.orange },
    StartifyPath = { fg = c.blue2 },
    StartifySection = { fg = c.magenta },
    StartifySelect = { fg = c.blue5 },
    StartifySlash = { fg = c.blue2 },
    StartifySpecial = { fg = c.blue2 },

    -- Java highlighting
    javaOperator = { fg = c.blue3 },

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
    -- TelescopeBorder = { fg = c.blue4, bg = c.bg_alt },
    TelescopePromptPrefix = { fg = c.red },
    TelescopeMatching = { fg = c.blue },
    TelescopeSelection = { fg = c.yellow },
    TelescopeSelectionCaret = { fg = c.yellow, bg = c.bg_alt },

    -- XML highlighting
    xmlTagName = { fg = c.blue3 },
    xmlCdatastart = { fg = c.yellow },
    --xmlEndTag = { fg = c.xmlTagName.bg },
    --xmlCdataCdata = { fg = c.xmlCdatastart.bg },

    -- MatchParen
    MatchParen = { fg = c.white, bg = c.red },

    -- CodeQL
    CodeqlAstFocus = { fg = c.bg_alt, bg = c.blue2 },
    CodeQLWindowPicker = { fg = c.bg_alt, bg = c.blue3 },

    -- TreeSitter
    TSError = { fg = c.red },
    TSConstant = { fg = c.orange },
    TSConstBuiltin = { fg = c.orange },
    TSConstMacro = { fg = c.orange },
    TSString = { fg = c.green },
    TSStringRegex = { fg = c.blue2 },
    TSStringEscape = { fg = c.blue2 },
    TSCharacter = { fg = c.red },
    TSNumber = { fg = c.blue2 },
    TSBoolean = { fg = c.orange },
    TSFloat = { fg = c.blue2 },
    TSFunction = { fg = c.blue3 },
    TSFuncBuiltin = { fg = c.blue3 },
    TSFuncMacro = { fg = c.blue3 },
    TSParameter = { fg = c.blue3 },
    TSConstructor = { fg = c.magenta },
    TSKeywordFunction = { fg = c.magenta },
    TSVariable = { fg = c.blue2 },
    TSVariableBuiltin = { fg = c.magenta },
    TSParameterReference = { fg = c.blue3 },
    TSMethod = { fg = c.blue3 },
    TSConditional = { fg = c.magenta },
    TSRepeat = { fg = c.yellow },
    TSLabel = { fg = c.yellow },
    TSOperator = { fg = c.blue2 },
    TSKeyword = { fg = c.magenta },
    TSException = { fg = c.red },
    TSType = { fg = c.yellow },
    TSTypeBuiltin = { fg = c.yellow },
    TSStructure = { fg = c.magenta },
    TSInclude = { fg = c.blue3 },
    TSAnnotation = { fg = c.blue2 },
    TSStrong = { fg = c.grey, bg = c.bg_alt, style = "bold" },
    TSTitle = { fg = c.yellow },
    TSLiteral = { fg = c.blue3 },
    TSPunctBracket = { fg = c.grey2 },
    TSPunctDelimiter = { fg = c.grey3 },

    -- TreeSitter Markdown
    -- TSTitle
    -- TSLiteral
    -- TSStrong
    -- TSStringEscape
    TSEmphasis = { fg = c.blue3 },
    TSURI = { fg = c.grey },
    TSTextReference = { fg = c.green },
    TSPunctSpecial = { fg = c.purple },

    -- Diff highlighting
    GitSignsAdd = { fg = c.green },
    GitSignsDelete = { fg = c.red },
    GitSignsChange = { fg = c.blue2 },

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
    LspFloatWinBorder = { fg = c.blue4 },

    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfor = { fg = c.blue },
    DiagnostictHint = { fg = c.green },
    -- DiagnosticUnderlineError = { sp = c.red, style = "underline", },
    -- DiagnosticUnderlineWarn = { sp = c.orange, style = "underline", },
    -- DiagnosticUnderlineInfor = { sp = c.blue, style = "underline", },
    -- DiagnosticUnderlineHint = { sp = c.green, style = "underline", },
    DiagnosticUnderlineError = { style = c.none, },
    DiagnosticUnderlineWarn = { style = c.none, },
    DiagnosticUnderlineInfor = { style = c.none, },
    DiagnosticUnderlineHint = { style = c.none, },
    --
    -- LspDiagnosticsDefaultError = { fg = c.red, },
    -- LspDiagnosticsDefaultWarning = { fg = c.orange, },
    -- LspDiagnosticsDefaultInformation = { fg = c.yellow, },
    -- LspDiagnosticsDefaultInfo = { fg = c.yellow, },
    -- LspDiagnosticsDefaultHint = { fg = c.blue, },
    -- LspDiagnosticsVirtualTextError = { fg = c.red, },
    -- LspDiagnosticsVirtualTextWarning = { fg = c.orange, },
    -- LspDiagnosticsVirtualTextInformation = { fg = c.yellow, },
    -- LspDiagnosticsVirtualTextInfo = { fg = c.yellow, },
    -- LspDiagnosticsVirtualTextHint = { fg = c.blue, },
    -- LspDiagnosticsFloatingError = { fg = c.red, },
    -- LspDiagnosticsFloatingWarning = { fg = c.orange, },
    -- LspDiagnosticsFloatingInformation = { fg = c.yellow, },
    -- LspDiagnosticsFloatingInfo = { fg = c.yellow, },
    -- LspDiagnosticsFloatingHint = { fg = c.blue, },
    -- DiagnosticSignError = { fg = c.red, },
    -- DiagnosticSignWarning = { fg = c.orange, },
    -- DiagnosticSignInformation = { fg = c.yellow, },
    -- DiagnosticSignInfo = { fg = c.yellow, },
    -- DiagnosticSignHint = { fg = c.blue, },
    -- LspDiagnosticsSignError = { fg = c.red, },
    -- LspDiagnosticsSignWarning = { fg = c.orange, },
    -- LspDiagnosticsSignInformation = { fg = c.yellow, },
    -- LspDiagnosticsSignInfo = { fg = c.yellow, },
    -- LspDiagnosticsSignHint = { fg = c.blue, },
    -- LspDiagnosticsError = { fg = c.red, },
    -- LspDiagnosticsWarning = { fg = c.orange, },
    -- LspDiagnosticsInformation = { fg = c.yellow, },
    -- LspDiagnosticsInfo = { fg = c.yellow, },
    -- LspDiagnosticsHint = { fg = c.blue, },
    -- LspDiagnosticsUnderlineError = { style = "underline", },
    -- LspDiagnosticsUnderlineWarning = { style = "underline", },
    -- LspDiagnosticsUnderlineInformation = { style = "underline", },
    -- LspDiagnosticsUnderlineInfo = { style = "underline", },
    -- LspDiagnosticsUnderlineHint = { style = "underline", },
    -- LspReferenceRead = { bg = "#36383F", },
    -- LspReferenceText = { bg = "#36383F", },
    -- LspReferenceWrite = { bg = "#36383f", },
    --
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
    CmpItemAbbrMatch = { fg = c.blue3 },
    CmpItemAbbr = { fg = c.grey2 },
    CmpItemAbbrDeprecated = { fg = c.grey, style = "strikethrough", },
    CmpItemAbbrMatchFuzzy = { fg = c.blue, },
    CmpGhostText = { fg = c.grey2, bg = c.bg_alt },
    CmpFloat = { bg = c.bg_alt },
    CmpBorder = { fg = c.bg, bg = c.bg_alt },
    PmenuThumb = { bg = c.grey2 },

    -- nvim-cmp kinds
    CmpItemKindFunction = { fg = c.magenta, },
    CmpItemKindMethod = { fg = c.magenta, },
    CmpItemKindConstructor = { fg = c.orange, },
    CmpItemKindClass = { fg = c.orange, },
    CmpItemKindEnum = { fg = c.orange, },
    CmpItemKindEvent = { fg = c.magenta, },
    CmpItemKindInterface = { fg = c.blue2, },
    CmpItemKindStruct = { fg = c.blue, },
    CmpItemKindVariable = { fg = c.blue, },
    CmpItemKindField = { fg = c.blue, },
    CmpItemKindProperty = { fg = c.blue, },
    CmpItemKindEnumMember = { fg = c.blue2, },
    CmpItemKindConstant = { fg = c.blue, },
    CmpItemKindKeyword = { fg = c.yellow, },
    CmpItemKindModule = { fg = c.yellow, },
    CmpItemKindValue = { fg = c.yellow, },
    CmpItemKindUnit = { fg = c.yellow, },
    CmpItemKindText = { fg = c.yellow, },
    CmpItemKindSnippet = { fg = c.yellow, },
    CmpItemKindFile = { fg = c.yellow, },
    CmpItemKindFolder = { fg = c.yellow, },
    CmpItemKindColor = { fg = c.yellow, },
    CmpItemKindReference = { fg = c.yellow, },
    CmpItemKindOperator = { fg = c.yellow, },
    CmpItemKindTypeParameter = { fg = c.yellow, },

    -- cmp-copilot
    CmpItemKindCopilot = { fg = c.green },


    -- Mini
    MiniIndentscopeSymbol = { fg = c.blue4, style = "nocombine" },
    MiniCursorword = { fg = c.blue2, style = "nocombine" },
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

    -- Lualine
    LualineNormal = { fg = c.white, bg = c.blue6 },

    -- Winbar
    WinbarFilename = { fg = c.yellow },
    WinbarContext = { fg = c.blue2 },

    -- Navic
    NavicText = { fg = c.blue2 },
    NavicSeparator = { fg = c.yellow },
    NavicIconsFunction = { fg = c.magenta, },
    NavicIconsMethod = { fg = c.magenta, },
    NavicIconsConstructor = { fg = c.orange, },
    NavicIconsClass = { fg = c.orange, },
    NavicIconsEnum = { fg = c.orange, },
    NavicIconsEvent = { fg = c.magenta, },
    NavicIconsInterface = { fg = c.blue2, },
    NavicIconsStruct = { fg = c.blue, },
    NavicIconsVariable = { fg = c.blue, },
    NavicIconsField = { fg = c.blue, },
    NavicIconsProperty = { fg = c.blue, },
    NavicIconsEnumMember = { fg = c.blue2, },
    NavicIconsConstant = { fg = c.blue, },
    NavicIconsKeyword = { fg = c.yellow, },
    NavicIconsModule = { fg = c.yellow, },
    NavicIconsValue = { fg = c.yellow, },
    NavicIconsUnit = { fg = c.yellow, },
    NavicIconsText = { fg = c.yellow, },
    NavicIconsSnippet = { fg = c.yellow, },
    NavicIconsFile = { fg = c.yellow, },
    NavicIconsFolder = { fg = c.yellow, },
    NavicIconsColor = { fg = c.yellow, },
    NavicIconsReference = { fg = c.yellow, },
    NavicIconsOperator = { fg = c.yellow, },
    NavicIconsTypeParameter = { fg = c.yellow, },

    -- Noice
    NoiceCmdlinePopupBorder = { fg = c.red },
    NoiceVirtualText = { fg = c.orange }

  }

  return theme
end

return M
