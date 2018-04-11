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


    private
        def makeDojo
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end
end
