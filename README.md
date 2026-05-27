# Myriad
Myriad is an arbitrary-precision library written in Lua.


## Features

Myriad is still very early in development but already supports:
- Addition
- Subtraction
- Comparisons
- Arbitrary size signed integers

## Notes

Myriad Integers are represented using a:
- String of base-10 digits.
- A sign (`-1` or `1`)

So something like:
```lua
    {
        digits = '12345',
        sign = -1
    }
```
represents `-12345`.

The current focus of Myriad is correctness, not performance.


## Usage

```lua
local myriad = require 'myriad'

local a = myriad.newInteger("99999999999999999999999999999999999")
local b = myriad.newInteger(1)

local result = a + b

print(result) -- 100000000000000000000000000000000000
```


## Roadmap

- Multiplication, Exponentiation, Division, Factorials, GCD
- Scientific and Engineering notation

## Acknowledgements

This is first and foremost a learning project. I am very inexperienced with Lua.

Myriad is mostly a way for me to dip my toes into long-term project development alongside learning a new language.

## Why "Myriad"?
A myriad is an enormous quantity, which felt appropriate for a bigint library.