local myriad = require 'myriad'

print("--- INTEGER TEST START [ ] ---")
-------------------------------------------------------------------------------
print("--- INTEGER INITIALIZATION --- (1)")

local testNum1 = myriad.newInteger(123)
local testNum2 = myriad.newInteger("123")
local testNum3 = myriad.newInteger(456)
local testNum4 = myriad.newInteger("-456")
local testNum5 = myriad.newInteger("-123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967533")
local testNum6 = myriad.newInteger(testNum1)
assert(not pcall(myriad.newInteger, "12.3"))
assert(not pcall(myriad.newInteger, math.huge))
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
-------------------------------------------------------------------------------
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


print("--- INTEGER RELATIONS      --- (PASS)")
-------------------------------------------------------------------------------
print("--- INTEGER ADDITION       --- (3)")
print("   --- INTEGER ADDITION SMALL --- (3.1)")

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


print("   --- INTEGER ADDITION SMALL --- (PASS)")
print("   --- INTEGER ADDITION BIG   --- (3.2)")

-- 
local addBig1 = myriad.newInteger("999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999")
local addBigResult1 = addBig1 + addNum2

-- print(addBigResult1.sign .. " * " .. addBigResult1.digits)
assert(addBigResult1.digits == "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" and addBigResult1.sign == 1)

-- https://www.calculator.net/big-number-calculator.html?cx=123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967533&cy=999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999&cp=20&co=plus
local addBigResult2 = addBig1 + testNum5
-- print(addBigResult2.sign .. " * " .. addBigResult2.digits)
assert(addBigResult2.digits == "1000000000000000000000000000000000000000000000000000000000000000000123313446345461134345634346464343434347537437443413164467673343434343574567657676765243147967532" and addBigResult2.sign == 1)

print("   --- INTEGER ADDITION BIG   --- (PASS)")
print("--- INTEGER ADDITION       --- (PASS)")


-------------------------------------------------------------------------------
print("")
print("")
print("---------- \\(^.^)/ -----------")
print("--> INTEGER TESTS PASS [X] <--")
print("------------------------------")












