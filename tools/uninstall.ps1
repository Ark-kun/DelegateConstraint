param($installPath, $toolsPath, $package, $project)

$importFile = 'DelegateConstraint.targets'

# Need to load MSBuild assembly if it's not loaded yet.
Add-Type -AssemblyName 'Microsoft.Build'
# Grab the loaded MSBuild project for the project
$proj = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | select -first 1

$proj.XML.Imports |
    where { $_.Project -eq $importFile } |
    foreach {
        $_.Parent.RemoveChild($_)
    }

$project.Save()
