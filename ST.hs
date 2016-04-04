module ST where

import AST

--what we allow to insert
data SYM_DESC = ARGUMENT (String,M_type,Int) --(name,type,dim)
              | VARIABLE (String,M_type,Int) --(name,type,dim)
              | FUNCTION (String,[(M_type,Int)],M_type) --(name,[(arg_type,dim)],return_type)
              | DATATYPE (String) -- (name of data type) M++
              | CONSTRUCTOR (String, [M_type], String) --(name,[arg_types],name_of_type) M++
			  deriving (Eq, Ord, Show, Read)

--when we do a look-up this is what we expect back
data SYM_I_DESC = I_VARIABLE (Int,Int,M_type,Int) --(level,offset,type,dim)
                    | I_FUNCTION (Int,String,[(M_type,Int)],M_type) --(level,label,[(type,dim)],return_type)
                    | I_CONSTRUCTOR (Int,[M_type],String) -- M++ (constructor_number,[arg_type],return_type)
                    | I_TYPE [String] -- M++ (constructor_name)
					deriving (Eq, Ord, Show, Read)

data ScopeType =  L_PROG 
				| L_FUN M_type 
				| L_BLK 
				| L_CASE
				deriving (Eq, Ord, Show, Read)


data SYM_VALUE = Var_attr (Int,M_type,Int) 
                  | Fun_attr (String,[(M_type,Int)],M_type)
                  | Con_attr (Int, [M_type], String)
                  | Typ_attr [String]
                  deriving (Eq, Ord, Show, Read)
                  
				--(ScopeType, # of local vars, # of args,[(name_of_symval,symval)]) 
data SYM_TABLE = Symbol_table (ScopeType,Int,Int,[(String,SYM_VALUE)])
				deriving (Eq, Ord, Show, Read)
				
type ST = [SYM_TABLE]
