from jinja2 import Environment, FileSystemLoader
from yaml import load

template=Environment(loader=FileSystemLoader('templates/'),
                block_start_string='<=',
                block_end_string='=>',
                variable_start_string='<<',
                variable_end_string='>>'
                ).get_template('resume.tex')

with open('resume.yaml') as header:    
    print template.render(load(header))
