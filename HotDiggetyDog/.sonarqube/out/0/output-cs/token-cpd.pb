◊8
\C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Controllers\ProductController.cs
	namespace 	
HotDiggetyDog
 
. 
Controllers #
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ProductController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
public 
ProductController  
(  !
IProductRepository! 3
productRepository4 E
)E F
{ 	
_productRepository 
=  
productRepository! 2
;2 3
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
GetProductDto' 4
>4 5
>5 6
Get7 :
(: ;
int; >
Id? A
)A B
{ 	
Product 
product 
= 
await #
_productRepository$ 6
.6 7
GetById7 >
(> ?
Id? A
)A B
;B C
return 
Ok 
( 
product 
) 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
GetProductDto3 @
>@ A
>A B
>B C
GetD G
(G H
)H I
{ 	
var 
getProductsDtos 
=  !
await" '
_productRepository( :
.: ;
GetAll; A
(A B
)B C
;C D
return   
Ok   
(   
getProductsDtos   %
)  % &
;  & '
}!! 	
["" 	
HttpPost""	 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
>##& '
Add##( +
(##+ ,
Product##, 3
product##4 ;
)##; <
{$$ 	
bool&& 
existsProduct&& 
=&&  
await&&! &
_productRepository&&' 9
.&&9 :
CreateProduct&&: G
(&&G H
product&&H O
)&&O P
;&&P Q
if'' 
('' 
existsProduct'' 
)'' 
{(( 
return** 
CreatedAtAction** &
(**& '
$str**' ,
,**, -
new**. 1
{**2 3
Id**4 6
=**7 8
product**9 @
.**@ A
Id**A C
}**D E
,**E F
product**G N
)**N O
;**O P
},, 
return-- 
UnprocessableEntity-- &
(--& '
$str--' ?
)--? @
;--@ A
}.. 	
}00 
[11 
ApiController11 
]11 
[22 
Route22 

(22
 
$str22 %
)22% &
]22& '
public33 

class33 !
IngredientsController33 &
:33' (
ControllerBase33) 7
{44 
private55 
readonly55 ,
 IIngredientFromProductRepository55 9,
 _ingredientFromProductRepository55: Z
;55Z [
public66 !
IngredientsController66 $
(66$ %,
 IIngredientFromProductRepository66% E+
ingredientFromProductRepository66F e
)66e f
{77 	,
 _ingredientFromProductRepository99 ,
=99- .+
ingredientFromProductRepository99/ N
;99N O
};; 	
[<< 	
HttpGet<<	 
]<< 
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
GetIngredientDto==' 7
>==7 8
>==8 9
Get==: =
(=== >
int==> A
id==B D
)==D E
{>> 	
var?? 

ingredient?? 
=?? ,
 _ingredientFromProductRepository?? =
.??= >
GetById??> E
(??E F
id??F H
)??H I
;??I J
return@@ 
await@@ 

ingredient@@ #
;@@# $
}AA 	
[CC 	
HttpPostCC	 
]CC 
publicDD 
asyncDD 
TaskDD 
<DD 
ActionResultDD &
>DD& '
AddDD( +
(DD+ ,"
IngredientsFromProductDD, B

ingredientDDC M
)DDM N
{EE 	
boolFF 
existsIngredientFF !
=FF" #
awaitFF$ ),
 _ingredientFromProductRepositoryFF* J
.FFJ K
CreateIngredientFFK [
(FF[ \

ingredientFF\ f
)FFf g
;FFg h
ifGG 
(GG 
existsIngredientGG  
)GG  !
{HH 
returnJJ 
CreatedAtActionJJ &
(JJ& '
$strJJ' ,
,JJ, -
newJJ. 1
{JJ2 3
IdJJ4 6
=JJ7 8

ingredientJJ9 C
.JJC D
IdJJD F
}JJG H
,JJH I

ingredientJJJ T
)JJT U
;JJU V
}LL 
returnMM 
UnprocessableEntityMM &
(MM& '
$strMM' ?
)MM? @
;MM@ A
}OO 	
}PP 
[QQ 
ApiControllerQQ 
]QQ 
[RR 
RouteRR 

(RR
 
$strRR #
)RR# $
]RR$ %
publicSS 

classSS '
IngredientProductControllerSS ,
:SS- .
ControllerBaseSS/ =
{TT 
privateUU 
readonlyUU (
IIngredientProductRepositoryUU 5(
_repositoryIngredientProductUU6 R
;UUR S
publicVV '
IngredientProductControllerVV *
(VV* +(
IIngredientProductRepositoryVV+ G

repositoryVVH R
)VVR S
{WW 	(
_repositoryIngredientProductXX (
=XX) *

repositoryXX+ 5
;XX5 6
}YY 	
[\\ 	
HttpPost\\	 
]\\ 
public]] 
async]] 
Task]] 
<]] 
ActionResult]] &
>]]& '
Add]]( +
(]]+ ,(
IngredientFromProductProduct]], H
relation]]I Q
)]]Q R
{^^ 	
bool__ 
existRelation__ 
=__  
await__! &(
_repositoryIngredientProduct__' C
.__C D
CreateRelation__D R
(__R S
relation__S [
)__[ \
;__\ ]
if`` 
(`` 
existRelation`` 
)`` 
{aa 
returnbb 
UnprocessableEntitybb *
(bb* +
)bb+ ,
;bb, -
}cc 
returnee 
Okee 
(ee 
)ee 
;ee 
}ff 	
}hh 
}jj ù|
YC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Controllers\ShopController.cs
	namespace

 	
HotDiggetyDog2


 
.

 
Controllers

 $
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ShopController 
:  !
ControllerBase" 0
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
ShopController 
( 
DataContext )
context* 1
)1 2
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3

GetShopDto3 =
>= >
>> ?
>? @
GetA D
(D E
)E F
{ 	
List 
< 
Shop 
> 
shops 
= 
await $
_context% -
.- .
Shops. 3
.3 4
ToListAsync4 ?
(? @
)@ A
;A B
List 
< 

GetShopDto 
> 
shopDtos %
=& '
new( +
List, 0
<0 1

GetShopDto1 ;
>; <
(< =
)= >
;> ?
foreach 
( 
Shop 
shop 
in !
shops" '
)' (
{ 
List 
< 
int 
> 
ingredientsId '
=( )
await* /
_context0 8
.8 9#
IngredientFromShopShops9 P
. 
Where 
( 
s 
=> 
s  
.  !
ShopsId! (
==) +
shop, 0
.0 1
Id1 3
)3 4
. 
Select 
( 
s 
=> 
s  !
.! "
IngredientsId" /
)/ 0
.   
ToListAsync   
(    
)    !
;  ! "

GetShopDto!! 
shopDto!! "
=!!# $
new!!% (

GetShopDto!!) 3
(!!3 4
)!!4 5
{"" 
Id## 
=## 
shop## 
.## 
Id##  
,##  !
Name$$ 
=$$ 
shop$$ 
.$$  
Name$$  $
,$$$ %
	LocationX%% 
=%% 
shop%%  $
.%%$ %
	LocationX%%% .
,%%. /
	LocationY&& 
=&& 
shop&&  $
.&&$ %
	LocationY&&% .
,&&. /
}(( 
;(( 
foreach)) 
()) 
int)) 
i)) 
in)) !
ingredientsId))" /
)))/ 0
{** 
IngredientsFromShop++ '

ingredient++( 2
=++3 4
await++5 :
_context++; C
.,,  
IngredientsFromShops,, -
.-- 
	FindAsync-- "
(--" #
i--# $
)--$ %
;--% &
int.. 
quantity..  
=..! "
await..# (
_context..) 1
.// #
IngredientFromShopShops// 0
.00 
Where00 
(00 
s00  
=>00! #
s00$ %
.00% &
IngredientsId00& 3
==004 6
i007 8
&&009 ;
s00< =
.00= >
ShopsId00> E
==00F H
shop00I M
.00M N
Id00N P
)00P Q
.11 
Select11 
(11  
s11  !
=>11" $
s11% &
.11& '
Quantity11' /
)11/ 0
.110 1
FirstOrDefaultAsync111 D
(11D E
)11E F
;11F G
shopDto22 
.22 
Ingredients22 '
.33 
Add33 
(33 
new33   
GetShopIngredientDto33! 5
(335 6
)336 7
{338 9
Id33: <
=33= >

ingredient33? I
.33I J
Id33J L
,33L M
Name33N R
=33S T

ingredient33U _
.33_ `
Name33` d
,33d e
Price33f k
=33l m

ingredient33n x
.33x y
Price33y ~
,33~ 
Quantity
33Ä à
=
33â ä
quantity
33ã ì
}
33î ï
)
33ï ñ
;
33ñ ó
}44 
shopDtos55 
.55 
Add55 
(55 
shopDto55 $
)55$ %
;55% &
}66 
return77 
Ok77 
(77 
shopDtos77 
)77 
;77  
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: 
):: 
]:: 
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
<;;& '
IEnumerable;;' 2
<;;2 3

