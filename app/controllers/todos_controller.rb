class TodosController < ApplicationController

    def index
        @todos = Todo.all
    end

    def show
        #grabs todo item from the id in url
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new()
    end

    def create
        @todo = Todo.new(todo_params) #create object with params
        if@todo.save #save new obj in db
            flash[:notice] = 'Todo was successfully created'
            redirect_to todo_path(@todo) #redirect to newly created obj
        else
             render 'new'
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = 'Todo was successfully updated'
            redirect_to todo_path(@todo)
        else   
            render 'edit'
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = 'Todo was deleted successfully'
        redirect_to todos_path
    end

    #whitelist parameters passed into create method
    private def todo_params
        params.require(:todo).permit(:name, :description)
    end

end