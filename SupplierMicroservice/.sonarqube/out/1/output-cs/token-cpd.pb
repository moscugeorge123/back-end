∆
_C:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\ApplicationDI.cs
	namespace 	
Application
 
{ 
public 

static 
class 
ApplicationDI %
{ 
public		 
static		 
void		 
AddApplication		 )
(		) *
this		* .
IServiceCollection		/ A
services		B J
)		J K
{

 	
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
} 	
} 
} Ì
ñC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\Features\JoinShopIngredientFeature\Commands\CreateJoinShopIngredient.cs
	namespace 	
Application
 
. 
Features 
. %
JoinShopIngredientFeature 8
.8 9
Commands9 A
{ 
public 

class $
CreateJoinShopIngredient )
:) *
IRequest* 2
<2 3
bool3 7
>7 8
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
public 
int 
IngrdientId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
Quantity		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
} 
} ê
ùC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\Features\JoinShopIngredientFeature\Commands\CreateJoinShopIngredientHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 %
JoinShopIngredientFeature		 8
.		8 9
Commands		9 A
{

 
public 

class +
CreateJoinShopIngredientHandler 0
:0 1
IRequestHandler1 @
<@ A$
CreateJoinShopIngredientA Y
,Y Z
boolZ ^
>^ _
{ 
private 
readonly 
IApplicationContext ,
context- 4
;4 5
public +
CreateJoinShopIngredientHandler .
(. /
IApplicationContext/ B
contextC J
)J K
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '$
CreateJoinShopIngredient' ?
request@ G
,G H
CancellationTokenH Y
cancellationTokenZ k
)k l
{ 	
try 
{ 
cancellationToken !
.! "(
ThrowIfCancellationRequested" >
(> ?
)? @
;@ A
await 
Task 
. 
Delay  
(  !
$num! %
,% &
cancellationToken' 8
)8 9
;9 :
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{ 
throw   
new   !
TaskCanceledException   /
(  / 0
$str  0 R
)  R S
;  S T
}!! 
bool"" 
alreadyExists"" 
=""  
context""! (
.""( )
JoinIngredientShop"") ;
.""; <
Any""< ?
(""? @
s""@ A
=>""B D
s""E F
.""F G
IngredientsId""G T
==""U W
request""X _
.""_ `
IngrdientId""` k
&&""l n
s""o p
.""p q
ShopsId""q x
==""y {
request	""| É
.
""É Ñ
ShopId
""Ñ ä
)
""ä ã
;
""ã å
if## 
(## 
alreadyExists## 
)## 
return$$ 
false$$ 
;$$ 
var%% 
relation%% 
=%% 
new%% "
IngredientFromShopShop%% 5
{&& 
IngredientsId'' 
='' 
request''  '
.''' (
IngrdientId''( 3
,''3 4
ShopsId(( 
=(( 
request(( !
.((! "
ShopId((" (
,((( )
Quantity)) 
=)) 
request)) "
.))" #
Quantity))# +
}++ 
;++ 
await,, 
context,, 
.,, 
JoinIngredientShop,, ,
.,,, -
AddAsync,,- 5
(,,5 6
relation,,6 >
,,,> ?
cancellationToken,,? P
),,P Q
;,,Q R
await-- 
context-- 
.-- 
SaveChangesAsync-- *
(--* +
)--+ ,
;--, -
return.. 
true.. 
;.. 
}11 	
}22 
}33 Ó
òC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\Features\JoinShopIngredientFeature\Queries\GetIngredientsFromShopQuery.cs
	namespace 	
Application
 
. 
Features 
. %
JoinShopIngredientFeature 8
.8 9
Queries9 @
{ 
public 

class '
GetIngredientsFromShopQuery ,
:- .
IRequest/ 7
<7 8
IEnumerable8 C
<C D"
IngredientsFromShopDtoD Z
>Z [
>[ \
{ 
}		 
}

 ª
üC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\Features\JoinShopIngredientFeature\Queries\GetIngredientsFromShopQueryHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 %
JoinShopIngredientFeature		 8
.		8 9
Queries		9 @
{

 
public 

class .
"GetIngredientsFromShopQueryHandler 3
:4 5
IRequestHandler6 E
<E F'
GetIngredientsFromShopQueryF a
,a b
IEnumerablec n
<n o#
IngredientsFromShopDto	o Ö
>
Ö Ü
>
Ü á
{ 
private 
readonly 
IApplicationContext ,
context- 4
;4 5
public .
"GetIngredientsFromShopQueryHandler 1
(1 2
IApplicationContext2 E
contextF M
)M N
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &"
IngredientsFromShopDto& <
>< =
>= >
Handle? E
(E F'
GetIngredientsFromShopQueryF a
requestb i
,i j
CancellationTokenk |
cancellationToken	} é
)
é è
{ 	
var 
	relations 
= 
await !
context" )
.) *
JoinIngredientShop* <
.< =
ToListAsync= H
(H I
cancellationTokenI Z
)Z [
;[ \
var 
result 
= 
new 
List !
<! ""
IngredientsFromShopDto" 8
>8 9
(9 :
): ;
;; <
foreach 
( 
var 
relation !
in" $
	relations% .
). /
{ 
if 
( 
relation 
. 
Quantity $
==% '
$num( )
)) *
{ 
result 
. 
Add 
( 
new ""
IngredientsFromShopDto# 9
(9 :
): ;
{ 
IngrdientId #
=$ %
relation& .
.. /
IngredientsId/ <
,< =
ShopId 
=  
relation! )
.) *
ShopsId* 1
,1 2
Quantity    
=  ! "
relation  # +
.  + ,
Quantity  , 4
}!! 
)!! 
;!! 
}"" 
}## 
return%% 
result%% 
;%% 
}&& 	
}'' 
}(( ™
pC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Application\Interfaces\IApplicationContext.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IApplicationContext (
{ 
DbSet		 
<		 "
IngredientFromShopShop		 $
>		$ %
JoinIngredientShop		& 8
{		9 :
get		; >
;		> ?
set		@ C
;		C D
}		E F
Task

 
<

 
int

 
>

 
SaveChangesAsync

 "
(

" #
)

# $
;

$ %
} 
} 