GetShopDto;;3 =
>;;= >
>;;> ?
>;;? @
Get;;A D
(;;D E
int;;E H
Id;;I K
);;K L
{<< 	
Shop== 
shop== 
=== 
await== 
_context== &
.==& '
Shops==' ,
.==, -
	FindAsync==- 6
(==6 7
Id==7 9
)==9 :
;==: ;
if>> 
(>> 
shop>> 
==>> 
null>> 
)>> 
return?? 
NotFound?? 
(??  
)??  !
;??! "
List@@ 
<@@ 
int@@ 
>@@ 
ingredientsId@@ #
=@@$ %
await@@& +
_context@@, 4
.@@4 5#
IngredientFromShopShops@@5 L
.AA 
WhereAA 
(AA 
sAA 
=>AA 
sAA 
.AA 
ShopsIdAA %
==AA& (
IdAA) +
)AA+ ,
.BB 
SelectBB 
(BB 
sBB 
=>BB 
sBB 
.BB 
IngredientsIdBB ,
)BB, -
.CC 
ToListAsyncCC 
(CC 
)CC 
;CC 

GetShopDtoDD 
shopDtoDD 
=DD  
newDD! $

GetShopDtoDD% /
(DD/ 0
)DD0 1
{EE 
IdFF 
=FF 
shopFF 
.FF 
IdFF 
,FF 
NameGG 
=GG 
shopGG 
.GG 
NameGG  
,GG  !
	LocationXHH 
=HH 
shopHH  
.HH  !
	LocationXHH! *
,HH* +
	LocationYII 
=II 
shopII  
.II  !
	LocationYII! *
,II* +
}KK 
;KK 
foreachLL 
(LL 
intLL 
iLL 
inLL 
ingredientsIdLL +
)LL+ ,
{MM 
IngredientsFromShopNN #

ingredientNN$ .
=NN/ 0
awaitNN1 6
_contextNN7 ?
.OO  
IngredientsFromShopsOO )
.PP 
	FindAsyncPP 
(PP 
iPP  
)PP  !
;PP! "
intQQ 
quantityQQ 
=QQ 
awaitQQ $
_contextQQ& .
.RR #
IngredientFromShopShopsRR ,
.SS 
WhereSS 
(SS 
sSS 
=>SS 
sSS  !
.SS! "
IngredientsIdSS" /
==SS0 2
iSS3 4
&&SS5 7
sSS8 9
.SS9 :
ShopsIdSS: A
==SSB D
IdSSE G
)SSG H
.TT 
SelectTT 
(TT 
sTT 
=>TT  
sTT! "
.TT" #
QuantityTT# +
)TT+ ,
.TT, -
FirstOrDefaultAsyncTT- @
(TT@ A
)TTA B
;TTB C
shopDtoUU 
.UU 
IngredientsUU #
.VV 
AddVV 
(VV 
newVV  
GetShopIngredientDtoVV 1
(VV1 2
)VV2 3
{WW 
IdWW 
=WW 

ingredientWW %
.WW% &
IdWW& (
,WW( )
NameWW* .
=WW/ 0

ingredientWW1 ;
.WW; <
NameWW< @
,WW@ A
PriceWWB G
=WWG H

ingredientWWH R
.WWR S
PriceWWS X
,WWX Y
QuantityWWY a
=WWa b
quantityWWb j
}WWk l
)WWl m
;WWm n
}XX 
returnYY 
OkYY 
(YY 
shopDtoYY 
)YY 
;YY 
}ZZ 	
[\\ 	
HttpPost\\	 
]\\ 
public]] 
async]] 
Task]] 
<]] 
ActionResult]] &
>]]& '
Add]]( +
(]]+ ,
Shop]], 0
shop]]1 5
)]]5 6
{^^ 	
bool__ 
alreadyExists__ 
=__  
_context__! )
.__) *
Shops__* /
.__/ 0
Any__0 3
(__3 4
s__4 5
=>__6 8
s__9 :
.__: ;
Id__; =
==__> @
shop__A E
.__E F
Id__F H
)__H I
;__I J
if`` 
(`` 
alreadyExists`` 
)`` 
returnaa 
UnprocessableEntityaa *
(aa* +
)aa+ ,
;aa, -
awaitbb 
_contextbb 
.bb 
Shopsbb  
.bb  !
AddAsyncbb! )
(bb) *
shopbb* .
)bb. /
;bb/ 0
awaitcc 
_contextcc 
.cc 
SaveChangesAsynccc +
(cc+ ,
)cc, -
;cc- .
returndd 
CreatedAtActiondd "
(dd" #
$strdd# (
,dd( )
newdd* -
{dd. /
Iddd0 2
=dd3 4
shopdd5 9
.dd9 :
Iddd: <
}dd= >
,dd> ?
shopdd@ D
)ddD E
;ddE F
}ee 	
}hh 
[jj 
ApiControllerjj 
]jj 
[kk 
Routekk 

(kk
 
$strkk "
)kk" #
]kk# $
publicll 

classll !
IngredientsControllerll &
:ll' (
ControllerBasell) 7
{mm 
DataContextoo 
_contextoo 
;oo 
publicpp !
IngredientsControllerpp $
(pp$ %
DataContextpp% 0
contextpp1 8
)pp8 9
{qq 	
_contextrr 
=rr 
contextrr 
;rr 
}ss 	
[tt 	
HttpGettt	 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
ActionResultuu &
<uu& '
IngredientsFromShopuu' :
>uu: ;
>uu; <
Getuu= @
(uu@ A
intuuA D
iduuE G
)uuG H
{vv 	
varww 

ingredientww 
=ww 
_contextww %
.ww% & 
IngredientsFromShopsww& :
.ww: ;
Findww; ?
(ww? @
idww@ B
)wwB C
;wwC D
returnxx 
Okxx 
(xx 

ingredientxx  
)xx  !
;xx! "
}yy 	
[zz 	
HttpPostzz	 
]zz 
public{{ 
async{{ 
Task{{ 
<{{ 
ActionResult{{ &
>{{& '
Add{{( +
({{+ ,
IngredientsFromShop{{, ?

ingredient{{@ J
){{J K
{|| 	
bool}} 
alreadyExists}} 
=}}  
_context}}! )
.}}) * 
IngredientsFromShops}}* >
.}}> ?
Any}}? B
(}}B C
i}}C D
=>}}E G
i}}H I
.}}I J
Id}}J L
==}}M O

ingredient}}P Z
.}}Z [
Id}}[ ]
)}}] ^
;}}^ _
if~~ 
(~~ 
alreadyExists~~ 
)~~ 
return 
UnprocessableEntity *
(* +
)+ ,
;, -
await
ÄÄ 
_context
ÄÄ 
.
ÄÄ "
IngredientsFromShops
ÄÄ /
.
ÄÄ/ 0
AddAsync
ÄÄ0 8
(
ÄÄ8 9

ingredient
ÄÄ9 C
)
ÄÄC D
;
ÄÄD E
await
ÅÅ 
_context
ÅÅ 
.
ÅÅ 
SaveChangesAsync
ÅÅ +
(
ÅÅ+ ,
)
ÅÅ, -
;
ÅÅ- .
return
ÇÇ 
CreatedAtAction
ÇÇ "
(
ÇÇ" #
$str
ÇÇ# (
,
ÇÇ( )
new
ÇÇ* -
{
ÇÇ. /
Id
ÇÇ0 2
=
ÇÇ3 4

ingredient
ÇÇ5 ?
.
ÇÇ? @
Id
ÇÇ@ B
}
ÇÇC D
,
ÇÇD E

ingredient
ÇÇF P
)
ÇÇP Q
;
ÇÇQ R
}
ÉÉ 	
}
ÑÑ 
[
ÖÖ 
ApiController
ÖÖ 
]
ÖÖ 
[
ÜÜ 
Route
ÜÜ 

(
ÜÜ
 
$str
ÜÜ &
)
ÜÜ& '
]
ÜÜ' (
public
áá 

class
áá &
IngredientShopController
áá )
:
áá* +
ControllerBase
áá, :
{
àà 
DataContext
ää 
_context
ää 
;
ää 
public
ãã &
IngredientShopController
ãã '
(
ãã' (
DataContext
ãã( 3
context
ãã4 ;
)
ãã; <
{
åå 	
_context
çç 
=
çç 
context
çç 
;
çç 
}
éé 	
[
èè 	
HttpPost
èè	 
]
èè 
public
êê 
async
êê 
Task
êê 
<
êê 
ActionResult
êê &
>
êê& '
Add
êê( +
(
êê+ ,$
IngredientFromShopShop
êê, B
relation
êêC K
)
êêK L
{
ëë 	
bool
íí 
alreadyExists
íí 
=
íí  
_context
íí! )
.
íí) *%
IngredientFromShopShops
íí* A
.
ííA B
Any
ííB E
(
ííE F
s
ííF G
=>
ííH J
s
ííK L
.
ííL M
ShopsId
ííM T
==
ííU W
relation
ííX `
.
íí` a
ShopsId
íía h
&&
ííi k
s
ííl m
.
íím n
IngredientsId
íín {
==
íí| ~
relationíí á
.ííá à
IngredientsIdííà ï
)ííï ñ
;ííñ ó
if
ìì 
(
ìì 
alreadyExists
ìì 
)
ìì 
return
îî !
UnprocessableEntity
îî *
(
îî* +
)
îî+ ,
;
îî, -
await
ïï 
_context
ïï 
.
ïï %
IngredientFromShopShops
ïï 2
.
ïï2 3
AddAsync
ïï3 ;
(
ïï; <
relation
ïï< D
)
ïïD E
;
ïïE F
await
ññ 
_context
ññ 
.
ññ 
SaveChangesAsync
ññ +
(
ññ+ ,
)
ññ, -
;
ññ- .
var
óó 
newRelation
óó 
=
óó 
_context
óó &
.
óó& '%
IngredientFromShopShops
óó' >
.
óó> ?
Where
óó? D
(
óóD E
s
óóE F
=>
óóG I
s
óóJ K
.
óóK L
ShopsId
óóL S
==
óóT V
relation
óóW _
.
óó_ `
ShopsId
óó` g
&&
óóh j
s
óók l
.
óól m
IngredientsId
óóm z
==
óó{ }
relationóó~ Ü
.óóÜ á
IngredientsIdóóá î
)óóî ï
;óóï ñ
return
òò 
Ok
òò 
(
òò 
newRelation
òò !
)
òò! "
;
òò" #
}
ôô 	
}
öö 
}õõ Ÿ)
ZC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Controllers\UsersController.cs
	namespace 	
