<#
.SYNOPSIS
Generate Dublin Core XML from MODS XML.

.DESCRIPTION
Generate Dublin Core XML from MODS XML. generate_dc.ps1 has one required
parameter, $Path, which specifies the path to a directory containing MODS
XML files that will be used to generate Dublin Core files.

This script relies on having Saxon for .NET platforms installed. Saxon for
.NET provides Transform.exe. Saxon can be downloaded here:
https://www.saxonica.com/download/dotnet.xml

By default, this script runs the default Islandora 7 mods_to_dc.xsl, which
is available here: https://github.com/Islandora/islandora_batch/blob/7.x/transforms/mods_to_dc.xsl.
This script assumes the XSL file is located in the same directory as this
script. If your copy of mods_to_dc.xsl is located elsewhere or you wish to
use a different XSL file, you can specify an alternate path on the command
line.

.EXAMPLE
.\generate_dc.ps1 Folder_of_MODS_Files
.\generate_dc.ps1 Folder_of_MODS_files custom_transform.xsl
.\generate_dc.ps1 -Path Folder_of_MODS_Files -XSL custom_transform.xsl
#>
param(
    [Parameter (Mandatory=$true)] [string] $Path,
    [Parameter (Mandatory=$false)] [string] $XSL = ".\isu_mods_to_dc.xsl"
)

Get-ChildItem -Path ${Path}\*.xml | ForEach-Object {
    if ( $_.Name -notlike "dc-*" ) {
        & Transform.exe -s:${_} -xsl:$XSL -o:${Path}\dc-$($_.Name)
    }
}
