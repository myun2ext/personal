require 'activerecord'
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
end
