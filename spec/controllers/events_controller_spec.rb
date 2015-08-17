require 'rails_helper'

describe EventsController do
  let(:convention) { create :convention }

  describe 'GET index' do
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

  describe 'GET show' do
    let!(:event) { create :event }

    it 'assigns the event' do
      get :show, id: event.id
      expect(assigns(:event)).to eq event
    end
  end

  describe 'GET new' do
    it 'assigns the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:convention)).to eq convention
    end

    it 'assigns a new track' do
      get :new, convention_id: convention.id
      expect(assigns(:event)).to be_a_new Event
    end

    it 'assigns the event to the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:event).convention_id).to eq convention.id
    end
  end

  describe 'POST create' do
    it 'assigns the convention' do
      post :create, convention_id: convention.id, event: attributes_for(:event)
      expect(assigns(:convention)).to eq convention
    end

    context 'with valid params' do
      it 'creates a new event on the correct convention' do
        expect do
          post :create, convention_id: convention.id, event: attributes_for(:event)
        end.to change(convention.events, :count).by(1)
      end

      it 'creates the event and assigns it' do
        post :create, convention_id: convention.id, event: attributes_for(:event)
        expect(assigns(:event)).to be_persisted
      end

      it 'redirects to the event show page' do
        post :create, convention_id: convention.id, event: attributes_for(:event)
        expect(response).to redirect_to event_path(convention.events.last)
      end
    end
  end

  describe 'GET edit' do
    let!(:event) { create :event }

    it 'assigns the event' do
      get :edit, id: event.id
      expect(assigns(:event)).to eq event
    end
  end

  describe 'PUT update' do
    let!(:event) { convention.events.create(attributes_for(:event)) }

    it 'assigns the event' do
      put :update, id: event.id, event: { conbook_name: 'abc' }
      expect(assigns(:event)).to eq event
    end

    context 'with valid params' do
      it 'updates the event' do
        put :update, id: event.id, event: { conbook_name: 'something else' }
        event.reload
        expect(event.conbook_name).to eq 'something else'
      end

      it 'redirects to the event page' do
        put :update, id: event.id, event: { conbook_name: 'something else' }
        expect(response).to redirect_to event_path(event)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:event) { convention.events.create(attributes_for(:event)) }

    it 'destroys the requested event' do
      expect { delete :destroy, id: event.id }
        .to change(Event, :count).by(-1)
    end

    it 'redirects to the events page' do
      delete :destroy, id: event.id
      expect(response).to redirect_to convention_events_path(convention)
    end
  end
end
