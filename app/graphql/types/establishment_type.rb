module Types
  class EstablishmentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :phone, Integer, null: false
    field :work_days, [Types::WorkDayType], null: false
  end
end
