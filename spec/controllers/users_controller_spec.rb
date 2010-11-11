require 'spec_helper'

describe UsersController do
  integrate_views
  
  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      #response.should have_tag("title", /Sign up/)
      response.should have_tag("span", /Sign up/)
    end

  it "should have a signup page at '/signup' mora da fati ova" do
    #vaka bez problem
       get 'users/new' 
    #
      
      #vaka greska zs ova ne e integration test
      #get '/signup'
    response.should render_template('users/new')
  end

  end#new
end



