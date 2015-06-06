	## Name: Test_Project1.r
	## Author: Dann Hekman (dannhek@gmail.com)
	## Purpose: tests all the other code files for the Exploratory Data Analysis Project 1
	##
	##			Specifications and data available here:
	##			https://class.coursera.org/exdata-013/human_grading/view/courses/973507/assessments/3/submissions
	##			
	## Returns:
	##		Four PNG files are written to the active working Directory
	##------------
#First, delete the PNG files we're about to re-create
file.remove('Plot1.png')
file.remove('Plot2.png')
file.remove('Plot3.png')
file.remove('Plot4.png')

#Then Remove all relevant objects
#and run each individual file, clearing objects at each point
rm(getData,plot1,plot2,plot3,plot4); rm(doItAll,DF)
source('Project1_Plot1.r')

rm(getData,plot1,plot2,plot3,plot4); rm(doItAll,DF)
source('Project1_Plot2.r')

rm(getData,plot1,plot2,plot3,plot4); rm(doItAll,DF)
source('Project1_Plot3.r')

rm(getData,plot1,plot2,plot3,plot4); rm(doItAll,DF)
source('Project1_Plot4.r')
