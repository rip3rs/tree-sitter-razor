; highlights.scm for tree-sitter-razor (tris203) in Helix
; This grammar extends tree-sitter-c-sharp, so we inherit C# highlights

; =====================
; Razor Comments
; =====================
(razor_comment) @comment
(html_comment) @comment

; =====================
; Razor Directives (@page, @model, @using, etc.)
; =====================
"at_page" @keyword.directive
"at_using" @keyword.directive
"at_model" @keyword.directive
"at_inject" @keyword.directive
"at_implements" @keyword.directive
"at_layout" @keyword.directive
"at_inherits" @keyword.directive
"at_attribute" @keyword.directive
"at_typeparam" @keyword.directive
"at_namespace" @keyword.directive
"at_preservewhitespace" @keyword.directive
"at_rendermode" @keyword.directive
"at_block" @keyword.directive
"at_section" @keyword.directive

; =====================
; Razor Control Flow
; =====================
"at_if" @keyword.control.conditional
"at_switch" @keyword.control.conditional
"at_for" @keyword.control.repeat
"at_foreach" @keyword.control.repeat
"at_while" @keyword.control.repeat
"at_do" @keyword.control.repeat
"at_try" @keyword.control.exception
"at_await" @keyword.control
"at_lock" @keyword.control

; =====================
; Razor Expressions
; =====================
"at_explicit" @keyword
"at_implicit" @keyword

; =====================
; Razor Escape (@@)
; =====================
"at_at_escape" @constant.character.escape

; =====================
; Explicit Line Transition (@:)
; =====================
"at_colon_transition" @keyword

; =====================
; Non-@ Control Flow Keywords
; =====================
"else if" @keyword.control.conditional
"else" @keyword.control.conditional
"catch" @keyword.control.exception
"finally" @keyword.control.exception
"case" @keyword.control.conditional
"default" @keyword.control.conditional
"break;" @keyword.control
"in" @keyword.control

; =====================
; Razor Rendermode Values
; =====================
(razor_rendermode) @constant.builtin

; =====================
; Razor Attributes (@bind, @onclick, etc.)
; =====================
(razor_attribute_name) @attribute
(razor_attribute_modifier) @attribute

; =====================
; HTML Structure
; =====================
(tag_name) @tag
(end_tag "</" @punctuation.bracket)
(end_tag (tag_name) @tag)
(end_tag ">" @punctuation.bracket)
(element "<" @punctuation.bracket)
(element ">" @punctuation.bracket)
(element "/>" @punctuation.bracket)

; HTML Attributes
(html_attribute_name) @attribute
(html_attribute_value) @string
(boolean_html_attribute) @attribute

; HTML Entities & Text
; (html_entity) @constant.character.escape  ; requires rebuilt parser
; (html_text) @markup                        ; requires rebuilt parser

; =====================
; Punctuation
; =====================
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
";" @punctuation.delimiter
":" @punctuation.delimiter
"," @punctuation.delimiter
"=" @operator

; =====================
; C# Fundamentals (fallback if inherits doesn't work)
; =====================
(identifier) @variable
(string_literal) @string
(interpolated_string_expression) @string
(character_literal) @constant.character
(integer_literal) @constant.numeric.integer
(real_literal) @constant.numeric.float
(boolean_literal) @constant.builtin.boolean
(null_literal) @constant.builtin
(type) @type
(predefined_type) @type.builtin
(implicit_type) @type.builtin
(comment) @comment

; Declarations
(variable_declarator (identifier) @variable)
(parameter name: (identifier) @variable.parameter)
(method_declaration name: (identifier) @function.method)
(local_function_statement name: (identifier) @function)
(invocation_expression function: (identifier) @function)
(invocation_expression function: (member_access_expression name: (identifier) @function.method))

; C# keywords
[
  "using"
  "namespace"
  "class"
  "struct"
  "interface"
  "enum"
  "record"
  "new"
  "return"
  "if"
  "switch"
  "for"
  "foreach"
  "while"
  "do"
  "try"
  "throw"
  "await"
  "async"
  "static"
  "public"
  "private"
  "protected"
  "internal"
  "virtual"
  "override"
  "abstract"
  "sealed"
  "readonly"
  "const"
  "var"
  "true"
  "false"
  "this"
  "base"
  "typeof"
  "is"
  "as"
  "where"
  "yield"
  "partial"
  "get"
  "set"
  "add"
  "remove"
] @keyword
