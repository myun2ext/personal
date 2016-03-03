require './trait.rb'
class PersonaApp < Sinatra::Base
  use Trait::Renderer
  set :bind, '0.0.0.0'
  run!
end
