class Component < ApplicationRecord
	belongs_to :service, optional: true
end
