# Minireport
This is an example of a setup used to generate parameterized 2-pager minireports. This example uses enterprise data (not provided) from various districts of Vietnam. The example includes the basics of using projects, tidying data, working in Rmarkdown and paramterizing the reports. There are also a few helper documents included, like the formatting documentation and the "Markdown vs LateX" comparison document. 

# First time setup
If it is the first time that you are working with PDF generation with Rmarkdown, then we have to do a bit of first time setup to get it working.


1)	Open the project “Vietnam_minireport”, you can do this by double clicking the “Vietnam_minireport.Rproj” file. 
2)	We recommend setting the following option in Rstudio: 
Tools -> Global Options -> Rmarkdown -> Evauluate chunks in directory: "Project". This ensures that Rmarkdown and the rest of Rstudio have the project folder as the root directory. 
3)	Now we can try to create the pdf document by pressing Knit. If this is the first trying knit to pdf this will most likely not work.
4)	We need to install a LateX engine to create the pdf-documents. There are two main options:
7)	The easiest way to do this is to run the code:
tinytex::install_tinytex() 
in the console. This will take some time, so we will be patient.
