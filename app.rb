require './trait.rb'
require './synonym.rb'
class PersonaApp < Sinatra::Base
  use Trait::Renderer
  use Synonym::Renderer
  set :bind, '0.0.0.0'
  run!
end
