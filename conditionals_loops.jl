## Conditional

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


## enumerate

for (i,n) in enumerate(10:10:100)
    println(i+n)
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
