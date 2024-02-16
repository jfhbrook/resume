from dataclasses import dataclass
from typing import Any, Dict, Optional, Type


@dataclass
class DateRange:
    from_: str
    to: Optional[str] = None

    @classmethod
    def load(cls: Type["DateRange"], raw: Dict[str, Any]) -> "DateRange":
        kwargs: Dict[str, Any] = dict()

        if "from" in raw:
            kwargs["from_"] = raw["from"]

        if "to" in raw:
            if "from" not in raw:
                kwargs["from_"] = raw["to"]
            else:
                kwargs["to"] = raw["to"]

        return cls(**kwargs)
