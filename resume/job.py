from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Type

from resume.accomplishment import Accomplishment
from resume.dates import DateRange


@dataclass
class Job:
    employer: str
    title: str
    dates: DateRange
    accomplishments: List[Accomplishment]
    offices: Optional[str] = None
    team: Optional[str] = None

    @classmethod
    def load(cls: Type["Job"], raw: Dict[str, Any]) -> "Job":
        accomplishments: List[Accomplishment] = []

        if "accomplishments" in raw:
            for accomplishment in raw["accomplishments"]:
                accomplishments.append(
                    Accomplishment(description=accomplishment, tags=["major"])
                )

        if "extended_accomplishments" in raw:
            for accomplishment in raw["extended_accomplishments"]:
                accomplishments.append(
                    Accomplishment(description=accomplishment, tags=["minor"])
                )

        kwargs: Dict[str, Any] = dict()

        for key in ["employer", "offices", "title", "team", "dates"]:
            if key in raw:
                kwargs[key] = raw[key]

        kwargs.update(
            dict(dates=DateRange.load(raw["dates"]), accomplishments=accomplishments)
        )

        return cls(**kwargs)
