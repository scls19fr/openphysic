#!/usr/bin/env python

import os
import sys
import shutil
import glob

import argparse

import random
import string
import json

import collections
from collections import OrderedDict

from IPython.lib import passwd

import datetime


def print_success(msg):
    print(' + ' + msg)

def print_fail(msg):
    print(' - ' + msg)


class NotebookCreateUsers():
    def __init__(self, args):
        print("Notbook management CLI")
        
        methodToCall = getattr(self, 'action_' + args.action)(args)


    def action_createuser(self, args):
        user_config = {
            'users': OrderedDict() #OrderedDict() or #dict()  or #{}
        }
        
        port = args.port
        
        for i in range(1, args.number + 1):
            username = 'user_' + args.number_format % (i)
            #print(username)
            
            pwd = ''.join(random.choice(string.ascii_lowercase + string.digits) for x in range(6))
            hash_pwd = passwd(pwd)
            directory = os.path.join(args.basepath, 'users', username)

            data_user = OrderedDict()
            data_user['pwd'] = pwd
            data_user['port'] = port
            data_user['directory'] = os.path.abspath(directory)
            data_user['hash_pwd'] = hash_pwd
            data_user['created'] = datetime.datetime.utcnow().isoformat()
            
            user_config['users'][username] = data_user
            port += 1
                
        user_config_json = json.dumps(user_config)
        
        print(json.dumps(user_config, indent=4))
        
        filename = os.path.join(args.basepath, args.usersfilename)
        print("Write user config file '{filename}'".format(filename=filename))
        with open(filename, 'w') as f:
            f.write(user_config_json)
        print(" + Done")


    def action_createuserdir(self, args):
        for user, datauser in self.users(args):
            directory = datauser['directory']
            print("Create directory {directory}".format(directory=directory))
            try:
                os.mkdir(directory)
                print_success("Directory created")
            except OSError as e:
                print_fail("Can't create directory - OS error({0}): {1}".format(e.errno, e.strerror))
            except:
                print_fail("Unexpected error:", sys.exc_info()[0])
                raise
            print("")


    def action_deleteuserdir(self, args):
        for user, datauser in self.users(args):
            directory = datauser['directory']
            print("Delete directory {directory}".format(directory=directory))
            try:
                #os.rmdir(directory)
                if not args.force:
                    os.removedirs(directory)
                else:
                    shutil.rmtree(directory)
                print_success("Directory removed")
            except OSError as e:
                print_fail("Can't delete directory - OS error({0}): {1}".format(e.errno, e.strerror))
            except:
                print_fail("Unexpected error:", sys.exc_info()[0])
                raise
            print("")


    def action_clone(self, args):
        
        filenames = glob.glob(os.path.join(args.basepath, 'master', args.filename))
        
        print(filenames)
        
        for filename_src in filenames:
            print("Cloning {filename}".format(filename=filename_src))

            for user, datauser in self.users(args):
                directory = datauser['directory']
                print(" to {user} directory".format(user=user))
                
                filename_dst =  os.path.join(args.basepath, 'users', user)

                print(" Copy {filename_src} to {filename_dst}".format(\
                   filename_src = filename_src,
                   filename_dst = filename_dst
                ))

                
              #filename_base = os.path.join(args.basepath, args.notebook_file)
              #filename_src = filename_base + '.' + args.extension

                
                #if not os.path.isfile(filename_dst) or args.force:
                #    shutil.copyfile(filename_src, filename_dst)
                #else:
                #    print_fail("Can't copy this file (ever exists)")
        
        """
        
            filename_dst = filename_base + clone_sep + args.number_format % (i) + '.' + args.extension
            
                print(" Copy {filename_src} to {filename_dst}".format(\
                   filename_src = filename_src,
                   filename_dst = filename_dst
                ))
                if not os.path.isfile(filename_dst) or args.force:
                    shutil.copyfile(filename_src, filename_dst)
                else:
                    print("  Can't copy this file (ever exists)")
        """

        


    def users(self, args):
        filename = os.path.join(args.basepath, args.usersfilename)
        with open(filename, 'r') as f:
            self.data = json.load(f, object_pairs_hook=collections.OrderedDict)

        for user in self.data['users']:
            yield(user, self.data['users'][user])


if __name__ == "__main__":
    PARSER = argparse.ArgumentParser(description='Use the following parameters')

    PARSER.add_argument('action', action="store",
        help="Action createuser/createdir/delete")

    PARSER.add_argument('--number', action="store",
        help="Number of notebooks ('20' as default)", default=20)

    PARSER.add_argument('--number_format', action="store",
        help="Number format as default ('04d' as default)", default='%04d')

    PARSER.add_argument('--port', action="store",
        help="Initial port (first user)", default='9001') # 8888

    PARSER.add_argument('--usersfilename', action="store",
        help="JSON users config file", default='users.json')

    PARSER.add_argument('--filename', action="store",
        help="Filename to clone (from master dir to users dir) \
            or to delete (in users dir)", default='*.ipynb')

    PARSER.add_argument('--force', action="store_true",
        help="Force overwrite")

        
    ARGS = PARSER.parse_args()

    ARGS.basepath = os.path.dirname(__file__)
    
    try:
        ARGS.number = int(ARGS.number)
    except:
        MSG = 'Number must be integer'
        raise(Exception(MSG))

    try:
        ARGS.port = int(ARGS.port)
    except:
        MSG = 'Number must be integer'
        raise(Exception(MSG))
        
    ARGS.action = ARGS.action.lower()
    allowed_actions = ['createuser', 'createuserdir', 'deleteuserdir', 'clone']
    allowed_actions_str = []
    for allowed_action in allowed_actions:
        allowed_actions_str.append("\'" + allowed_action + "\'")
    if ARGS.action not in allowed_actions:
        msg = 'Action must be [' + '|'.join(allowed_actions_str) + ']'
        raise(Exception(msg))

    
    CLI = NotebookCreateUsers(ARGS)
    