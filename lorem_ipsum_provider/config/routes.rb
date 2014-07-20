LoremIpsumProvider::Application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do

    api_version(module: "v1", header: {name: "API-VERSION", value: '1'}, default: true) do
      match '/filler(.:format)' => 'text_generator#filler', via: :get
    end

  end
end
