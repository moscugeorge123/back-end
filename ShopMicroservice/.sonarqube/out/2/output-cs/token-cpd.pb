À%
aC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Persistance\Context\ShopContext.cs
	namespace 	
Persistance
 
. 
Context 
{ 
public 

partial 
class 
ShopContext $
:% &
	DbContext' 0
,0 1
IApplicationContext2 E
{		 
public

 
ShopContext
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
ShopContext 
( 
DbContextOptions +
<+ ,
ShopContext, 7
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
public 
virtual 
DbSet 
< 
IngredientsFromShop 0
>0 1
Ingredients2 =
{> ?
get@ C
;C D
setE H
;H I
}J K
public 
virtual 
DbSet 
< "
IngredientFromShopShop 3
>3 4
JoinIngredientShop5 G
{H I
getJ M
;M N
setO R
;R S
}T U
public 
virtual 
DbSet 
< 
Shop !
>! "
Shops# (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
async 
Task 
< 
int 
> 
SaveChangesAsync /
(/ 0
)0 1
{ 	
return 
await 
base 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
} 	
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
if 
( 
! 
optionsBuilder 
.  
IsConfigured  ,
), -
{   
optionsBuilder"" 
."" 
	UseSqlite"" (
(""( )
$str"") C
)""C D
;""D E
}## 
}$$ 	
	protected&& 
override&& 
void&& 
OnModelCreating&&  /
(&&/ 0
ModelBuilder&&0 <
modelBuilder&&= I
)&&I J
{'' 	
modelBuilder** 
.** 
Entity** 
<**  "
IngredientFromShopShop**  6
>**6 7
(**7 8
entity**8 >
=>**? A
{++ 
entity,, 
.,, 
HasKey,, 
(,, 
e,, 
=>,,  "
new,,# &
{,,' (
e,,) *
.,,* +
IngredientsId,,+ 8
,,,8 9
e,,: ;
.,,; <
ShopsId,,< C
},,D E
),,E F
;,,F G
entity.. 
... 
ToTable.. 
(.. 
$str.. 7
)..7 8
;..8 9
entity00 
.00 
HasIndex00 
(00  
e00  !
=>00" $
e00% &
.00& '
ShopsId00' .
,00. /
$str000 S
)00S T
;00T U
entity22 
.22 
HasOne22 
(22 
d22 
=>22  "
d22# $
.22$ %
Ingredients22% 0
)220 1
.33 
WithMany33 
(33 
p33 
=>33  "
p33# $
.33$ %#
IngredientFromShopShops33% <
)33< =
.44 
HasForeignKey44 "
(44" #
d44# $
=>44% '
d44( )
.44) *
IngredientsId44* 7
)447 8
;448 9
entity66 
.66 
HasOne66 
(66 
d66 
=>66  "
d66# $
.66$ %
Shops66% *
)66* +
.77 
WithMany77 
(77 
p77 
=>77  "
p77# $
.77$ %#
IngredientFromShopShops77% <
)77< =
.88 
HasForeignKey88 "
(88" #
d88# $
=>88% '
d88( )
.88) *
ShopsId88* 1
)881 2
;882 3
}99 
)99 
;99 
modelBuilder== 
.== 
Entity== 
<==  
IngredientsFromShop==  3
>==3 4
(==4 5
entity==5 ;
=>==< >
{>> 
entity?? 
.?? 
ToTable?? 
(?? 
$str?? 4
)??4 5
;??5 6
}@@ 
)@@ 
;@@ 
}BB 	
}DD 
}EE ∏

[C:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Persistance\PersistenceDI.cs
	namespace 	
Persistance
 
{ 
public		 

static		 
class		 
PersistenceDI		 %
{

 
public 
static 
void 
AddPersistence )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
AddDbContext !
<! "
ShopContext" -
>- .
(. /
options/ 6
=>7 9
options: A
.A B
	UseSqliteB K
(K L
configurationL Y
.Y Z
GetConnectionStringZ m
(m n
$strn }
)} ~
)~ 
)	 Ä
;
Ä Å
services 
. 
	AddScoped 
< 
IApplicationContext 2
>2 3
(3 4
provider4 <
=>= ?
provider@ H
.H I

GetServiceI S
<S T
ShopContextT _
>_ `
(` a
)a b
)b c
;c d
} 	
} 
} ˚
pC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Persistance\Repository\v1\IngredientRepository.cs
	namespace 	
Persistance
 
. 

