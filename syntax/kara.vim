" TODO: group subtitle group
" --- Whitespace ---
" どうして不安なの
" eng Why am I feeling anxious?
" 00:00:14.000 --> 00:00:14.290 ど
" 00:00:14.290 --> 00:00:14.590 う
" 00:00:14.590 --> 00:00:14.860 し
" 00:00:14.860 --> 00:00:15.120 て
" 00:00:15.120 --> 00:00:15.420 不
" 00:00:15.420 --> 00:00:15.720 安
" 00:00:15.720 --> 00:00:16.020 な
" 00:00:16.020 --> 00:00:16.290 の
" --- Whitespace --

" TODO: color translation marker
" どうして不安なの
" eng Why am I feeling anxious?
"  ^------- marker
"
" TODO: text comment
" eng Love is overflowing already #this might be incorrect
"                                         ^-------- Text comment

if exists('b:current_syntax')
    finish
endif

" Identifier
syntax match karaIdentifier "^\cKARA"

" Comments
syn keyword karaTodo TODO FIXME NOTE XXX contained
syn match karaComment /^#.*$/ contains=karaTodo,@Spell
syn match karaTextComment /{[^}]*}/ contained contains=@Spell

" Headers
syn match karaHeader /^[^#]\+:/ skipwhite nextgroup=karaField

" Fields
syn match karaField /[^,]*\(,\|$\)/ contained skipwhite nextgroup=karaField

" Range
syn match karaRange /\d\d:\d\d:\d\d[,.]\d\d\d --> \d\d:\d\d:\d\d[,.]\d\d\d/ skipwhite contains=karaArrow,karaTime nextgroup=karaCoordinates
syn match karaArrow /-->/ contained contains=@NoSpell
syn match karaTime /\d\d:\d\d:\d\d[,.]\d\d\d/ contained contains=@NoSpell
syn match karaCoordinates /X1:\d\+ X2:\d\+ Y1:\d\+ Y2:\d\+/ contained contains=@NoSpell

hi link karaIdentifier Identifier

hi def link karaArrow Delimiter
hi def link karaComment Comment
hi def link karaCoordinates Label
hi def link karaField String
hi def link karaHeader Label
hi def link karaTextComment Comment
hi def link karaTime String
hi def link karaTodo Todo

let b:current_syntax = 'kara'
