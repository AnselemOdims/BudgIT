require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  context 'routes' do
    it { should route(:get, '/deals').to(action: :index) }
    it { should route(:get, '/deals/1').to(action: :show, id: 1) }
    it { should route(:post, '/deals').to(action: :create) }
    it { should route(:get, '/deals/new').to(action: :new) }
  end
end
