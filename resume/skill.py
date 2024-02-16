from dataclasses import dataclass
from typing import Any, Dict, List, Type


@dataclass
class Skillset:
    name: str
    skills: List[str]

    @classmethod
    def load(cls: Type["Skillset"], raw: Dict[str, Any]) -> "Skillset":
        return cls(**raw)
