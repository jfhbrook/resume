top = '.'
out = 'build'

def configure(ctx):
    ctx.check_tool('python')
    ctx.check_tool('tex')

def build(ctx):
    obj = bld.new_task_gen(features='tex')
    obj.source

def pdf(ctx):
    pass

def markdown(ctx):
    pass

def rtf(ctx):
    pass
