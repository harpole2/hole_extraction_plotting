#!/home/tyler/Programs/anaconda3/envs/py27/bin/python
"""
Create radius files For Hole graph from hole output file 

This creates files that can be used in plot_hole_profile.R
General Usage:
./red_hole.py hole_outputfile.dat hole_outputfile2.dat startAxis endAxis
"""

import sys
import fileinput

def get_radius():

  x= len(sys.argv)
#Find the Files
  i = 1
  while i < x-2:
    try:
      f = file(sys.argv[i])
    except IOError:                     
      print "The file " + sys.argv[i] + " does not exist"
      exit()
    i += 1

#find the last two system argument for pore dimensions
  
 
# loop over all input files 
  i = 1
  while i < x-2:
# name output file
    name = sys.argv[i]
    sep = "."
    name =name.split(sep,1)[0]+"_reduced.dat"
    new = file(name, "w")
    parsing = False
    pars=False
    search = open(sys.argv[i])
# find and extract the radius and write output
    for line in search:
      line=line.strip()
      if line.startswith(sys.argv[x-2]):
        pars=True
      elif line.startswith(sys.argv[x-1]):
        pars=False
      if pars:
        new.write(line +'\n')

    i +=1
	
 
get_radius()
