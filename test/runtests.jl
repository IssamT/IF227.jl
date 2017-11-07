using IF227
using Base.Test

@testset "Tests of td1 ex1 : resource_assign" begin

    product_lowerbounds = [100, 100]
    product_profits = [12, 20] 
    resource_capacities = [490, 400]
    resource_consumptions = [12*60 30*60; 24*60 24*60]

    @test resource_assign(product_lowerbounds, product_profits, resource_capacities, resource_consumptions) == 0
    
    product_lowerbounds = [100, 100, 120, 180]
    product_profits = [12, 20, 16, 23] 
    resource_capacities = [490, 400, 320]
    resource_consumptions = [12*60 30*60 24*60 ; 24*60 24*60 25*60; 12*60 32*60 21*60 ; 22*60 27*60 24*60]

    @test resource_assign(product_lowerbounds, product_profits, resource_capacities, resource_consumptions) == 0
    
end
