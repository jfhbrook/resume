top = '.'
out = 'build'

def set_options(opts):
    opts.add_option('--output', action = 'store', default='pdf', help='pdf, markdown or rtf')
    opts.add_option('--tag', action = 'store', default='cv', help='use a tag to pick out relevant entries')

def configure(conf):
    from Options import options
    conf.check_tool('python')
    conf.check_python_module('jinja2')
    conf.check_python_module('yaml')
    

def build(bld):
    from Options import options
    templates = {'pdf': 'resume.tex',
                 'markdown': 'resume.md'}
    tag=options.tag
    template = templates[options.output]

    from jinja2 import Environment, FileSystemLoader
    from yaml import load

    template=Environment(loader=FileSystemLoader('templates/'),
                    block_start_string='<=',
                    block_end_string='=>',
                    variable_start_string='<<',
                    variable_end_string='>>'
                    ).get_template(template)

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
        output = template.render(header)

    if (options.output == "pdf"):
        pass
        #obj = bld.new_task_gen(features='tex')
        #obj.source
