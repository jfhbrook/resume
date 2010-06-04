from jinja2 import Environment, FileSystemLoader

env=Environment(loader=FileSystemLoader('templates/'),
                #block_start_string='<%',
                #block_end_string='%>''
                #variable_start_string='<<',
                #variable_end_string='>>'
                )
                


