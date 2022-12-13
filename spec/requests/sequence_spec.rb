require 'rails_helper'

RSpec.describe 'Sequences', type: :request do
  describe 'GET /' do
    before { get root_path } # перед каждым тестом делать запрос

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe 'POST /show' do
    # Сценарий, когда параметры неправильные
    context 'when params are valid' do
      let(:number_params) { 3 }
      let(:string_array_params) { '16 25 39' }
      before { post show_path, params: { number: number_params, string_array: string_array_params }, xhr: true }

      it 'returns http success' do
      expect(response).to have_http_status(:success)
      end

      it 'renders show templates' do
        expect(response).to render_template(:show)
        expect(response).to render_template(:_show)
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be true
      end
    end
  end
end
