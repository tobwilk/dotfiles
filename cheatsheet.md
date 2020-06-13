========================== TOBYS CHEET SHEET ==========================

These shortcuts are based on my personal configuration


# Vim

specific to my configuration

    - leader is space. good alternative is ,

    - Basics Level 1
        - j & k                  up and down
        - h & l                  left and right
        - w & b                  Forward & back a word
        - yy                     yank a line
        - dd                     delete a line
        - p                      paste the line below
        - u                      undo
        - v (lowercase)          highlight whole line
        - V                      higlights at cursor position
        - i                      Insert mode
        - esc or jj              leave insert mode. Note, jj is not default.

    - Basics Level 2
        - o                     insert mode, on new line below
        - O                     same thing, but upwards
        - shift+p               Paste one line up
        - a                     insert, one char over
        - shift+i               Insert at start of line
        - shift+a               Insert at end of line
        - /                     search mode. Hop with n & shift+n
        - * or #                hop between occurances of what your hovered on

     -Nerd Tree
        - leader + n            toggle
        - enter                 open folder
        - t                     open folder in new tab
        - m                     Brings up nerdtree menu. a creates a new file
        - i                     opens selected horizontally
        - s                     opens selected vertically

    - panes
        - hjkl                  move between panes
        - gt                    move between tabs

    - Moving around
        - { or }                Up / Down paragraph
        - H, M, L               Move to Top, Middle or bottom of current view
        - e                     Move left by word
        - A                     Move to end of line, switch to insert
        - $                     move to end of line
        - gg                    move to top of file
        - G                     move to bottom of file
        - $                     move to end of line
        - 0 or ^                move to start of line

    - insert
        - i                     insert mode at current place
        - A                     insert mode at end of line

    - moving text
        - v                     enters visual mode
        - y                     yank, copies the text
        - d                     delete, but it also cuts
        - p                     paste
        - >>                    Indent right
        - <<                    Indent left


    - serching and replace
        - :%s/foo/bar/g         find all foo, and replace with bar
        - :%s/foo/bar/gc        same, but confirm before all replace
        - s/foo/bar/g           find foo on current line, and replace with bar

    - spelling
        - ]s and [s             moves between mispelled words
        - z=                    shows spelling alternatives
        - zg                    adds word to dictionary

    - VimWiki
        - L,ww                  Go to Vimwiki homepage
        - L,w,L,w               Go to todays diary page
        - :Diary                Go to diary index page

    - Misc
        - gqG                   move to top of file (gg), then word wrap

# tmux

    - Session managment
        - tmux ls                       List sessions
        - tmux a -t name                attach to session
        - tmux kill-session -t name     kill sesstion
        - leader + d                    detatch from within session

    - leader is ctrl + a

    - General Disconnect                      hotkey + d

    - Windows
        - New window                    hotkey + c
        - Kill window                   hotkey + &
        - Rename window                 hotkey + ,
        - List windows                  hotkey + w
        - next window                   hotkey + n
        - previouse window              hotkey + p

    - Pains
        - Kill pain                     hotkey + x
        - New vertical                  hotkey + |
        - New horizontal                hotkey + -
        - Move around                   hotkey + up/down/left/right or hjkl


