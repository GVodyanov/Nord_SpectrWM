
# Width of a tab
set-option global tabstop 2

# Indent with 4 spaces
set-option global indentwidth 2

# Use tab for autocompletion
hook global InsertCompletionShow .* %{
    map window insert <tab> <c-n>
    map window insert <s-tab> <c-p>
}

hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

#line numbers
add-highlighter global/ number-lines


# add brackets highliting
hook global WinCreate .* %{addhl show_matching}
require-module auto-pairs
# add brackets completion
# set-option codepoint-list
eval %sh{kak-lsp --kakoune -s $kak_session}  # Not needed if you load it with plug.kak.
hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
        lsp-enable-window
}

nop %sh{
    mkdir -p "$kak_config/autoload"
    ln -s "$kak_runtime/autoload" "$kak_config/autoload/standard-library"
}

colorscheme default+

add-highlighter global/ wrap -word -indent

set-option global modelinefmt ' %val{bufname} %val{cursor_line}:%val{cursor_char_column}'

auto-pairs-enable

set-option global aligntab true
