Import-Module posh-git
Import-Module prompt

if (Get-Module -ListAvailable -Name work) {
    Import-Module work
} 

if (Get-Module -ListAvailable -Name home) {
    Import-Module home
} 

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
function cfc () { code $profile.CurrentUserAllHosts }
function cfh () { code "C:\Windows\System32\drivers\etc\hosts" }

# Git aliases
function Get-GitStatus { & git st }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitLog { & git ls }
New-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

function Get-GitCommit { & git commit -m $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitAdd { & git add $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitPush { & git push }
New-Alias -Name gp -Value Get-GitPush -Force -Option AllScope

function Get-GitPushForce { & git push --force-with-lease }
New-Alias -Name gpf -Value Get-GitPushForce -Force -Option AllScope

function Get-GitPullRebase { & git pr }
New-Alias -Name pr -Value Get-GitPullRebase -Force -Option AllScope

function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope

function Get-GitCheckout { & git checkout $args }
New-Alias -Name co -Value Get-GitCheckout -Force -Option AllScope

function Get-ListLocalBranches { & git bl }
New-Alias -Name bl -Value Get-ListLocalBranches -Force -Option AllScope

function Get-ListRemoteBranches { & git br }
New-Alias -Name bl -Value Get-ListRemoteBranches -Force -Option AllScope

# Source profile
function rf() {
    . $PROFILE.CurrentUserAllHosts
}
