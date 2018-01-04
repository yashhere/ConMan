#!/usr/bin/env python3

import os
import sys
import shutil
from ruamel.yaml import YAML


def readConfig(path):
    fh = open(path, "r")
    yaml = YAML(typ='safe')
    return yaml.load(fh)


def main():

    if sys.argv == 1:
        print("Using default configuration file")
        path = os.getcwd() + '/' + 'dotfiles.yaml'
        cwd = os.getcwd()
    else:
        path = sys.argv[1]
        cwd = os.path.join(os.path.sep, path.rpartition('/')[0])


if __name__ == '__main__':
    main()
