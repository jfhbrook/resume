# Josh Holbrook's Resume

## Links

* [A one-page resume [PDF]](https://github.com/jfhbrook/resume/raw/main/resume.pdf)
* [A multi-page extended CV [PDF]](https://github.com/jfhbrook/resume/raw/main/cv.pdf)
* [My LinkedIn](https://www.linkedin.com/in/josh-holbrook-27744965/)
* [My GitHub](https://github.com/jfhbrook)

## Building My Resume

My resume is written in LaTeX and is compiled with luatex. I use Docker to
build it, since setting up the environment can be challenging *and* takes up
a lot of space.

### Prerequisites

- [just](https://github.com/casey/just)
  - with cargo: `cargo install just`
- [watchexec](https://github.com/watchexec/watchexec)
  - with cargo: `rustup run nightly cargo install watchexec-cli`
- [Docker](https://www.docker.com/products/docker-desktop/)
- A PDF viewer - this will be OS dependent

### Setup

To build the Docker image, run `just build`.

### Development

1. Run `just watch` to get Docker to watch all `.tex` files and run the build on
   save.
2. Open `resume.pdf` and `cv.pdf`. Most PDF viewers will automatically refresh
   whenever the file changes.
3. When you're done, commit and push
   
### Build Individual PDFs

- `just make resume.pdf` - Build the one-page resume
- `just make cv.pdf` - Build the extended CV
- `just make everything.pdf` - Build a document that includes everything I've
  ever done, since childhood

### Cleanup

Running `just clean` should, in theory, delete the Docker image and prune
layers.