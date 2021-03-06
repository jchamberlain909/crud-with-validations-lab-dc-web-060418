class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year,:artist_name]}
    
    validates :release_year, presence: true, if: :released?
    def released?
        self.released
    end
    validates :release_year, numericality: {less_than_or_equal_to:DateTime.now.year}, if: :released?
    validates :artist_name, presence: true


end
