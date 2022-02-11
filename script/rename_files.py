import os
import shutil
import re
from os.path import join

DIR = "/home/zhihaohe/vbox_shared/下载/fofa/2018_刘素云老师讲无量寿经"

UNICODE_WHITESPACE_CHARACTERS = set([
    "\u0009", # character tabulation
    "\u000a", # line feed
    "\u000b", # line tabulation
    "\u000c", # form feed
    "\u000d", # carriage return
    "\u0020", # space
    "\u0085", # next line
    "\u00a0", # no-break space
    "\u1680", # ogham space mark
    "\u2000", # en quad
    "\u2001", # em quad
    "\u2002", # en space
    "\u2003", # em space
    "\u2004", # three-per-em space
    "\u2005", # four-per-em space
    "\u2006", # six-per-em space
    "\u2007", # figure space
    "\u2008", # punctuation space
    "\u2009", # thin space
    "\u200A", # hair space
    "\u2028", # line separator
    "\u2029", # paragraph separator
    "\u202f", # narrow no-break space
    "\u205f", # medium mathematical space
    "\u3000", # ideographic space
])


def move_to_head(s, span):
    return s[span.start(): span.end()] + '_' + s[:span.start()] + s[span.end():]


def move_triple_index_to_head(s):
    index = re.search('\\d{3}', s)
    if index:
        return move_to_head(s, index)
    return s

index_set = set()

def move_chinese_index_to_head(s):
    if re.search('\\d{1,3}', s) and re.search('\\d{1,3}', s).start() == 0:
        return s
    span = re.search('第\\d{1,3}集', s)
    if span:
        index = s[span.start()+1: span.end()-1]
        index_set.add(int(index))
        return index + '_' + ''.join([c for c in s if c != '_'])
    return s


def split(s, *indexes):
    indexes = [0] + list(indexes) + [len(s)]
    return [s[h:e] for h, e in zip(indexes[:-1], indexes[1:])]


def swap_filename_item(s):
    match = re.search('第\\d{1,3}集刘素云老师无量寿经', s)
    if match:
        prev, match_str, after = split(s, match.start(), match.end())
        index_span = re.search('第\\d{1,3}集', match_str)
        index_str, content = split(match_str, index_span.end())
        # print('index_str:', index_str)
        s = prev + content + index_str + after
    return s

def remove_url_string(s):
    match = re.search('\[.*\]', s)
    if match:
        prev, _, after = split(s, match.start(), match.end())
        s = prev + after
    return s

for f in os.listdir(DIR):
    if os.path.isdir(join(DIR, f)):
        continue
    removed_whitespace = ''.join([c for c in f if c not in UNICODE_WHITESPACE_CHARACTERS])
    new_file_name = remove_url_string(removed_whitespace)
    shutil.move(join(DIR, f), join(DIR, new_file_name))
    print("mv ", f, new_file_name)

# print(','.join([str(i) for i in range(1, 71) if i not in index_set]))
