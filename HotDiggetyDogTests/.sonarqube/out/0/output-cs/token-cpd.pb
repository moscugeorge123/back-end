�%
VC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Controllers\UsersController.cs
	namespace 	

 
. 
Controllers #
{
[ 

] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
DataContext $
context% ,
;, -
private 
IUserService 
_userService )
;) *
public 
UsersController 
( 
DataContext *
context+ 2
,2 3
IUserService3 ?
userService@ K
)K L
{ 	
this 
. 
context 
= 
context "
;" #
_userService 
= 
userService &
;& '
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 

Authenticate )
() *
AuthenticateRequest* =
model> C
)C D
{ 	
var 
response 
= 
_userService '
.' (
Authenticate( 4
(4 5
model5 :
): ;
;; <
if 
( 
response 
== 
null  
)  !
return   

BadRequest   !
(  ! "
new  " %
{  & '
message  ( /
=  0 1
$str  2 U
}  V W
)  W X
;  X Y
return"" 
Ok"" 
("" 
response"" 
)"" 
;""  
}## 	
[$$ 	
HttpGet$$	 
]$$ 
public%% 
async%% 
Task%% 
<%% 
ActionResult%% &
<%%& '
IEnumerable%%' 2
<%%2 3
User%%3 7
>%%7 8
>%%8 9
>%%9 :
Get%%; >
(%%> ?
)%%? @
{&& 	
return'' 
await'' 
context''  
.''  !
Users''! &
.''& '
ToListAsync''' 2
(''2 3
)''3 4
;''4 5
}(( 	
[** 	
HttpGet**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
User++' +
>+++ ,
>++, -
Get++- 0
(++0 1
Guid++1 5
Id++6 8
)++8 9
{,, 	
var-- 
user-- 
=-- 
await-- 
context-- $
.--$ %
Users--% *
.--* +
	FindAsync--+ 4
(--4 5
Id--5 7
)--7 8
;--8 9
if.. 
(.. 
user.. 
==.. 
null.. 
).. 
return// 
NotFound// 
(//  
)//  !
;//! "
return00 
user00 
;00 
}11 	
[33 	
HttpPost33	 
]33 
public44 
async44 
Task44 
<44 
ActionResult44 &
>44& '

InsertUser44' 1
(441 2
User442 6
newUser447 >
)44> ?
{55 	
bool66 
existsEmail66 
=66 
context66 &
.66& '
Users66' ,
.66, -
Any66- 0
(660 1
b661 2
=>663 5
b666 7
.667 8
Email668 =
==66> @
newUser66A H
.66H I
Email66I N
)66N O
;66O P
if77 
(77 
!77 
existsEmail77 
)77 
{88 
context99 
.99 
Users99 
.99 
Add99 !
(99! "
newUser99" )
)99) *
;99* +
await:: 
context:: 
.:: 
SaveChangesAsync:: .
(::. /
)::/ 0
;::0 1
return;; 
CreatedAtAction;; &
(;;& '
$str;;' ,
,;;, -
new;;. 1
{;;2 3
Id;;4 6
=;;7 8
newUser;;9 @
.;;@ A
Id;;A C
};;D E
,;;E F
newUser;;G N
);;N O
;;;O P
}<< 
return== 
UnprocessableEntity== *
(==* +
$str==+ A
)==A B
;==B C
}>> 	
}?? 
}@@ �
KC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Data\DataContext.cs
	namespace 	

 
. 
Data 
{ 
public 

class 
DataContext 
: 
	DbContext (
{ 
public 
DataContext 
( 
DbContextOptions +
options, 3
)3 4
:5 6
base7 ;
(; <
options< C
)C D
{		 	
}

 	
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
}
} �
gC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Data\Migrations\20210329175824_InitialCreate.cs
	namespace 	

 
. 
Data 
. 

Migrations '
{ 
public 

partial 
class 

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
$str 
, 
columns 
: 
table 
=> !
new" %
{
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
Username 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
trueI M
)M N
,N O
Password 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
trueL P
)P Q
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str 
) 
; 
} 	
} 
} �
KC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Entities\Product.cs
	namespace 	

 
. 
Entities  
{ 
public 

class 
Product 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
float		 
Price		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}
} �
HC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Entities\User.cs
	namespace 	

 
. 
Entities  
{ 
public 

class 
User 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public
string
Email
{
get
;
set
;
}
public 
string 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �
NC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Helpers\AppSettings.cs
	namespace 	

 
. 
Helpers 
{ 
public 

class 
AppSettings 
{		 
public

 
string

 
Secret

 
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
} �
UC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Helpers\AuthorizeAttribute.cs
	namespace

 	



 
.

 
Helpers

 
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
)D E
]E F
public

class
AuthorizeAttribute
:
	Attribute
,
IAuthorizationFilter
{ 
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
var 
user 
= 
( 
User 
) 
context $
.$ %
HttpContext% 0
.0 1
Items1 6
[6 7
$str7 =
]= >
;> ?
if 
( 
user 
== 
null 
) 
{ 
context 
. 
Result 
=  
new! $

JsonResult% /
(/ 0
new0 3
{4 5
message6 =
=> ?
$str@ N
}O P
)P Q
{R S

StatusCodeT ^
=_ `
StatusCodesa l
.l m"
Status401Unauthorized	m �
}
� �
;
� �
} 
} 	
} 
} �"
PC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Helpers\JwtMiddleware.cs
	namespace

 
.
Helpers
{ 
public 

class 

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
public 

( 
RequestDelegate ,
next- 1
,1 2
IOptions3 ;
<; <
AppSettings< G
>G H
appSettingsI T
)T U
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
{'' 
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
}99 
catch:: 
{;; 
}>> 
}?? 	
}@@ 
}AA �
UC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Models\AuthenticateRequest.cs
	namespace 	

 
. 
Models 
{ 
public		 

class		 
AuthenticateRequest		 $
{

 
[ 	
Required	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �	
VC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Models\AuthenticateResponse.cs
	namespace 	

 
. 
Models 
{ 
public		 

class		  
AuthenticateResponse		 %
{

 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public
string
Token
{
get
;
set
;
}
public  
AuthenticateResponse #
(# $
User$ (
user) -
,- .
string/ 5
token6 ;
); <
{ 	
Id 
= 
user 
. 
Id 
; 
Username 
= 
user 
. 
Username $
;$ %
Token 
= 
token 
; 
} 	
} 
} �

BC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Program.cs
	namespace 	

 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public
static
IHostBuilder
CreateHostBuilder
(
string
[
]
args
)
=>
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} �&
OC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Services\UserService.cs
	namespace 	

 
. 
Services  
{ 
public 

	interface 
IUserService !
{  
AuthenticateResponse 
Authenticate )
() *
AuthenticateRequest* =
model> C
)C D
;D E
User 
GetById
( 
Guid 
id 
) 
; 
} 
public 

class 
UserService 
: 
IUserService )
{ 
private 
readonly 
DataContext $
_dataContext% 1
;1 2
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
UserService 
( 
DataContext &
dataContext' 2
,2 3
IOptions4 <
<< =
AppSettings= H
>H I
appSettingsJ U
)U V
{ 	
_dataContext 
= 
dataContext &
;& '
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
public  
AuthenticateResponse #
Authenticate$ 0
(0 1
AuthenticateRequest1 D
modelE J
)J K
{   	
var!! 
user!! 
=!! 
_dataContext!! #
.!!# $
Users!!$ )
.!!) *
Where!!* /
(!!/ 0
s!!0 1
=>!!2 4
s!!5 6
.!!6 7
Username!!7 ?
==!!@ B
model!!C H
.!!H I
Username!!I Q
&&!!R T
s!!U V
.!!V W
Password!!W _
==!!_ a
model!!a f
.!!f g
Password!!g o
)!!p q
.!!q r
FirstOrDefault	!!r �
(
!!� �
)
!!� �
;
!!� �
if&& 
(&& 
user&& 
==&& 
null&& 
)&& 
return&& $
null&&% )
;&&) *
var)) 
token)) 
=)) 
generateJwtToken)) (
())( )
user))) -
)))- .
;)). /
return++ 
new++  
AuthenticateResponse++ +
(+++ ,
user++, 0
,++0 1
token++2 7
)++7 8
;++8 9
},, 	
private-- 
string-- 
generateJwtToken-- '
(--' (
User--( ,
user--- 1
)--1 2
{.. 	
var00 
tokenHandler00 
=00 
new00 "#
JwtSecurityTokenHandler00# :
(00: ;
)00; <
;00< =
var11 
key11 
=11 
Encoding11 
.11 
ASCII11 $
.11$ %
GetBytes11% -
(11- .
_appSettings11. :
.11: ;
Secret11; A
)11A B
;11B C
var22 
tokenDescriptor22 
=22  !
new22" %#
SecurityTokenDescriptor22& =
{33 
Subject44 
=44 
new44 
ClaimsIdentity44 ,
(44, -
new44- 0
[440 1
]441 2
{443 4
new445 8
Claim449 >
(44> ?
$str44? C
,44C D
user44E I
.44I J
Id44J L
.44L M
ToString44M U
(44U V
)44V W
)44W X
}44Y Z
)44Z [
,44[ \
Expires55 
=55 
DateTime55 "
.55" #
UtcNow55# )
.55) *
AddDays55* 1
(551 2
$num552 3
)553 4
,554 5
SigningCredentials66 "
=66# $
new66% (
SigningCredentials66) ;
(66; <
new66< ? 
SymmetricSecurityKey66@ T
(66T U
key66U X
)66X Y
,66Y Z
SecurityAlgorithms66[ m
.66m n 
HmacSha256Signature	66n �
)
66� �
}77 
;77
var88 
token88 
=88 
tokenHandler88 $
.88$ %
CreateToken88% 0
(880 1
tokenDescriptor881 @
)88@ A
;88A B
return99 
tokenHandler99 
.99  

WriteToken99  *
(99* +
token99+ 0
)990 1
;991 2
}:: 	
public;; 
User;; 
GetById;; 
(;; 
Guid;;  
id;;! #
);;# $
{<< 	
return== 
_dataContext== 
.==  
Users==  %
.==% &
Find==& *
(==* +
id==+ -
)==- .
;==. /
}>> 	
}AA 
}BB �
BC:\Users\Andrei\Desktop\HDD repo\back-end\HotDiggetyDog\Startup.cs
	namespace 	

 
{ 
public

class
Startup
{ 
private 
readonly 
IConfiguration '

;5 6
public 
Startup 
( 
IConfiguration %

)3 4
{ 	
this 
. 

=  

;. /
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddDbContext !
<! "
DataContext" -
>- .
(. /
options/ 6
=>7 9
{: ;
options< C
.C D
	UseSqliteD M
(M N

.[ \
GetConnectionString\ o
(o p
$strp 
)	 �
)
� �
;
� �
}
� �
)
� �
;
� �
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
	Configure 
< 
AppSettings *
>* +
(+ ,

.9 :

GetSection: D
(D E
$strE R
)R S
)S T
;T U
services   
.   
	AddScoped   
<   
IUserService   +
,  + ,
UserService  - 8
>  8 9
(  9 :
)  : ;
;  ; <
services## 
.## 

(##" #
)### $
;##$ %
}$$ 	
public'' 
void'' 
	Configure'' 
('' 
IApplicationBuilder'' 1
app''2 5
,''5 6
IWebHostEnvironment''7 J
env''K N
)''N O
{(( 	
if)) 
()) 
env)) 
.)) 

())! "
)))" #
)))# $
{** 
app++ 
.++ %
UseDeveloperExceptionPage++ -
(++- .
)++. /
;++/ 0
},, 
app-- 
.-- 

UseSwagger-- 
(-- 
)-- 
;-- 
app11 
.11 
UseSwaggerUI11 
(11 
c11 
=>11 !
{22 
c33 
.33 
SwaggerEndpoint33 !
(33! "
$str33" <
,33< =
$str33> I
)33I J
;33J K
}44 
)44
;44 
app66 
.66 

UseRouting66 
(66 
)66 
;66 
app88 
.88 
UseAuthorization88  
(88  !
)88! "
;88" #
app:: 
.:: 
UseEndpoints:: 
(:: 
	endpoints:: &
=>::' )
{;; 
	endpoints<< 
.<< 
MapControllers<< (
(<<( )
)<<) *
;<<* +
}== 
)==
;== 
}?? 	
}@@ 
}AA 