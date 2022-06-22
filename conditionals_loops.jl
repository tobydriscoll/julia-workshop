## Conditional

'a' ≤ 'a'
'a' < 'c' && 'c' < 'z'

'a' < 'c' < 'z'

π == 3.1416

isapprox(π,3.14159265358)
π ≈ 3.14159265358

3 in 1:10

4.1 in 1:10


## for loop

a = 7
s = 1
for n in 1:9
    s = (s+(a/s))/2
    println(s)
end

## local vs. global scope

## v1: not what you might want

for i in 1:5
    z = i^2
end
z  # not defined at global scope

## v2: explicit global declaration

for i in 1:5
    global zz = i^2
end
zz

## v3: implicit inheritance of outer scope

zzz = 0
for i in 1:5
    zzz = i^2
end
zzz

## enumerate

for (i,n) in enumerate(10:10:100)
    println("i is $i, n is $n")
end


## while loop

x = 117
while x > 1
    if iseven(x)
        x ÷= 2
    else
        x = 3x+1
    end
    println(x)
end
