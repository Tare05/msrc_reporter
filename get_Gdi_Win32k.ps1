Import-Module -Name msrcsecurityupdates -Force

$monthOfInterest = $args[0]
$Output_Location = "~/.local/msrc_report.html"

$CVRFDoc = Get-MsrcCvrfDocument -ID $monthOfInterest -Verbose

Set-MSRCApiKey -ApiKey "<YOUR API KEY HERE>" -Verbose

$CVRFDoc = Get-MsrcCvrfDocument -ID $monthOfInterest -Verbose
$CVRFHtmlProperties = @{
    Vulnerability = $CVRFDoc.Vulnerability | Where-Object {$_.Title -match "Win32k" -or $_.Title -match "GDI"}
    ProductTree = $CVRFDoc.ProductTree
    DocumentTracking = $CVRFDoc.DocumentTracking
    DocumentTitle = $CVRFDoc.DocumentTitle
}

Get-MsrcSecurityBulletinHtml @CVRFHtmlProperties -Verbose | Out-File $Output_Location
