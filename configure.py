#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess
import collections
import errno
import datetime
from distutils.dir_util import copy_tree
try:
    import simplejson as json
except ImportError:
    import json


def backup_all_files(backup_dir, src_dir):
    print(backup_dir, src_dir)
    if not os.path.isdir(backup_dir):
        os.makedirs(backup_dir)
    else:
        print("backup directory already exists. Continuing to backup...")

    if not (os.path.isfile(src_dir) and os.path.isdir(src_dir)):
        print("the {} doesn't exist.".format(src_dir))
        return

    try:
        shutil.copytree(src_dir, backup_dir + '/' + src_dir.split('/')[-1])
    except OSError as e:
        if e.errno == errno.ENOTDIR:
            shutil.copy(src_dir, backup_dir + '/')
        else:
            raise


def construct_command(command, subcommand, argument):
    return command + ' ' + subcommand + ' ' + argument


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
            _src = os.path.join(cwd, directory['src']).rstrip('/')
            _dest = os.path.expandvars(
                '$HOME') + '/' + directory['dest'].rstrip('/')

            print("Backing up {}".format(directory['name']))
            now = datetime.datetime.now()
            backup_dir = cwd + '/.backups' +  '/' + \
                now.strftime("%d-%m-%Y-%H:%M")

            current_status = cwd + '/current_status'
            if not os.path.exists(current_status):
                file = open(current_status, 'a')
                file.close()

            current_status = open(cwd + '/current_status').read()
            current_files = [os.path.expanduser(file) for file in current_status.strip().split('\n')]
            print(current_files)
            # backup_all_files(backup_dir, _dest)

            # print("Processing {}".format(directory['name']))
            # # print(_src, _dest)
            # if os.path.lexists(_dest):
            #     print("Link already exists at destination. Removing it...")
            #     os.unlink(_dest)

            # os.symlink(_src, _dest)


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

    if not os.path.exists(cwd + '/.backups'):
        os.makedirs(cwd + '/.backups')

    print(json.dumps(configObj, indent=2 * ' '))
    vars = [name for name, value in configObj.items()]
    # print(vars)

    for action in vars:
        excute_commands(action, configObj, cwd)

if __name__ == '__main__':
    main()
