CingleVue Coding Challenge- Student Data management System


Application Configuration and Deployment Guild lines:

Application can be deploy as War file in any Java supporting Web Application server 

URL: http://ServerIP:port/displayAllStudents
Example: http://localhost:8080/displayAllStudents
(successfully Tested on Tomcat 7)

XML Data file location can be change in dataAccess.properties file (if path is not specified default location is AppllcationServer directory/bin/ student_data.xml )
Location :  WEB-INF\classes\dataAccess.properties

Initially there will be no entries in the Data Storage
 
Click on Add New Button to add new student entry
 
When click on Edit button, relevant recode will be change to editable mood. After changing the values click on save button to save data.
Clicking on Delete button will be deleted the recode permanently from Data storage

 
High level Work flow:

1 Application is Loading XML Data to Memory (to Hash Table) in Application Stat up
2 Controller is getting data from cache via Service method to populate display result request
3 when Update/Insert/Delete operation, 1st update the cache (Hash Table) then update in to XML file 
JAXB is used For marshaling and unmarshaling  (JAVA to XML /XML to JAVA)



Technologies and Tools Used:

Java (J2EE) /JSP
Spring MVC
JAXB 
Java Script/Jquery
Ajax
CSS
Maven
IntelijIdea (IDE)
Tomcat (Application server for hosting)