HotDiggetyDog
 
. 
Controllers #
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
DataContext $
context% ,
;, -
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
UsersController 
( 
DataContext *
context+ 2
,2 3
IUserService3 ?
userService@ K
)K L
{ 	
this 
. 
context 
= 
context "
;" #
_userService 
= 
userService &
;& '
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 
IActionResult 
Authenticate )
() *
AuthenticateRequest* =
model> C
)C D
{ 	
var 
response 
= 
_userService '
.' (
Authenticate( 4
(4 5
model5 :
): ;
;; <
if   
(   
response   
==   
null    
)    !
return!! 

BadRequest!! !
(!!! "
new!!" %
{!!& '
message!!( /
=!!0 1
$str!!2 U
}!!V W
)!!W X
;!!X Y
return## 
Ok## 
(## 
response## 
)## 
;##  
}$$ 	
[&& 	
	Authorize&&	 
]&& 
['' 	
HttpGet''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
IEnumerable((' 2
<((2 3
User((3 7
>((7 8
>((8 9
>((9 :
Get((; >
(((> ?
)((? @
{)) 	
return** 
await** 
context**  
.**  !
Users**! &
.**& '
ToListAsync**' 2
(**2 3
)**3 4
;**4 5
}++ 	
[-- 	
	Authorize--	 
]-- 
[.. 	
HttpGet..	 
(.. 
$str.. 
).. 
].. 
public// 
async// 
Task// 
<// 
ActionResult// &
<//& '
User//' +
>//+ ,
>//, -
Get//- 0
(//0 1
Guid//1 5
Id//6 8
)//8 9
{00 	
var11 
user11 
=11 
await11 
context11 $
.11$ %
Users11% *
.11* +
	FindAsync11+ 4
(114 5
Id115 7
)117 8
;118 9
if22 
(22 
user22 
==22 
null22 
)22 
return33 
NotFound33 
(33  
)33  !
;33! "
return44 
Ok44 
(44 
user44 
)44 
;44 
}55 	
[77 	
HttpPost77	 
]77 
public88 
async88 
Task88 
<88 
ActionResult88 &
>88& '

InsertUser88' 1
(881 2
User882 6
newUser887 >
)88> ?
{99 	
bool:: 
existsEmail:: 
=:: 
context:: &
.::& '
Users::' ,
.::, -
Any::- 0
(::0 1
b::1 2
=>::3 5
b::6 7
.::7 8
Email::8 =
==::> @
newUser::A H
.::H I
Email::I N
)::N O
;::O P
if;; 
(;; 
!;; 
existsEmail;; 
);; 
{<< 
newUser== 
.== 
Password==  
===! "
BCrypt==# )
.==) *
Net==* -
.==- .
BCrypt==. 4
.==4 5
HashPassword==5 A
(==A B
newUser==B I
.==I J
Password==J R
)==R S
;==S T
newUser>> 
.>> 
Role>> 
=>> 
$str>> )
;>>) *
context?? 
.?? 
Users?? 
.?? 
Add?? !
(??! "
newUser??" )
)??) *
;??* +
await@@ 
context@@ 
.@@ 
SaveChangesAsync@@ .
(@@. /
)@@/ 0
;@@0 1
returnAA 
CreatedAtActionAA &
(AA& '
$strAA' ,
,AA, -
newAA. 1
{AA2 3
IdAA4 6
=AA7 8
newUserAA9 @
.AA@ A
IdAAA C
}AAC D
,AAD E
newUserAAF M
)AAM N
;AAN O
}BB 
returnCC 
UnprocessableEntityCC *
(CC* +
$strCC+ A
)CCA B
;CCB C
}DD 	
}EE 
}FF Ü>
OC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\DataContext.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public 

partial 
class 
DataContext $
:% &
	DbContext' 0
{		 
public

 
DataContext

 
(

 
)

 
{ 	
} 	
public 
DataContext 
( 
DbContextOptions +
<+ ,
DataContext, 7
>7 8
options9 @
)@ A
: 
base 
( 
options 
) 
{ 	
} 	
public 
virtual 
DbSet 
< (
IngredientFromProductProduct 9
>9 :)
IngredientFromProductProducts; X
{Y Z
get[ ^
;^ _
set` c
;c d
}e f
public 
virtual 
DbSet 
< "
IngredientFromShopShop 3
>3 4#
IngredientFromShopShops5 L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
virtual 
DbSet 
< "
IngredientsFromProduct 3
>3 4#
IngredientsFromProducts5 L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
virtual 
DbSet 
< 
IngredientsFromShop 0
>0 1 
IngredientsFromShops2 F
{G H
getI L
;L M
setN Q
;Q R
}S T
public 
virtual 
DbSet 
< 
Product $
>$ %
Products& .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
virtual 
DbSet 
< 
Shop !
>! "
Shops# (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
virtual 
DbSet 
< 
User !
>! "
Users# (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
if 
( 
! 
optionsBuilder 
.  
IsConfigured  ,
), -
{ 
optionsBuilder   
.   
	UseSqlite   (
(  ( )
$str  ) C
)  C D
;  D E
}!! 
}"" 	
	protected$$ 
override$$ 
void$$ 
OnModelCreating$$  /
($$/ 0
ModelBuilder$$0 <
modelBuilder$$= I
)$$I J
{%% 	
modelBuilder&& 
.&& 
Entity&& 
<&&  (
IngredientFromProductProduct&&  <
>&&< =
(&&= >
entity&&> D
=>&&E G
{'' 
entity(( 
.(( 
HasKey(( 
((( 
e(( 
=>((  "
new((# &
{((' (
e(() *
.((* +
IngredientsId((+ 8
,((8 9
e((: ;
.((; <

ProductsId((< F
}((G H
)((H I
;((I J
entity** 
.** 
ToTable** 
(** 
$str** =
)**= >
;**> ?
entity,, 
.,, 
HasIndex,, 
(,,  
e,,  !
=>,," $
e,,% &
.,,& '

ProductsId,,' 1
,,,1 2
$str,,3 _
),,_ `
;,,` a
entity.. 
... 
HasOne.. 
(.. 
d.. 
=>..  "
d..# $
...$ %
Ingredients..% 0
)..0 1
.// 
WithMany// 
(// 
p// 
=>//  "
p//# $
.//$ %)
IngredientFromProductProducts//% B
)//B C
.00 
HasForeignKey00 "
(00" #
d00# $
=>00% '
d00( )
.00) *
IngredientsId00* 7
)007 8
;008 9
entity22 
.22 
HasOne22 
(22 
d22 
=>22  "
d22# $
.22$ %
Products22% -
)22- .
.33 
WithMany33 
(33 
p33 
=>33  "
p33# $
.33$ %)
IngredientFromProductProducts33% B
)33B C
.44 
HasForeignKey44 "
(44" #
d44# $
=>44% '
d44( )
.44) *

ProductsId44* 4
)444 5
;445 6
}55 
)55 
;55 
modelBuilder77 
.77 
Entity77 
<77  "
IngredientFromShopShop77  6
>776 7
(777 8
entity778 >
=>77? A
{88 
entity99 
.99 
HasKey99 
(99 
e99 
=>99  "
new99# &
{99' (
e99) *
.99* +
IngredientsId99+ 8
,998 9
e99: ;
.99; <
ShopsId99< C
}99D E
)99E F
;99F G
entity;; 
.;; 
ToTable;; 
(;; 
$str;; 7
);;7 8
;;;8 9
entity== 
.== 
HasIndex== 
(==  
e==  !
=>==" $
e==% &
.==& '
ShopsId==' .
,==. /
$str==0 S
)==S T
;==T U
entity?? 
.?? 
HasOne?? 
(?? 
d?? 
=>??  "
d??# $
.??$ %
Ingredients??% 0
)??0 1
.@@ 
WithMany@@ 
(@@ 
p@@ 
=>@@  "
p@@# $
.@@$ %#
IngredientFromShopShops@@% <
)@@< =
.AA 
HasForeignKeyAA "
(AA" #
dAA# $
=>AA% '
dAA( )
.AA) *
IngredientsIdAA* 7
)AA7 8
;AA8 9
entityCC 
.CC 
HasOneCC 
(CC 
dCC 
=>CC  "
dCC# $
.CC$ %
ShopsCC% *
)CC* +
.DD 
WithManyDD 
(DD 
pDD 
=>DD  "
pDD# $
.DD$ %#
IngredientFromShopShopsDD% <
)DD< =
.EE 
HasForeignKeyEE "
(EE" #
dEE# $
=>EE% '
dEE( )
.EE) *
ShopsIdEE* 1
)EE1 2
;EE2 3
}FF 
)FF 
;FF 
modelBuilderHH 
.HH 
EntityHH 
<HH  "
IngredientsFromProductHH  6
>HH6 7
(HH7 8
entityHH8 >
=>HH? A
{II 
entityJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ 7
)JJ7 8
;JJ8 9
}KK 
)KK 
;KK 
modelBuilderMM 
.MM 
EntityMM 
<MM  
IngredientsFromShopMM  3
>MM3 4
(MM4 5
entityMM5 ;
=>MM< >
{NN 
entityOO 
.OO 
ToTableOO 
(OO 
$strOO 4
)OO4 5
;OO5 6
}PP 
)PP 
;PP "
OnModelCreatingPartialRR "
(RR" #
modelBuilderRR# /
)RR/ 0
;RR0 1
}SS 	
partialUU 
voidUU "
OnModelCreatingPartialUU +
(UU+ ,
ModelBuilderUU, 8
modelBuilderUU9 E
)UUE F
;UUF G
}VV 
}WW ¬
dC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\IIngredientFromProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public 

	interface ,
 IIngredientFromProductRepository 5
{ 
Task		 
<		 
bool		 
>		 
CreateIngredient		 #
(		# $"
IngredientsFromProduct		$ :

ingredient		; E
)		E F
;		F G
Task

 
<

 
GetIngredientDto

 
>

 
GetById

 &
(

& '
int

' *
id

+ -
)

- .
;

. /
} 
} ã
`C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\IIngredientProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public 

	interface (
IIngredientProductRepository 1
{ 
Task 
< 
bool 
> 
CreateRelation !
(! "(
IngredientFromProductProduct" >
relation? G
)G H
;H I
}		 
}

 î
cC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\IngredientFromProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public		 

class		 +
IngredientFromProductRepository		 0
:		1 2,
 IIngredientFromProductRepository		3 S
{

 
private 
readonly 
DataContext $
_context% -
;- .
public +
IngredientFromProductRepository .
(. /
DataContext/ :
context; B
)B C
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
bool 
> 
CreateIngredient  0
(0 1"
IngredientsFromProduct1 G

ingredientH R
)R S
{ 	
bool 
existsIngredient !
=" #
_context$ ,
., -#
IngredientsFromProducts- D
.D E
AnyE H
(H I
pI J
=>K M
pN O
.O P
IdP R
==S U

ingredientV `
.` a
Ida c
)c d
;d e
if 
( 
! 
existsIngredient !
)! "
{ 
_context 
. #
IngredientsFromProducts 0
.0 1
Add1 4
(4 5

ingredient5 ?
)? @
;@ A
await 
_context 
. 
SaveChangesAsync /
(/ 0
)0 1
;1 2
return 
true 
; 
} 
return 
false 
; 
} 	
public 
async 
Task 
< 
GetIngredientDto *
>* +
GetById, 3
(3 4
int4 7
id8 :
): ;
{ 	
var 

ingredient 
= 
await "
_context# +
.+ ,#
IngredientsFromProducts, C
.C D
WhereD I
(I J
iJ K
=>L N
iO P
.P Q
IdQ S
==T V
idW Y
)Y Z
." #
Select# )
() *
i* +
=>, .
new/ 2
GetIngredientDto3 C
(C D
)D E
{F G
IdH J
=K L
iM N
.N O
IdO Q
,Q R
NameS W
=X Y
iZ [
.[ \
Name\ `
}a b
)b c
.c d
FirstOrDefaultAsyncd w
(w x
)x y
;y z
return 

ingredient 
; 
}   	
}!! 
}"" å
_C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\IngredientProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public 

class '
IngredientProductRepository ,
:- .(
IIngredientProductRepository/ K
{ 
private		 
readonly		 
DataContext		 $
_dataContext		% 1
;		1 2
public

 '
IngredientProductRepository

 *
(

* +
DataContext

+ 6
dataContext

7 B
)

B C
{ 	
_dataContext 
= 
dataContext &
;& '
} 	
public 
async 
Task 
< 
bool 
> 
CreateRelation  .
(. /(
IngredientFromProductProduct/ K
relationL T
)T U
{ 	
bool 
alreadyExists 
=  
_dataContext! -
.- .)
IngredientFromProductProducts. K
.K L
AnyL O
(O P
sP Q
=>R T
sU V
.V W

ProductsIdW a
==b d
relatione m
.m n

ProductsIdn x
&&y {
s| }
.} ~
IngredientsId	~ ã
==
å é
relation
è ó
.
ó ò
IngredientsId
ò •
)
• ¶
;
¶ ß
if 
( 
alreadyExists 
) 
return 
true 
; 
await 
_dataContext 
. )
IngredientFromProductProducts <
.< =
AddAsync= E
(E F
relationF N
)N O
;O P
await 
_dataContext 
. 
SaveChangesAsync /
(/ 0
)0 1
;1 2
return 
false 
; 
} 	
} 
} À
VC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\IProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{ 
public 

	interface 
IProductRepository '
{		 
Task

 
<

 
bool

 
>

 
CreateProduct

  
(

  !
Product

! (
product

) 0
)

0 1
;

1 2
Task 
< 
IEnumerable 
< 
GetProductDto &
>& '
>' (
GetAll) /
(/ 0
)0 1
;1 2
Task 
< 
Product 
> 
GetById 
( 
int !
Id" $
)$ %
;% &
} 
} “Ö
kC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\Migrations\20210409221552_InitialCreate.cs
	namespace 	
HotDiggetyDog2
 
. 
Data 
. 

Migrations (
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str .
,. /
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% @
,@ A
xB C
=>D F
xG H
.H I
IdI K
)K L
;L M
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str +
,+ ,
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
Quantity 
= 
table $
.$ %
Column% +
<+ ,
int, /
>/ 0
(0 1
type1 5
:5 6
$str7 @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
Price 
= 
table !
.! "
Column" (
<( )
double) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
falseI N
)N O
,O P
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
}   
,   
constraints!! 
:!! 
table!! "
=>!!# %
{"" 
table## 
.## 

PrimaryKey## $
(##$ %
$str##% =
,##= >
x##? @
=>##A C
x##D E
.##E F
Id##F H
)##H I
;##I J
}$$ 
)$$ 
;$$ 
migrationBuilder&& 
.&& 
CreateTable&& (
(&&( )
name'' 
:'' 
$str''  
,''  !
columns(( 
:(( 
table(( 
=>(( !
new((" %
{)) 
Id** 
=** 
table** 
.** 
Column** %
<**% &
int**& )
>**) *
(*** +
type**+ /
:**/ 0
$str**1 :
,**: ;
nullable**< D
:**D E
false**F K
)**K L
.++ 

Annotation++ #
(++# $
$str++$ :
,++: ;
true++< @
)++@ A
,++A B
Name,, 
=,, 
table,,  
.,,  !
Column,,! '
<,,' (
string,,( .
>,,. /
(,,/ 0
type,,0 4
:,,4 5
$str,,6 <
,,,< =
nullable,,> F
:,,F G
true,,H L
),,L M
,,,M N
Price-- 
=-- 
table-- !
.--! "
Column--" (
<--( )
double--) /
>--/ 0
(--0 1
type--1 5
:--5 6
$str--7 =
,--= >
nullable--? G
:--G H
false--I N
)--N O
,--O P
Description.. 
=..  !
table.." '
...' (
Column..( .
<... /
string../ 5
>..5 6
(..6 7
type..7 ;
:..; <
$str..= C
,..C D
nullable..E M
:..M N
true..O S
)..S T
,..T U
Discount// 
=// 
table// $
.//$ %
Column//% +
<//+ ,
double//, 2
>//2 3
(//3 4
type//4 8
://8 9
$str//: @
,//@ A
nullable//B J
://J K
false//L Q
)//Q R
}00 
,00 
constraints11 
:11 
table11 "
=>11# %
{22 
table33 
.33 

PrimaryKey33 $
(33$ %
$str33% 2
,332 3
x334 5
=>336 8
x339 :
.33: ;
Id33; =
)33= >
;33> ?
}44 
)44 
;44 
migrationBuilder66 
.66 
CreateTable66 (
(66( )
name77 
:77 
$str77 
,77 
columns88 
:88 
table88 
=>88 !
new88" %
{99 
Id:: 
=:: 
table:: 
.:: 
Column:: %
<::% &
int::& )
>::) *
(::* +
type::+ /
:::/ 0
$str::1 :
,::: ;
nullable::< D
:::D E
false::F K
)::K L
.;; 

Annotation;; #
(;;# $
$str;;$ :
,;;: ;
true;;< @
);;@ A
,;;A B
	LocationX<< 
=<< 
table<<  %
.<<% &
Column<<& ,
<<<, -
double<<- 3
><<3 4
(<<4 5
type<<5 9
:<<9 :
$str<<; A
,<<A B
nullable<<C K
:<<K L
false<<M R
)<<R S
,<<S T
	LocationY== 
=== 
table==  %
.==% &
Column==& ,
<==, -
double==- 3
>==3 4
(==4 5
type==5 9
:==9 :
$str==; A
,==A B
nullable==C K
:==K L
false==M R
)==R S
,==S T
Name>> 
=>> 
table>>  
.>>  !
Column>>! '
<>>' (
string>>( .
>>>. /
(>>/ 0
type>>0 4
:>>4 5
$str>>6 <
,>>< =
nullable>>> F
:>>F G
true>>H L
)>>L M
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% /
,BB/ 0
xBB1 2
=>BB3 5
xBB6 7
.BB7 8
IdBB8 :
)BB: ;
;BB; <
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF 
,FF 
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
GuidII& *
>II* +
(II+ ,
typeII, 0
:II0 1
$strII2 8
,II8 9
nullableII: B
:IIB C
falseIID I
)III J
,IIJ K
UsernameJJ 
=JJ 
tableJJ $
.JJ$ %
ColumnJJ% +
<JJ+ ,
stringJJ, 2
>JJ2 3
(JJ3 4
typeJJ4 8
:JJ8 9
$strJJ: @
,JJ@ A
nullableJJB J
:JJJ K
trueJJL P
)JJP Q
,JJQ R
EmailKK 
=KK 
tableKK !
.KK! "
ColumnKK" (
<KK( )
stringKK) /
>KK/ 0
(KK0 1
typeKK1 5
:KK5 6
$strKK7 =
,KK= >
nullableKK? G
:KKG H
trueKKI M
)KKM N
,KKN O
PasswordLL 
=LL 
tableLL $
.LL$ %
ColumnLL% +
<LL+ ,
stringLL, 2
>LL2 3
(LL3 4
typeLL4 8
:LL8 9
$strLL: @
,LL@ A
nullableLLB J
:LLJ K
trueLLL P
)LLP Q
}MM 
,MM 
constraintsNN 
:NN 
tableNN "
=>NN# %
{OO 
tablePP 
.PP 

PrimaryKeyPP $
(PP$ %
$strPP% /
,PP/ 0
xPP1 2
=>PP3 5
xPP6 7
.PP7 8
IdPP8 :
)PP: ;
;PP; <
}QQ 
)QQ 
;QQ 
migrationBuilderSS 
.SS 
CreateTableSS (
(SS( )
nameTT 
:TT 
$strTT 4
,TT4 5
columnsUU 
:UU 
tableUU 
=>UU !
newUU" %
{VV 
IngredientsIdWW !
=WW" #
tableWW$ )
.WW) *
ColumnWW* 0
<WW0 1
intWW1 4
>WW4 5
(WW5 6
typeWW6 :
:WW: ;
$strWW< E
,WWE F
nullableWWG O
:WWO P
falseWWQ V
)WWV W
,WWW X

ProductsIdXX 
=XX  
tableXX! &
.XX& '
ColumnXX' -
<XX- .
intXX. 1
>XX1 2
(XX2 3
typeXX3 7
:XX7 8
$strXX9 B
,XXB C
nullableXXD L
:XXL M
falseXXN S
)XXS T
}YY 
,YY 
constraintsZZ 
:ZZ 
tableZZ "
=>ZZ# %
{[[ 
table\\ 
.\\ 

PrimaryKey\\ $
(\\$ %
$str\\% F
,\\F G
x\\H I
=>\\J L
new\\M P
{\\Q R
x\\S T
.\\T U
IngredientsId\\U b
,\\b c
x\\d e
.\\e f

ProductsId\\f p
}\\q r
)\\r s
;\\s t
table]] 
.]] 

ForeignKey]] $
(]]$ %
name^^ 
:^^ 
$str^^ d
,^^d e
column__ 
:__ 
x__  !
=>__" $
x__% &
.__& '
IngredientsId__' 4
,__4 5
principalTable`` &
:``& '
$str``( @
,``@ A
principalColumnaa '
:aa' (
$straa) -
,aa- .
onDeletebb  
:bb  !
ReferentialActionbb" 3
.bb3 4
Cascadebb4 ;
)bb; <
;bb< =
tablecc 
.cc 

ForeignKeycc $
(cc$ %
namedd 
:dd 
$strdd S
,ddS T
columnee 
:ee 
xee  !
=>ee" $
xee% &
.ee& '

ProductsIdee' 1
,ee1 2
principalTableff &
:ff& '
$strff( 2
,ff2 3
principalColumngg '
:gg' (
$strgg) -
,gg- .
onDeletehh  
:hh  !
ReferentialActionhh" 3
.hh3 4
Cascadehh4 ;
)hh; <
;hh< =
}ii 
)ii 
;ii 
migrationBuilderkk 
.kk 
CreateTablekk (
(kk( )
namell 
:ll 
$strll .
,ll. /
columnsmm 
:mm 
tablemm 
=>mm !
newmm" %
{nn 
IngredientsIdoo !
=oo" #
tableoo$ )
.oo) *
Columnoo* 0
<oo0 1
intoo1 4
>oo4 5
(oo5 6
typeoo6 :
:oo: ;
$stroo< E
,ooE F
nullableooG O
:ooO P
falseooQ V
)ooV W
,ooW X
ShopsIdpp 
=pp 
tablepp #
.pp# $
Columnpp$ *
<pp* +
intpp+ .
>pp. /
(pp/ 0
typepp0 4
:pp4 5
$strpp6 ?
,pp? @
nullableppA I
:ppI J
falseppK P
)ppP Q
}qq 
,qq 
constraintsrr 
:rr 
tablerr "
=>rr# %
{ss 
tablett 
.tt 

PrimaryKeytt $
(tt$ %
$strtt% @
,tt@ A
xttB C
=>ttD F
newttG J
{ttK L
xttM N
.ttN O
IngredientsIdttO \
,tt\ ]
xtt^ _
.tt_ `
ShopsIdtt` g
}tth i
)tti j
;ttj k
tableuu 
.uu 

ForeignKeyuu $
(uu$ %
namevv 
:vv 
$strvv [
,vv[ \
columnww 
:ww 
xww  !
=>ww" $
xww% &
.ww& '
IngredientsIdww' 4
,ww4 5
principalTablexx &
:xx& '
$strxx( =
,xx= >
principalColumnyy '
:yy' (
$stryy) -
,yy- .
onDeletezz  
:zz  !
ReferentialActionzz" 3
.zz3 4
Cascadezz4 ;
)zz; <
;zz< =
table{{ 
.{{ 

ForeignKey{{ $
({{$ %
name|| 
:|| 
$str|| G
,||G H
column}} 
:}} 
x}}  !
=>}}" $
x}}% &
.}}& '
ShopsId}}' .
,}}. /
principalTable~~ &
:~~& '
$str~~( /
,~~/ 0
principalColumn '
:' (
$str) -
,- .
onDelete
ÄÄ  
:
ÄÄ  !
ReferentialAction
ÄÄ" 3
.
ÄÄ3 4
Cascade
ÄÄ4 ;
)
ÄÄ; <
;
ÄÄ< =
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateIndex
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ B
,
ÑÑB C
table
ÖÖ 
:
ÖÖ 
$str
ÖÖ 5
,
ÖÖ5 6
column
ÜÜ 
:
ÜÜ 
$str
ÜÜ $
)
ÜÜ$ %
;
ÜÜ% &
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ 9
,
ââ9 :
table
ää 
:
ää 
$str
ää /
,
ää/ 0
column
ãã 
:
ãã 
$str
ãã !
)
ãã! "
;
ãã" #
}
åå 	
	protected
éé 
override
éé 
void
éé 
Down
éé  $
(
éé$ %
MigrationBuilder
éé% 5
migrationBuilder
éé6 F
)
ééF G
{
èè 	
migrationBuilder
êê 
.
êê 
	DropTable
êê &
(
êê& '
name
ëë 
:
ëë 
$str
ëë 4
)
ëë4 5
;
ëë5 6
migrationBuilder
ìì 
.
ìì 
	DropTable
ìì &
(
ìì& '
name
îî 
:
îî 
$str
îî .
)
îî. /
;
îî/ 0
migrationBuilder
ññ 
.
ññ 
	DropTable
ññ &
(
ññ& '
name
óó 
:
óó 
$str
óó 
)
óó 
;
óó 
migrationBuilder
ôô 
.
ôô 
	DropTable
ôô &
(
ôô& '
name
öö 
:
öö 
$str
öö .
)
öö. /
;
öö/ 0
migrationBuilder
úú 
.
úú 
	DropTable
úú &
(
úú& '
name
ùù 
:
ùù 
$str
ùù  
)
ùù  !
;
ùù! "
migrationBuilder
üü 
.
üü 
	DropTable
üü &
(
üü& '
name
†† 
:
†† 
$str
†† +
)
††+ ,
;
††, -
migrationBuilder
¢¢ 
.
¢¢ 
	DropTable
¢¢ &
(
¢¢& '
name
££ 
:
££ 
$str
££ 
)
££ 
;
££ 
}
§§ 	
}
•• 
}¶¶ Ÿ
qC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\Migrations\20210410194039_QuantityInJoinTable.cs
	namespace 	
HotDiggetyDog2
 
. 
Data 
. 

Migrations (
{ 
public 

partial 
class 
QuantityInJoinTable ,
:- .
	Migration/ 8
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 

DropColumn		 '
(		' (
name

 
:

 
$str

  
,

  !
table 
: 
$str ,
), -
;- .
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str  
,  !
table 
: 
$str /
,/ 0
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str  
,  !
table 
: 
$str /
)/ 0
;0 1
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str  
,  !
table 
: 
$str ,
,, -
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue   
:   
$num   
)    
;    !
}!! 	
}"" 
}## ≥
kC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\Migrations\20210413094929_AddedUserRole.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
. 

Migrations '
{ 
public 

partial 
class 
AddedUserRole &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
	AddColumn		 &
<		& '
string		' -
>		- .
(		. /
name

 
:

 
$str

 
,

 
table 
: 
$str 
, 
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str 
) 
;  
} 	
} 
} ˝<
UC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Data\ProductRepository.cs
	namespace 	
HotDiggetyDog
 
. 
Data 
{		 
public

 

class

 
ProductRepository

 "
:

# $
IProductRepository

% 7
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
ProductRepository  
(  !
DataContext! ,
dataContext- 8
)8 9
{ 	
_context 
= 
dataContext "
;" #
} 	
public 
async 
Task 
< 
Product !
>! "
GetById# *
(* +
int+ .
Id/ 1
)1 2
{ 	
var 
product 
= 
await 
_context  (
.( )
Products) 1
.1 2
	FindAsync2 ;
(; <
Id< >
)> ?
;? @
List 
< 
int 
> 
ingredientsId #
=$ %
await& +
_context, 4
.4 5)
IngredientFromProductProducts5 R
. 
Where 
( 
p 
=> 
p 
. 

ProductsId (
==) +
Id, .
). /
. 
Select 
( 
p 
=> 
p 
. 
IngredientsId ,
), -
. 
ToListAsync 
( 
) 
; 
GetProductDto 

productDto $
=% &
new' *
GetProductDto+ 8
(8 9
)9 :
{ 
Id 
= 
product 
. 
Id 
,  
Name 
= 
product 
. 
Name #
,# $
Description 
= 
product %
.% &
Description& 1
,1 2
Price 
= 
product 
.  
Price  %
,% &
Discount 
= 
product "
." #
Discount# +
}   
;   
foreach!! 
(!! 
int!! 
i!! 
in!! 
ingredientsId!! +
)!!+ ,
{"" "
IngredientsFromProduct## &

ingredient##' 1
=##2 3
await##4 9
_context##: B
.$$ #
IngredientsFromProducts$$ ,
.%% 
	FindAsync%% 
(%% 
i%%  
)%%  !
;%%! "

productDto&& 
.&& 
Ingredients&& &
.'' 
Add'' 
('' 
new'' 
GetIngredientDto'' -
(''- .
)''. /
{''0 1
Id''2 4
=''5 6

ingredient''7 A
.''A B
Id''B D
,''D E
Name''F J
=''K L

ingredient''M W
.''W X
Name''X \
}''] ^
)''^ _
;''_ `
}(( 
return)) 
product)) 
;)) 
}++ 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
GetProductDto,,& 3
>,,3 4
>,,4 5
GetAll,,6 <
(,,< =
),,= >
{-- 	
List.. 
<.. 
Product.. 
>.. 
products.. "
=..# $
await..% *
_context..+ 3
...3 4
Products..4 <
...< =
ToListAsync..= H
(..H I
)..I J
;..J K
List// 
<// 
GetProductDto// 
>// 
productDtos//  +
=//, -
new//. 1
List//2 6
<//6 7
GetProductDto//7 D
>//D E
(//E F
)//F G
;//G H
foreach00 
(00 
Product00 
product00 $
in00% '
products00( 0
)000 1
{11 
List22 
<22 
int22 
>22 
ingredientsId22 '
=22( )
await22* /
_context220 8
.228 9)
IngredientFromProductProducts229 V
.33 
Where33 
(33 
p33 
=>33 
p33  
.33  !

ProductsId33! +
==33, .
product33/ 6
.336 7
Id337 9
)339 :
.44 
Select44 
(44 
p44 
=>44 
p44  !
.44! "
IngredientsId44" /
)44/ 0
.55 
ToListAsync55 
(55  
)55  !
;55! "
GetProductDto66 

productDto66 (
=66) *
new66+ .
GetProductDto66/ <
(66< =
)66= >
{77 
Id88 
=88 
product88  
.88  !
Id88! #
,88# $
Name99 
=99 
product99 "
.99" #
Name99# '
,99' (
Description:: 
=::  !
product::" )
.::) *
Description::* 5
,::5 6
Price;; 
=;; 
product;; #
.;;# $
Price;;$ )
,;;) *
Discount<< 
=<< 
product<< &
.<<& '
Discount<<' /
}== 
;== 
foreach>> 
(>> 
int>> 
i>> 
in>> !
ingredientsId>>" /
)>>/ 0
{?? "
IngredientsFromProduct@@ *

ingredient@@+ 5
=@@6 7
await@@8 =
_context@@> F
.AA #
IngredientsFromProductsAA 0
.BB 
	FindAsyncBB "
(BB" #
iBB# $
)BB$ %
;BB% &

productDtoCC 
.CC 
IngredientsCC *
.DD 
AddDD 
(DD 
newDD  
GetIngredientDtoDD! 1
(DD1 2
)DD2 3
{DD4 5
IdDD6 8
=DD9 :

ingredientDD; E
.DDE F
IdDDF H
,DDH I
NameDDJ N
=DDO P

ingredientDDQ [
.DD[ \
NameDD\ `
}DDa b
)DDb c
;DDc d
}EE 
productDtosFF 
.FF 
AddFF 
(FF  

productDtoFF  *
)FF* +
;FF+ ,
}GG 
returnHH 
productDtosHH 
;HH 
}II 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 
CreateProductJJ  -
(JJ- .
ProductJJ. 5
productJJ6 =
)JJ= >
{KK 	
boolLL 
existsProductLL 
=LL  
_contextLL! )
.LL) *
ProductsLL* 2
.LL2 3
AnyLL3 6
(LL6 7
pLL7 8
=>LL9 ;
pLL< =
.LL= >
IdLL> @
==LLA C
productLLD K
.LLK L
IdLLL N
)LLN O
;LLO P
ifMM 
(MM 
!MM 
existsProductMM 
)MM 
{NN 
_contextOO 
.OO 
ProductsOO !
.OO! "
AddOO" %
(OO% &
productOO& -
)OO- .
;OO. /
awaitPP 
_contextPP 
.PP 
SaveChangesAsyncPP /
(PP/ 0
)PP0 1
;PP1 2
returnQQ 
trueQQ 
;QQ 
}RR 
returnSS 
falseSS 
;SS 
}TT 	
}UU 
}VV œ
TC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTOs\GetIngredientDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
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
}' (
} 
}		 ï
QC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTOs\GetProductDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
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
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
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
double 
Discount 
{  
get! $
;$ %
set& )
;) *
}+ ,
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
} 
} ˙

NC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTOs\GetShopDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
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
GetShopIngredientDto		# 7
>		7 8
(		8 9
)		9 :
;		: ;
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
public 
List 
<  
GetShopIngredientDto (
>( )
Ingredients* 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} â
XC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTOs\GetShopIngredientDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
{ 
public 

class  
GetShopIngredientDto %
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
}		 
}

 •
RC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTO\AddCharacterDto.cs
	namespace 	
HotDiggetyDog2
 
. 
DTOs 
{ 
public 

class 
AddCharacterDto  
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
}' (
=) *
$str+ 2
;2 3
public 
int 
	HitPoints 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$num- 0
;0 1
public 
int 
Strength 
{ 
get !
;! "
set# &
;& '
}( )
=* +
$num, .
;. /
public		 
int		 
Defense		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
$num		+ -
;		- .
public

 
int

 
Intelligence

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
$num

0 2
;

2 3
} 
} ﬂ
WC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTO\AddCharacterSkillDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
{ 
public 

class  
AddCharacterSkillDto %
{ 
public 
int 
CharacterId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
SkillId 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ö
NC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTO\AddSkillDto.cs
	namespace 	
HotDiggetyDog2
 
. 
DTOs 
{ 
public 

class 
AddSkillDto 
{ 
} 
} Û
RC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTO\GetCharacterDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
{ 
public 

class 
GetCharacterDto  
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
$str		+ 2
;		2 3
public

 
int

 
	HitPoints

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
=

+ ,
$num

- 0
;

0 1
public 
int 
Strength 
{ 
get !
;! "
set# &
;& '
}( )
=* +
$num, .
;. /
public 
int 
Defense 
{ 
get  
;  !
set" %
;% &
}' (
=) *
$num+ -
;- .
public 
int 
Intelligence 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$num0 2
;2 3
public 
List 
< 
GetSkillDto 
>  
Skills! '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} »
NC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\DTO\GetSkillDto.cs
	namespace 	
HotDiggetyDog
 
. 
DTOs 
{ 
public 

class 
GetSkillDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Damage 
{ 
get 
;  
set! $
;$ %
}& '
} 
} â
TC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\Acquisitions.cs
	namespace 	
HotDiggetyDog2
 
. 
Entities !
{ 
public 

class 
Acquisition 
{ 
public 
Guid 
	InvoiceId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
ShopId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
int		 
	ProductId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
Quantity

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
} 
} ∂
RC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\BaseEntity.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

abstract 
class 

BaseEntity $
{ 
} 
} Ù
dC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\IngredientFromProductProduct.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class (
IngredientFromProductProduct 5
{ 
public		 
int		 
IngredientsId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 

ProductsId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
[ 	

JsonIgnore	 
] 
public 
virtual "
IngredientsFromProduct -
Ingredients. 9
{: ;
get< ?
;? @
setA D
;D E
}F G
[ 	

JsonIgnore	 
] 
public 
virtual 
Product 
Products '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ı	
^C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\IngredientFromShopShop.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class "
IngredientFromShopShop /
{ 
public		 
int		 
IngredientsId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 
ShopsId

 
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
' (
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
[ 	

JsonIgnore	 
] 
public 
virtual 
IngredientsFromShop *
Ingredients+ 6
{7 8
get9 <
;< =
set> A
;A B
}C D
[ 	

JsonIgnore	 
] 
public 
virtual 
Shop 
Shops !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ¿

^C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\IngredientsFromProduct.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class "
IngredientsFromProduct /
{		 
public

 "
IngredientsFromProduct

 %
(

% &
)

& '
{ 	)
IngredientFromProductProducts )
=* +
new, /
HashSet0 7
<7 8(
IngredientFromProductProduct8 T
>T U
(U V
)V W
;W X
} 	
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
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
<" #(
IngredientFromProductProduct# ?
>? @)
IngredientFromProductProductsA ^
{_ `
geta d
;d e
setf i
;i j
}k l
} 
} ∏
[C:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\IngredientsFromShop.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class 
IngredientsFromShop ,
{		 
public

 
IngredientsFromShop

 "
(

" #
)

# $
{ 	#
IngredientFromShopShops #
=$ %
new& )
HashSet* 1
<1 2"
IngredientFromShopShop2 H
>H I
(I J
)J K
;K L
} 	
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
virtual 
ICollection "
<" #"
IngredientFromShopShop# 9
>9 :#
IngredientFromShopShops; R
{S T
getU X
;X Y
setZ ]
;] ^
}_ `
} 
} ˝
OC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\Invoice.cs
	namespace 	
HotDiggetyDog2
 
. 
Entities !
{ 
public 

class 
Invoice 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
int 
ShopId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
float		 

TotalPrice		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
DateTime

 
Date

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
} 
} ±
OC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\Product.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class 
Product  
{		 
public

 
Product

 
(

 
)

 
{ 	)
IngredientFromProductProducts )
=* +
new, /
HashSet0 7
<7 8(
IngredientFromProductProduct8 T
>T U
(U V
)V W
;W X
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
double 
Discount 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	

JsonIgnore	 
] 
public 
virtual 
ICollection "
<" #(
IngredientFromProductProduct# ?
>? @)
IngredientFromProductProductsA ^
{_ `
geta d
;d e
setf i
;i j
}k l
} 
} ¨
LC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\Shop.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class 
Shop 
{		 
public

 
Shop

 
(

 
)

 
{ 	#
IngredientFromShopShops #
=$ %
new& )
HashSet* 1
<1 2"
IngredientFromShopShop2 H
>H I
(I J
)J K
;K L
} 	
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
double 
	LocationX 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
	LocationY 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
virtual 
ICollection "
<" #"
IngredientFromShopShop# 9
>9 :#
IngredientFromShopShops; R
{S T
getU X
;X Y
setZ ]
;] ^
}_ `
} 
} ¶
LC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Entities\User.cs
	namespace 	
HotDiggetyDog
 
. 
Entities  
{ 
public 

partial 
class 
User 
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ∫
RC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Helpers\AppSettings.cs
	namespace 	
HotDiggetyDog
 
. 
Helpers 
{ 
public 

class 
AppSettings 
{ 
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ”'
UC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Helpers\AuthMiddleware.cs
	namespace 	
HotDiggetyDog
 
. 
Helpers 
{ 
public 

class 
AuthMiddleware 
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
AuthMiddleware 
( 
RequestDelegate -
next. 2
,2 3
IOptions4 <
<< =
AppSettings= H
>H I
appSettingsJ U
)U V
{ 	
_next 
= 
next 
; 
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
,4 5
IUserService6 B
userServiceC N
)N O
{ 	
var 
token 
= 
context 
.  
Request  '
.' (
Headers( /
[/ 0
$str0 ?
]? @
.@ A
FirstOrDefaultA O
(O P
)P Q
?Q R
.R S
SplitS X
(X Y
$strY \
)\ ]
.] ^
Last^ b
(b c
)c d
;d e
if 
( 
token 
!= 
null 
) 
attachUserToContext #
(# $
context$ +
,+ ,
userService- 8
,8 9
token: ?
)? @
;@ A
await!! 
_next!! 
(!! 
context!! 
)!!  
;!!  !
}"" 	
private$$ 
void$$ 
attachUserToContext$$ (
($$( )
HttpContext$$) 4
context$$5 <
,$$< =
IUserService$$> J
userService$$K V
,$$V W
string$$X ^
token$$_ d
)$$d e
{%% 	
try&& 
{'' 
var(( 
tokenHandler((  
=((! "
new((# &#
JwtSecurityTokenHandler((' >
(((> ?
)((? @
;((@ A
var)) 
key)) 
=)) 
Encoding)) "
.))" #
ASCII))# (
.))( )
GetBytes))) 1
())1 2
_appSettings))2 >
.))> ?
Secret))? E
)))E F
;))F G
tokenHandler** 
.** 
ValidateToken** *
(*** +
token**+ 0
,**0 1
new**2 5%
TokenValidationParameters**6 O
{++ $
ValidateIssuerSigningKey,, ,
=,,- .
true,,/ 3
,,,3 4
IssuerSigningKey-- $
=--% &
new--' * 
SymmetricSecurityKey--+ ?
(--? @
key--@ C
)--C D
,--D E
ValidateIssuer.. "
=..# $
false..% *
,..* +
ValidateAudience// $
=//% &
false//' ,
,//, -
	ClockSkew11 
=11 
TimeSpan11  (
.11( )
Zero11) -
}22 
,22 
out22 
SecurityToken22 $
validatedToken22% 3
)223 4
;224 5
var44 
jwtToken44 
=44 
(44  
JwtSecurityToken44  0
)440 1
validatedToken441 ?
;44? @
var55 
userId55 
=55 
Guid55 !
.55! "
Parse55" '
(55' (
jwtToken55( 0
.550 1
Claims551 7
.557 8
First558 =
(55= >
x55> ?
=>55@ B
x55C D
.55D E
Type55E I
==55J L
$str55M Q
)55Q R
.55R S
Value55S X
)55X Y
;55Y Z
context88 
.88 
Items88 
[88 
$str88 $
]88$ %
=88& '
userService88( 3
.883 4
GetById884 ;
(88; <
userId88< B
)88B C
;88C D
}:: 
catch;; 
(;; 
	Exception;; 
e;; 
);; 
{<< 
}?? 
}@@ 	
}AA 
publicDD 

staticDD 
classDD $
AuthMiddlewareExtensionsDD 0
{EE 
publicFF 
staticFF 
IApplicationBuilderFF )
UseAuthMiddlewareFF* ;
(FF; <
thisFF< @
IApplicationBuilderFFA T
builderFFU \
)FF\ ]
{GG 	
returnHH 
builderHH 
.HH 
UseMiddlewareHH (
<HH( )
AuthMiddlewareHH) 7
>HH7 8
(HH8 9
)HH9 :
;HH: ;
}II 	
}JJ 
}KK •
YC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Helpers\AuthorizeAttribute.cs
	namespace 	
HotDiggetyDog
 
. 
Helpers 
{ 
[		 
AttributeUsage		 
(		 
AttributeTargets		 $
.		$ %
Class		% *
|		+ ,
AttributeTargets		- =
.		= >
Method		> D
)		D E
]		E F
public

 

class

 
AuthorizeAttribute

 #
:

$ %
	Attribute

& /
,

/ 0 
IAuthorizationFilter

1 E
{ 
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
var 
user 
= 
( 
User 
) 
context $
.$ %
HttpContext% 0
.0 1
Items1 6
[6 7
$str7 =
]= >
;> ?
if 
( 
user 
== 
null 
|| 
user  $
.$ %
Role% )
!=* ,
$str- 4
)4 5
{ 
context 
. 
Result 
=  
new! $

JsonResult% /
(/ 0
new0 3
{4 5
message6 =
=> ?
$str@ N
}O P
)P Q
{R S

StatusCodeT ^
=_ `
StatusCodesa l
.l m"
Status401Unauthorized	m Ç
}
É Ñ
;
Ñ Ö
} 
} 	
} 
} Á"
TC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Helpers\JwtMiddleware.cs
	namespace 	
HotDiggetyDog
 
. 
Helpers 
{ 
public 

class 
JwtMiddleware 
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
JwtMiddleware 
( 
RequestDelegate ,
next- 1
,1 2
IOptions3 ;
<; <
AppSettings< G
>G H
appSettingsI T
)T U
{ 	
_next 
= 
next 
; 
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
,4 5
IUserService6 B
userServiceC N
)N O
{ 	
var 
token 
= 
context 
.  
Request  '
.' (
Headers( /
[/ 0
$str0 ?
]? @
.@ A
FirstOrDefaultA O
(O P
)P Q
?Q R
.R S
SplitS X
(X Y
$strY \
)\ ]
.] ^
Last^ b
(b c
)c d
;d e
if 
( 
token 
!= 
null 
) 
attachUserToContext #
(# $
context$ +
,+ ,
userService- 8
,8 9
token: ?
)? @
;@ A
await 
_next 
( 
context 
)  
;  !
}   	
private"" 
void"" 
attachUserToContext"" (
(""( )
HttpContext"") 4
context""5 <
,""< =
IUserService""> J
userService""K V
,""V W
string""X ^
token""_ d
)""d e
{## 	
try$$ 
{%% 
var&& 
tokenHandler&&  
=&&! "
new&&# &#
JwtSecurityTokenHandler&&' >
(&&> ?
)&&? @
;&&@ A
var'' 
key'' 
='' 
Encoding'' "
.''" #
ASCII''# (
.''( )
GetBytes'') 1
(''1 2
_appSettings''2 >
.''> ?
Secret''? E
)''E F
;''F G
tokenHandler(( 
.(( 
ValidateToken(( *
(((* +
token((+ 0
,((0 1
new((2 5%
TokenValidationParameters((6 O
{)) $
ValidateIssuerSigningKey** ,
=**- .
true**/ 3
,**3 4
IssuerSigningKey++ $
=++% &
new++' * 
SymmetricSecurityKey+++ ?
(++? @
key++@ C
)++C D
,++D E
ValidateIssuer,, "
=,,# $
false,,% *
,,,* +
ValidateAudience-- $
=--% &
false--' ,
,--, -
	ClockSkew// 
=// 
TimeSpan//  (
.//( )
Zero//) -
}00 
,00 
out00 
SecurityToken00 $
validatedToken00% 3
)003 4
;004 5
var22 
jwtToken22 
=22 
(22  
JwtSecurityToken22  0
)220 1
validatedToken221 ?
;22? @
var33 
userId33 
=33 
Guid33 !
.33! "
Parse33" '
(33' (
jwtToken33( 0
.330 1
Claims331 7
.337 8
First338 =
(33= >
x33> ?
=>33@ B
x33C D
.33D E
Type33E I
==33J L
$str33M Q
)33Q R
.33R S
Value33S X
)33X Y
;33Y Z
context66 
.66 
Items66 
[66 
$str66 $
]66$ %
=66& '
userService66( 3
.663 4
GetById664 ;
(66; <
userId66< B
)66B C
;66C D
}77 
catch88 
{99 
}<< 
}== 	
}>> 
}?? Œ
YC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Models\AuthenticateRequest.cs
	namespace 	
HotDiggetyDog
 
. 
Models 
{ 
public 

class 
AuthenticateRequest $
{ 
[ 	
Required	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
[

 	
Required

	 
]

 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ”	
ZC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Models\AuthenticateResponse.cs
	namespace 	
HotDiggetyDog
 
. 
Models 
{ 
public 

class  
AuthenticateResponse %
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
Username		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Token

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public  
AuthenticateResponse #
(# $
User$ (
user) -
,- .
string/ 5
token6 ;
); <
{ 	
Id 
= 
user 
. 
Id 
; 
Username 
= 
user 
. 
Username $
;$ %
Token 
= 
token 
; 
} 	
} 
} ˙
UC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Models\ServiceResponse.cs
	namespace 	
HotDiggetyDog
 
. 
Models 
{ 
public 

class 
ServiceResponse  
<  !
T! "
>" #
{ 
public 
T 
Data 
{ 
get 
; 
set  
;  !
}" #
public 
bool 
Success 
{ 
get !
;! "
set# &
;& '
}( )
=* +
true, 0
;0 1
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
;2 3
}		 
}

 ¢

FC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Program.cs
	namespace 	
HotDiggetyDog2
 
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} Ô'
SC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Services\UserService.cs
	namespace 	
HotDiggetyDog
 
. 
Services  
{ 
public 

	interface 
IUserService !
{  
AuthenticateResponse 
Authenticate )
() *
AuthenticateRequest* =
model> C
)C D
;D E
User 
GetById 
( 
Guid 
id 
) 
; 
} 
public 

class 
UserService 
: 
IUserService )
{ 
private 
readonly 
DataContext $
_dataContext% 1
;1 2
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
UserService 
( 
DataContext &
dataContext' 2
,2 3
IOptions4 <
<< =
AppSettings= H
>H I
appSettingsJ U
)U V
{ 	
_dataContext 
= 
dataContext &
;& '
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
public  
AuthenticateResponse #
Authenticate$ 0
(0 1
AuthenticateRequest1 D
modelE J
)J K
{ 	
var 
user 
= 
_dataContext #
.# $
Users$ )
.) *
Where* /
(/ 0
s0 1
=>2 4
s5 6
.6 7
Username7 ?
==@ B
modelC H
.H I
UsernameI Q
)S T
.T U
FirstOrDefaultU c
(c d
)d e
;e f
if$$ 
($$ 
user$$ 
==$$ 
null$$ 
||$$ 
!$$  !
BCrypt$$! '
.$$' (
Net$$( +
.$$+ ,
BCrypt$$, 2
.$$2 3
Verify$$3 9
($$9 :
model$$: ?
.$$? @
Password$$@ H
,$$H I
user$$I M
.$$M N
Password$$N V
)$$W X
)$$X Y
return$$Z `
null$$a e
;$$e f
var'' 
token'' 
='' 
generateJwtToken'' (
(''( )
user'') -
)''- .
;''. /
return)) 
new))  
AuthenticateResponse)) +
())+ ,
user)), 0
,))0 1
token))2 7
)))7 8
;))8 9
}** 	
private++ 
string++ 
generateJwtToken++ '
(++' (
User++( ,
user++- 1
)++1 2
{,, 	
var.. 
tokenHandler.. 
=.. 
new.. "#
JwtSecurityTokenHandler..# :
(..: ;
)..; <
;..< =
var// 
key// 
=// 
Encoding// 
.// 
ASCII// $
.//$ %
GetBytes//% -
(//- .
_appSettings//. :
.//: ;
Secret//; A
)//A B
;//B C
var00 
tokenDescriptor00 
=00  !
new00" %#
SecurityTokenDescriptor00& =
{11 
Subject22 
=22 
new22 
ClaimsIdentity22 ,
(22, -
new22- 0
[220 1
]221 2
{223 4
new225 8
Claim229 >
(22> ?
$str22? C
,22C D
user22E I
.22I J
Id22J L
.22L M
ToString22M U
(22U V
)22V W
)22W X
}22Y Z
)22Z [
,22[ \
Expires33 
=33 
DateTime33 "
.33" #
UtcNow33# )
.33) *
AddDays33* 1
(331 2
$num332 3
)333 4
,334 5
SigningCredentials44 "
=44# $
new44% (
SigningCredentials44) ;
(44; <
new44< ? 
SymmetricSecurityKey44@ T
(44T U
key44U X
)44X Y
,44Y Z
SecurityAlgorithms44[ m
.44m n 
HmacSha256Signature	44n Å
)
44Å Ç
}55 
;55 
var66 
token66 
=66 
tokenHandler66 $
.66$ %
CreateToken66% 0
(660 1
tokenDescriptor661 @
)66@ A
;66A B
return77 
tokenHandler77 
.77  

WriteToken77  *
(77* +
token77+ 0
)770 1
;771 2
}88 	
public99 
User99 
GetById99 
(99 
Guid99  
id99! #
)99# $
{:: 	
return;; 
_dataContext;; 
.;;  
Users;;  %
.;;% &
Find;;& *
(;;* +
id;;+ -
);;- .
;;;. /
}<< 	
}?? 
}@@ á(
FC:\Users\Andrei\Desktop\HDD repo new\back-end\HotDiggetyDog\Startup.cs
	namespace 	
HotDiggetyDog
 
{ 
public 

class 
Startup 
{ 
private 
readonly 
string "
MyAllowSpecificOrigins  6
=7 8
$str9 R
;R S
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddDbContext !
<! "
DataContext" -
>- .
(. /
options/ 6
=>7 9
{: ;
options< C
.C D
	UseSqliteD M
(M N
configurationN [
.[ \
GetConnectionString\ o
(o p
$strp 
)	 Ä
)
Ä Å
;
Å Ç
}
É Ñ
)
Ñ Ö
;
Ö Ü
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
	Configure 
< 
AppSettings *
>* +
(+ ,
configuration, 9
.9 :

GetSection: D
(D E
$strE R
)R S
)S T
;T U
services 
. 
AddTransient !
<! "
IProductRepository" 4
,4 5
ProductRepository6 G
>G H
(H I
)I J
;J K
services   
.   
AddTransient   !
<  ! ",
 IIngredientFromProductRepository  " B
,  B C+
IngredientFromProductRepository  D c
>  c d
(  d e
)  e f
;  f g
services!! 
.!! 
AddTransient!! !
<!!! "(
IIngredientProductRepository!!" >
,!!> ?'
IngredientProductRepository!!@ [
>!![ \
(!!\ ]
)!!] ^
;!!^ _
services## 
.## 
	AddScoped## 
<## 
IUserService## +
,##+ ,
UserService##- 8
>##8 9
(##9 :
)##: ;
;##; <
services$$ 
.$$ 
AddCors$$ 
($$ 
options$$ $
=>$$% '
{%% 
options&& 
.&& 
	AddPolicy&& !
(&&! ""
MyAllowSpecificOrigins&&" 8
,&&8 9
builder&&: A
=>&&B D
{'' 
builder)) 
.)) 
AllowAnyOrigin)) *
())* +
)))+ ,
.)), -
AllowAnyHeader))- ;
()); <
)))< =
.))= >
AllowAnyMethod))> L
())L M
)))M N
;))N O
}** 
)** 
;** 
}++ 
)++ 
;++ 
services// 
.// 
AddSwaggerGen// "
(//" #
)//# $
;//$ %
}66 	
public99 
void99 
	Configure99 
(99 
IApplicationBuilder99 1
app992 5
,995 6
IWebHostEnvironment997 J
env99K N
)99N O
{:: 	
if;; 
(;; 
env;; 
.;; 
IsDevelopment;; !
(;;! "
);;" #
);;# $
{<< 
app== 
.== %
UseDeveloperExceptionPage== -
(==- .
)==. /
;==/ 0
}>> 
app?? 
.?? 

UseSwagger?? 
(?? 
)?? 
;?? 
appCC 
.CC 
UseSwaggerUICC 
(CC 
cCC 
=>CC !
{DD 
cEE 
.EE 
SwaggerEndpointEE !
(EE! "
$strEE" <
,EE< =
$strEE> I
)EEI J
;EEJ K
}FF 
)FF 
;FF 
appGG 
.GG 
UseCorsGG 
(GG "
MyAllowSpecificOriginsGG .
)GG. /
;GG/ 0
appHH 
.HH 

UseRoutingHH 
(HH 
)HH 
;HH 
appJJ 
.JJ 
UseAuthorizationJJ  
(JJ  !
)JJ! "
;JJ" #
appLL 
.LL 
UseAuthMiddlewareLL !
(LL! "
)LL" #
;LL# $
appNN 
.NN 
UseEndpointsNN 
(NN 
	endpointsNN &
=>NN' )
{OO 
	endpointsPP 
.PP 
MapControllersPP (
(PP( )
)PP) *
;PP* +
}QQ 
)QQ 
;QQ 
}SS 	
}TT 
}UU 