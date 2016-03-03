require './base'
class Trait < ActiveRecord::Base
  class Migration < ActiveRecord::Migration
    def change
      create_table(:traits) do |t|
        t.string    :what,          null: false
        t.string    :of,            null: false
        t.string    :is,            null: false
        t.datetime  :remembered_at, null: false
        t.index     %i[what of], unique: true
      end
    end
  end
  class Renderer < Sinatra::Base
    get '/c/:w/:of/:is' do
      Trait.create(what: params[:w], of: params[:of], is: params[:is], remembered_at: Time.now)
    end
    get '/d/:id' do
      Trait.find(params[:id]).delete
    end
    get '/' do
      Trait.all.to_json
    end
  end
end