Repository  
.  !
v1! #
{ 
public 

class  
IngredientRepository %
:& '

Repository( 2
<2 3
IngredientsFromShop3 F
>F G
,G H!
IIngredientRepositoryI ^
{ 
public		  
IngredientRepository		 #
(		# $
ShopContext		$ /
shopContext		0 ;
)		; <
:		= >
base		? C
(		C D
shopContext		D O
)		O P
{

 	
} 	
} 
} »5
fC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Persistance\Repository\v1\Repository.cs
	namespace 	
Persistance
 
. 

Repository  
.  !
v1! #
{ 
public		 

class		 

Repository		 
<		 
TEntity		 #
>		# $
:		% &
IRepository		' 2
<		2 3
TEntity		3 :
>		: ;
where		< A
TEntity		B I
:		J K
class		L Q
,		Q R
new		S V
(		V W
)		W X
{

 
private 
readonly 
ShopContext $
shopContext% 0
;0 1
public 

Repository 
( 
ShopContext %
shopContext& 1
)1 2
{ 	
this 
. 
shopContext 
= 
shopContext *
;* +
} 	
public 
async 
Task 
< 
TEntity !
>! "
AddAsync# +
(+ ,
TEntity, 3
entity4 :
): ;
{ 	
if 
( 
entity 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
entity7 =
)= >
)> ?
;? @
} 
try 
{ 
await 
shopContext !
.! "
AddAsync" *
(* +
entity+ 1
)1 2
;2 3
await 
shopContext !
.! "
SaveChangesAsync" 2
(2 3
)3 4
;4 5
return 
entity 
; 
} 
catch 
( 
	Exception 
ex 
)  
{ 
throw 
new 
ArgumentException +
(+ ,
ex, .
.. /
Message/ 6
,6 7
nameof7 =
(= >
entity> D
)D E
)E F
;F G
}!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
TEntity$$ !
>$$! "
DeleteAsync$$# .
($$. /
TEntity$$/ 6
entity$$7 =
)$$= >
{%% 	
if&& 
(&& 
entity&& 
==&& 
null&& 
)&& 
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
nameof((0 6
(((6 7
entity((7 =
)((= >
)((> ?
;((? @
}** 
try++ 
{,, 
shopContext-- 
.-- 
Remove-- "
(--" #
entity--# )
)--) *
;--* +
await.. 
shopContext.. !
...! "
SaveChangesAsync.." 2
(..2 3
)..3 4
;..4 5
return// 
entity// 
;// 
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
throw33 
new33 
ArgumentException33 +
(33+ ,
ex33, .
.33. /
Message33/ 6
,336 7
nameof337 =
(33= >
entity33> D
)33D E
)33E F
;33F G
}55 
}66 	
public88 
IEnumerable88 
<88 
TEntity88 "
>88" #
GetAll88$ *
(88* +
)88+ ,
{99 	
try:: 
{;; 
return<< 
shopContext<< "
.<<" #
Set<<# &
<<<& '
TEntity<<' .
><<. /
(<</ 0
)<<0 1
;<<1 2
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
throw@@ 
new@@ *
CannotUnloadAppDomainException@@ 8
(@@8 9
$"@@9 ;(
Couldn't retrieve entities: @@; W
{@@W X
ex@@X Z
.@@Z [
Message@@[ b
}@@b c
"@@c d
)@@d e
;@@e f
}AA 
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
TEntityDD !
>DD! "
GetByIdDD# *
(DD* +
intDD+ .
idDD/ 1
)DD1 2
{EE 	
ifFF 
(FF 
idFF 
==FF 
$numFF 
)FF 
{GG 
throwHH 
newHH 
ArgumentExceptionHH +
(HH+ ,
$strHH, 5
,HH5 6
nameofHH6 <
(HH< =
idHH= ?
)HH? @
)HH@ A
;HHA B
}JJ 
tryKK 
{LL 
returnMM 
awaitMM 
shopContextMM (
.MM( )
	FindAsyncMM) 2
<MM2 3
TEntityMM3 :
>MM: ;
(MM; <
idMM< >
)MM> ?
;MM? @
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
throwQQ 
newQQ *
CannotUnloadAppDomainExceptionQQ 8
(QQ8 9
$"QQ9 ;(
Couldn't retrieve entities: QQ; W
{QQW X
exQQX Z
.QQZ [
MessageQQ[ b
}QQb c
"QQc d
)QQd e
;QQe f
}RR 
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
TEntityVV !
>VV! "
UpdateAsyncVV# .
(VV. /
TEntityVV/ 6
entityVV7 =
)VV= >
{WW 	
ifXX 
(XX 
entityXX 
==XX 
nullXX 
)XX 
{YY 
throwZZ 
newZZ !
ArgumentNullExceptionZZ /
(ZZ/ 0
nameofZZ0 6
(ZZ6 7
entityZZ7 =
)ZZ= >
)ZZ> ?
;ZZ? @
}\\ 
try]] 
{^^ 
shopContext__ 
.__ 
Update__ "
(__" #
entity__# )
)__) *
;__* +
await`` 
shopContext`` !
.``! "
SaveChangesAsync``" 2
(``2 3
)``3 4
;``4 5
returnaa 
entityaa 
;aa 
}bb 
catchcc 
(cc 
	Exceptioncc 
excc 
)cc  
{dd 
throwee 
newee 
ArgumentExceptionee +
(ee+ ,
exee, .
.ee. /
Messageee/ 6
,ee6 7
nameofee7 =
(ee= >
entityee> D
)eeD E
)eeE F
;eeF G
}gg 
}hh 	
}ii 
}jj ‘
jC:\Users\Andrei\Desktop\HDD repo new\back-end\ShopMicroservice\Persistance\Repository\v1\ShopRepository.cs
	namespace 	
Persistance
 
. 

Repository  
.  !
v1! #
{ 
public 

class 
ShopRepository 
:  !

Repository" ,
<, -
Shop- 1
>1 2
,2 3
IShopRepository4 C
{ 
public		 
ShopRepository		 
(		 
ShopContext		 )
shopContext		* 5
)		5 6
:		7 8
base		9 =
(		= >
shopContext		> I
)		I J
{

 	
} 	
} 
} 