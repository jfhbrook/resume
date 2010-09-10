My resume is generated using templates and jinja2, along with a few other programs.
My goal is to have a few different formats available:

* .pdf, which looks best, especially printed. Should fit on one page.

* .md, which works good for online and text-only viewing.

* .rtf, since a lot of people prefer MS Word-compatible formats. Might not fit on one page.

In order to compile it yourself, you need waf. Do it like this:

    waf configure
    waf build --output=<pdf|markdown>

which will dump the final compiled document(s) into *resumes/*. The wscript is really crummy, but it seems to work!
