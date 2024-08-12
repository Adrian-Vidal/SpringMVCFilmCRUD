# SpringMVCFilmCRUD



## Overview
* Create an application where a user can:
		* Enter a film's ID to view details
		* Search for a film using keyword
		* Add a new film with all properties
		* Delete a film
		* Edit a film
		
* Apply appropriate error message if:
		* Film is not found
		* Add film fails
		* Delete film fails
		* Edit film fails
			
## Team Members
* Adrian
* Sarocha

## Project Structure
* Create model classes (actor and film) with appropriate properties, such as ID, title, description, etc. Both classes will have getters and setters for each property
* Create multiple JSP files for different parts of the user interface, including forms for displaying, creating, editing, and deleting data. All JSP files will be in the WEB-INF directory to ensure the application is secure, well-organized, and adheres to the principles of the MVC architecture
* Map controller methods to the JSP files to allow proper handling and processing of HTTP requests
* DAO interface and implementation. Define methods for C.R.U.D operations and implement the DAO interface using JDBC
* Implement exception handling to manage and display user friendly error messages

## Technologies Used
* Github
* Terminal
* Eclipse spring tool suite
* Spring model view controller
* Data access object
* Jakarta server pages

## Lessons Learned
* Working as a team. Communication is key when working together in a group project. Before writing any code, we established our game plan and assigned roles for which part of the project each person would work on. This streamlined our building process and allowed us to work more efficiently. To keep both team members updated, we communicated any time we made changes and pushed to Github
* Gained a better understanding of how to create multiple JSP's in combination with servlets and data provided by the controller, to build full-featured web applications