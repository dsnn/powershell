function install-deps() { 
#     Install-Module -Name PowerShellGet -Force
#     Install-Module PSReadLine -AllowPrerelease -Force
#     PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
#     Install-Module -Name z 

    if (-not (Get-Module -ListAvailable -Name PowerShellGet)) {
        Write-Host "PowerShellGet not found, installing..."
    } else {
        Write-Host "PowerShellGet found, skipping..."
    }

    if (-not (Get-Module -ListAvailable -Name PSReadLine)) {
        Write-Host "PSReadLine not found, installing..."
        Install-Module PSReadLine -AllowPrerelease -Force
    } else {
        Write-Host "PSReadLine found, skipping..."
    }

    if (-not (Get-Module -ListAvailable -Name posh-git)) {
        Write-Host "posh-git not found, installing..."
        PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
    } else {
        Write-Host "posh-git found, skipping..."
    }

    if (-not (Get-Module -ListAvailable -Name z)) {
        Write-Host "z not found, installing..."
        Install-Module -Name z 
    } else {
        Write-Host "z found, skipping..."
    }
}

if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
} 

if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
} 

if (Get-Module -ListAvailable -Name prompt) {
    Import-Module prompt
} 

if (Get-Module -ListAvailable -Name work) {
    Import-Module work
} 

if (Get-Module -ListAvailable -Name home) {
    Import-Module home
} 

# General aliases
function which() { & get-command $args }

# Navigation aliases
function l() { ls }
function ..() { cd ..}
function ...() { cd ../..}

# Dotnet aliases
function dnn () { dotnet run --no-build }
function dnb () { dotnet build }
function dnc () { dotnet clean }
function dnr () { dotnet restore }

# NPM aliases
function ni () { npm install }
function np () { npm prune }
function ns () { npm start }
function nt () { npm test }
function ntu () { npm run test:update-snapshot }

# Edit configs
function cfc () { code $profile }
function cfh () { code "C:\Windows\System32\drivers\etc\hosts" }
function cfcw () { code $PSScriptRoot\Modules\work\work.psm1 }

# Git aliases
function gs() { git status}
function gll() { git log } # ffs ms. change to 'gl' later. requires to be forcefully deleted
function gc() { & git commit -am $args }
function ga() { & git add $args }
function gp() { git push }
function gpf() { git push --force-with-lease }
function pr() { git pull --rebase }
function gf() { git fetch }
function co() { & git checkout $args }
function bl() { git branch -l }
function br() { git branch -r }
function cb() { git rev-parse --abbrev-ref HEAD }

# Source profile
function rf() {
    . $PROFILE
}

function ff() {
    $fzf_path = "C:\stuff\bin\fzf.exe"
    if (-not (Test-Path -Path $fzf_path -PathType Leaf)) {
        Write-Host "FZF binary not found"
    } elseif ((Get-Command "fzf" -ErrorAction SilentlyContinue) -eq $null) {
        Write-Host "fzf not in your PATH"
    } else {
        $result = git branch | fzf | Out-String 
        Invoke-Expression "& git checkout $result"
    }
    
}

# TODO: review this later (I need to sleep now) 
# function Load-Module ($m) {

#     # If module is imported say that and do nothing
#     if (Get-Module | Where-Object {$_.Name -eq $m}) {
#         write-host "Module $m is already imported."
#     }
#     else {

#         # If module is not imported, but available on disk then import
#         if (Get-Module -ListAvailable | Where-Object {$_.Name -eq $m}) {
#             Import-Module $m -Verbose
#         }
#         else {

#             # If module is not imported, not available on disk, but is in online gallery then install and import
#             if (Find-Module -Name $m | Where-Object {$_.Name -eq $m}) {
#                 Install-Module -Name $m -Force -Verbose -Scope CurrentUser
#                 Import-Module $m -Verbose
#             }
#             else {

#                 # If module is not imported, not available and not in online gallery then abort
#                 write-host "Module $m not imported, not available and not in online gallery, exiting."
#                 EXIT 1
#             }
#         }
#     }
# }

# Load-Module "ModuleName" # Use "PoshRSJob" to test it out