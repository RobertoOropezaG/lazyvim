" -----------------------------
" Extra HTTP/Kalula highlighting
" -----------------------------

" HTTP Methods
syntax keyword httpMethod GET POST PUT DELETE PATCH OPTIONS HEAD
highlight link httpMethod Keyword

" HTTP Headers (e.g., Content-Type: application/json)
syntax match httpHeader "^[A-Za-z-]\+:\s.*$"
highlight link httpHeader Identifier

" URLs (http/https)
syntax match httpUrl "http[s]*:\/\/[^\s]\+"
highlight link httpUrl String

" Status lines (optional)
syntax match httpStatus "\vHTTP\/\d\.\d\s\d{3}"
highlight link httpStatus Number

" @annotations like @definitions, @tags
syntax match httpAnnotation "@[A-Za-z_]\+"
highlight link httpAnnotation PreProc

" @annotations like =definitions, =tags
syntax match httpAnnotation "=[A-Za-z_]\+"
highlight link httpAnnotation PreProc

" JSON keys inside body (if YAML highlighting is active)
syntax match httpJsonKey "\"\zs\w\+\ze\"(?=:)"
highlight link httpJsonKey Identifier

