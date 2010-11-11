require 'spec_helper'

describe PagesController do
integrate_views


  before(:each) do
    #
    # Define @base_title here.
    #
  end

  
  #Delete these examples and add some real ones
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end


  #Proverva dali postoj home stranata
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end


  describe "GET 'contact' ustvari ja opisvas akcijata inace e nevazno so ke napisis" do
    it "should be successful vo slucaj na greska se ispisva ovaj tekst" do
      #ova e vazno praj GET request do pages/contavt
      get 'contact'
      #proverva dali resposnost ke e 200 ok
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  it "should have the right title" do
  get 'home'
  response.should have_tag("title",
                           "Pages title Home")
  end

end
