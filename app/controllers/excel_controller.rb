class ExcelController < ApplicationController

  def update

    puts 'ingresa a update dee excel'
    puts params
    params[:_json].each do |param|
     if User.where(cc: param[:Identificacion]).count == 1
       @user= User.where(param[:Identificacion]).first
       @list= User.joins(:graduate).map {|e| e.cc}
       if   @list.include?(param[:Identificacion])
         @graduate = Graduate.where(user_id: User.where(cc: param[:Identificacion]).first).first
         Work.create(graduate: @graduate,carge: param[:puest_trabajo],company: param[:company],country: param[:country],description: param[:descrip_trabajo])
         AcademicTitle.create(graduate: @graduate,title: param[:Titulos],description: param[:Descripcion_titulo],institucion: param[:institucion_titulo],country: param[:country])
         LifeHistory.create(graduate: @graduate,title: param[:Vida_personal],description: param[:descripcion_historia])
       else
         Graduate.create(user: User.where(cc: param[:Identificacion]).first,graduation_year: param[:graduation_year],faculty: param[:facultad],qualification: param[:Carrera])
         @graduate = Graduate.where(user_id: User.where(cc: param[:Identificacion]).first).first
         Work.create(graduate: @graduate,carge: param[:puest_trabajo],company: param[:company],country: param[:country],description: param[:descrip_trabajo])
         AcademicTitle.create(graduate: @graduate,title: param[:Titulos],description: param[:Descripcion_titulo],institucion: param[:institucion_titulo],country: param[:country])
         LifeHistory.create(graduate: @graduate,title: param[:Vida_personal],description: param[:descripcion_historia])
       end
     else
      puts 'Se esta ingresando a la creacion de usuario nuevo  ------------------------------------------------------------------------------------'
         User.create(id: User.count+1,name: param[:Primer_Nombre],lastname: param[:Primer_Apellido],cc: param[:Identificacion],edad: param[:Edad],direccion: param[:direccion],email: param[:email],celular: param[:numero],password: "123456")
         Graduate.create(user: User.where(cc: param[:Identificacion]).first,graduation_year: param[:graduation_year],faculty: param[:facultad],qualification: param[:Carrera])
         @graduate = Graduate.where(user_id: User.where(cc: param[:Identificacion]).first).first
         Work.create(graduate: @graduate,carge: param[:puest_trabajo],company: param[:company],country: param[:country],description: param[:descrip_trabajo])
         AcademicTitle.create(graduate: @graduate,title: param[:Titulos],description: param[:Descripcion_titulo],institucion: param[:institucion_titulo],country: param[:country])
         LifeHistory.create(graduate: @graduate,title: param[:Vida_personal],description: param[:descripcion_historia])
       end
     end
    end

  def updategraduados
    puts 'ingrese a el actualizar de graduados'
  end
end
