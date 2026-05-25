local IntegerMT = require 'src.core.Integer'

local myriad = {}

---@param value string | number | Integer
function myriad.newInteger(value)
    return IntegerMT.new(value)
end

return myriad