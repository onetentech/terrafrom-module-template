$type = "document" # "document" or "table"
$examples = (Get-ChildItem ./examples -Directory).name
$modules = (Get-ChildItem ./modules -Directory).name
# terraform-docs markdown $type ./
terraform-docs markdown $type ./ -c ./_docs/.terraform-module-docs.yml
foreach ($example in $examples) {
    if (gci ./examples/$example -Filter "header.md" -file) {
        write-host "Found header.md in $example"
        terraform-docs markdown $type ./examples/$example/ -c ./_docs/.terraform-example-docs.yml
    }

}
foreach ($module in $modules) {
    if (gci ./modules/$module -Filter "header.md" -file) {
        write-host "Found header.md in $module"
        terraform-docs markdown $type ./modules/$module/ -c ./_docs/.terraform-module-docs.yml
    }
}
