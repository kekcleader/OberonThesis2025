@echo off
rem Portable python3 shim for latexminted on Windows.
rem Tries versioned interpreters first, then the py launcher.

for %%V in (3.12 3.13 3.11 3.10) do (
  where python%%V.exe >NUL 2>&1
  if not errorlevel 1 (
    python%%V.exe %*
    exit /b %ERRORLEVEL%
  )
)

where py >NUL 2>&1
if not errorlevel 1 (
  for %%V in (3.12 3.13 3.11 3.10 3) do (
    py -%%V %*
    if not errorlevel 1 exit /b 0
  )
)

echo python3 interpreter not found (tried 3.12, 3.13, 3.11, 3.10) 1>&2
exit /b 127
