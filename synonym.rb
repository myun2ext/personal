require './base'
class Synonym < ActiveRecord::Base
  class Migration < ActiveRecord::Migration
    def change
      create_table(:synonyms) do |t|
        t.string    :of,            null: false
        t.string    :as,            null: false
        t.datetime  :remembered_at, null: false
        t.index     %i[of as], unique: true
      end
    end
  end
  class Renderer < Sinatra::Base
    get '/a/:of/:as' do
      Synonym.create(of: params[:of], as: params[:as], remembered_at: Time.now)
    end
    get '/a/:of' do
      Synonym.where(of: [:of]).to_json
    end
  end
end
