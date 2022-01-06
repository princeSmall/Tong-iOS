#!/bin/bash
import os
import socket
import json


def getLocalIP():
    adds = socket.getaddrinfo(socket.gethostname(), None)
    for item in adds:
        print item
    print ('...')


def get_host_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()
    return ip


def mkdirIP(path):
    IP_File = os.path.exists(path)
    if not IP_File:
        os.makedirs(path)
    else:
        print "exist"
    print (path)
    ip_json = path + '/ip.json'
    f = open(ip_json, 'wr')

    current_ip = {
        'ip': get_host_ip()
    }
    print current_ip
    f.write(json.dumps(current_ip, sort_keys=True, indent=2))
    f.close()


if __name__ == '__main__':
    current_file = os.getcwd()
    mkdirIP(current_file+'/LocalIP')
    # getLocalIP()

    get_host_ip()

