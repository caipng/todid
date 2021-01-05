class TodosController < ApplicationController
    before_action :find_todo, except: [:index, :create]

    # GET /todos
    def index
      @todos = @user.todos
      render json: @todos, status: :ok
    end

    # POST /todos
    def create
        @todo = @user.todos.create!(todo_params)
        render json: @todo, status: :created
    end

    # GET /todos/:id
    def show
        render json: @todo, status: :ok
    end

    # PATCH /todos/:id, PUT /todos/:id
    def update
        # @todo.update!(todo_params)
        @todo.assign_attributes(todo_params)
        if @todo.valid?
            @todo.save
            render json: @todo, status: :ok
        else
            render json: { error: @todo.errors.full_messages }, status: :unprocessable_entity
        end        
    end
    
    # DELETE /todos/:id
    def destroy
        @todo.destroy
        render json: @todo, status: :ok
    end

    private

    def todo_params
        params.permit(:id, :title, :description, :completed, :completed_time, :tags, :due_time)
    end

    def find_todo
        @todo = Todo.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: 'Todo not found' }, status: :not_found
    end
end
