class Ped < ApplicationRecord
validates_presence_of :name
validates_presence_of :breed
validates_presence_of :gender
validates_presence_of :customer_id, :message => "(Breeder) can't be blank"


end
