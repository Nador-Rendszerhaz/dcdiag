function reg_the_task {
  $install_path = "C:\Scripts"
  $logs_path = "\dcdiag_logs"
  Write-Host "Szia!"
  Write-host "Add meg kérlek annak a felhasználónak az adatait akinek a nevében futni fog ez a script..."
  $u_name= Read-Host -Prompt "Felhasználónév (DOMAIN\USER)"
  $u_pass= Read-Host -Prompt "Jelszó"

  New-Item -Path ($install_path + $logs_path) -ItemType Directory -Force
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest -Uri https://raw.githubusercontent.com/PacsoT/dcdiag/main/dcdiag_logger.cmd -OutFile ($install_path + "\dcdiag_logger.cmd") 

  $execute = $install_path + '\dcdiag_logger.cmd'
  $ps_argument = '-NoProfile -WindowStyle Hidden -File "' + $install_path + '\dcdiag_logger.cmd'

  $act = New-ScheduledTaskAction -Execute $execute -WorkingDirectory ($install_path)

  $trigger = New-ScheduledTaskTrigger -At 5:47 -Daily

  $principal = New-ScheduledTaskPrincipal -RunLevel Highest -UserId $u_name

  $settings = New-ScheduledTaskSettingsSet -Compatibility Win8

  $task = New-ScheduledTask -Action $act -Trigger $trigger -Settings $settings -Principal $principal

  Register-ScheduledTask dcdiag_logger -InputObject $task -Password $u_pass -User $u_name 
  }
cls
reg_the_task
