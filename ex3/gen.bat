@echo off


java -jar ./lib/JFlex.jar

cd src

java -jar ../javacup/java-cup-11a.jar parser.cup 

cd ..

pause

@echo on
