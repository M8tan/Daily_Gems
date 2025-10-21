@echo off
setlocal enabledelayedexpansion
title Quoter
for /l %%i in (1,1,5) do (
    set "line="
    for /L %%i in (1,1,10) do (
        set "line=!line!#"
        echo !line!
    )
)
cd .\
cls
ruby Quoter.rb