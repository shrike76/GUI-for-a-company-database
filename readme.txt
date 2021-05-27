Runs on Java 12.0.2

In your project structure:

set the javafx-sdk-16/lib file to your library
Set the mssql-jbdc-9.2.1.jre11.jar file to your modules
check both the lib and the mssql jar file in the modules screen


In your run configuration 

paste this into your VM options:
--module-path "C:\software_extensions\javafx-sdk-16\lib" --add-modules javafx.controls,javafx.fxml

your module path being where the javafx-sdk-16\lib is located