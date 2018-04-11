class StudentsController < ApplicationController

    def show
        @dojo = Dojo.find( params[:dojo_id])
        @student = Student.find( params[:id])
        date = @student.created_at
        date = date.time.to_date

        @allStudents = @dojo.students

        @studentsInCohert = []
        @allStudents.each {|student|
        if (student.created_at.strftime("%d %m %y") == @student.created_at.strftime("%d %m %y"))
                @studentsInCohert.push(student)
        end
        }
        render "Students/student"
    end


    def edit
        @student = Student.find(params[:id])
        p "the student is #{@student.id}"
        @dojo = Dojo.find(params[:dojo_id])
        @all_dojos = Dojo.all
        p @all_dojos
        render "Students/update"
    end

    def new
        @dojo = Dojo.find(params[:dojo_id])
        @all_dojos = Dojo.all
        render "Students/newStudent"
    end

    def create
        @student = Student.create( makeStudent )
        if @student.errors.full_messages.length > 0
            flash[:notice] = @student.errors.full_messages
            redirect_to :back
        else
            redirect_to showDojo_path
        end
    end

    def update
        @s = Student.find( params[:id] )
        @s.update( makeStudent )
        if @s.errors.full_messages.length > 0
            flash[:notice] = @s.errors.full_messages            
            redirect_to :back
        else
            redirect_to showDojo_path
        end
    end

    def destroy
        d = Student.find( params[:id] )
        d.destroy
        redirect_to showDojo_path
    end

    private
        def makeStudent
            params.require(:student).permit(:first_name, :last_name_, :email, :dojo_id)
        end

end