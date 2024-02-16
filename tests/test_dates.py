import pytest

from resume.dates import DateRange


@pytest.mark.parametrize(
    "raw,expected",
    [
        (
            {"from": "January 2020", "to": "December 2020"},
            DateRange(from_="January 2020", to="December 2020"),
        ),
        ({"from": "January 2020"}, DateRange(from_="January 2020")),
        ({"to": "January 2020"}, DateRange(from_="January 2020")),
    ],
)
def test_daterange(raw, expected):
    assert DateRange.load(raw) == expected
