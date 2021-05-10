Ñ
^C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Dtos\GetIngredientDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
GetIngredientDto !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
}

 
} ¨
[C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Dtos\GetProductDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
GetProductDto 
{ 
public 
GetProductDto 
( 
) 
{ 	
Ingredients		 
=		 
new		 
List		 "
<		" #
GetIngredientDto		# 3
>		3 4
(		4 5
)		5 6
;		6 7
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
List 
< 
GetIngredientDto $
>$ %
Ingredients& 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} ı

XC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Dtos\GetShopDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 

GetShopDto 
{ 
public 

GetShopDto 
( 
) 
{ 	
Ingredients		 
=		 
new		 
List		 "
<		" #
GetIngredientDto		# 3
>		3 4
(		4 5
)		5 6
;		6 7
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
	LocationX 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
	LocationY 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List 
< 
GetIngredientDto $
>$ %
Ingredients& 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} Å
VC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Dtos\OrderDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
OrderDto 
{ 
public 
int 
ShopId 
{ 
get 
;  
set! $
;$ %
}& '
public 
List 
< 
GetProductDto !
>! "
Products# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
}

 
} ¯	
hC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Entities\IngredientFromShopShop.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

partial 
class "
IngredientFromShopShop /
{ 
public 
int 
IngredientsId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
ShopsId 
{ 
get  
;  !
set" %
;% &
}' (
public		 
int		 
Quantity		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[ 	

JsonIgnore	 
] 
public 
virtual 
IngredientsFromShop *
Ingredients+ 6
{7 8
get9 <
;< =
set> A
;A B
}C D
[ 	

JsonIgnore	 
] 
public 
virtual 
Shop 
Shops !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ª
eC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Entities\IngredientsFromShop.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

partial 
class 
IngredientsFromShop ,
{ 
public 
IngredientsFromShop "
(" #
)# $
{		 	#
IngredientFromShopShops

 #
=

$ %
new

& )
HashSet

* 1
<

1 2"
IngredientFromShopShop

2 H
>

H I
(

I J
)

J K
;

K L
} 	
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
virtual 
ICollection "
<" #"
IngredientFromShopShop# 9
>9 :#
IngredientFromShopShops; R
{S T
getU X
;X Y
setZ ]
;] ^
}_ `
} 
} Ø
VC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Domain\Entities\Shop.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

partial 
class 
Shop 
{ 
public 
Shop 
( 
) 
{		 	#
IngredientFromShopShops

 #
=

$ %
new

& )
HashSet

* 1
<

1 2"
IngredientFromShopShop

2 H
>

H I
(

I J
)

J K
;

K L
} 	
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
	LocationX 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
	LocationY 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
virtual 
ICollection "
<" #"
IngredientFromShopShop# 9
>9 :#
IngredientFromShopShops; R
{S T
getU X
;X Y
setZ ]
;] ^
}_ `
} 
} 