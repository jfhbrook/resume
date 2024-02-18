# Josh Holbrook's Resume

## Links

* [Resume [Word]](https://github.com/jfhbrook/resume/raw/main/resume.docx)
* [Resume [PDF]](https://github.com/jfhbrook/resume/raw/main/resume.pdf)
* [My LinkedIn](https://www.linkedin.com/in/josh-holbrook-27744965/)
* [My GitHub](https://github.com/jfhbrook)

## Development

My resume is written in Microsoft Word using a largely manual process. That
said, there are a scant handful of tasks in the [justfile](https://github.com/casey/just).

### Create a New Prototypal Entry

First, open `everything.docx`:

```bash
open everything.docx
```

Copy and paste an existing entry, and fill in the fields accordingly. Customize
the formatting if it makes sense to. Write more bullet points than you would
reasonably have in a completed resume - you can delete them later. Save the
document.

Next, open `resume.docx`:

```bash
open resume.docx
```

Copy and paste the new entry from `everything.docx` into the document, if
appropriate. Pare down the bullet points to target a general purpose software
oriented resume.

The resulting document can be up to two pages long. After consulting with
career counseling experts, I've decided that it's not viable to fully
represent my experience on a one-pager and that employers are less picky about
it than they might be for an industry where jobs require less explanation.

### Create a Tailored Resume

Tailored resumes may be created by copying either `everything.docx` or
`resume.docx` as a starting point, and editing from there. Most resumes will work
best by starting with `resume.docx` but referring to `everything.docx` for more
bullet points which may be better-suited for the tailored resume:

```bash
just new tailored.docx
open everything.docx tailored.docx
```

### Generate PDFs

For convenience, manually print `resume.docx` (or your tailored resume) to the
corresponding PDF (ie., `resume.pdf`).

### Cleanup

Running `just clean` should clean up temporary files created by Microsoft Word.
