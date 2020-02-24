# tmux

hotkey: ctrl + b

# General
Disconnect         hotkey + d


## Windows

New window          hotkey + c
Kill window         hotkey + &
Rename window       hotkey + ,
List windows        hotkey + w
next window         hotkey + n
previouse window    hotkey + p


## Pains
note, some of these are specific to my config

Kill pain           hotkey + x
New vertical        hotkey + |
New horizontal      hotkey + -
Move around         hotkey + up/down/left/right


# Docker

run a temporaty node container, mounting the current directory:
  docker run -it --rm -p 5000:5000 -v $(pwd):app -w/app node bash

