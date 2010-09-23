My resume is generated using templates and jinja2, along with a few other programs.
My goal is to have a few different formats available:

* .pdf, which looks best, especially printed. Should fit on one page.

* .md, which works good for online and text-only viewing.

* .rtf, since a lot of people prefer MS Word-compatible formats. Might not fit on one page.

In order to compile it yourself, you need waf. Do it like this:

    waf distclean && waf configure && waf build --output=<pdf|markdown>

which will dump the final compiled document(s) into *resumes/*. The wscript is really crummy (I plan to revert the waf action), but for now it *kinda* works. ;)

The resume at the moment also tries to support tagging (either engineering or cv at the moment), but it seems somewhat buggy (Plus, every resume should be tailored right?) so I'll probably remove this functionality when I have some spare time.
