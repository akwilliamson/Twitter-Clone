class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :message, :presence => true

  def message_split(message)
    words = message.split(' ')
    @new_words = []
    rgx = /\@(.+)$/

    words.each do |word|
      if word.match(rgx)
        @new_words << word.split('@')[1]

      end
    end

    @new_words.length > 0

  end

end
