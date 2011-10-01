
  class Post < ActiveRecord::Base
  
    validates_presence_of :titulo
    validates_inclusion_of :status,
        :in => %w( publicado rascunho )
    validates_presence_of :texto
    
    has_one :autor
    
  end

