	## Name: Plot1.r
	## Author: Dann Hekman (dannhek@gmail.com)
	## Purpose: Downloads data from UC Irvine's Machine Learning Respository
	##			and graphs a histogram of Global Active Power consumption.
	##
	##			Specifications and data available here:
	##			https://class.coursera.org/exdata-013/human_grading/view/courses/973507/assessments/3/submissions
	##			
	##			All the processing (including data fetching and graph rendering)
	##			is actually done using functions contained in 'Project1.r'
	##			This is a shell function to write a single graph to file.
	## Parameters:
	##		'df' is the pre-fetched dataframe, if available
	##		'getData' if true, we will will download the data from 
	##				  the internet if it's not previously loaded
	## Returns:
	##		a PNG file is written to the active working Directory
	##------------
if (!exists('plot1')) {source('Project1.r')}
if (!exists('DF')) {DF <- getData()}
png(file="Plot1.png"); plot1(DF); dev.off()
