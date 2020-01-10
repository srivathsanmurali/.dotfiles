#!/usr/bin/python
from mpd import MPDClient
def getName():
    ## find current song
    song = client.currentsong()['title']
    album = client.currentsong()['album']

    if album != '':
        name = song + ' - ' + album
    else:
        name = "'" + song + "'"
    #name = song
    return name

client = MPDClient()
client.connect('localhost',6600)

if client.status()['state'] == 'play':
    print getName()
    #print "Playing '" , song, "' from", album
elif client.status()['state'] == 'pause' or client.status()['state'] == 'stop':
    print '[', getName(), ']'
    #print song, '[', album, ']'

client.close()
client.disconnect()

