require 'rails_helper'

describe ConventionsController do
  describe 'GET index' do
    let!(:conventions) { create_list :convention, 3 }

    it 'assigns all conventions as @conventions' do
      get :index
      expect(assigns(:conventions)).to match_array(conventions)
    end
  end
end
