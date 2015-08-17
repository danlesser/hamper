require 'rails_helper'

describe EventsController do
  describe 'GET index' do
    let!(:convention) { create :convention }
    let!(:events) { create_list :event, 3, convention: convention }

    it 'assigns the conventions as @convention' do
      get :index, convention_id: convention.id
      expect(assigns(:convention)).to eq(convention)
    end

    it 'assigns all events belonging to the convention as @events' do
      get :index, convention_id: convention.id
      expect(assigns(:events)).to match_array(events)
    end
  end
end
