import math
def longueur(nbCote) :
	if nbCote == 2 :
		return 1
	
	return (math.sqrt(2)/2)*(longueur(nbCote/2)/math.sqrt(1+math.sqrt(1-longueur(nbCote/2)**2)))
