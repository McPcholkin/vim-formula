{% from "vim/map.jinja" import vim with context %}

vim:
  pkg.installed:
    - name: {{ vim.pkg }}

{% if salt['pillar.get']('vim:managed_vimrc', True) == True %}
vim_file_vimrc:
  file.managed:
    - name {{ vim.config_root }}/vimrc
    - source: salt://vim/files/vimrc
    - user: root
    - group: {{ vim.group }}
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: vim
    - defaults:
        config_root: {{ vim.config_root }}
{% endif %}
