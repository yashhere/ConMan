#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess
import collections
try:
    import simplejson as json
except ImportError:
    import json


def construct_command(command, subcommand, argument):
    return command + ' ' + subcommand + ' ' + argument


def check_existing_symlinks():
    return


def excute_commands(section, configObj, cwd):
    if section == 'pre':
        devnull = open(os.devnull, "w")
        retval = subprocess.call(
            ["dpkg", "-s", "git"], stdout=devnull, stderr=subprocess.STDOUT)
        devnull.close()
        if retval != 0:
            print("Package git not installed.")
            sys.exit()

        for action in configObj[section]:
            repo_name = action['argument'].split('/')[-1].split('.')[0]
            if not os.path.isdir(os.path.join(cwd, repo_name)):
                command = construct_command(action['command'], action[
                    'subcommand'], action['argument'])
                subprocess.call(command, cwd=cwd, shell=True)
            else:
                print("{} already exists. Skipping git clone...".format(repo_name))

    elif section == 'linking':
        for directory in configObj[section]:
            print("Processing {}".format(directory['name']))
            _src = directory['src']
            _dest = directory['dest']
            print(_src, _dest)


def readConfig(path):
    try:
        fh = open(path, "r")
    except FileNotFoundError:
        print('file not found')
        sys.exit()
    return json.load(fh, object_pairs_hook=collections.OrderedDict)


def main():
    if len(sys.argv) == 1:
        print("Using default configuration file")
        path = os.getcwd() + '/' + 'dotfiles.json'
        cwd = os.getcwd()
    else:
        path = sys.argv[1]
        cwd = os.path.join(os.path.sep, path.rpartition('/')[0])

    configObj = readConfig(path)

    print(json.dumps(configObj, indent=2 * ' '))
    vars = [name for name, value in configObj.items()]
    # print(vars)

    for action in vars:
        excute_commands(action, configObj, cwd)

if __name__ == '__main__':
    main()
