# Josh Holbrook's Resume

## Links

* [A one-page resume [PDF]](https://github.com/jfhbrook/resume/raw/master/resume.pdf)
* [A multi-page extended CV [PDF]](https://github.com/jfhbrook/resume/raw/master/cv.pdf)
* [My LinkedIn](https://www.linkedin.com/in/joshua-holbrook-27744965/)
* [My GitHub](https://github.com/jfhbrook)

## Building My Resume

My resume is written in LaTeX and is compiled with luatex. All of the packages
should come with the standard TeXlive distribution. In addition, you will need
to install the Merriweather, Montserrat and mononoki fonts.

If everything is set, my resume can be compiled with make:

* `make resume.pdf` - Build the one-page resume
* `make cv.pdf` - Build the extended CV
* `make everything.pdf` - Build a document that includes everything I've ever
  done ever, since childhood
