class Api::V1::StrainsController < ApplicationController

    before_action :user_is_dispensary, only: [:create, :update]

def index
    @strains = Strain.all
    render json: { strains: StrainSerializer.new(@strains) }
end

def create

    @newStrain = Strain.new(strain_params)

    #if the strain is already in the database, create only relationship
    @newStrain.strain_name.downcase == Strain.find_by(strain_name: @newStrain.strain_name.downcase)

    if @newStrain.strain_name.downcase == Strain.find_by(strain_name: @newStrain.strain_name.downcase)

        @strain = Strain.find_by(strain_name: strain_params[:strain_name])

        @user.dispensary_strain.create(@Strain)

        render json: { StrainSerializer.new(@strain) }
        #create a new dispensary_strain_id on the join table and then render original strain
    elsif @newStrain.valid?

        @strain = Strain.create(strain_params)

        DispensaryStrain.create(@strain)

        render json: { StrainSerializer.new(@strain) }
        #create a new strain into the database and then create a new dispensary_strain_id
    else
        render json: @newStrain.errors
end
end

def show
    @strain = Strain.find(strain_name: strain_params[:strain_name])

    render json: {strains: StrainSerializer.new(@strain)}
end

def update
end

def destroy
end


private

def user_is_dispensary
    @user = User.find(params[:id])
    if @user.dispensary?
        @dispensary = @user
    else
        render @user.errors, status: :unprocessable_entity
    end
end



def strain_params
    params.require(:strain).permit(:id, :avatar, :strain_type, :strain_name, :location, :description)
end






end
