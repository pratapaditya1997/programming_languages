class Hello
    def my_first_method
        puts "Hello, World!"
    end
end

class A
    def m1
        34
    end

    def m2 (x,y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end
end

class B
    def m1
        4
    end

    def m3 x
        x.abs * 2 + self.m1
    end
end

class C
    Age = 22

    def self.reset_bar
        @@bar = 0
    end

    def initialize(f=0)
        @foo = f
    end

    def m1
        @foo = 0
    end

    def m2 x
        @foo += x
        @@bar += 1
    end

    def foo
        @foo
    end

    def bar
        @@bar
    end
end

class Foo
    def initialize(max)
        @max = max
    end

    def silly
        yield(4,5) + yield(@max,@max)
    end

    def count base
        if base > @max
            raise "reached max"
        elsif yield base
            1
        else
            1 + (count(base+1) {|i| yield i})
        end
    end
end

class Point
    #defines setter and getter methods
    # x, y, x=, y=
    attr_accessor :x, :y

    def initialize(x,y)
        @x = x
        @y = y
    end

    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y)
    end

    def distFromOrigin2
        Math.sqrt(x*x + y*y)
    end
end

class ThreeDPoint < Point
    attr_accessor :z

    def initialize(x,y,z)
        super(x,y)
        @z = z
    end

    def distFromOrigin
        d = super
        Math.sqrt(d*d + @z * @z)
    end

    def distFromOrigin2
        d = super
        Math.sqrt(d * d + z * z)
    end
end

class PolarPoint < Point
    def initialize(r, theta)
        @r = r
        @theta = theta
    end

    def x
        @r * Math.cos(@theta)
    end

    def y
        @r * Math.sin(@theta)
    end

    def x= a
        b = y
        @theta = Math.atan(b/a)
        @r = Math.sqrt(a*a + b*b)
        self
    end

    def y= b
        a = y
        @theta = Math.atan(b/a)
        @r = Math.sqrt(a*a + b*b)
        self
    end

    def distFromOrigin
        @r
    end

    # doen't need to override distFromOrigin2
    # as it uses the getter methods
end

class ColorPoint < Point
    attr_accessor :color 

    def initialize(x,y,c = "clear")
        #super keyword calls same method from superclass
        super(x,y)
        @color = c
    end
end

