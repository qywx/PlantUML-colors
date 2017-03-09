## Copyright (c) 2017-present, Ivan Kuvaldin <i.kyb_(bark)_ya.ru>
## [BSD License](https://opensource.org/licenses/BSD-3-Clause)
## This script is to show all named color suggested by PlantUML
## in a style of table.
## You can implement your own picture by changing header, template 
## and footer. In template symbol `&` will be substituted with 
## color name.



## Get colors from java -jar plantuml.jar -language
## http://stackoverflow.com/questions/42703101/extract-text-between-two-patterns-excluding-patterns
#colors=$(java -jar plantuml.jar -language | awk '/^;/{if (/[[:alpha:]]/) f=(/color/?1:0); next} f && NF')

#header=
#template='note "&" as & #&'
#footer=

header="title\n|= ColorName ------------- make this column long |"
template="|<#&> & |"
footer="end title\n"


echo -e "@startuml\n"  >plantuml-colors.puml
echo -e $header >>plantuml-colors.puml

## Get colors, and pass them through template to result file
java -jar plantuml.jar -language \
		| awk '/^;/{if (/[[:alpha:]]/) f=(/color/?1:0); next} f && NF' \
		| sed "s/.*/$template/"  >>plantuml-colors.puml

echo -e $footer >>plantuml-colors.puml
echo -e "\n@enduml" >>plantuml-colors.puml

## Generate picture
java -jar plantuml.jar ./plantuml-colors.puml
