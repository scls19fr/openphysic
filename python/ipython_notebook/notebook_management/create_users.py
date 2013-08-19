#!/usr/bin/env python

import os
import argparse

import random
import string
import json

from collections import OrderedDict

from IPython.lib import passwd

import datetime

class NotebookCreateUsers():
    def __init__(self, args):
        print("NB user CLI")
        
        #eval('self.'+args.action+'('+')')
        
        #locals()["action_createuser"](args)
        self.action_createuser(args)
        #self.__getattribute__('action_createuser')(args)
        
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
        
        filename = args.filename
        print("Write user config file '{filename}'".format(filename=filename))
        with open(filename, 'w') as f:
            f.write(user_config_json)
        print(" + Done")


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

    PARSER.add_argument('--filename', action="store",
        help="JSON users config file", default='users.json')

    #PARSER.add_argument('--force', action="store_true",
    #    help="Force overwrite")
        
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
    allowed_actions = ['createuser', 'createdir']
    allowed_actions_str = []
    for allowed_action in allowed_actions:
        allowed_actions_str.append("\'" + allowed_action + "\'")
    if ARGS.action not in allowed_actions:
        msg = 'Action must be [' + '|'.join(allowed_actions_str) + ']'
        raise(Exception(msg))

    
    CLI = NotebookCreateUsers(ARGS)
    