¨
eC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Persistance\Context\ShopContext.cs
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
< "
IngredientFromShopShop 3
>3 4
JoinIngredientShop5 G
{H I
getJ M
;M N
setO R
;R S
}T U
public 
async 
Task 
< 
int 
> 
SaveChangesAsync /
(/ 0
)0 1
{ 	
return 
await 
base 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
} 	
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
modelBuilder(( 
.(( 
Entity(( 
<((  "
IngredientFromShopShop((  6
>((6 7
(((7 8
entity((8 >
=>((? A
{)) 
entity** 
.** 
HasKey** 
(** 
e** 
=>**  "
new**# &
{**' (
e**) *
.*** +
IngredientsId**+ 8
,**8 9
e**: ;
.**; <
ShopsId**< C
}**D E
)**E F
;**F G
entity,, 
.,, 
ToTable,, 
(,, 
$str,, 7
),,7 8
;,,8 9
entity.. 
... 
HasIndex.. 
(..  
e..  !
=>.." $
e..% &
...& '
ShopsId..' .
,... /
$str..0 S
)..S T
;..T U
}// 
)// 
;// 
}33 	
}55 
}66 º

_C:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\Persistance\PersistenceDI.cs
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
} 