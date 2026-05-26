local myriad = require 'myriad'

print("--- INTEGER TEST START [ ] ---")
------------------------------------------------------------------------------
-- INITS
print("--- INTEGER INITIALIZATION --- (1)")

local testNum1 = myriad.newInteger(123)
local testNum2 = myriad.newInteger("123")
local testNum3 = myriad.newInteger(456)
local testNum4 = myriad.newInteger("-456")
local testNum5 = myriad.newInteger("-123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967533")
local testNum6 = myriad.newInteger(testNum1)
assert(not pcall(myriad.newInteger, "12.3"))
assert(not pcall(myriad.newInteger, -math.huge))
assert(not pcall(myriad.newInteger, ''))
assert(not pcall(myriad.newInteger, "12a"))
assert(not pcall(myriad.newInteger, 0 / 0))

assert(testNum1.digits == "123" and testNum1.sign == 1)
assert(testNum2.digits == "123" and testNum2.sign == 1)
assert(testNum3.digits == "456" and testNum3.sign == 1)
assert(testNum4.digits == "456" and testNum4.sign == -1)
assert(testNum5.digits == "123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967533" and testNum5.sign == -1)
assert(testNum6.digits == "123" and testNum6.sign == 1)
testNum6.digits = "124"
assert(testNum1.digits == "123" and testNum1.sign == 1)
assert(testNum6.digits == "124" and testNum6.sign == 1)

print("--- INTEGER INITIALIZATION --- (PASS)")
------------------------------------------------------------------------------
-- RELATIONS
print("--- INTEGER RELATIONS      --- (2)")

assert(testNum1 <= testNum3)
assert(not (testNum1 >= testNum3))
assert(testNum1 == testNum2)
assert(not (testNum1 == testNum5))
assert(not (testNum1 ~= testNum1))
assert(testNum5 == testNum5)

assert(testNum1 < testNum3)
assert(testNum1 <= testNum3)
assert(not (testNum1 > testNum3))
assert(not (testNum1 >= testNum3))
assert(not (testNum1 == testNum3))
assert(testNum1 ~= testNum3)

local cmpNum1 = myriad.newInteger("-100")
local cmpNum2 = myriad.newInteger("-1000")

assert(cmpNum2 <= cmpNum1)
assert(not (cmpNum1 <= cmpNum2))


print("--- INTEGER RELATIONS      --- (PASS)")
------------------------------------------------------------------------------
-- ADDITION
print("--- INTEGER ADDITION       --- (3)")
print("   --> INTEGER ADDITION SMALL --- (3.1)")

local addNum1 = myriad.newInteger(0)
local addNum2 = myriad.newInteger(1)
local addNum3 = myriad.newInteger(9)
local addNum4 = myriad.newInteger(10)
local addNum5 = myriad.newInteger(99)
local addNum6 = myriad.newInteger(999)
local addNum7 = myriad.newInteger(1234567890)
local addNum8 = myriad.newInteger("-123")
local addNum9 = myriad.newInteger("-456")
local addNum10 = myriad.newInteger(123)

local addResult1 = addNum1 + addNum1
local addResult2 = addNum1 + addNum2
local addResult3 = addNum2 + addNum3
local addResult4 = addNum2 + addNum4
local addResult5 = addNum2 + addNum5
local addResult6 = addNum4 + addNum7
local addResult7 = addNum8 + addNum10
local addResult8 = addNum9 + addNum9
local addResult9 = addNum7 + addNum7

-- print(addResult9.sign .. " * " .. addResult9.digits)

assert(addResult1.digits == "0" and addResult1.sign == 1)
assert(addResult2.digits == "1" and addResult2.sign == 1)
assert(addResult3.digits == "10" and addResult3.sign == 1)
assert(addResult4.digits == "11" and addResult4.sign == 1)
assert(addResult5.digits == "100" and addResult5.sign == 1)
assert(addResult6.digits == "1234567900" and addResult6.sign == 1)
assert(addResult7.digits == "0" and addResult7.sign == 1)
-- print(addResult8.sign .. " * " .. addResult8.digits)
assert(addResult8.digits == "912" and addResult8.sign == -1)
assert(addResult9.digits == "2469135780" and addResult9.sign == 1)


