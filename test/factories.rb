FactoryGirl.define do 
    factory :course do
        title "Monkeys Like Bananas"
        description "Learn how to find good bananas."
        cost 89.99
        association :user
    end
end

FactoryGirl.define do 
    factory :user do
        sequence :email do |n|
            "fruitygirl#{n}@gmail.com"
        end
        password "orange4cantaloupe"
        password_confirmation "orange4cantaloupe"
    end
end

FactoryGirl.define do  
    factory :section do 
        title "Introduction"
        association :course 
    end
end

FactoryGirl.define do
    factory :lesson do
        title "Bananas grow on trees"
        subtitle "Effective monkeys can climb trees"
        association :section
    end
end

