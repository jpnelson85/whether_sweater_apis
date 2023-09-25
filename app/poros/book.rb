class Book
  attr_reader :title,
              :authors,
              :isbns

  def initialize(data)
    @title = data[:title]
    @authors = data[:author_name]
    @isbns = data[:isbn]
  end
end