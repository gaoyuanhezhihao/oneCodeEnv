import os
from os.path import join
import argparse
import re
# pip3 install --user charset-normalizer
from charset_normalizer import from_path

def help():
    print('''
Example:
          python3 ./replace_std_pmr.py ~/cybertron/seamake --add_to_git_ignore ~/cybertron/.gitignore
          ''')

def insert_includes(lines, pmr_items):
    special_items = {'polymorphic_allocator': 'memory_resource'}
    extra_include_lines = []
    for item in pmr_items:
        if item in special_items:
            extra_include_lines.append('#include <experimental/%s>\n' % special_items[item])
        else:
            extra_include_lines.append('#include <experimental/%s>\n' % item)
    first_include_index = 0
    for i, line in enumerate(lines):
        if line.count('#include'):
            first_include_index = i
            break
    lines = lines[:first_include_index] + extra_include_lines + lines[first_include_index:]
    return lines

def remove_experimental_includes(lines):
    filtered_lines = []
    for l in lines:
        if not l.count('#include <experimental'):
            filtered_lines.append(l)
    return filtered_lines


def replace_keywords(fp, replaced_key_word, new_key_word):
    regex_pattern = replaced_key_word + '::(\\w+)'
    replaced_lines = []
    pmr_items = set()
    # print(fp)
    # print("encoding:", from_path(fp).best())
    with open(fp, 'r', encoding=str(from_path(fp).best().encoding)) as file:
        for line in file.readlines():
            matches = re.findall(regex_pattern, line)
            if matches:
                line = line.replace(replaced_key_word, new_key_word)
                pmr_items = pmr_items.union(matches)
            replaced_lines.append(line)
    return replaced_lines, pmr_items


def replace_std_pmr(fp):
    replaced_lines, pmr_items = replace_keywords(fp, "std::pmr", "std::experimental::pmr")
    if pmr_items:
        with open(fp, 'w') as file:
            replaced_lines = insert_includes(replaced_lines, pmr_items)
            file.writelines(replaced_lines)
        return True
    else:
        return False


def recover_std_pmr(fp):
    replaced_lines, pmr_items = replace_keywords(fp, "std::experimental::pmr", "std::pmr")
    if pmr_items:
        with open(fp, 'w') as file:
            replaced_lines = remove_experimental_includes(replaced_lines)
            file.writelines(replaced_lines)



if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--remove_experimental', default=False, action='store_true')
    parser.add_argument('--add_to_git_ignore', default='')
    parser.add_argument('directory')
    args = parser.parse_args()
    root_dir = os.path.split(args.add_to_git_ignore)[0]
    cpp_file_paths = []
    for root, subdirs, files in os.walk(args.directory):
        for f in files:
            if f.endswith('.h') or f.endswith('.cc'):
                cpp_file_paths.append(join(root, f))
    if args.remove_experimental:
        for fp in cpp_file_paths:
            recover_std_pmr(fp)
    else:
        for fp in cpp_file_paths:
            if replace_std_pmr(fp) and args.add_to_git_ignore:
                rel_path = os.path.relpath(fp, root_dir)
                with open(args.add_to_git_ignore, 'a') as f:
                    print(fp)
                    print('rel_path:', rel_path)
                    f.writelines(rel_path+'\n')
