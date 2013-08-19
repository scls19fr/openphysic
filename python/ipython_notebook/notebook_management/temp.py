#!/usr/bin/env python

import os
import sys
import shutil
import glob
from os.path import expanduser

import argparse

import random
import string
import json

import collections
from collections import OrderedDict

from IPython.lib import passwd

import datetime


def print_success(msg):
    """print msg when success"""
    print(' + ' + msg)

def print_fail(msg):
    """print msg when fail"""
    print(' - ' + msg)


class NotebookManageCLI():
    """"Class to mangage IPython notebooks"""
    
    data = {}
    
    def __init__(self, args):
        print("Notbook management CLI")
        
        getattr(self, 'action_' + args.action)(args)


    def action_createusers(self, args):
        """Create users JSON file"""
        user_config = {
            'users': OrderedDict() #OrderedDict() or #dict()  or #{}
        }
        
        port = args.port
        
        for i in range(1, args.number + 1):
            username = 'user_' + args.number_format % (i)
            #print(username)
            
            pwd = ''.join(random.choice(
                string.ascii_lowercase + string.digits) for x in range(6))
                
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
        with open(filename, 'w') as file_users:
            file_users.write(user_config_json)
        print_success("Done")


    def action_createusersdir(self, args):
        """Create users directory according JSON user file"""
        for user, datauser in self.users(args):
            directory = datauser['directory']
            print("Create directory {directory} for {user}"
                .format(directory=directory, user=user))
            try:
                #os.mkdir(directory)
                os.makedirs(directory)
                print_success("Directory created")
            except OSError as exc:
                print_fail("Can't create directory - OS error({0}): {1}"
                    .format(exc.errno, exc.strerror))
            except:
                print_fail("Unexpected error:", sys.exc_info()[0])
                raise
            print("")


    def action_deleteusersdir(self, args):
        """Delete users directory"""
        for user, datauser in self.users(args):
            directory = datauser['directory']
            print("Delete directory {directory}".format(directory=directory))
            try:
                #os.rmdir(directory)
                if not args.force:
                    #os.rmdir(directory)
                    #os.removedirs(directory)
                    shutil.rmtree(directory)
                else:
                    shutil.rmtree(directory)
                print_success("Directory removed")
            except OSError as exc:
                print_fail("Can't delete directory - OS error({0}): {1}"
                    .format(exc.errno, exc.strerror))
            except:
                print_fail("Unexpected error:", sys.exc_info()[0])
                raise
            print("")


    def action_clone(self, args):
        """Clone master directory to users directory"""
        src = os.path.join(args.basepath, 'master')
        for user, datauser in self.users(args):
            dst = datauser['directory']
            print("Cloning \'{src}\' to \'{dst}\'".format(src=src, dst=dst))
            try:
                shutil.copytree(src, dst, symlinks=False, ignore=None)
                print_success("Master cloned")
            except OSError as exc:
                print_fail("Can't clone directory - OS error({0}): {1}"
                    .format(exc.errno, exc.strerror))
            except:
                print_fail("Unexpected error:", sys.exc_info()[0])
                raise
        
        #print(filenames)        
        
    def action_copy(self, args):
        """Copy file(s) or directory(ies)
        from master directory to users directory"""
        filenames = glob.glob(args.filename)

        for filename_src in filenames:
            print("Copying {filename}".format(filename=filename_src))

            for user, datauser in self.users(args):
                directory = datauser['directory']
                #print(" to {user} directory".format(user=user))
                
                filename_dst =  os.path.join(args.basepath, 'users', user)

                print("  Copy {filename_src} to {filename_dst}".format(\
                   filename_src = filename_src,
                   filename_dst = filename_dst
                ))
                
                try:
                    if os.path.isfile(filename_src):
                        shutil.copy2(filename_src, filename_dst)
                    elif os.path.isdir(filename_src):
                        directory_dst = os.path.join(
                            filename_dst, os.path.basename(filename_src))
                        shutil.copytree(filename_src, directory_dst,
                            symlinks=False, ignore=None)
                    else:
                        print_fail("Can't copy")
                    print_success("Done")
                except OSError as exc:
                    print_fail("Can't clone directory - OS error({0}): {1}"
                        .format(exc.errno, exc.strerror))
                except:
                    print_fail("Unexpected error:", sys.exc_info()[0])
                    raise
            print("")

    def action_configure(self, args):
        """Configure profile file for a given user using template"""
        user = args.user
        assert(user != None)
        self.load_users(args)
        print("Configure profile file for {user}".format(user=user))
        if user not in self.data['users']:
            raise(Exception("User '{user}' doesn't exists".format(user=user)))
        datauser = self.data['users'][user]
        filename = os.path.join(args.basepath, 'profile_template', 'ipython_notebook_config.template.py')
        with open(filename, 'r') as file_tpl:
            config_template = file_tpl.read()
        d_replace = {
            'c__NotebookApp__port': datauser['port'],
            'c__NotebookApp__password': "'" + datauser['hash_pwd'] + "'",
            'c__NotebookManager__notebook_dir': "u'" + datauser['directory'] + "'",
            
            ### FIX BUG
            'c__NotebookApp__webapp_settings': '{}', # To fix problem with {}
            'c__InlineBackend__rc': "{'font.size': 10, 'figure.figsize': (6.0, 4.0), 'figure.facecolor': 'white', 'savefig.dpi': 72, 'figure.subplot.bottom': 0.125, 'figure.edgecolor': 'white'}" # To fix problem with {}
        }
        config = config_template.format(**d_replace)
        #print(config)
        
        home = expanduser("~")
        filename = os.path.join(home, '.ipython', 'profile_nbserver', 'ipython_notebook_config.py')
        print(filename)
        with open(filename, 'w') as file_tpl:
            file_tpl.write(config)
        print("Profile file written to {filename}".format(filename=filename))


    def action_printusers(self, args):
        line = "-"*50
        space = " "*10
        print(line)
        for user, datauser in self.users(args):
            print("")
            print(user + space + datauser['pwd'] + space + str(datauser['port']))
            print("")
            print(line)
        

    def load_users(self, args):
        #print("Loading users file")
        filename = os.path.join(args.basepath, args.usersfilename)
        with open(filename, 'r') as file_users:
            self.data = json.load(file_users, object_pairs_hook=collections.OrderedDict)


    def users(self, args):
        """Users generator (yield username and data from JSON file)"""
        self.load_users(args)
            
        if args.user == None:
            for user in self.data['users']:
                yield(user, self.data['users'][user])
        else:
            users = args.user.split(',')
            for user in users:
                if user in self.data['users']:
                    yield(user, self.data['users'][user])
                else:
                    raise(Exception("User '{user}' doesn't exists".format(user=user)))


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
            or to delete (in users dir)", default='master/*.ipynb')

    PARSER.add_argument('--user', action="store",
        help="User", default=None)

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
    ALLOWED_ACTIONS = ['createusers', 'createusersdir',
        'deleteusersdir', 'clone', 'copy', 'configure', 'printusers']
    ALLOWED_ACTIONS_STR = []
    for ALLOWED_ACTIONS in ALLOWED_ACTIONS:
        ALLOWED_ACTIONS_STR.append("\'" + ALLOWED_ACTIONS + "\'")
    if ARGS.action not in ALLOWED_ACTIONS:
        MSG = 'Action must be [' + '|'.join(ALLOWED_ACTIONS_STR) + ']'
        raise(Exception(MSG))

    
    CLI = NotebookManageCLI(ARGS)
    