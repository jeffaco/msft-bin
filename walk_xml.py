#! python

from xml.dom import minidom
import sys
import os.path

xmldoc = minidom.parse(sys.argv[1])
base = os.path.basename(sys.argv[1])
for rule in xmldoc.getElementsByTagName('Rule'):
	print base + ", " + rule.getAttribute('ID')
