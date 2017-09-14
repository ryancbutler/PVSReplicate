$sut = "$env:APPVEYOR_BUILD_FOLDER\PVSReplicate.ps1"

Describe 'Script Metadata Validation' {      
        it 'Script fileinfo should be ok' {
            {Test-ScriptFileInfo $sut} | Should Not Throw
        }    
}