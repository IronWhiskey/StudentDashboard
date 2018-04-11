class DojosController < ApplicationController

    def main
        @dojos = Dojo.all
        render "dojos/main" 
    end

    def showForm
        render "dojos/newDojo"
    end

    def create
        @dojo = Dojo.create( makeDojo )
        # p "@dojo.errors is : #{@dojo.errors.full_messages}"
        if @dojo.errors.full_messages.length > 0
            flash[:notice] = @dojo.errors.full_messages            
            redirect_to showDojoForm_path
        else
            redirect_to root_path 
        end
    end

    def show
        @dojo = Dojo.find( params[:id] )
        @students = @dojo.students
        render "dojos/dojoInfo"
    end

    

    def edit
        @dojo = Dojo.find( params[:id] )
        render "dojos/dojoEdit"
    end

    def updateDojo
        @d = Dojo.find(params[:id])
        @d.update( makeDojo )
        if @d.errors.full_messages.length > 0
            flash[:notice] = @d.errors.full_messages            
            redirect_to :back
        else
            redirect_to root_path
        end
    end

    def destroy
        d = Dojo.find( params[:id] )
        d.destroy
        redirect_to root_path
    end
    # <%=link_to "destroy", destroyDojo_path(dojo.id)%>


    private
        def makeDojo
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end

        # <td><%=link_to "show", showDojo_path(dojo.id)%> | <%= link_to "Edit", editDojo_path(dojo.id) %> |  <a href="dojos/<%= dojo.id %>" data-method="delete">Delete</a> </td>


end
