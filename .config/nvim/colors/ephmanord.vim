" "ephemanord" by /u/calvers70 - based on nord theme.
" Heavily influenced by ephemeral elanapan @ github
" --------------------------------------------------
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "ephemanord"
let s:ephemanord_vim_version="0.12.0"
set background=dark

let s:ephemanord0_gui = "#3d4c5f"
let s:ephemanord1_gui = "#f48fb1"
let s:ephemanord2_gui = "#a1efd3"
let s:ephemanord3_gui = "#f1fa8c"
let s:ephemanord3_gui_bright = "#f1ff4f"
let s:ephemanord4_gui = "#92b6f4"
let s:ephemanord5_gui = "#bd99ff"
let s:ephemanord6_gui = "#87dfeb"
let s:ephemanord7_gui = "#f8f8f2"
let s:ephemanord8_gui = "#56687e"
let s:ephemanord9_gui = "#ee4f84"
let s:ephemanord10_gui = "#53e2ae"
let s:ephemanord11_gui = "#f1ff52"
let s:ephemanord12_gui = "#6498ef"
let s:ephemanord13_gui = "#985eff"
let s:ephemanord14_gui = "#24d1e7"
let s:ephemanord15_gui = "#e5e5e5"

let s:ephemanord1_term = "0"
let s:ephemanord2_term = "13"
let s:ephemanord3_term = "8"
let s:ephemanord5_term = "7"
let s:ephemanord6_term = "15"
let s:ephemanord7_term = "14"
let s:ephemanord8_term = "6"
let s:ephemanord9_term = "4"
let s:ephemanord10_term = "12"
let s:ephemanord11_term = "1"
let s:ephemanord12_term = "11"
let s:ephemanord13_term = "3"
let s:ephemanord14_term = "2"
let s:ephemanord15_term = "5"
let s:ephemanord16_term = "9"

let s:ephemanord3_gui_brightened = [
  \ s:ephemanord3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:ephemanord_bold")
  let g:ephemanord_bold = 1
endif

let s:bold = "bold,"
if g:ephemanord_bold == 0
  let s:bold = ""
endif

if !exists("g:ephemanord_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:ephemanord_italic = 1
  else
    let g:ephemanord_italic = 0
 endif
endif

let s:italic = "italic,"
if g:ephemanord_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "ephemanord_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:ephemanord_italic_comments")
  if g:ephemanord_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:ephemanord_uniform_status_lines')
  let g:ephemanord_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'ephemanord: warning: ' . a:msg
  echohl None
endfunction

if exists("g:ephemanord_comment_brightness")
  call s:logWarning('Variable g:ephemanord_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/nord-vim/issues/145 for more details.')
  let g:ephemanord_comment_brightness = 10
endif

if !exists("g:ephemanord_uniform_diff_background")
  let g:ephemanord_uniform_diff_background = 0
endif

if !exists("g:ephemanord_cursor_line_number_background")
  let g:ephemanord_cursor_line_number_background = 0
endif

if !exists("g:ephemanord_bold_vertical_split_line")
  let g:ephemanord_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:ephemanord1_gui, "NONE", s:ephemanord1_term, "", "")
