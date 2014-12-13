#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import sys
import os

def print_shellscript_for_brew_bundle(brewfilename):
    with open(brewfilename) as f:
        print("#!/bin/sh")
        for line in f:
            if line[0] == "#" or len(line) == 1:
                print(line.rstrip())
            else:
                print("brew %s || true" % line.rstrip())

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("brewfile")
    args = parser.parse_args()
    if not os.path.isfile(args.brewfile):
        print("%s is not a file" % args.brewfile)
        sys.exit(1)

    print_shellscript_for_brew_bundle(args.brewfile)

if __name__ == '__main__':
    main()
