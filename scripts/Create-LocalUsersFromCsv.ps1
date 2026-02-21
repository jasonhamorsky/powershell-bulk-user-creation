# Path to CSV and log
$CsvPath = "C:\LABS\PowerShell-BulkUsers\users.csv"
$LogPath = "C:\LABS\PowerShell-BulkUsers\user_creation.log"
$LocalGroup = "Users"   # You can change this later if needed

# Simple logging function
function Write-Log {
    param(
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp`t$Message" | Out-File -FilePath $LogPath -Append -Encoding utf8
}

Write-Log "===== Script started ====="

# Check CSV exists
if (-not (Test-Path $CsvPath)) {
    Write-Log "ERROR: CSV file not found at $CsvPath"
    Write-Host "CSV file not found. Check path and try again."
    exit 1
}

# Import CSV
try {
    $users = Import-Csv -Path $CsvPath
    Write-Log "INFO: Imported $($users.Count) users from CSV."
}
catch {
    Write-Log "ERROR: Failed to import CSV. $_"
    Write-Host "Failed to import CSV. See log for details."
    exit 1
}
foreach ($user in $users) {
    $firstName = $user.FirstName
    $lastName  = $user.LastName
    $userName  = $user.UserName
    $password  = $user.Password

    $fullName = "$firstName $lastName"

    Write-Log "INFO: Processing user $userName ($fullName)."

    # Check if user already exists
    $existing = Get-LocalUser -Name $userName -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Log "WARN: User $userName already exists. Skipping."
        continue
    }

    try {
        $securePassword = ConvertTo-SecureString $password -AsPlainText -Force

        # Create the local user
        New-LocalUser -Name $userName -FullName $fullName -Password $securePassword -PasswordNeverExpires:$true

        Write-Log "INFO: Created local user $userName."

        # Add to group
        Add-LocalGroupMember -Group $LocalGroup -Member $userName
        Write-Log "INFO: Added $userName to group $LocalGroup."
    }
    catch {
        Write-Log "ERROR: Failed to create or configure user $userName. $_"
        Write-Host "Error creating user $userName. See log for details."
        continue
    }
}
Write-Log "===== Script finished ====="
Write-Host "User creation process complete. Check the log file for details."