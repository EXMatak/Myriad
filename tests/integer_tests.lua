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
print("--- INTEGER RELATIONS --- (2)")


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


print("--- INTEGER RELATIONS --- (PASS)")
-------------------------------------------------------------------------------

print("--- INTEGER TESTS PASS [X] ---")










