
  require 'spec_helper'

  describe Post do
    
    before(:each) do
      @post = Post.create(:titulo => "Meu post",:status => 'publicado',:texto => "teste")
    end
  
    it "deve ser invalido sem um titulo" do
      @post.titulo = nil
      @post.should_not be_valid
    end
  
    it "deve ser invalido sem um status" do
      @post.status = nil
      @post.should_not be_valid
    end
    
    it "deve ser invalido se o status for diferente de publicado ou rascunho" do
      @post.status = "despublicado"
      @post.should_not be_valid
    end
    
    it "deve ser invalido sem texto" do
      @post.texto = nil
      @post.should_not be_valid
    end
    
    it "deve ser invalido sem um autor" do
      @post.should_not be_valid
    end
  
  end

