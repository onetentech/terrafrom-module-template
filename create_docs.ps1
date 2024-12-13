$type = "document" # "document" or "table"
# Filter out the folders containing header.md files
$headers = gci -recurse -filter "*header.md"
# Loop through the folders and create the docs


$headers.directoryname | foreach {
    if ($_ -match "examples") {
        write-host "Creating example docs for: $($_)"
        terraform-docs markdown $type "$($_)" -c _docs\.terraform-example-docs.yml
    } else {
        write-host "Creating docs for: $($_)"
        terraform-docs markdown $type "$($_)" -c _docs\.terraform-module-docs.yml
    }
}