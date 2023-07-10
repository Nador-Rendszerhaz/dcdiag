$ts = get-date -format 'yyyy-MM-dd_hh-mm-ss';
$cmmnd = "%windir%\system32\dcdiag.exe";
$args = "/c /e /v > .\dcdiag_logs\dcdiag_" + $ts + ".log";

Start-Process $cmmnd -ArgumentList $args 


