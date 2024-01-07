set windows-shell := ['pwsh', '-Command']

watch:
  watchexec -e .tex docker run -it -v "$(pwd):/opt/resume" resume-builder
  
make *ARGS:
  docker run -it -v "$(pwd):/opt/resume" resume-builder {{ARGS}}
  
shell:
  docker run -it -v "$(pwd):/opt/resume" resume-builder bash
  
build:
  docker build . -t resume-builder
  
clean:
  docker rmi resume-builder
  docker system prune