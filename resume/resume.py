from dataclasses import dataclass
from typing import Any, Dict, Iterable, Tuple, Type

import yaml

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
{yaml.safe_dump(data)}
"""
        )


Id = str
Data = Dict[str, Any]


@dataclass
class Resume:
    author: str
    location: str
    phone: str
    email: str
    webpage: str
    awards: Dict[str, Award]
    education: Dict[str, Education]
    jobs: Dict[str, Job]
    projects: Dict[str, Project]
    service: Dict[str, Service]
    skillsets: Dict[str, Skillset]

    @classmethod
    def load(cls: Type["Resume"], raw: Iterable[Tuple[Id, Data]]) -> "Resume":
        kwargs: Dict[str, Any] = dict(
            awards={}, education={}, jobs={}, projects={}, service={}, skillsets={}
        )

        for id, entity in raw:
            for key in entity.keys():
                if key in WHOAMI_FIELDS:
                    kwargs[key] = entity[key]
                elif key in LOADERS:
                    l, k = LOADERS[key]
                    try:
                        d = l(entity[key])
                        kwargs[k][id] = d
                    except Exception as exc:
                        raise LoadError(entity[key], exc) from exc

        return Resume(**kwargs)
