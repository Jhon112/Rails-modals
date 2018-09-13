class Product < ApplicationRecord
    validates :name, presence: true

    scope :published, -> {where(published: true)}

    def word_count
        name.split(" ").length
    end

    def margen
        (price - costo)/costo
    end

    def stock_status
        quantity > 0 ? true : false        
    end

    
end
