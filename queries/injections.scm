; injections.scm for tree-sitter-razor (tris203) in Helix
; C# is built into this grammar (it extends tree-sitter-c-sharp)
; so no C# injection is needed.

; Razor comments have their own content
((razor_comment) @injection.content
 (#set! injection.language "comment"))

((html_comment) @injection.content
 (#set! injection.language "comment"))