call s:hi("Cursor", s:ephemanord0_gui, s:ephemanord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:ephemanord1_gui, "NONE", s:ephemanord1_term, "NONE", "")
call s:hi("Error", s:ephemanord0_gui, s:ephemanord9_gui, "", s:ephemanord11_term, "", "")
call s:hi("iCursor", s:ephemanord0_gui, s:ephemanord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord3_term, "NONE", "", "")
call s:hi("MatchParen", s:ephemanord8_gui, "NONE", s:ephemanord5_term, s:ephemanord3_term, "", "")
call s:hi("NonText", s:ephemanord2_gui, "", s:ephemanord3_term, "", "", "")
call s:hi("Normal", s:ephemanord7_gui, s:ephemanord0_gui, s:ephemanord5_term, "NONE", "", "")
call s:hi("PMenu", s:ephemanord4_gui, s:ephemanord2_gui, "NONE", s:ephemanord1_term, "NONE", "")
call s:hi("PmenuSbar", s:ephemanord4_gui, s:ephemanord2_gui, "NONE", s:ephemanord1_term, "", "")
call s:hi("PMenuSel", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord3_term, s:ephemanord5_term, "", "")
call s:hi("PmenuThumb", s:ephemanord8_gui, s:ephemanord3_gui, "NONE", s:ephemanord3_term, "", "")
call s:hi("SpecialKey", s:ephemanord3_gui, "", s:ephemanord3_term, "", "", "")
call s:hi("SpellBad", s:ephemanord11_gui, s:ephemanord0_gui, s:ephemanord12_term, "NONE", "undercurl", s:ephemanord11_gui)
call s:hi("SpellCap", s:ephemanord13_gui, s:ephemanord0_gui, s:ephemanord13_term, "NONE", "undercurl", s:ephemanord13_gui)
call s:hi("SpellLocal", s:ephemanord5_gui, s:ephemanord0_gui, s:ephemanord5_term, "NONE", "undercurl", s:ephemanord5_gui)
call s:hi("SpellRare", s:ephemanord6_gui, s:ephemanord0_gui, s:ephemanord6_term, "NONE", "undercurl", s:ephemanord6_gui)
call s:hi("Visual", "", s:ephemanord2_gui, "", s:ephemanord1_term, "", "")
call s:hi("VisualNOS", "", s:ephemanord2_gui, "", s:ephemanord1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:ephemanord11_gui, s:ephemanord1_gui, s:ephemanord12_term, s:ephemanord1_term, "", "")
call s:hi("healthSuccess", s:ephemanord14_gui, s:ephemanord1_gui, s:ephemanord14_term, s:ephemanord1_term, "", "")
call s:hi("healthWarning", s:ephemanord13_gui, s:ephemanord1_gui, s:ephemanord13_term, s:ephemanord11_term, "", "")
call s:hi("TermCursorNC", "", s:ephemanord1_gui, "", s:ephemanord1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:ephemanord1_gui, s:ephemanord11_gui, s:ephemanord14_gui, s:ephemanord13_gui, s:ephemanord9_gui, s:ephemanord15_gui, s:ephemanord8_gui, s:ephemanord5_gui, s:ephemanord3_gui, s:ephemanord11_gui, s:ephemanord14_gui, s:ephemanord13_gui, s:ephemanord9_gui, s:ephemanord15_gui, s:ephemanord7_gui, s:ephemanord6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:ephemanord0_gui
  let g:terminal_color_1 = s:ephemanord1_gui
  let g:terminal_color_2 = s:ephemanord2_gui
  let g:terminal_color_3 = s:ephemanord3_gui
  let g:terminal_color_4 = s:ephemanord4_gui
  let g:terminal_color_5 = s:ephemanord5_gui
  let g:terminal_color_6 = s:ephemanord6_gui
  let g:terminal_color_7 = s:ephemanord7_gui
  let g:terminal_color_8 = s:ephemanord8_gui
  let g:terminal_color_9 = s:ephemanord9_gui
  let g:terminal_color_10 = s:ephemanord10_gui
  let g:terminal_color_11 = s:ephemanord11_gui
  let g:terminal_color_12 = s:ephemanord12_gui
  let g:terminal_color_13 = s:ephemanord13_gui
  let g:terminal_color_14 = s:ephemanord14_gui
  let g:terminal_color_15 = s:ephemanord15_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:ephemanord1_gui, "NONE", s:ephemanord1_term, "", "")
if g:ephemanord_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:ephemanord14_gui, "", s:ephemanord7_term, "NONE", s:bold, s:bold)
else
  call s:hi("CursorLineNr", s:ephemanord14_gui, "", s:ephemanord7_term, "NONE", s:bold, s:bold)
endif
call s:hi("Folded", s:ephemanord3_gui, s:ephemanord8_gui, s:ephemanord14_term, s:ephemanord3_term, s:bold, "")
call s:hi("FoldColumn", s:ephemanord3_gui, s:ephemanord0_gui, s:ephemanord3_term, "NONE", "", "")
call s:hi("SignColumn", s:ephemanord1_gui, s:ephemanord0_gui, s:ephemanord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:ephemanord8_gui, "", s:ephemanord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:ephemanord1_gui, "", s:ephemanord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:ephemanord4_gui, s:ephemanord9_gui, "NONE", s:ephemanord16_term, "", "")
call s:hi("ModeMsg", s:ephemanord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:ephemanord4_gui, "", "", "", "", "")
call s:hi("Question", s:ephemanord4_gui, "", "NONE", "", "", "")
if g:ephemanord_uniform_status_lines == 0
  call s:hi("StatusLine", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:ephemanord4_gui, s:ephemanord1_gui, "NONE", s:ephemanord1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:ephemanord4_gui, s:ephemanord1_gui, "NONE", s:ephemanord1_term, "NONE", "")
