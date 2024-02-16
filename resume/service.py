from dataclasses import dataclass
from typing import Any, Dict, Type

from resume.dates import DateRange


@dataclass
class Service:
    organization: str
    dates: DateRange
    description: str

    @classmethod
    def load(cls: Type["Service"], raw: Dict[str, Any]) -> "Service":
        kwargs: Dict[str, Any] = dict(**raw)
        kwargs.update(dict(dates=DateRange.load(raw["dates"])))
        return cls(**kwargs)
