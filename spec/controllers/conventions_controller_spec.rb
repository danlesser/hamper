require 'rails_helper'

describe ConventionsController do
  fixtures :users

  before do
    @user = users(:dan)
    login_user
  end

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
    context 'with valid params' do
      it 'creates the convention and assigns it' do
        post :create, convention: attributes_for(:convention)
        expect(assigns(:convention)).to be_persisted
      end

      it 'redirects to the conventions page' do
        post :create, convention: attributes_for(:convention)
        expect(response).to redirect_to conventions_path
      end
    end

    context 'with invalid params' do
      it 'assigns a new convention' do
        post :create, convention: { convention_email: 'wat' }
        expect(assigns(:convention)).to be_a_new(Convention)
      end

      it 're-renders the new template' do
        post :create, convention: { convention_email: 'wat' }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit' do
    let!(:convention) { create :convention }

    it 'assigns the convention' do
      get :edit, id: convention.id
      expect(assigns(:convention)).to eq convention
    end
  end

  describe 'PUT update' do
    let!(:convention) { create :convention }

    it 'assigns the convention' do
      put :update, id: convention.id, convention: { title: 'abc' }
      expect(assigns(:convention)).to eq convention
    end

    context 'with valid params' do
      it 'updates the convention' do
        put :update, id: convention.id, convention: { title: 'something else' }
        convention.reload
        expect(convention.title).to eq 'something else'
      end

      it 'redirects to the conventions page' do
        put :update, id: convention.id, convention: { title: 'something else' }
        expect(response).to redirect_to conventions_path
      end
    end

    context 'with invalid params' do
      it 're-renders the edit form' do
        put :update, id: convention.id, convention: { title: 'Hi!:::' }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:convention) { create :convention }
    it 'destroys the requested convention' do
      expect { delete :destroy, id: convention.id }
        .to change(Convention, :count).by(-1)
    end

    it 'redirects to the conventions page' do
      delete :destroy, id: convention.id
      expect(response).to redirect_to conventions_path
    end
  end

  describe 'GET show' do
    let!(:convention) { create :convention }

    it 'assigns the convention' do
      get :show, id: convention.id
      expect(assigns(:convention)).to eq convention
    end
  end
end
