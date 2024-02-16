from dataclasses import dataclass
from typing import Any, Dict, Type

from resume.dates import DateRange


@dataclass
class Award:
    name: str
    dates: DateRange
    project: str
    amount: str

    @classmethod
    def load(cls: Type["Award"], raw: Dict[str, Any]) -> "Award":
        kwargs: Dict[str, Any] = dict(**raw)
        kwargs.update(dict(dates=DateRange.load(raw["dates"])))
        return cls(**kwargs)
