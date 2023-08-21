class Project < ApplicationRecord
    has_many_attached :images
    # has_many :images, dependent: :destroy

    def image_variants
      {
        small: { resize: '300x300' },
        medium: { resize: '512x512' },
        large: { resize: '1024x1024' }
      }
    end
end
