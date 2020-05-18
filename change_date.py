# handler.py
from datetime import datetime
import re

def handle(commit):
    date_str = commit.author_date.decode("utf-8")
    [seconds, tz] = date_str.split()
    date = datetime.fromtimestamp(int(seconds))

    msg = commit.message.decode("utf-8")
    m = re.match('^Day (\\d+):.*$', msg)
    day = int(m.group(1))
    new_date = date.replace(day=day)
    new_seconds = int(new_date.timestamp())
    new_date_str = f"{new_seconds} {tz}"
    commit.author_date = new_date_str.encode("utf-8")
