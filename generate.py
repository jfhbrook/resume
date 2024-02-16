from dataclasses import dataclass
from glob import glob
from typing import Any, Dict, Iterable, List

import yaml

try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader

from resume.resume import Resume

@dataclass
class Config:
    include: List[str]

    @property
    def entities(self: "Config") -> Iterable[Dict[str, Any]]:
        for include in self.include:
            for filename in glob(include, recursive=True):
                with open(filename, "r") as f:
                    data = yaml.load(f, Loader=Loader)
                yield data


def main():
    config = Config(include=["**/*.yaml"])

    resume = Resume.load(config.entities)

    from pprint import pprint

    pprint(resume)


if __name__ == "__main__":
    main()
