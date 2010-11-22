require 'spec_helper'

describe "Users" do


  describe "signup" do

    describe "failure" do

      it "should not make a new user1" do
        visit signup_path
        click_button
        response.should render_template('users/new')
        response.should have_tag("div#errorExplanation")
      end


     it "should not make a new user2" do
        lambda do
          visit signup_path
          click_button
          response.should render_template('new')
          response.should have_tag("div#errorExplanation")
        end.should_not change(User, :count)
      end

      
    end



    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end#success




        describe "proba" do


     it "should not make a new user2" do

          visit signup_path
           fill_in "q",         :with => "asd"
          click_button
          #response.should render_template('new')
          response.should have_tag("title","asd")

      end

        end#proba
        
  end#sign up



end#users