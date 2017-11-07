
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
  const LB = product_lowerbounds
  const P = product_profits
  const CAP = resource_capacities
  const CONS = resource_consumptions
  
  # Build the model     
  # ...
  
  # solve it, and return its obj value
  # ...
 
  return 0
    
end






