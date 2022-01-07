#requires -Version 2 -Modules posh-git

# $global:GitPromptSettings.BeforeText = ' '
# $global:GitPromptSettings.AfterText  = ''

function global:prompt {
    $PwdPath = Split-Path -Path $pwd -Leaf
    Write-Host -Object "$PwdPath" -NoNewline -ForegroundColor White
    # Write-VcsStatus
    return " > "
}

# Previous prompt (remove later)

# function prompt ()
# {
#     Write-Host ""

#     Write-VcsStatus

#     $origLastExitCode = $LASTEXITCODE

#     $maxPathLength = 40
#     $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
#     if ($curPath.Length -gt $maxPathLength) {
#         $curPath = '...' + $curPath.SubString($curPath.Length - $maxPathLength + 3)
#     }

#     # $curPath = $curPath.Split('\')[-1]

#     Write-Host $curPath -ForegroundColor Green -BackgroundColor Black 

#     $LASTEXITCODE = $origLastExitCode
#     "$('>' * ($nestedPromptLevel + 1)) "
# }