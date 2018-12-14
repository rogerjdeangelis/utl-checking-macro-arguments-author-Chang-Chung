Checking macro arguments author Chang Chung                                                                        
                                                                                                                   
Checking for blank, missing or null arguments                                                                      
                                                                                                                   
github                                                                                                             
https://tinyurl.com/y7kwohsr                                                                                       
https://github.com/rogerjdeangelis/utl-checking-macro-arguments-author-Chang-Chung                                 
                                                                                                                   
related to                                                                                                         
https://tinyurl.com/yce4ylbs                                                                                       
https://communities.sas.com/t5/New-SAS-User/file-export-macro-with-rename-option/m-p/521169                        
                                                                                                                   
Macros                                                                                                             
https://tinyurl.com/y9nfugth                                                                                       
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                         
                                                                                                                   
                                                                                                                   
PROBLEM                                                                                                            
                                                                                                                   
  Given a macro with these REQUIRED arguments                                                                      
                                                                                                                   
  %macro checker(sysbin=,outdsn=);                                                                                 
                                                                                                                   
  Trap on all these invocations                                                                                    
                                                                                                                   
     1. %checker();                                                                                                
                                                                                                                   
     2. %checker(sysbin=,outdsn=);                                                                                 
                                                                                                                   
     3. %checker(sysbin=   ,outdsn=   );                                                                           
                                                                                                                   
     4. %checker(sysbin=%str( ),outdsn=%str( ) );                                                                  
                                                                                                                   
     5. %checker(outdsn=Roger );                                                                                   
                                                                                                                   
                                                                                                                   
EXAMPLE OUTPUT ( in the log)                                                                                       
----------------------------                                                                                       
                                                                                                                   
 1. %checker();                                                                                                    
                                                                                                                   
      **** Please Provide the sysbin value    ****                                                                 
      **** Please Provide an output dataset    ****                                                                
                                                                                                                   
 2. %checker(sysbin=,outdsn=);                                                                                     
                                                                                                                   
      **** Please Provide the sysbin value    ****                                                                 
      **** Please Provide an output dataset    ****                                                                
                                                                                                                   
 3. %checker(sysbin=   ,outdsn=   );                                                                               
                                                                                                                   
      **** Please Provide the sysbin value    ****                                                                 
      **** Please Provide an output dataset    ****                                                                
                                                                                                                   
 4. %checker(sysbin=%str( ),outdsn=%str( ) );                                                                      
                                                                                                                   
      **** Please Provide the sysbin value    ****                                                                 
      **** Please Provide an output dataset    ****                                                                
                                                                                                                   
 5. %checker(outdsn=Roger );                                                                                       
                                                                                                                   
      **** Please Provide the sysbin value    ****                                                                 
                                                                                                                   
PROCESS                                                                                                            
=======                                                                                                            
                                                                                                                   
 %checker();                                                                                                       
 %checker(sysbin=,outdsn=);                                                                                        
 %checker(sysbin=   ,outdsn=   );                                                                                  
 %checker(sysbin=%str( ),outdsn=%str( ) );                                                                         
 %checker(outdsn=Roger );                                                                                          
                                                                                                                   
                                                                                                                   
  /* Check Lex Jansen SAS archives for author Chang Chung */                                                       
                                                                                                                   
  %macro checker(sysbin=,outdsn=);                                                                                 
                                                                                                                   
   %put %sysfunc(ifc(%sysevalf(%superq(sysbin )=,boolean),**** Please Provide the sysbin value    ****,));         
   %put %sysfunc(ifc(%sysevalf(%superq(outdsn )=,boolean),**** Please Provide an output dataset    ****,));        
                                                                                                                   
    %let res= %eval                                                                                                
    (                                                                                                              
        %sysfunc(ifc(%sysevalf(%superq(sysbin )=,boolean),1,0))                                                    
      + %sysfunc(ifc(%sysevalf(%superq(outdsn )=,boolean),1,0))                                                    
    );                                                                                                             
                                                                                                                   
     %if &res = 0 %then %do;                                                                                       
         %put do some work;                                                                                        
     %end;                                                                                                         
                                                                                                                   
  %mend checker;                                                                                                   
                                                                                                                   
                                                                                                                   
  %checker();                                                                                                      
  %checker(sysbin=,outdsn=);                                                                                       
  %checker(sysbin=   ,outdsn=   );                                                                                 
  %checker(sysbin=%str( ),outdsn=%str( ) );                                                                        
  %checker(outdsn=Roger );                                                                                         
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   
