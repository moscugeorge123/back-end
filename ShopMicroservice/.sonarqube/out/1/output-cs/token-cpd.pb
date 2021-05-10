¬
[C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\ApplicationDI.cs
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
} Œ
âC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\CreateIngredientCommand.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{ 
public 

class #
CreateIngredientCommand (
:) *
IRequest+ 3
<3 4
int4 7
>7 8
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} ´
êC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\CreateIngredientCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{		 
public

 

class

 *
CreateIngredientCommandHandler

 /
:

0 1
IRequestHandler

2 A
<

A B#
CreateIngredientCommand

B Y
,

Y Z
int

[ ^
>

^ _
{ 
private 
readonly !
IIngredientRepository .

repository/ 9
;9 :
public *
CreateIngredientCommandHandler -
(- .!
IIngredientRepository. C

repositoryD N
)N O
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &#
CreateIngredientCommand& =
request> E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
try 
{ 
cancellationToken %
.% &(
ThrowIfCancellationRequested& B
(B C
)C D
;D E
await 
Task 
. 
Delay $
($ %
$num% )
,) *
cancellationToken+ <
)< =
;= >
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 R
)R S
;S T
}   
var## 

ingredient## 
=## 
new##  
IngredientsFromShop##! 4
{$$ 
Id%% 
=%% 
request%% 
.%% 
Id%% 
,%%  
Name&& 
=&& 
request&& 
.&& 
Name&& #
,&&# $
Price'' 
='' 
request'' 
.''  
Price''  %
}(( 
;(( 
await)) 

repository)) 
.)) 
AddAsync)) %
())% &

ingredient))& 0
)))0 1
;))1 2
return-- 

