local IntegerMT = require 'src.core.Integer'

local myriad = {}

---@param value string | number | Integer
function myriad.newInteger(value)
    local new = setmetatable({}, IntegerMT)
    new:init(value)

    return new
end

return myriad