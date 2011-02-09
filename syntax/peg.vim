" Vim syntax file
" Language: Parser Expression Grammars (PEG)
" Maintainer: Gianni Chiappetta
" Latest Revision: 2011-02-08

if exists("b:current_syntax")
  finish
endif

syn match   pegRuleIdentifier   /^\a\+/ skipwhite nextgroup=pegSeperator

syn match   pegSeperator        "<-" skipwhite contained nextgroup=pegExpression
syn match   pegSeperator        "←" skipwhite contained nextgroup=pegExpression

syn match   pegExpression       /.*/ contained skipwhite contains=pegDelimiter,pegGrouping,pegSpecial,pegRange,pegTerminal,pegOrderedChoice,pegNonTerminal,pegQuantifier
syn match   pegDelimiter        /[§]/ contained display
syn region  pegGrouping         matchgroup=pegDelimiter start=/(/ end=/)/ contained skipwhite keepend contains=pegExpression display
syn match   pegSpecial          /[!&ϵ^]/ contained display
syn match   pegOrderedChoice    /\// contained display
syn region  pegRange            matchgroup=pegDelimiter start=/\[^/ start=/\[/ end=/\]/ contained skipwhite contains=pegRangeValue,pegUnicode display
syn match   pegRangeValue       /\d\+-\d\+/ contained display
syn match   pegRangeValue       /\a\+-\a\+/ contained display
syn region  pegTerminal         matchgroup=pegDelimiter start=/"/ end=/"/ contained display
syn region  pegTerminal         matchgroup=pegDelimiter start=/'/ end=/'/ contained display
syn match   pegUnicode          /U+[A-F0-9]\{4,6}/ contained display
syn match   pegNonTerminal      /\a+/ contained display
syn match   pegQuantifier       /[+\*?]/ contained display
syn match   pegQuantifier       /{\d\+,\d\+}/ contained display
syn match   pegQuantifier       /{\d\+}/ contained display

syn match   pegComment          /;.*$/ contains=pegTodo
syn keyword pegTodo             TODO FIXME XXX NOTE contained

hi link pegRuleIdentifier Identifier
hi link pegSeperator      Conditional
hi link pegDelimiter      Delimiter
hi link pegSpecial        Special
hi link pegOrderedChoice  Conditional
hi link pegComment        Comment
hi link pegRangeValue     Constant
hi link pegTerminal       String
hi link pegUnicode        Constant
hi link pegQuantifier     Function
hi link pegTodo           Todo

let b:current_syntax = "peg"

