class TodosController < ApplicationController

    def show
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

    #whitelist parameters passed into create method
    private def todo_params
        params.require(:todo).permit(:name, :description)
    end

end