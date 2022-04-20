#### Rails API CRUD


1. Add route in config/routes.rb
```
namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :stories, only: [:index]      
  end
end
```
2. Add action in controllers/api/v1/stories_controller.rb

```
def index
end
```
3. Add view if needed in views/api/v1/stories/index.json.jbuilder


```
index.json.jbuilder
```