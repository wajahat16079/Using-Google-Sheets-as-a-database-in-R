library(googlesheets4)


## Link of the sheet

## Authentication: one time 

gs4_auth(
  cache = ".secrets/",
  email = "vizit.pvt@gmail.com"
)



## Creating a sheet using R
ss = gs4_create(
  "MySheet",
  sheets = list(flowers = head(iris), autos = head(mtcars))
)


## Use sheet link directly for exixting sheet
ss = "https://docs.google.com/spreadsheets/d/19NOja67RStLlMeHZlhHC5gnQMSPjrm_QVAsSSu6wNYk/edit#gid=0"


## Reading data from the sheet
Data = read_sheet(ss)

Data1 = range_read(
  ss,
  range = "Sheet1!A1:C2"
)


## Writing data to the sheet
write_sheet(iris, ss = ss)

## Appending data to the sheet  
sheet_append(ss, iris, sheet = "iris")


## deleting the sheet
googledrive::drive_trash(ss)


