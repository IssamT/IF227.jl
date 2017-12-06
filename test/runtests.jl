using IF227
using Base.Test

@testset "Tests of td1 ex1 : resource_assign" begin

    product_lowerbounds = [100, 100]
    product_profits = [12, 20] 
    resource_capacities = [490*60, 400*60]
    resource_consumptions = [12 30; 24 24]

    # @test resource_assign(product_lowerbounds, product_profits, resource_capacities, resource_consumptions) == 18700.0
    
    #=
    product_lowerbounds = [100, 100, 120, 180]
    product_profits = [12, 20, 16, 23] 
    resource_capacities = [490*60, 400*60, 320*60]
    resource_consumptions = [12 30 24 ; 24 24 25; 12 32 21 ; 22 27 24]

    @test resource_assign(product_lowerbounds, product_profits, resource_capacities, resource_consumptions) == 0
    =#
end

@testset "Tests of td1 ex2 : lot_sizing" begin

    srand(227)
        
    I=2
    T=3    
    demands = rand(1:5, I,T)
    production_costs = rand(10:20,I,T)
    production_times = rand(30:60,I,T)
    holding_costs = rand(1:60,I,T)
    setup_costs = rand(30:40,I,T)
    setup_times = rand(10:15,I,T)
    penalty_costs = rand(100:200,I,T)
    capacities = rand(300:500,T)
    
    @test lot_sizing(demands, production_costs, production_times, holding_costs, setup_costs, setup_times,
        penalty_costs, capacities) == 570.0
        
    I=3
    T=7    
    demands = rand(1:5, I, T)
    production_costs = rand(10:20,I,T)
    production_times = rand(30:60,I,T)
    holding_costs = rand(1:60,I,T)
    setup_costs = rand(30:40,I,T)
    setup_times = rand(10:15,I,T)
    penalty_costs = rand(100:200,I,T)
    capacities = rand(300:500,T)

    @test lot_sizing(demands, production_costs, production_times, holding_costs, setup_costs, setup_times,
        penalty_costs, capacities) == 1834.0
        
    capacities = capacities / 4

    @test lot_sizing(demands, production_costs, production_times, holding_costs, setup_costs, setup_times,
        penalty_costs, capacities) == 6696.0
    
end

