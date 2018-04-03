{% from "vim/map.jinja" import vim with context %}

include:
  - vim

colors_vimfiles:
  file.recurse:
    - name: {{ vim.colors_dir }}
    - source: salt://vim/files/colors
