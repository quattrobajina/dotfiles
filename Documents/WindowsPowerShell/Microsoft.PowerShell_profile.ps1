# Microsoft.PowerShell_profile.ps1
# Windows PowerShell (5.1)

#-----------------------------------------------------------------------------
# Modules
#-----------------------------------------------------------------------------

# posh-git: better git prompt integration
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
}

#-----------------------------------------------------------------------------
# PSReadLine Configuration
#-----------------------------------------------------------------------------

if (Get-Module -ListAvailable -Name PSReadLine) {
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete  # zsh-like tab completion
    Set-PSReadLineOption -EditMode Windows
}

#-----------------------------------------------------------------------------
# Terminal Enhancements
#-----------------------------------------------------------------------------

# oh-my-posh: prompt theme engine
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config 'stelbent-compact.minimal' | Invoke-Expression
}

# zoxide: smarter cd command
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# mise: polyglot runtime manager (preferred)
# fnm: Fast Node Manager with automatic version switching (fallback)
# Note: mise chpwd requires PowerShell 7+, so mise will warn but still works for 'mise activate'
if (Get-Command mise -ErrorAction SilentlyContinue) {
    $miseInit = (&mise activate pwsh 2>$null) | Out-String
    if ($miseInit) {
        Invoke-Expression $miseInit
    }
} elseif (Get-Command fnm -ErrorAction SilentlyContinue) {
    $fnmInit = (fnm env --use-on-cd --shell powershell 2>$null) | Out-String
    if ($fnmInit) {
        Invoke-Expression $fnmInit
    }
}

#-----------------------------------------------------------------------------
# Aliases & Functions
#-----------------------------------------------------------------------------

Set-Alias -Name grep -Value Select-String

# eza: modern ls replacement with git integration
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function ls    { eza -F     --color=auto --color-scale --hyperlink --icons @args }
    function la    { eza -aF    --color=auto --color-scale --hyperlink --icons @args }
    function lt    { eza -TF    --color=auto --color-scale --hyperlink --icons @args }
    function lta   { eza -aTF   --color=auto --color-scale --hyperlink --icons @args }
    function ll    { eza -glF   --color=auto --color-scale --hyperlink --icons --git --git-repos --time-style=long-iso @args }
    function lla   { eza -aglF  --color=auto --color-scale --hyperlink --icons --git --git-repos --time-style=long-iso @args }
    function llt   { eza -glTF  --color=auto --color-scale --hyperlink --icons --git --git-repos --time-style=long-iso @args }
    function llta  { eza -aglTF --color=auto --color-scale --hyperlink --icons --git --git-repos --time-style=long-iso @args }
}

#-----------------------------------------------------------------------------
# Environment Variables
#-----------------------------------------------------------------------------

$env:EDITOR = 'nvim'

#-----------------------------------------------------------------------------
# Custom Scripts
#-----------------------------------------------------------------------------

# Load additional custom scripts from profile directory
$customScripts = Join-Path $PSScriptRoot "custom.ps1"
if (Test-Path $customScripts) {
    . $customScripts
}
