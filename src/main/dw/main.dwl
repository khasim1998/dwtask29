%dw 2.0
output application/json
/*
1) variable 'noOfRow' will return how many array of objects we need to create.
2) variable 'keys' will store all the keys
3) variable 'values' will store all the values 
4) script logic will return the expected output in csv with reduce() to
 convert array of object into object
*/
var noOfRow= 1 to sizeOf(payload.rows default '')
var keys = payload.headers
var values = payload.rows
---
noOfRow   map((item, index) -> (keys map ((keyValue, keyIndex) -> 
 (keyValue) : values[index][keyIndex]
 ))reduce ((item, accumulator={}) -> accumulator ++ item )) 



