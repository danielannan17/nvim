command! Term15 split | resize 15 | terminal
command! ListWindows windo echo getwinvar(winnr(), '&filetype')