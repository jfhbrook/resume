from dataclasses import dataclass
from typing import Any, Dict, Iterable, List, Type

import yaml

try:
    from yaml import CDumper as Dumper
except ImportError:
    from yaml import Dumper

from resume.award import Award
from resume.education import Education
from resume.job import Job
from resume.project import Project
from resume.service import Service
from resume.skill import Skillset

WHOAMI_FIELDS = {"author", "location", "phone", "email", "webpage"}
LOADERS = {
    "award": (Award.load, "awards"),
    "education": (Education.load, "education"),
    "job": (Job.load, "jobs"),
    "project": (Project.load, "projects"),
    "service": (Service.load, "service"),
    "skillset": (Skillset.load, "skillsets"),
}


class ResumeError(Exception):
    pass


class LoadError(ResumeError):
    def __init__(self, data: Dict[str, Any], exc: Exception):
        super(LoadError, self).__init__(
            f"""Error loading entity: {str(exc)}:
{yaml.safe_dump(data, Dumper=Dumper)}
"""
        )


@dataclass
class Resume:
    author: str
    location: str
    phone: str
    email: str
    webpage: str
    awards: List[Award]
    education: List[Education]
    jobs: List[Job]
    projects: List[Project]
    service: List[Service]
    skillsets: List[Skillset]

    @classmethod
    def load(cls: Type["Resume"], raw: Iterable[Dict[str, Any]]) -> "Resume":
        kwargs: Dict[str, Any] = dict(
            awards=[], education=[], jobs=[], projects=[], service=[], skillsets=[]
        )

        for entity in raw:
            for key in entity.keys():
                if key in WHOAMI_FIELDS:
                    kwargs[key] = entity[key]
                elif key in LOADERS:
                    l, k = LOADERS[key]
                    try:
                        d = l(entity[key])
                        kwargs[k].append(d)
                    except Exception as exc:
                        raise LoadError(entity[key], exc) from exc

        return Resume(**kwargs)
