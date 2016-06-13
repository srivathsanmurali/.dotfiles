#!/usr/bin/python
from mpd import MPDClient
def getName():
    ## find current song
    song = client.currentsong()['title']
    album = client.currentsong()['album']

    if album != '':
        name = "'" + song + "' from " + album
    else:
        name = "'" + song + "'"
    return name

client = MPDClient()
client.connect('localhost',6600)

FA_PLAY = "<span font='FontAwesome'>\uf077</span>"
#FA_PLAY = "<span font='FontAwesome'>\uf077</span>"

if client.status()['state'] == 'play':
    print 'You are listening to', getName()
    #print "Playing '" , song, "' from", album
elif client.status()['state'] == 'pause':
    print 'Taking a break from listening to', getName()
    #print song, '[', album, ']'
else:
    print "Bummer! No music playing"


client.close()
client.disconnect()

