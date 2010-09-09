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

    def templatize(task):
        # This section here is originally from resume.py. I don't know
        # if there's a more idiomatic way to do this with waf or not.
        # Lookit sections 7.4 and 8.2 in The Waf Book.
        from jinja2 import Environment, FileSystemLoader
        from yaml import load
        import re

        src = re.split('/', task.inputs[0].srcpath(task.env))
        tgt = task.outputs[0].bldpath(task.env)
        tag = options.tag

        print('Searching for template "'+src[2]+'" in "'+src[0]+'/'+src[1]+'":')
        template=Environment(loader = FileSystemLoader(src[0]+'/'+src[1])
                            , block_start_string = '<='
                            , block_end_string = '=>'
                            , variable_start_string = '<<'
                            , variable_end_string = '>>'
                            ).get_template(src[2])

        print('Processing template using "'+src[0]+'/resume.yaml":')

        with open(src[0]+'/resume.yaml', 'r') as infile:
            header = load(infile)
            for group in header:
                if 'tags' in group:
                    if tag not in group['tags']:
                        header.remove(group)
                for item in header[group]:
                    if 'tags' in item:
                        if tag not in item['tags']:
                            header[group].remove(item)
            print('Writing output to "'+tgt+'":')
            with open(tgt, 'w') as outfile:
                outfile.write(template.render(header))
                return 0

    bld( rule = templatize
       , source = 'templates/'+templates[options.output]
       , target = templates[options.output]
       )
