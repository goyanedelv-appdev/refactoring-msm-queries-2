# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

  # Only used for the the_one relation
  belongs_to(:director,
      {
        :foreign_key => "director_id",
        :class_name => "Director"
      }
    )

  # def director
  #  key = self.director_id

  #  matching_set = Director.where({ :id => key })

  #  the_one = matching_set.at(0)

  #  return the_one
  # end

  # And for the many relation:
  has_many(:characters, 
      {
        :class_name => "Character", 
        :foreign_key => "movie_id"
      }
    )
  
  # def characters
  #  key =self.id

  #  the_many = Characters.where({}:movie_id => key)

  #  return the_many
  # end

  has_many(:cast, {:through => :characters, :source => :actor})

  # def cast
  #  the_many = Array.new

  #  self.characters.each do |joining_record|
  #    destination_record = joining_record.movie

  #    the_many.push(destination_record)
  #  end

  #  return the_many
  # end

end
