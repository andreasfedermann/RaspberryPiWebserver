# Balena cli installation https://github.com/balena-io/balena-cli/blob/master/INSTALL.md
# "https://github.com/balena-io/balena-cli/releases/download/v11.20.1/balena-cli-v11.20.1-windows-x64-standalone.zip"

# Strategy
## Unzip the zip-archive in balena folder
## Call the balena login && balena deploy command with balena cli command

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    $Destination
)

Expand-Archive -Path "balena-cli-linux-x64-standalone" -DestinationPath "$Destination"
$Env:Path="$Env:Path;$Destination\balena-cli"