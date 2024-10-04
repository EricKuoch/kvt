# db/seeds.rb
Transaction.destroy_all
TransactionType.destroy_all
WorkDay.destroy_all
Establishment.destroy_all

# Étape 1 : Créer des établissements
establishment = Establishment.create!(
  name: "Cordonnerie et Clés",
  address: "123 Rue de Paris, Paris, France",
  phone: 1234567890
)
# Étape 5 : Créer des catégories de transactions
TransactionType.create!([
  { name: 'Cordonnerie', description: 'Services de cordonnerie' },
  { name: 'Clés', description: 'Services de duplication de clés' },
  { name: 'Vente Mses', description: 'Vente de produits divers' }
])
# Étape 2 : Créer des jours de travail et les transactions associées
work_days_data = [
  { date: '2024-01-01', total: 0.0, closed_shop: false },
  { date: '2024-01-02', total: 62.0, closed_shop: false, transactions: [
      { payment_type: 'cash', amount: 62.0 } # Total pour ce jour
    ]},
  { date: '2024-01-03', total: 80.0, closed_shop: false, transactions: [
      { payment_type: 'cash', amount: 30.0 },
      { payment_type: 'card', amount: 40.0 },
      { payment_type: 'cash', amount: 10.0 }
    ]},
  { date: '2024-01-04', total: 65.0, closed_shop: false, transactions: [
      { payment_type: 'cash', amount: 35.0 },
      { payment_type: 'card', amount: 18.0 },
      { payment_type: 'cash', amount: 12.0 }
    ]},
  { date: '2024-01-05', total: 79.0, closed_shop: false, transactions: [
      { payment_type: 'cash', amount: 30.0 },
      { payment_type: 'card', amount: 14.0 },
      { payment_type: 'cash', amount: 35.0 }
    ]},
  # Ajoutez les autres jours ici...
  { date: '2024-01-31', total: 77.0, closed_shop: false, transactions: [
      { payment_type: 'cash', amount: 27.0 },
      { payment_type: 'card', amount: 15.0 },
      { payment_type: 'cash', amount: 35.0 }
    ]}
]

# Étape 3 : Boucle à travers les données des jours de travail et créer les enregistrements
work_days_data.each do |day_data|
  work_day = WorkDay.create!(
    date: day_data[:date],
    total: day_data[:total],
    closed_shop: day_data[:closed_shop],
    establishment_id: establishment.id
  )
  
  # Étape 4 : Créer les transactions associées
  if day_data[:transactions]
    day_data[:transactions].each do |transaction_data|
      Transaction.create!(
        work_day: work_day,
        transaction_type_id: 1, # ID par défaut, changez selon vos catégories
        payment_type: transaction_data[:payment_type], # Maintenant inclut espèces, carte, etc.
        amount: transaction_data[:amount]
      )
    end
  end
end

