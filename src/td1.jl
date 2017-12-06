using JuMP, Cbc

# Input : 
# - product_lowerbounds est un vecteur qui contient le nombre min pour chaque produit
# - product_profits un vecteur qui contient le profit unitaire pour chaque produit
# - resource_capacities un vecteur qui contient la capacité de chaque ressource
# - resource_consumptions une matrice (m_pr) qui contient pour chaque produit p sa consommation de r
# Output :
# - le profit max qui respecte les contraintes
function resource_assign(product_lowerbounds, product_profits, resource_capacities, resource_consumptions)

  const I = 1:length(product_profits)
  const R = 1:length(resource_capacities)
  
  # Build the model     
  # ...
  
  # solve it, and return its obj value
  # ...
  
  return 0
end

# Input:
# demands
# production_costs
# production_times
# holding_costs
# setup_costs
# setup_times
# penalty_costs
# capacities

# Output
# Le cout minimum qui permet de respecter les contraintes

function lot_sizing(demands, production_costs, production_times, holding_costs, setup_costs, setup_times,
    penalty_costs, capacities)
        
    const I = 1:size(demands,1)    
    const T = 1:size(demands,2)
    
    m = Model(solver = CbcSolver())    
          
    # Build the model     
    @variable(m, x[I,T] >= 0 , Int)
    @variable(m, y[I,T], Bin)    
    @variable(m, s[I,T] >= 0 , Int)
    @variable(m, z[I,T] >= 0 , Int)
    
    @constraint(m, conserv[i in I,t in T], x[i,t] + (t==1?0:s[i,t-1]) + z[i,t] == demands[i,t]+ s[i,t])
    
    @constraint(m, cap[t in T], sum(production_times[i,t] * x[i,t] + setup_times[i,t] * y[i,t] for i in I) <= capacities[t]) 
    
    @constraint(m, setup[i in I, t in T], x[i,t] <= 10 * y[i,t]) 
    
    @objective(m, Min, sum(production_costs[i,t] * x[i,t] + holding_costs[i,t] * s[i,t] + penalty_costs[i,t] * z[i,t] +
        setup_costs[i,t] * y[i,t] for i in I, t in T))
    
    # solve it, and return its obj value
    # ...   
        
    solve(m)    
    # @show getvalue(x)
    # @show getvalue(s)
    # @show getvalue(z)
    # @show getobjectivevalue(m)     
        
    return getobjectivevalue(m)
end