else
  call s:hi("StatusLine", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:ephemanord4_gui, s:ephemanord3_gui, "NONE", s:ephemanord3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:ephemanord4_gui, s:ephemanord3_gui, "NONE", s:ephemanord3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:ephemanord0_gui, s:ephemanord13_gui, s:ephemanord1_term, s:ephemanord13_term, "", "")
call s:hi("WildMenu", s:ephemanord8_gui, s:ephemanord1_gui, s:ephemanord8_term, s:ephemanord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:ephemanord6_gui, s:ephemanord10_gui, s:ephemanord6_term, s:ephemanord10_term, s:underline, "")
call s:hi("Search", s:ephemanord1_gui, s:ephemanord8_gui, s:ephemanord1_term, s:ephemanord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:ephemanord4_gui, s:ephemanord1_gui, "NONE", s:ephemanord3_term, "NONE", "")
call s:hi("TabLineFill", s:ephemanord4_gui, s:ephemanord1_gui, "NONE", s:ephemanord9_term, "NONE", "")
call s:hi("TabLineSel", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:ephemanord4_gui, "", "NONE", "", "NONE", "")

if g:ephemanord_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:ephemanord2_gui, s:ephemanord0_gui, s:ephemanord3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:ephemanord2_gui, s:ephemanord1_gui, s:ephemanord3_term, s:ephemanord8_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Character", s:ephemanord14_gui, "", s:ephemanord14_term, "", "", "")
call s:hi("Comment", s:ephemanord8_gui, "", s:ephemanord3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:ephemanord3_gui, "", s:ephemanord13_term, "", "", "")
call s:hi("Constant", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Define", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Delimiter", s:ephemanord6_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("Exception", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Float", s:ephemanord15_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("Function", s:ephemanord14_gui, "", s:ephemanord14_term, "", "", "")
call s:hi("Identifier", s:ephemanord4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:ephemanord8_gui, "", s:ephemanord3_term, "", "", "")
call s:hi("Keyword", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Label", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Number", s:ephemanord5_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("Operator", s:ephemanord4_gui, "", s:ephemanord9_term, "", "NONE", "")
call s:hi("PreProc", s:ephemanord4_gui, "", s:ephemanord9_term, "", "NONE", "")
call s:hi("Repeat", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Special", s:ephemanord4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:ephemanord13_gui, "", s:ephemanord13_term, "", "", "")
call s:hi("SpecialComment", s:ephemanord8_gui, "", s:ephemanord8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("StorageClass", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("String", s:ephemanord1_gui, "", s:ephemanord11_term, "", "", "")
call s:hi("Structure", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("Tag", s:ephemanord4_gui, "", "", "", "", "")
call s:hi("Todo", s:ephemanord13_gui, "NONE", s:ephemanord13_term, "NONE", "", "")
call s:hi("Type", s:ephemanord4_gui, "", s:ephemanord9_term, "", "NONE", "")
call s:hi("Typedef", s:ephemanord4_gui, "", s:ephemanord9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("asciidocAttributeList", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("asciidocHLabel", s:ephemanord9_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("asciidocListingBlock", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:ephemanord9_gui, "", s:ephemanord9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("awkPatterns", s:ephemanord9_gui, "", s:ephemanord9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("cssDefinition", s:ephemanord7_gui, "", s:ephemanord7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:ephemanord7_gui, "", s:ephemanord7_term, "", s:underline, "")
call s:hi("cssStringQ", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("dtExecKey", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("dtLocaleKey", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("dtNumericKey", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("dtTypeKey", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:ephemanord_uniform_diff_background == 0
  call s:hi("DiffAdd", s:ephemanord14_gui, s:ephemanord0_gui, s:ephemanord14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:ephemanord13_gui, s:ephemanord0_gui, s:ephemanord13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:ephemanord11_gui, s:ephemanord0_gui, s:ephemanord12_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:ephemanord9_gui, s:ephemanord0_gui, s:ephemanord9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:ephemanord14_gui, s:ephemanord1_gui, s:ephemanord14_term, s:ephemanord1_term, "", "")
  call s:hi("DiffChange", s:ephemanord13_gui, s:ephemanord1_gui, s:ephemanord13_term, s:ephemanord1_term, "", "")
  call s:hi("DiffDelete", s:ephemanord11_gui, s:ephemanord1_gui, s:ephemanord12_term, s:ephemanord1_term, "", "")
  call s:hi("DiffText", s:ephemanord9_gui, s:ephemanord1_gui, s:ephemanord9_term, s:ephemanord1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")

call s:hi("goBuiltins", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:ephemanord3_gui, "", s:ephemanord3_term, "", "", "")
call s:hi("helpHyperTextJump", s:ephemanord8_gui, "", s:ephemanord8_term, "", s:underline, "")

call s:hi("htmlArg", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
call s:hi("htmlLink", s:ephemanord4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:ephemanord7_gui, "", s:ephemanord15_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")

call s:hi("lessClass", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownCode", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownFootnote", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownId", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("markdownH1", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("markdownLinkText", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("markdownUrl", s:ephemanord4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")

call s:hi("phpClasses", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("phpDocTags", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("podVerbatimLine", s:ephemanord4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("rubySymbol", s:ephemanord6_gui, "", s:ephemanord6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("rustEnum", s:ephemanord7_gui, "", s:ephemanord7_term, "", s:bold, "")
call s:hi("rustMacro", s:ephemanord8_gui, "", s:ephemanord8_term, "", s:bold, "")
call s:hi("rustModPath", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("rustPanic", s:ephemanord9_gui, "", s:ephemanord9_term, "", s:bold, "")
call s:hi("rustTrait", s:ephemanord7_gui, "", s:ephemanord7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("sassId", s:ephemanord7_gui, "", s:ephemanord7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("vimMapRhs", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("vimNotation", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("xmlCdataStart", s:ephemanord3_gui_bright, "", s:ephemanord3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("ALEErrorSign" , s:ephemanord9_gui, "", s:ephemanord16_term, "", "", "")
call s:hi("ALEWarning" , s:ephemanord11_gui, "", s:ephemanord12_term, "", "undercurl", "")
call s:hi("ALEError" , s:ephemanord9_gui, "", s:ephemanord16_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningSign", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("CocErrorSign" , s:ephemanord9_gui, "", s:ephemanord16_term, "", "", "")
call s:hi("CocInfoSign" , s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("CocHintSign" , s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:ephemanord10_gui, "", s:ephemanord14_term, "", "", "")
call s:hi("GitGutterChange", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("GitGutterDelete", s:ephemanord9_gui, "", s:ephemanord12_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:ephemanord14_gui, "", s:ephemanord14_term, "", "", "")
call s:hi("SignifySignChange", s:ephemanord13_gui, "", s:ephemanord13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("SignifySignDelete", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:ephemanord11_gui, "", s:ephemanord12_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:ephemanord14_gui, "", s:ephemanord14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:ephemanord4_gui, s:ephemanord3_gui, "", s:ephemanord3_term, "", "")
call s:hi("jediFat", s:ephemanord8_gui, s:ephemanord3_gui, s:ephemanord8_term, s:ephemanord3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:ephemanord11_gui, "", "", s:ephemanord12_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("haskellType", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:ephemanord8_gui, "", s:ephemanord8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "")
call s:hi("mkdFootnote", s:ephemanord8_gui, "", s:ephemanord8_term, "", "", "")
call s:hi("mkdRule", s:ephemanord10_gui, "", s:ephemanord10_term, "", "", "")
call s:hi("mkdLineBreak", s:ephemanord9_gui, "", s:ephemanord9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:ephemanord8_gui, "", s:ephemanord8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:ephemanord7_gui, s:ephemanord8_gui, s:ephemanord9_gui, s:ephemanord10_gui, s:ephemanord14_gui, s:ephemanord15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:ephemanord7_term, s:ephemanord8_term, s:ephemanord9_term, s:ephemanord10_term, s:ephemanord14_term, s:ephemanord15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:ephemanord8_gui, "", s:ephemanord8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:ephemanord7_gui, "", s:ephemanord7_term, "", "", "") 
