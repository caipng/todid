# todos   GET    /todos(.:format)                                                                                  todos#index
#         POST   /todos(.:format)                                                                                  todos#create
# todo    GET    /todos/:id(.:format)                                                                              todos#show
#         PATCH  /todos/:id(.:format)                                                                              todos#update
#         PUT    /todos/:id(.:format)                                                                              todos#update
#         DELETE /todos/:id(.:format)                                                                              todos#destroy

class TodosController < ApplicationController
    # GET /todos
    def index
      @todos = @user.todos
      render json: @todos, status: :ok
    end
end
