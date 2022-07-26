import re

with open("./a.html", 'r') as f:
    lines = f.readlines()

for l in lines:
    result = re.search(r'http:.*\.mp3', l)
    if result:
        print(result.group(0))
        # for g in result.group():
            # print(g)
