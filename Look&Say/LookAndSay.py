#!/usr/bin/env python3

import sys

def Classic(start = '3', lastline = 13, output = sys.stdout, displayall = True):
    res = start
    for i in range(1,13):
        if displayall:
            aff = res + '\n'
            output.buffer.write(aff.encode())
        rep = ''
        prev = ''
        count = 1
        for d in range(0,len(res)):
            cur = res[d]
            if cur == prev:
                count = count +1
            else:
                if prev != '':
                    rep = rep + str(count) + prev
                count = 1
            prev = cur
        rep = rep + str(count) + cur
        res = rep
    res = res + '\n'
    output.buffer.write(res.encode())

def Spaced(start = '5', lastline = 10, output = sys.stdout, displayall = True):
    res = start
    for i in range(1,13):
        if displayall:
            aff = res + '\n'
            output.buffer.write(aff.encode())
        rep = ''
        prev = ''
        count = 1
        for cur in res.split(' '):
            if cur == prev:
                count = count +1
            else:
                if prev != '':
                    rep = rep + str(count) + ' ' + prev + ' '
                count = 1
            prev = cur
        rep = rep + str(count) + ' ' + cur
        res = rep
    res = res + '\n'
    output.buffer.write(res.encode())

if __name__ == "__main__":
    Classic()
    Spaced()
