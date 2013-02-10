param($installPath, $toolsPath, $package, $project)

$importFile = 'DelegateConstraint.targets'

# Need to load MSBuild assembly if it's not loaded yet.
Add-Type -AssemblyName 'Microsoft.Build'
# Grab the loaded MSBuild project for the project
$proj = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | select -first 1

# Add the import

$existingImports = $proj.XML.Imports | where { $_.Project -eq $importFile }
if($existingImports.count -eq 0) {
    $importElement = $proj.Xml.AddImport($importFile) 
    $importElement.Condition = "Exists('" + $importFile + "')" 
    $project.Save()
}