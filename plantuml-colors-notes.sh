## Copyright (c) 2017-present, Ivan Kuvaldin <i.kyb_(bark)_ya.ru>
## [BSD License](https://opensource.org/licenses/BSD-3-Clause)
## This script is to show all named color suggested by PlantUML
## as many notes.

## Get colors from java -jar plantuml.jar -language
## http://stackoverflow.com/questions/42703101/extract-text-between-two-patterns-excluding-patterns
#colors=$(java -jar plantuml.jar -language | awk '/^;/{if (/[[:alpha:]]/) f=(/color/?1:0); next} f')

#template='s/.*/note "&" as & #&/'
template='note "&" as & #&'


#echo -e "@startuml\n"  >plantuml-colors.puml
#echo -e "title
#Color Name
#|= ColorName             make this column long |
#|<#AliceBlue> AliceBlue |
#|<#Beige> Beige |
#|<#AntiqueWhite> AntiqueWhite |
#|<#Bisque> Bisque |
#end title"

java -jar plantuml.jar -language | awk '/^;/{if (/[[:alpha:]]/) f=(/color/?1:0); next} f && NF' | sed "s/.*/$template/"  >>plantuml-colors.puml
echo -e "\n@enduml" >>plantuml-colors.puml
java -jar plantuml.jar ./plantuml-colors.puml




