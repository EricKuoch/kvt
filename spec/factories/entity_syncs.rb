FactoryBot.define do
  factory :entity_sync do
    entity { "recette" }
    association :establishment 
    enable { true }
    mapper_name { nil }
    establishment_helper { "kvt" }
    conversion_hash_method { "kvt_transactions" }
    folder_path { "lib" }
    csv_name { "accounting" }
    headers { true }
    col_sep { ";" }
    encoding { nil }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
