require 'rails_helper'

describe ConventionsController do
  describe 'GET index' do
    let!(:conventions) { create_list :convention, 3 }

    it 'assigns all conventions as @conventions' do
      get :index
      expect(assigns(:conventions)).to match_array(conventions)
    end
  end

  describe 'GET new' do
    it 'assigns a new convention' do
      get :new
      expect(assigns(:convention)).to be_a_new Convention
    end
  end
  describe 'POST create' do
    it 'creates the convention and assigns it' do
      post :create, convention: attributes_for(:convention)
      expect(assigns(:convention)).to be_persisted
    end

    it 'redirects to the conventions page' do
      post :create, convention: attributes_for(:convention)
      expect(response).to redirect_to conventions_path
    end
  end
end
