class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories
    # Es una propiedad que puedo leer y escribir que le agregamos a nuestro objeto
    attr_accessor :category_elements

    def save_categories
        # categories_array = category_elements.split(',') Como category elements es una arreglo no se tiene que convertir
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            # unless HasCategory.where(article: self, category_id: category_id).any?
            #     HasCategory.create(article: self, category_id: category_id)
            # end
            HasCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end
end
