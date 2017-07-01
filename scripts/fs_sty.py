#!/usr/bin/env python

import os
import re
import sys

import jinja2

# Regex Pattern
ICON_PATTERN = re.compile('^.fa-(.*):before')
CODE_PATTERN = re.compile('^  content: "(.*)"')

latex_jinja_env = jinja2.Environment(
    block_start_string='\BLOCK{',
    block_end_string='}',
    variable_start_string='\VAR{',
    variable_end_string='}',
    comment_start_string='\#{',
    comment_end_string='}',
    line_statement_prefix='%%%',
    line_comment_prefix='%#',
    trim_blocks=True,
    autoescape=False,
    loader=jinja2.FileSystemLoader(os.path.abspath('.')))

template = latex_jinja_env.get_template('fontawesome.sty.j2')

fs_css = sys.argv[1]

icons_list = list()

with open(fs_css, 'r') as css:
    icons = []
    for line in css:
        match = ICON_PATTERN.search(line)
        if match:
            icons.append(match.group(1))
            continue
        match = CODE_PATTERN.search(line)
        if match:
            code = match.group(1)[1:]
            for icon in icons:
                icons_list.append((icon, code.upper(),
                                   icon.replace('-', ' ').title().replace(' ', '')))
            icons = []

print(template.render(fontawesome=icons_list))
