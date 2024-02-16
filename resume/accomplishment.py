from dataclasses import dataclass
from typing import List


@dataclass
class Accomplishment:
    description: str
    tags: List[str]