ingredient-- 
.-- 
Id--  
;--  !
}00 	
}33 
}44 Œ
âC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\DeleteIngredientCommand.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{ 
public 

class #
DeleteIngredientCommand (
:) *
IRequest+ 3
<3 4
int4 7
>7 8
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} Ø
êC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\DeleteIngredientCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{ 
public		 

class		 *
DeleteIngredientCommandHandler		 /
:		0 1
IRequestHandler		2 A
<		A B#
DeleteIngredientCommand		B Y
,		Y Z
int		[ ^
>		^ _
{

 
private 
readonly !
IIngredientRepository .

repository/ 9
;9 :
public *
DeleteIngredientCommandHandler -
(- .!
IIngredientRepository. C

repositoryD N
)N O
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &#
DeleteIngredientCommand& =
request> E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
try 
{ 
cancellationToken %
.% &(
ThrowIfCancellationRequested& B
(B C
)C D
;D E
await 
Task 
. 
Delay $
($ %
$num% )
,) *
cancellationToken+ <
)< =
;= >
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 R
)R S
;S T
}   
var!! 

ingredient!! 
=!! 

repository!! '
.!!' (
GetById!!( /
(!!/ 0
request!!0 7
.!!7 8
Id!!8 :
)!!: ;
.!!; <
Result!!< B
;!!B C
if"" 
("" 

ingredient"" 
=="" 
null"" "
)""" #
{## 
throw$$ 
new$$ !
ArgumentNullException$$ /
($$/ 0
nameof$$0 6
($$6 7
request$$7 >
)$$> ?
)$$? @
;$$@ A
}%% 
await'' 

repository'' 
.'' 
DeleteAsync'' (
(''( )

ingredient'') 3
)''3 4
;''4 5
return)) 

ingredient)) 
.)) 
Id))  
;))  !
}** 	
}++ 
},, Œ
âC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\UpdateIngredientCommand.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{ 
public 

class #
UpdateIngredientCommand (
:) *
IRequest+ 3
<3 4
int4 7
>7 8
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} ≈
êC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Commands\UpdateIngredientCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Commands1 9
{ 
public		 

class		 *
UpdateIngredientCommandHandler		 /
:		0 1
IRequestHandler		2 A
<		A B#
UpdateIngredientCommand		B Y
,		Y Z
int		[ ^
>		^ _
{

 
private 
readonly !
IIngredientRepository .

repository/ 9
;9 :
public *
UpdateIngredientCommandHandler -
(- .!
IIngredientRepository. C

repositoryD N
)N O
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &#
UpdateIngredientCommand& =
request> E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
try 
{ 
cancellationToken %
.% &(
ThrowIfCancellationRequested& B
(B C
)C D
;D E
await 
Task 
. 
Delay $
($ %
$num% )
,) *
cancellationToken+ <
)< =
;= >
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 R
)R S
;S T
}   
var!! 

ingredient!! 
=!! 

repository!! '
.!!' (
GetById!!( /
(!!/ 0
request!!0 7
.!!7 8
Id!!8 :
)!!: ;
.!!; <
Result!!< B
;!!B C
if## 
(## 

ingredient## 
==## 
null## "
)##" #
{$$ 
throw%% 
new%% !
ArgumentNullException%% /
(%%/ 0
nameof%%0 6
(%%6 7
request%%7 >
)%%> ?
)%%? @
;%%@ A
}&& 

ingredient(( 
.(( 
Id(( 
=(( 
request(( #
.((# $
Id(($ &
;((& '

ingredient)) 
.)) 
Name)) 
=)) 
request)) %
.))% &
Name))& *
;))* +
await** 

repository** 
.** 
UpdateAsync** (
(**( )

ingredient**) 3
)**3 4
;**4 5
return++ 

ingredient++ 
.++ 
Id++  
;++  !
},, 	
}-- 
}.. ¶
áC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Queries\GetIngredientByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Queries1 8
{ 
public 

class "
GetIngredientByIdQuery '
:' (
IRequest( 0
<0 1
GetIngredientDto1 A
>A B
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
}		 
}

 À
éC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\IngredientFeature\Queries\GetIngredientByIdQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
IngredientFeature 0
.0 1
Queries1 8
{ 
public		 

class		 )
GetIngredientByIdQueryHandler		 .
:		. /
IRequestHandler		/ >
<		> ?"
GetIngredientByIdQuery		? U
,		U V
GetIngredientDto		V f
>		f g
{

 
private 
readonly !
IIngredientRepository .

repository/ 9
;9 :
public )
GetIngredientByIdQueryHandler ,
(, -!
IIngredientRepository- B

repositoryC M
)M N
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
GetIngredientDto *
>* +
Handle, 2
(2 3"
GetIngredientByIdQuery3 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 

ingredient 
= 
await "

repository# -
.- .
GetById. 5
(5 6
request6 =
.= >
Id> @
)@ A
;A B
var 
getIngredientDto  
=! "
new# &
GetIngredientDto' 7
(7 8
)8 9
{ 
Id 
= 

ingredient 
.  
Id  "
," #
Name 
= 

ingredient !
.! "
Name" &
,& '
Price 
= 

ingredient "
." #
Price# (
} 
; 
return 
getIngredientDto #
;# $
} 	
} 
} È
íC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\JoinShopIngredientFeature\Commands\CreateJoinShopIngredient.cs
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
} å
ôC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\JoinShopIngredientFeature\Commands\CreateJoinShopIngredientHandler.cs
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
}33 ﬂ
C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\OrderFeature\Commands\CreateOrderCommand.cs
	namespace 	
Application
 
. 
Features 
. 
OrderFeature +
.+ ,
Commands, 4
{ 
public 

class 
CreateOrderCommand #
:$ %
IRequest& .
<. /
int/ 2
>2 3
{ 
public		 
int		 
ShopId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
List

 
<

 
GetProductDto

 !
>

! "
Products

# +
{

, -
get

. 1
;

1 2
set

3 6
;

6 7
}

8 9
} 
} ‚
ÜC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\OrderFeature\Commands\CreateOrderCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
OrderFeature +
.+ ,
Commands, 4
{		 
public

 

class

 %
CreateOrderCommandHandler

 *
:

+ ,
IRequestHandler

- <
<

< =
CreateOrderCommand

= O
,

O P
int

P S
>

S T
{ 
private 
readonly 
IApplicationContext ,
_context- 5
;5 6
public %
CreateOrderCommandHandler (
(( )
IApplicationContext) <
context= D
)D E
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
int 
> 
Handle $
($ %
CreateOrderCommand% 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
foreach 
( 
GetProductDto !
product" )
in* ,
request- 4
.4 5
Products5 =
)= >
{ 
List 
< 
GetIngredientDto %
>% &
ingredients' 2
=3 4
product5 <
.< =
Ingredients= H
;H I
await (
SubstractIngredientsFromShop 2
(2 3
ingredients3 >
,> ?
request? F
.F G
ShopIdG M
)M N
;N O
} 
return 
request 
. 
ShopId !
;! "
} 	
public 
async 
Task 
< 
bool 
> (
SubstractIngredientsFromShop ;
(; <
List< @
<@ A
GetIngredientDtoA Q
>Q R
ingredientsR ]
,] ^
int^ a
shopIdb h
)h i
{ 	
foreach 
( 
GetIngredientDto $

ingredient% /
in0 2
ingredients3 >
)> ?
{ 
var 
relation 
= 
_context '
.' (
JoinIngredientShop( :
.: ;
Find; ?
(? @

ingredient@ J
.J K
IdK M
,M N
shopIdN T
)T U
;U V
relation 
. 
Quantity !
=! "
relation" *
.* +
Quantity+ 3
-3 4
$num4 5
;5 6
_context   
.   
JoinIngredientShop   +
.  + ,
Update  , 2
(  2 3
relation  3 ;
)  ; <
;  < =
await!! 
_context!! 
.!! 
SaveChangesAsync!! /
(!!/ 0
)!!0 1
;!!1 2
}"" 
return## 
true## 
;## 
}$$ 	
}%% 
}&& √
}C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Commands\CreateShopCommand.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Commands+ 3
{ 
public 

class 
CreateShopCommand "
:" #
IRequest# +
<+ ,
int, /
>/ 0
{ 
public 
double 
	LocationX 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
	LocationY 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} Í
ÑC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Commands\CreateShopCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Commands+ 3
{		 
public

 

class

 $
CreateShopCommandHandler

 )
:

* +
IRequestHandler

, ;
<

; <
CreateShopCommand

< M
,

M N
int

O R
>

R S
{ 
private 
readonly 
IShopRepository (

repository) 3
;3 4
public $
CreateShopCommandHandler '
(' (
IShopRepository( 7

repository8 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &
CreateShopCommand& 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
try 
{ 
cancellationToken !
.! "(
ThrowIfCancellationRequested" >
(> ?
)? @
;@ A
await 
Task 
. 
Delay  
(  !
$num! %
,% &
cancellationToken' 8
)8 9
;9 :
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{   
throw!! 
new!! !
TaskCanceledException!! /
(!!/ 0
$str!!0 R
)!!R S
;!!S T
}"" 
var## 
shop## 
=## 
new## 
Shop## 
{$$ 
Name&& 
=&& 
request&& 
.&& 
Name&& #
,&&# $
	LocationX'' 
='' 
request'' #
.''# $
	LocationX''$ -
,''- .
	LocationY(( 
=(( 
request(( #
.((# $
	LocationY(($ -
})) 
;)) 
await** 

repository** 
.** 
AddAsync** %
(**% &
shop**& *
)*** +
;**+ ,
return++ 
shop++ 
.++ 
Id++ 
;++ 
},, 	
}-- 
}.. ÷
}C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Commands\UpdateShopCommand.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Commands+ 3
{ 
public 

class 
UpdateShopCommand "
:" #
IRequest# +
<+ ,
int, /
>/ 0
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
	LocationX 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
double		 
	LocationY		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
} 
} ‚
ÑC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Commands\UpdateShopCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Commands+ 3
{ 
public 

class $
UpdateShopCommandHandler )
{		 
private

 
readonly

 
IShopRepository

 (

repository

) 3
;

3 4
public $
UpdateShopCommandHandler '
(' (
IShopRepository( 7

repository8 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &
UpdateShopCommand& 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
try 
{ 
cancellationToken !
.! "(
ThrowIfCancellationRequested" >
(> ?
)? @
;@ A
await 
Task 
. 
Delay  
(  !
$num! %
,% &
cancellationToken' 8
)8 9
;9 :
} 
catch 
( 
	Exception 
ex 
)  
when! %
(& '
ex' )
is* ,!
TaskCanceledException- B
)B C
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 R
)R S
;S T
} 
var 
shop 
= 

repository !
.! "
GetById" )
() *
request* 1
.1 2
Id2 4
)4 5
.5 6
Result6 <
;< =
if!! 
(!! 
shop!! 
==!! 
null!! 
)!! 
{"" 
throw## 
new## !
ArgumentNullException## /
(##/ 0
nameof##0 6
(##6 7
request##7 >
)##> ?
)##? @
;##@ A
}$$ 
shop&& 
.&& 
Id&& 
=&& 
request&& 
.&& 
Id&&  
;&&  !
shop'' 
.'' 
Name'' 
='' 
request'' 
.''  
Name''  $
;''$ %
await(( 

repository(( 
.(( 
UpdateAsync(( (
(((( )
shop(() -
)((- .
;((. /
return)) 
shop)) 
.)) 
Id)) 
;)) 
}** 	
}++ 
},, á
{C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Queries\GetShopByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Queries+ 2
{ 
public 

class 
GetShopByIdQuery !
:! "
IRequest" *
<* +

GetShopDto+ 5
>5 6
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
}		 
}

 ¥+
ÇC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Queries\GetShopByIdQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Queries+ 2
{ 
public 

class #
GetShopByIdQueryHandler (
:( )
IRequestHandler) 8
<8 9
GetShopByIdQuery9 I
,I J

GetShopDtoJ T
>T U
{ 
private 
readonly 
IApplicationContext ,
context- 4
;4 5
private 
readonly 
IShopRepository (

repository) 3
;3 4
public #
GetShopByIdQueryHandler &
(& '
IApplicationContext' :
context; B
,B C
IShopRepositoryC R

repositoryS ]
)] ^
{ 	
this 
. 
context 
= 
context "
;" #
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 

GetShopDto $
>$ %
Handle& ,
(, -
GetShopByIdQuery- =
request> E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
var 
shop 
= 
await 

repository '
.' (
GetById( /
(/ 0
request0 7
.7 8
Id8 :
): ;
;; <
if 
( 
shop 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
List"" 
<"" 
int"" 
>"" 
ingredientsId"" #
=""$ %
await""& +
context"", 3
.""3 4
JoinIngredientShop""4 F
.## 
Where## 
(## 
p## 
=>## 
p## 
.## 
ShopsId## %
==##& (
request##) 0
.##0 1
Id##1 3
)##3 4
.$$ 
Select$$ 
($$ 
p$$ 
=>$$ 
p$$ 
.$$ 
IngredientsId$$ ,
)$$, -
.%% 
ToListAsync%% 
(%% 
cancellationToken%% .
)%%. /
;%%/ 0

GetShopDto&& 
shopDto&& 
=&&  
new&&! $

GetShopDto&&% /
(&&/ 0
)&&0 1
{'' 
Id(( 
=(( 
shop(( 
.(( 
Id(( 
,(( 
Name)) 
=)) 
shop)) 
.)) 
Name))  
,))  !
	LocationX** 
=** 
shop**  
.**  !
	LocationX**! *
,*** +
	LocationY++ 
=++ 
shop++  
.++  !
	LocationY++! *
,++* +
}-- 
;-- 
foreach.. 
(.. 
int.. 
i.. 
in.. 
ingredientsId.. +
)..+ ,
{// 
IngredientsFromShop00 #

ingredient00$ .
=00/ 0
await001 6
context007 >
.11 
Ingredients11  
.22 
	FindAsync22 
(22 
i22  
,22  !
cancellationToken22! 2
)222 3
;223 4
GetIngredientDto33  
getIngredientDto33! 1
=332 3
new334 7
GetIngredientDto338 H
(33H I
)33I J
;33J K
getIngredientDto44  
.44  !
Id44! #
=44$ %

ingredient44& 0
.440 1
Id441 3
;443 4
getIngredientDto55  
.55  !
Name55! %
=55& '

ingredient55( 2
.552 3
Name553 7
;557 8
getIngredientDto66  
.66  !
Price66! &
=66' (

ingredient66) 3
.663 4
Price664 9
;669 :
int88 
quantity88 
=88 
context88 &
.88& '
JoinIngredientShop88' 9
.99 
Where99 
(99 
p99 
=>99 
(99  !
p99! "
.99" #
IngredientsId99# 0
==991 3

ingredient994 >
.99> ?
Id99? A
)99A B
&&99C E
(99F G
p99G H
.99H I
ShopsId99I P
==99Q S
shopDto99T [
.99[ \
Id99\ ^
)99^ _
)99_ `
.:: 
Select:: 
(:: 
p:: 
=>::  
p::! "
.::" #
Quantity::# +
)::+ ,
.;; 
FirstOrDefault;; #
(;;# $
);;$ %
;;;% &
getIngredientDto<<  
.<<  !
Quantity<<! )
=<<* +
quantity<<, 4
;<<4 5
shopDto== 
.== 
Ingredients== #
.==# $
Add==$ '
(==' (
getIngredientDto==( 8
)==8 9
;==9 :
}>> 
return?? 
shopDto?? 
;?? 
}@@ 	
}CC 
}DD •
xC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Queries\GetShopsQuery.cs
	namespace 	
Application
 
. 
Features 
. 
ShopFeature *
.* +
Queries+ 2
{ 
public 

class 
GetShopsQuery 
: 
IRequest '
<' (
IEnumerable( 3
<3 4

GetShopDto4 >
>> ?
>? @
{ 
}		 
}

 ‹,
C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Features\ShopFeature\Queries\GetShopsQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
ShopFeature

 *
.

* +
Queries

+ 2
{ 
public 

class  
GetShopsQueryHandler %
:& '
IRequestHandler( 7
<7 8
GetShopsQuery8 E
,E F
IEnumerableG R
<R S

GetShopDtoS ]
>] ^
>^ _
{ 
private 
readonly 
IApplicationContext ,
context- 4
;4 5
private 
readonly 
IShopRepository (

repository) 3
;3 4
public  
GetShopsQueryHandler #
(# $
IApplicationContext$ 7
context8 ?
,? @
IShopRepositoryA P

repositoryQ [
)[ \
{ 	
this 
. 
context 
= 
context "
;" #
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

GetShopDto& 0
>0 1
>1 2
Handle3 9
(9 :
GetShopsQuery: G
requestH O
,O P
CancellationTokenQ b
cancellationTokenc t
)t u
{ 	
var 
shops 
= 

repository #
.# $
GetAll$ *
(* +
)+ ,
;, -
List 
< 

GetShopDto 
> 
	listShops &
=' (
new) ,
List- 1
<1 2

GetShopDto2 <
>< =
(= >
)> ?
;? @
foreach 
( 
var 
shop 
in  
shops! &
)& '
{ 
List 
< 
int 
> 
ingredientsId '
=( )
context+ 2
.2 3
JoinIngredientShop3 E
. 
Where 
( 
p 
=> 
p  !
.! "
ShopsId" )
==* ,
shop- 1
.1 2
Id2 4
)4 5
. 
Select 
( 
p 
=>  
p! "
." #
IngredientsId# 0
)0 1
. 
ToList 
( 
) 
; 

GetShopDto   
shopDto   "
=  # $
new  % (

GetShopDto  ) 3
(  3 4
)  4 5
{!! 
Id"" 
="" 
shop"" 
."" 
Id""  
,""  !
Name## 
=## 
shop## 
.##  
Name##  $
,##$ %
	LocationX$$ 
=$$ 
shop$$  $
.$$$ %
	LocationX$$% .
,$$. /
	LocationY%% 
=%% 
shop%%  $
.%%$ %
	LocationY%%% .
,%%. /
}'' 
;'' 
foreach(( 
((( 
int(( 
i(( 
in(( !
ingredientsId((" /
)((/ 0
{)) 
IngredientsFromShop** '

ingredient**( 2
=**3 4
await**6 ;
context**< C
.**C D
Ingredients**D O
.**O P
	FindAsync**P Y
(**Y Z
i**Z [
,**[ \
cancellationToken**\ m
)**m n
;**n o
GetIngredientDto++ $
getIngredientDto++% 5
=++6 7
new++8 ;
GetIngredientDto++< L
(++L M
)++M N
;++N O
getIngredientDto,, $
.,,$ %
Id,,% '
=,,( )

ingredient,,* 4
.,,4 5
Id,,5 7
;,,7 8
getIngredientDto-- $
.--$ %
Name--% )
=--* +

ingredient--, 6
.--6 7
Name--7 ;
;--; <
getIngredientDto.. $
...$ %
Price..% *
=..+ ,

ingredient..- 7
...7 8
Price..8 =
;..= >
int00 
quantity00  
=00! "
context00# *
.00* +
JoinIngredientShop00+ =
.11 
Where11 
(11 
p11  
=>11! #
(11$ %
p11% &
.11& '
IngredientsId11' 4
==115 7

ingredient118 B
.11B C
Id11C E
)11E F
&&11G I
(11J K
p11K L
.11L M
ShopsId11M T
==11U W
shopDto11X _
.11_ `
Id11` b
)11b c
)11c d
.22 
Select22 
(22  
p22  !
=>22" $
p22% &
.22& '
Quantity22' /
)22/ 0
.33 
FirstOrDefault33 '
(33' (
)33( )
;33) *
getIngredientDto44 $
.44$ %
Quantity44% -
=44. /
quantity440 8
;448 9
shopDto55 
.55 
Ingredients55 '
.55' (
Add55( +
(55+ ,
getIngredientDto55, <
)55< =
;55= >
}66 
	listShops77 
.77 
Add77 
(77 
shopDto77 %
)77% &
;77& '
}88 
return99 
	listShops99 
;99 
};; 	
}>> 
}?? £
lC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Interfaces\IApplicationContext.cs
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
<		 
IngredientsFromShop		 !
>		! "
Ingredients		# .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
DbSet

 
<

 
Shop

 
>

 
Shops

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
DbSet 
< "
IngredientFromShopShop $
>$ %
JoinIngredientShop& 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
Task 
< 
int 
> 
SaveChangesAsync "
(" #
)# $
;$ %
} 
} ≤
nC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Interfaces\IIngredientRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IIngredientRepository *
:* +
IRepository+ 6
<6 7
IngredientsFromShop7 J
>J K
{ 
} 
} ¿

dC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Interfaces\IRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where* /
TEntity0 7
:7 8
class8 =
,= >
new> A
(A B
)B C
{ 
IEnumerable 
< 
TEntity 
> 
GetAll #
(# $
)$ %
;% &
Task		 
<		 
TEntity		 
>		 
GetById		 
(		 
int		 !
id		" $
)		$ %
;		% &
Task

 
<

 
TEntity

 
>

 
AddAsync

 
(

 
TEntity

 &
entity

' -
)

- .
;

. /
Task 
< 
TEntity 
> 
UpdateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task 
< 
TEntity 
> 
DeleteAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
} 
} ó
hC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Application\Interfaces\IShopRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IShopRepository $
:$ %
IRepository% 0
<0 1
Shop1 5
>5 6
{ 
} 
} 