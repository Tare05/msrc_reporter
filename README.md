MSCR Win32K/GDI reporter
========================

A powershell script that uses MSCR update API (https://github.com/microsoft/MSRC-Microsoft-Security-Updates-API) to get report from the latest Win32k and GDI related security bulletins.

Powershell is needed, and the MSRC module should be installed:

`Install-Module -Name msrcsecurityupdates -force`

If you add the bashscript to a crontab like:

`0 */6 * * * MsrcReporter $(date +%Y-%b)`

and you create a module from your taskbar which opens the HTML report in your preferred browser, new security updates can be checked very conviniently.
