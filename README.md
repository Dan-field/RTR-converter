# RTR-converter
The intent of this software is that it will be:
- an m-file that runs on GNU Octave (and should also run on Matlab)
- that converts a Rohde & Schwarz .RTR file into a format that's more open and widely useable (probably CSV)

UPDATE 27 December 2016: Well, this is turning into a 16-bit to 14-bit converter at the moment. I still haven't worked out the structure of the RTR file but I have come across some separate documentation suggesting that Rohde & Schwarz likes to use a 14-bit number format. I have been unable to find any native Octave functions to handle this and so I am writing my own routine to "cheat" by reading the next 14 bits into a 16-bit integer, and padding it out with zeros.

Still no idea if this will help to read RTR files but hey, you gotta start somewhere.
