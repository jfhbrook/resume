from dataclasses import dataclass
from glob import glob
import os.path
from typing import Any, Dict, Iterable, List, Tuple

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
    def entities(self: "Config") -> Iterable[Tuple[str, Dict[str, Any]]]:
        for include in self.include:
            for filename in glob(include, recursive=True):
                id = os.path.splitext(os.path.basename(filename))[0]
                with open(filename, "r") as f:
                    data = yaml.load(f, Loader=Loader)
                yield (id, data)


def main():
    config = Config(include=["**/*.yaml"])

    resume = Resume.load(config.entities)

    from pprint import pprint

    pprint(resume)


if __name__ == "__main__":
    main()
