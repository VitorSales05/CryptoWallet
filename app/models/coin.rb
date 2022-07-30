class Coin < ApplicationRecord
    belongs_to :mining_type #, optional: true  ||| <-- não seria mais obrigatório informar a FK
end
