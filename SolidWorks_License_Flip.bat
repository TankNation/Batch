REM #~ SolidWorks License Change - Swap Between Academic and Research Licenses
 
REM #~ Brian Tancredi
REM #~ Created: 2016-10-17
REM #~ Modified: 2016-11-03
 
REM #~ References:
REM #~ http://stackoverflow.com/questions/17412150/batch-regex-the-output-of-reg-query-command-to-a-variable
 
@ECHO off
REM #~ Assigning Variables
SETLOCAL ENABLEEXTENSIONS
 
SET HKLMS=HKEY_LOCAL_MACHINE\SOFTWARE
SET Key_Name_1="%HKLMS%\FLEXlm License Manager"
SET Key_Name_2="%HKLMS%\SolidWorks\Security"
SET Key_Name_3="%HKLMS%\SolidWorks\Licenses\Serial Numbers"
 
SET Value_Name_1="SW_D_LICENSE_FILE"
SET Value_Name_2="Serial Number"
SET Value_Name_3="Serial Number Extra"
SET Value_Name_4="COSMOSFloWorks"
SET Value_Name_5="COSMOSMotion"
SET Value_Name_6="COSMOSWorks"
SET Value_Name_7="SolidWorks"
 
REM #~ University Research License
SET RL=xxxx xxxx xxxx xxxx
SET RL_Ext=xxxx xxxx
SET RL_LM=portnumber@server.domain.edu
SET RL_SN_Value=%RL% %RL_Ext%
 
REM #~ University Academic License
SET AL=xxxx xxxx xxxx xxxx
SET AL_Ext=xxxx xxxx
SET AL_LM=portnumber@server.domain.edu
SET AL_SN_Value=%AL% %AL_Ext%
 
FOR /f "tokens=3*" %%a in ('reg query %Key_Name_2% /v %Value_Name_2%') DO SET "Serial=%%b"
REM ECHO %Serial%
 
REM #~ Flipping Licenses and License Managers
REM #~ University Research License to University Academic License
IF /I "%Serial%" == "%RL%" (
Reg add %Key_Name_1% /v %Value_Name_1% /t REG_SZ /d "%AL_LM%" /f /reg:32
Reg add %Key_Name_1% /v %Value_Name_1% /t REG_SZ /d "%AL_LM%" /f /reg:64
Reg add %Key_Name_2% /v %Value_Name_2% /t REG_SZ /d "%AL%" /f /reg:32
Reg add %Key_Name_2% /v %Value_Name_2% /t REG_SZ /d "%AL%" /f /reg:64
Reg add %Key_Name_2% /v %Value_Name_3% /t REG_SZ /d "%AL_Ext%" /f /reg:32
Reg add %Key_Name_2% /v %Value_Name_3% /t REG_SZ /d "%AL_Ext%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_4% /t REG_SZ /d "%AL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_4% /t REG_SZ /d "%AL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_5% /t REG_SZ /d "%AL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_5% /t REG_SZ /d "%AL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_6% /t REG_SZ /d "%AL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_6% /t REG_SZ /d "%AL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_7% /t REG_SZ /d "%AL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_7% /t REG_SZ /d "%AL_SN_Value%" /f /reg:64
)
 
REM #~ University Academic License to University Research License
IF /I "%Serial%" == "%AL%" (
Reg add %Key_Name_1% /v %Value_Name_1% /t REG_SZ /d "%RL_LM%" /f /reg:32
Reg add %Key_Name_1% /v %Value_Name_1% /t REG_SZ /d "%RL_LM%" /f /reg:64
Reg add %Key_Name_2% /v %Value_Name_2% /t REG_SZ /d "%RL%" /f /reg:32
Reg add %Key_Name_2% /v %Value_Name_2% /t REG_SZ /d "%RL%" /f /reg:64
Reg add %Key_Name_2% /v %Value_Name_3% /t REG_SZ /d "%RL_Ext%" /f /reg:32
Reg add %Key_Name_2% /v %Value_Name_3% /t REG_SZ /d "%RL_Ext%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_4% /t REG_SZ /d "%RL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_4% /t REG_SZ /d "%RL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_5% /t REG_SZ /d "%RL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_5% /t REG_SZ /d "%RL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_6% /t REG_SZ /d "%RL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_6% /t REG_SZ /d "%RL_SN_Value%" /f /reg:64
Reg add %Key_Name_3% /v %Value_Name_7% /t REG_SZ /d "%RL_SN_Value%" /f /reg:32
Reg add %Key_Name_3% /v %Value_Name_7% /t REG_SZ /d "%RL_SN_Value%" /f /reg:64
)
