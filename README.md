 
TODO: this package is very useful to data managing by collecting data from json and allocating to cells to view it to widgets like list view and grid view  of app or get the data from input widgets and formatting it to map json and sending it to data stage like firebase of nade js back end 
 
## How dose it work ?
 
TODO: to under stand this packge you should to to look at the json map 
example 
  ```json 
  {"table name":[
  {

      "id": 0 , 
      "name":"Moaz Salah " , 
      "age": 36 
  } , 
  {

      "id": 1 , 
      "name":"Mohammed Salah " , 
      "age": 32 
  } ,
  {

      "id": 2 , 
      "name":"Ahammed Salah " , 
      "age": 32 
  } 
  
  ]
  }
  ```
this is table of data of persos 
we get it from json date came from php server of firebase database 
the cell module analiyze this json data to 
all data gose to ```dart "ModuleDataTable" ``` class but the 
``` json 
 {

      "id": 2 , 
      "name":"Ahammed Salah " , 
      "age": 32 
  } 
```
called RowofCell class 
and 
```json 
  { "name":"Ahammed Salah " }
```
called Cell 

## Usage

TODO:  
```json
j{"key":"dd" }

```

```dart
const like = 'sample';
```

  
