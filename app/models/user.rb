class User
  include Mongoid::Document
  include Mongoid::Paperclip

  attr_accessor :password

  field :name, type: String
  field :email, type: String
  field :password_hash, type: String
  field :password_salt, type: String

  def self.after_commit(*args, &block)
    args.each do |arg|
    case arg[:on]
      when :destroy
        after_destroy &block
      end
    end
  end

	has_mongoid_attached_file :image,
	:styles => {
	  :original => '1920x1680>',
	  :thumbnail => '40x40#',
	  :small    => '100x100#',
	  :medium   => '300x300',
	  :thumbnail_2x => '80x80#',
	  :small_2x    => '200x200#',
	  :medium_2x   => '600x600'
	},
  convert_options: {
    all: '-background white -flatten +matte'
  }


end
