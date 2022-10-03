# Generate_DC

## Description

`generate_dc.ps1` is a PowerShell script for generating Dublin Core XML files
from MOD XML. This script is primarily used as part of the workflow for
uploading revised MODS metadata to Islandora 7. Because uploading new metadata
to Islandora doesn't trigger the regeneration of derivatives, it is necessary
to generate and upload the Dublin Core files used by Islandora's OAI endpoint
to keep OAI metadata up-to-date with revisions to the main metadata.

## Requirements

This script relies on having Saxon for .NET platforms installed. Saxon for
.NET provides Transform.exe. Download Saxon from 
[Saxonica's download page](https://www.saxonica.com/download/dotnet.xml)
and install it, following Saxonica's instructions.

## Installation

To install `generate_dc.ps1`, download it to your computer. Download a copy of
[Islandora's default MODS-to-DC XSL](https://github.com/Islandora/islandora_batch/blob/7.x/transforms/mods_to_dc.xsl),
`mods_to_dc.xsl` to the same folder as the `generate_dc.ps1`.

## Usage

If `generate_dc.ps1` and `mods_to_dc.xsl` are in the same folder, you can run
the script from that folder like so:`> .\generate_dc.ps1 Path\To\MODS_XML_dir`,
replacing "Path\To\MODS_XML_dir" with the appropriate path. You may also
specify the path to your XSL file, in either of the following ways:
`> .\generate_dc.ps1 Path\To\MODS_XML_dir .\XSLT\mods_to_dc.xsl` or
`> .\generate_dc.ps1 -Path Path\To\MODS_XML_dir -XSL .\mods_to_dc.xsl`.
