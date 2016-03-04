require './base'
class Property < ActiveRecord::Base
  class Migration < ActiveRecord::Migration
    def change
      create_table(:properties) do |t|
        t.string    :what,          null: false
        t.string    :of,            null: false
        t.string    :is,            null: false
        t.datetime  :remembered_at, null: false
        t.index     %i[what of], unique: true
      end
    end
  end
  class Renderer < Sinatra::Base
    get '/p/:w/:of/:is' do
      Property.create(what: params[:w], of: params[:of], is: params[:is], remembered_at: Time.now)
    end
    get '/p/d/:id' do
      Property.find(params[:id]).delete
    end
    get '/' do
      Property.all.to_json
    end
  end
end
