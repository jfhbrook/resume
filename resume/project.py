from dataclasses import dataclass
from typing import Any, Dict, Optional, Type

from resume.dates import DateRange


@dataclass
class Project:
    name: str
    dates: DateRange
    description: str
    url: Optional[str] = None
    stars: Optional[int] = None

    @classmethod
    def load(cls: Type["Project"], raw: Dict[str, Any]) -> "Project":
        kwargs: Dict[str, Any] = dict(**raw)
        kwargs.update(dict(dates=DateRange.load(raw["dates"])))
        return cls(**kwargs)
