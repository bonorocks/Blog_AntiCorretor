str = "0770000.019625.0avg(VALM2)9625.0avg(VALOR)770000.0"
res= str.slice(str.index("M2")+3..str.index("VALOR"))
puts res.slice(0..res.index(".")-1)
puts str.slice(1..str.index(".")-1)