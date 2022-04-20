require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/categories/1').to(action: :show, id: 1) }
    it { should route(:post, '/categories').to(action: :create) }
    it { should route(:get, '/categories/new').to(action: :new) }
  end
end
