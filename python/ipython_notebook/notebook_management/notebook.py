#!/usr/bin/env python

"""
A python script to manage several IPython notebooks
"""

import os
import shutil
import glob
import argparse

class NotebookCLI():
    def __init__(self, args):
        #print(args.action)
        #print(args.notebook_file)
        #print(args.number)
        
        filename_base = os.path.join(args.basepath, args.notebook_file)
        filename_src = filename_base + '.' + args.extension
        
        clone_sep = '__'
                
        if args.action == 'clone':
            print("Clone notebook '{notebook}'".format(notebook=args.notebook_file))
            for i in range(1, args.number + 1):
                filename_dst = filename_base + clone_sep + args.number_format % (i) + '.' + args.extension
                print(" Copy {filename_src} to {filename_dst}".format(\
                   filename_src = filename_src,
                   filename_dst = filename_dst
                ))
                if not os.path.isfile(filename_dst) or args.force:
                    shutil.copyfile(filename_src, filename_dst)
                else:
                    print("  Can't copy this file (ever exists)")
        
        elif args.action == 'delete':
            print("Delete notebook '{notebook}'".format(notebook=args.notebook_file))
            filenames = glob.glob(filename_base + clone_sep + '*.' + args.extension)
            for f in filenames:
                print(" Delete " + f)
                os.remove(f)
            
            
        else:
            raise(Exception("Action {action} not supported".format(action=args.action)))

if __name__ == "__main__":
    PARSER = argparse.ArgumentParser(description='Use the following parameters')

    PARSER.add_argument('action', action="store",
        help="Action clone/delete")
    
    PARSER.add_argument('notebook_file', action="store",
        help="Input file to clone")

    PARSER.add_argument('--number', action="store",
        help="Number of notebooks ('20' as default)", default=20)

    PARSER.add_argument('--number_format', action="store",
        help="Number format as default ('04d' as default)", default='%04d')

    PARSER.add_argument('--extension', action="store",
        help="File extension ('ipynb' as default)", default='ipynb')

    PARSER.add_argument('--force', action="store_true",
        help="Force overwrite")
        
    ARGS = PARSER.parse_args()

    ARGS.basepath = os.path.dirname(__file__)
    
    try:
        ARGS.number = int(ARGS.number)
    except:
        msg = 'Number must be integer'
        raise(Exception(msg))        
    
    allowed_actions = ['clone', 'delete']
    allowed_actions_str = []
    for allowed_action in allowed_actions:
        allowed_actions_str.append("\'" + allowed_action + "\'")
    if ARGS.action not in allowed_actions:
        msg = 'Action must be [' + '|'.join(allowed_actions_str) + ']'
        raise(Exception(msg))
    
    cli = NotebookCLI(ARGS)
