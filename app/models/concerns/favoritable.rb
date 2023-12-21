module Favoritable
    extend ActiveSupport::Concern

    included do
      has_many :favoritos, dependent: :destroy

      def favorite!
        favoritos.create(user: Current.user)
      end

      def unfavorite!
        favorito.destroy
      end

      def favorito
        favoritos.find_by(user: Current.user)
      end
    end
end
