from dataclasses import dataclass
from typing import Any, Dict, Optional, Type

from resume.dates import DateRange


@dataclass
class Education:
    institution: str
    degree: str
    dates: DateRange
    major: Optional[str] = None
    minor: Optional[str] = None
    honor: Optional[str] = None
    thesis: Optional[str] = None
    gpa: Optional[str] = None

    @classmethod
    def load(cls: Type["Education"], raw: Dict[str, Any]) -> "Education":
        kwargs: Dict[str, Any] = dict(**raw)
        kwargs.update(dict(dates=DateRange.load(raw["dates"])))
        return cls(**kwargs)
