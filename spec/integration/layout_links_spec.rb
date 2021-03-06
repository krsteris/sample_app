require 'spec_helper'

describe "LayoutLinks" do
  
  
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('pages/contact')
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template('pages/about')
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('pages/help')
  end

  it "should have a signup page at '/signup' mora da fati ova" do
    #vaka bez problem
       get 'users/new'
    #

      #vaka greska zs ova ne e integration test
      #get '/signup'
    response.should render_template('users/new')
  end

#webrat
    it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should render_template('pages/about')
    #click_link "Help"
    #response.should # fill in
    #click_link "Contact"
    #response.should # fill in
    #click_link "Home"
    #response.should # fill in
    #click_link "Sign up now!"
    #response.should # fill in
  end


end#layout
