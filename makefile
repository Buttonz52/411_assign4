run:
	cabal exec -- happy -gca ParAssignment.y
	alex -g LexAssignment.x
	ghc --make TestAssignment.hs -o TestAssignment
	ghc --make Mainfile.hs -o Mainfile
	@echo " "
	@echo " 				START"
	@echo " "
	./Mainfile test1.m+
	@echo " "
	@echo " 				END"
	@echo " "
	@echo " "	
	@echo " 				START"
	./Mainfile test2.m+
	@echo " "
	@echo " 				END"
	@echo " "
	@echo " "
	@echo " 				START"
	./Mainfile test3.m+
	@echo " "
	@echo " 				END"
	@echo " "
	@echo " "
	@echo " 				START"
	./Mainfile test4.m+
	@echo " "
	@echo " 				END"
	@echo " "
	@echo " "
	@echo " 				START"
	./Mainfile test5.m+
	@echo " "
	@echo " 				END"
	@echo " "
	@echo " "
	@echo " 				START"
	./Mainfile test6.m+
	@echo " "
	@echo " 				END"

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocAssignment.* LexAssignment.* ParAssignment.* LayoutAssignment.* SkelAssignment.* PrintAssignment.* TestAssignment.* AbsAssignment.* TestAssignment ErrM.* SharedString.* ComposOp.* Assignment3.dtd XMLAssignment.* Makefile*
	

