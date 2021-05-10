Ú
jC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\WebAPI\Controllers\BaseApiController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
public 

class 
BaseApiController "
:# $
ControllerBase% 3
{		 
	protected

 
	IMediator

 
mediator

 $
;

$ %
public 
BaseApiController  
(  !
	IMediator! *
mediator+ 3
)3 4
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
} 	
} 
} ½
xC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\WebAPI\Controllers\v1\JoinShopIngredientController.cs
	namespace 	
WebAPI
 
. 
Controllers 
. 
v1 
{ 
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
public

 

class

 (
JoinShopIngredientController

 -
:

- .
BaseApiController

. ?
{ 
public (
JoinShopIngredientController +
(+ ,
	IMediator, 5
mediator6 >
)> ?
:@ A
baseB F
(F G
mediatorG O
)O P
{ 	
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Create) /
(/ 0
[0 1
FromBody1 9
]9 :$
CreateJoinShopIngredient; S
commandT [
)[ \
{ 	
return 
Ok 
( 
await 
mediator $
.$ %
Send% )
() *
command* 1
)1 2
)2 3
;3 4
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetById) 0
(0 1
)1 2
{ 	
return 
Ok 
( 
await 
mediator $
.$ %
Send% )
() *
new* -'
GetIngredientsFromShopQuery. I
(I J
)J K
)K L
)L M
;M N
} 	
} 
} ¼

TC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\WebAPI\Program.cs
	namespace 	
WebAPI
 
{ 
public 

static 
class 
Program 
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
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
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
} Û%
TC:\Users\Andrei\Desktop\HDD repo new\back-end\SupplierMicroservice\WebAPI\Startup.cs
	namespace		 	
WebAPI		
 
{

 
public 

class 
Startup 
{ 
private 
readonly 
string "
MyAllowSpecificOrigins  6
=7 8
$str9 R
;R S
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddApiVersioning %
(% &
config& ,
=>- /
{ 
config 
. 
DefaultApiVersion (
=) *
new+ .
	Microsoft/ 8
.8 9

AspNetCore9 C
.C D
MvcD G
.G H

ApiVersionH R
(R S
$numS T
,T U
$numV W
)W X
;X Y
config 
. /
#AssumeDefaultVersionWhenUnspecified :
=; <
true= A
;A B
config 
. 
ReportApiVersions (
=) *
true+ /
;/ 0
} 
) 
; 
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddPersistence #
(# $
Configuration$ 1
)1 2
;2 3
services   
.   
AddApplication   #
(  # $
)  $ %
;  % &
services!! 
.!! 
AddCors!! 
(!! 
options!! $
=>!!% '
{"" 
options## 
.## 
	AddPolicy## !
(##! ""
MyAllowSpecificOrigins##" 8
,##8 9
builder##: A
=>##B D
{$$ 
builder&& 
.&& 
AllowAnyOrigin&& *
(&&* +
)&&+ ,
.&&, -
AllowAnyHeader&&- ;
(&&; <
)&&< =
.&&= >
AllowAnyMethod&&> L
(&&L M
)&&M N
;&&N O
}'' 
)'' 
;'' 
}(( 
)(( 
;(( 
services** 
.** 
AddSwaggerGen** "
(**" #
c**# $
=>**% '
{++ 
c,, 
.,, 

SwaggerDoc,, 
(,, 
$str,, !
,,,! "
new,,# &
OpenApiInfo,,' 2
{,,3 4
Title,,5 :
=,,; <
$str,,= E
,,,E F
Version,,G N
=,,O P
$str,,Q U
},,V W
),,W X
;,,X Y
}-- 
)-- 
;-- 
}.. 	
public11 
void11 
	Configure11 
(11 
IApplicationBuilder11 1
app112 5
,115 6
IWebHostEnvironment117 J
env11K N
)11N O
{22 	
if33 
(33 
env33 
.33 
IsDevelopment33 !
(33! "
)33" #
)33# $
{44 
app55 
.55 %
UseDeveloperExceptionPage55 -
(55- .
)55. /
;55/ 0
app66 
.66 

UseSwagger66 
(66 
)66  
;66  !
app77 
.77 
UseSwaggerUI77  
(77  !
c77! "
=>77# %
c77& '
.77' (
SwaggerEndpoint77( 7
(777 8
$str778 R
,77R S
$str77T _
)77_ `
)77` a
;77a b
}88 
app:: 
.:: 
UseHttpsRedirection:: #
(::# $
)::$ %
;::% &
app<< 
.<< 

UseRouting<< 
(<< 
)<< 
;<< 
app>> 
.>> 
UseAuthorization>>  
(>>  !
)>>! "
;>>" #
app?? 
.?? 
UseCors?? 
(?? "
MyAllowSpecificOrigins?? .
)??. /
;??/ 0
appAA 
.AA 
UseEndpointsAA 
(AA 
	endpointsAA &
=>AA' )
{BB 
	endpointsCC 
.CC 
MapControllersCC (
(CC( )
)CC) *
;CC* +
}DD 
)DD 
;DD 
}EE 	
}FF 
}GG 