print("   --> INTEGER ADDITION SMALL --- (PASS)")
print("   --> INTEGER ADDITION BIG   --- (3.2)")

-- 
local addBig1 = myriad.newInteger("999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999")
local addBigResult1 = addBig1 + addNum2

-- print(addBigResult1.sign .. " * " .. addBigResult1.digits)
assert(addBigResult1.digits == "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" and addBigResult1.sign == 1)

-- https://www.calculator.net/big-number-calculator.html?cx=999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999&cy=-123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967533&cp=20&co=plus
local addBigResult2 = addBig1 + testNum5
-- print(addBigResult2.sign .. " * " .. addBigResult2.digits)
assert(addBigResult2.digits == "999999999999999999999999999999999999999999999999999999999999999999876686553654538865654365653535656565652462562556586835532326656565656425432342323234756852032466" and addBigResult2.sign == 1)


print("   --> INTEGER ADDITION BIG   --- (PASS)")
print("--- INTEGER ADDITION       --- (PASS)")
------------------------------------------------------------------------------
-- PRINTING
print("--- INTEGER PRINTING       --- (4)")

-- print(addResult9)
assert(tostring(addResult9) == "(1) * 2469135780")
-- print(addNum1)
assert(tostring(addNum1) == "(1) * 0")

print("--- INTEGER PRINTING       --- (PASS)")
-------------------------------------------------------------------------------
--SUBTRACTION
print("--- INTEGER SUBTRACTION    --- (5)")
print("   --> INTEGER SUBTRACT SMALL --- (5.1)")


local newSub1 = myriad.newInteger(0)
local newSub2 = myriad.newInteger(1)
local newSub3 = myriad.newInteger(10)
local newSub4 = myriad.newInteger(100)
local newSub5 = myriad.newInteger("-123")
local newSub6 = myriad.newInteger("-412")
local newSub7 = myriad.newInteger("192379816283698126893")
local newSub8 = myriad.newInteger("391218238")

local subResult1 = newSub1 - newSub1
local subResult2 = newSub1 - newSub2
local subResult3 = newSub3 - newSub2
local subResult4 = newSub5 - newSub4
local subResult5 = newSub6 - newSub5
local subResult6 = newSub7 - newSub2
local subResult7 = newSub8 - newSub7
local subResult8 = newSub7 - newSub7

assert(tostring(subResult1) == "(1) * 0")
assert(tostring(subResult2) == "(-1) * 1")
assert(tostring(subResult3) == "(1) * 9")
assert(tostring(subResult4) == "(-1) * 223")
assert(tostring(subResult5) == "(-1) * 289")
assert(tostring(subResult6) == "(1) * 192379816283698126892")
assert(tostring(subResult7) == "(-1) * 192379816283306908655")
assert(tostring(subResult8) == "(1) * 0")

print("   --> INTEGER SUBTRACT SMALL --- (PASS)")
print("   --> INTEGER SUBTRACT BIG   --- (5.2)")



local bigSub1 = myriad.newInteger("654644343434123123123134654322123646812630489126938648261890346961293649861902364960126903469162936490691263946912693469160239468912693460619203649")
local bigSub2 = myriad.newInteger("123471234712896348962634929374012896358960129368956901269385692685190269035690162903658906190236590619029035698012690356906")
local bigResult1 = bigSub1 - bigSub2

assert(tostring(bigResult1) == "(1) * 654644343434123123123134530850888933916281526492009274248993988001164280905001095574434218278893900800528360288006503232569620439876995447928846743")


print("   --> INTEGER SUBTRACT BIG   --- (DONE)")
print("--- INTEGER SUBTRACTION    --- (PASS)")
-------------------------------------------------------------------------------

print("")
print("")
print("---------- \\(^.^)/ -----------")
print("--> INTEGER TESTS PASS [X] <--")
print("------------------------------")












