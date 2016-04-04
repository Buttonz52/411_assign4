module SymbolTable (ST,empty,new_scope,insert,lookup,return)
where 

import ST
import AST

empty :: ST 
empty = []

new_scope :: ScopeType -> ST -> ST
new_scope scope_type s = (Symbol_table(scope_type,0,0,[])):s

look_up :: ST -> String -> SYM_I_DESC 
look_up s x = find 0 s where
	found level (Var_attr(offset,m_type,dim)) =  I_VARIABLE(level,offset,m_type,dim)
	found level (Fun_attr(label,arg_Type,m_type)) = I_FUNCTION(level,label,arg_Type,m_type)
	find_level ((str,v):rest) 
			| x== str = Just v
			| otherwise =  find_level rest
	find_level [] = Nothing
	find n [] = error ("Could not find ")
	find n (Symbol_table(_,_,_,vs):rest) = 
		   (case find_level vs of 
			  Just v -> found n v
			  Nothing -> find (n+1) rest)

--found :: Int -> SYM_VALUE -> SYM_I_DESC

--find_level :: [(String,SYM_VALUE)] -> Maybe SYM_VALUE


--find :: Int -> ST -> Maybe ST
 
 
 
 
 

insert:: Int -> ST -> SYM_DESC -> (Int,ST)
insert n s sd = (0,s)
--return:: ST -> M_type

--Symbol_table (ScopeType,Int,Int,[(String,SYM_VALUE)])
