# Minireport

This is an example of a setup used to generate parameterized 2-pager minireports. This example uses enterprise data (not provided) from various districts of Vietnam. The example includes the basics of using projects, tidying data, working in Rmarkdown and paramterizing the reports. There are also a few helper documents included, like the formatting documentation and the "Markdown vs LateX" comparison document.

# First time setup

If it is the first time that you are working with PDF generation with Rmarkdown, then we have to do a bit of first time setup to get it working.

1)  Open the project “Vietnam_minireport”, you can do this by double clicking the “Vietnam_minireport.Rproj” file.
2)  We recommend setting the following option in Rstudio: Tools -\> Global Options -\> Rmarkdown -\> Evauluate chunks in directory: "Project". This ensures that Rmarkdown and the rest of Rstudio have the project folder as the root directory.
3)  Now we can try to create the pdf document by pressing Knit. If this is the first trying knit to pdf this will most likely not work.
4)  We need to install a LateX engine to create the pdf-documents. There are two main options:
    a)  Run the code tinytex::install_tinytex() in the Rstudio console. Tinytex is the simplest way to handle LateX as it requires no other setup and it will simply install any other LateX packages you need.
    b)  Unfortunately, it seems that tinytex does not work for everyone. If you encounter errors while trying to install tinytex, we recommend switching to MikTex. This cannot be installed directly from Rstudio. Instead you will need to download the most recent version from <https://miktex.org/download>. After downloading and installing, it is important to set MikTex to automatically download and install packages, this can be done in the MikTex Console application.
5)  After installing one of the LateX engines it should be possible to knit the reports.

# Long and short reports

This project is setup to create to variations of the basic 2-pager minireport. The short report version uses a seperate R-script "2_generate_reports.R", to loop over the district parameter and rendering a seperate PDF document for each district.

The long report version uses the "generate_long_report.Rmd" to pull the report template into the same Rmarkdown document several times, using the knit_child() function. The result is a single longer PDF document where each minireport is a chapter.
