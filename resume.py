from jinja2 import Environment, FileSystemLoader
from yaml import load

template=Environment(loader=FileSystemLoader('templates/'),
                block_start_string='<=',
                block_end_string='=>',
                variable_start_string='<<',
                variable_end_string='>>'
                ).get_template('resume.tex')

tag='cv'

with open('resume.yaml') as infile:
    header = load(infile)
    for group in header:
        if 'tags' in group:
            if tag not in group['tags']:
                header.remove(group)
        for item in header[group]:
            if 'tags' in item:
                if tag not in item['tags']:
                    header[group].remove(item)
    print template.render(header)
