-- I guess that current paradigm to try making this in is OOP

---@class Integer
---@field digits string
---@field sign 1 | 0 | -1
local Integer = {}

local IntegerMT = {
    __index = Integer
    --TODO: __add, __sub etc.
}

local StringValidate
local StringParse
local NumberValidate
local NumberParse

---@param value string | number | Integer
function Integer:init(value)

    if (type(value) == "number") then -- Validate as number
        if not NumberValidate(value) then error("Bad number validation at initialization", 2) end
        self.digits, self.sign = NumberParse(value)
        
    elseif(type(value) == "string") then -- Validate as string
        if not StringValidate(value) then error("Bad string validation at initialization ", 2) end
        self.digits, self.sign = StringParse(value)

    elseif(type(value) == "table") then -- Copy constructor
        self.digits, self.sign = value.digits, value.sign

    else error("Bad integer initialization", 2) end -- Die, value is something currently unsupported

end

---Recieves a `string` **value**, returns `true` if:
--- - Not empty    
--- - Not nil
--- - The string contains one or more digits
--- 
---Otherwise returns `false`.
---@param value? string
---@return boolean
function StringValidate(value) 
    if (value == nil or value == '') then return false end -- In this current state value shouldn't be recieving `nil` anyway but I'll keep it for clarity.

    -- Starts - Optionally start with a sign - A (1-inf) amount of digits - Ends
    if (value:match("^[%+%-]?%d+$")) then return true end
    
    return false
end

---Parses given `string` value into its sign and its value separately.
---If no sign is supplied, returns positive one.
---@param value? string
---@return string, integer
function StringParse(value)
    local digits
    local sign

    if (value == nil) then return '', 0 end

    if (value:match("^%+")) then
        sign = 1
        digits = value:sub(2)
    elseif (value:match("^%-")) then
        sign = -1
        digits = value:sub(2)
    else 
        sign = 1
        digits = value
    end

    return digits, sign
end

---Recieves a `number` **value**, returns `true` if:
--- - Not nil
--- - The string contains one or more digits
--- 
---Otherwise returns `false`.
---@param value? number
---@return boolean
function NumberValidate(value) 
    if (value == nil) then return false end -- Read above.
    if (value % 1 ~= 0) then return false end -- Cannot recieve non-integer.
    if (value == math.huge) then return false end -- Inf.
    if (value == -math.huge) then return false end -- -Inf.
    if (value ~= value) then return false end -- NaN.

    return true
end

---Parses given `number` value into its sign and its string value separately.
---Negative numbers return a [sign = -1], positive and zero returns [sign = 1]
---@param value? number
---@return string, integer
function NumberParse(value)
    local digits
    local sign

    if (value == nil) then return '', 0 end

    if (value < 0) then
        sign = -1
        digits = tostring(value * (-1))
    else
        sign = 1
        digits = tostring(value)
    end

    return digits, sign
end

return IntegerMT