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
    conf.check_tool('tex')
    if options.output == 'pdf':
        if not conf.env.PDFLATEX:
            conf.fatal('Gurl how do you expect to make a pdf without pdflatex?')
    

def build(bld):
    from Options import options
    templates = {'pdf': 'resume.tex',
                 'markdown': 'resume.md'}
    tag=options.tag
    tpl_name = templates[options.output]


    # This section here is originally from resume.py. I don't know
    # if there's a more idiomatic way to do this with waf or not.
    # Lookit section 7.4 in The Waf Book.
    from jinja2 import Environment, FileSystemLoader
    from yaml import load

    template=Environment(loader=FileSystemLoader('templates/'),
                    block_start_string='<=',
                    block_end_string='=>',
                    variable_start_string='<<',
                    variable_end_string='>>'
                    ).get_template(tpl_name)

    with open(top+'/resume.yaml', 'r') as infile:
        header = load(infile)
        for group in header:
            if 'tags' in group:
                if tag not in group['tags']:
                    header.remove(group)
            for item in header[group]:
                if 'tags' in item:
                    if tag not in item['tags']:
                        header[group].remove(item)
        with open(top+'/'+out+'/'+tpl_name, 'w') as outfile:
            outfile.write(template.render(header))
    #That's the end of that!

    if (options.output == "pdf"):        
        obj = bld( features = 'tex'
                 , type='pdflatex'
                 , source = out+'/resume.tex'
                 )
        obj.deps = out+'/resume.tex'

