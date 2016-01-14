class SolicitudsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :index, :show]
    before_action :admin_user, only: :destroy
    before_action :set_solicitud, only: [:show, :edit, :update, :destroy]

  # GET /solicituds
  # GET /solicituds.json
  def index
    @solicituds = Solicitud.all
  end
  
    def orden
        @solicituds = Solicitud.aprobadas
    end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
  end

  # GET /solicituds/new
  def new
    @solicitud = Solicitud.new
    @solicitud.productos.build
  end

  # GET /solicituds/1/edit
  def edit
  end

  # POST /solicituds
  # POST /solicituds.json
    def create
        if Solicitud.search(params[:search]) && Solicitud.search(params[:search]).status
            @solicitud = Solicitud.search(params[:search]).solicituds.build(solicitud_params)
            respond_to do |format|
                if @solicitud.save
                    format.html { redirect_to root_path, notice: 'Solicitud Creada HUMANO' }
                    format.json { render :show, status: :created, location: @solicitud }
                else
                    format.html { redirect_to root_path }
                    format.json { render json: @solicitud.errors, status: :unprocessable_entity }
                end
            end
        else
            flash[:error] = "Lo siento no puedes JAJAJA"
            redirect_to root_path
        end
    end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
    def update
        respond_to do |format|
            if @solicitud.update(solicitud_params)
                format.html { redirect_to @solicitud, notice: 'Solicitud actualizada' }
                format.json { render :show, status: :ok, location: @solicitud }
            else
                format.html { render :edit }
                format.json { render json: @solicitud.errors, status: :unprocessable_entity }
            end
        end
        if @solicitud.aprobar
            b = Compra.create(empleado_id: @solicitud.empleado_id, proyecto_id: @solicitud.proyecto_id, solicitud_id: @solicitud.id, 
            total: @solicitud.productos.where(aprobar: true).sum(:total))
            @solicitud.productos.each do |producto|
                producto.compra_id = b.id
                producto.unidad_compra = producto.unidad
                producto.cantidad_compra = producto.cantidad
                producto.descripcion_compra = producto.descripcion
                producto.precio_compra = producto.precio
                producto.total_compra = producto.cantidad * producto.precio
                producto.save
            end
        end
    end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud destruida HUMANO.' }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_params
      params.require(:solicitud).permit(:pin, :empleado_id, :proyecto_id, :total, :aprobar, 
                                        productos_attributes: [:id, :nombre, :descripcion, :uso, :cantidad, :precio, :unidad, :precio_total, 
                                        :aprobar, :_destroy])
    end
    
     # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Identificate HUMANO."
            redirect_to login_url
        end
    end
    
    # Confirms the correct user.
    def correct_user
        @user = Usuario.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end