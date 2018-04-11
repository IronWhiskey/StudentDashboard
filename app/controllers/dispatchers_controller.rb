class DispatchersController < ApplicationController

    def main
        @dojos = Dojo.all
        render "dispatchers/main" 
    end

    def showForm
        render "dispatchers/newDojo"
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

    def showDojo
        @dojo = Dojo.find( params[:id] )
        @students = @dojo.students
        # p @student
        render "dispatchers/dojoInfo"
    end

    

    def editDojo
        @dojo = Dojo.find( params[:id] )
        render "dispatchers/dojoEdit"
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

    def  destroyDojo
        d = Dojo.find( params[:id] )
        d.destroy
        redirect_to root_path
    end
    # <%=link_to "destroy", destroyDojo_path(dojo.id)%>


    private
        def makeDojo
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end
end
