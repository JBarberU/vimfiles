# cheat

## easymotion

<leader>
    <leader>f{char}      | Find {char} to the right. See |f|.
    <leader>F{char}      | Find {char} to the left. See |F|.
    <leader>t{char}      | Till before the {char} to the right. See |t|.
    <leader>T{char}      | Till after the {char} to the left. See |T|.
    <leader>w            | Beginning of word forward. See |w|.
    <leader>W            | Beginning of WORD forward. See |W|.
    <leader>b            | Beginning of word backward. See |b|.
    <leader>B            | Beginning of WORD backward. See |B|.
    <leader>e            | End of word forward. See |e|.
    <leader>E            | End of WORD forward. See |E|.
    <leader>ge           | End of word backward. See |ge|.
    <leader>gE           | End of WORD backward. See |gE|.
    <leader>j            | Line downward. See |j|.
    <leader>k            | Line upward. See |k|.
    <leader>n            | Jump to latest "/" or "?" forward. See |n|.
    <leader>N            | Jump to latest "/" or "?" backward. See |N|.
    <leader>s            | Find(Search) {char} forward and backward.

## neat stuff

While in insert mode:
    <C-r>=              brings up an arithmetic expression evaluator and pastes the result
        <C-r>"          pastes previous delete into evaluation :)

Marks:
    m{a-z}              Set mark in current buffer
    m{A-Z}              Set mark in file
    '{a-z}              Jump to mark in current buffer
    '{A-Z}              Jump to mark in file
    ''                  Jump to previous position
    <C-o>               Jump to previous position
    :marks              Shows a list of set marks
    :marks a-f          Shows a list of set marks from a-f

Windows:
    <C-w>_              Maximize window
    <C-w>=              Make all windows equal

Jumping:
    <C-o>               Jump to previous position
    <C-i>               Jump to future position (like back after <C-o>)
