Function New-PasswdFile {
    [CmdletBinding()]
    Param (
        [String]$Passwd7zKdbx,
        [String]$Passwd7zKeyx,
        [String]$Passwd7zKpxc,
        [String]$PasswdEmail,
        [String]$PasswdVCKdbx,
        [String]$PasswdVCKeyx,
        [String]$PasswdFilePath
    )

    $FileNames = @("Passwd7zKdbx", "Passwd7zKeyx", "Passwd7zKpxc", "PasswdEmail", "PasswdVCKdbx", "PasswdVCKeyx")
    $Passwds = @($Passwd7zKdbx, $Passwd7zKeyx, $Passwd7zKpxc, $PasswdEmail, $PasswdVCKdbx, $PasswdVCKeyx)
    <#
    for ($i = 0; $i -lt $FileNames.Count; $i++) {
        $FileName = $FileNames[$i]
        $Passwd = $Passwds[$i]
    #>
    foreach ($FileName in $FileNames) {
        $Indice = [array]::IndexOf($FileNames, $FileName)
        $Passwd = $Passwds[$Indice]

        $FilePath = Join-Path -Path $PasswdFilePath -ChildPath $FileName
        $Passwd | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File -Encoding utf8 $FilePath
    }
}

New-PasswdFile -Passwd7zKdbx "Passw0rd.Kdbx" -Passwd7zKeyx "Passw0rd.Keyx" `
               -Passwd7zKpxc "Passw0rd.Kpxc" -PasswdEmail "Passw0rd.Email" `
               -PasswdVCKdbx "Passw0rd.VCKdbx" -PasswdVCKeyx "Passw0rd.VCKeyx" `
               -PasswdFilePath "C:\PATH\PasswdBackup\"