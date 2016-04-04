happy -gca ParAssignment.y
	alex -g LexAssignment.x
	ghc --make TestAssignment.hs -o TestAssignment
	ghc --make Mainfile.hs -o Mainfile
    
