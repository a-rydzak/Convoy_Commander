class VehiclesController < ApplicationController
  def create
  	vehicle=Vehicle.new(vehicle_type: params[:vehicle_type], call_sign: params[:call_sign], serial_number: params[:serial_number], order_of_movement: params[:order_of_movement], bumper_number: params[:bumper_number], convoy_plan_id: params[:id])
  	if vehicle.valid?
  		Vehicle.create(vehicle_type: params[:vehicle_type], call_sign: params[:call_sign], serial_number: params[:serial_number], order_of_movement: params[:order_of_movement], bumper_number: params[:bumper_number], convoy_plan_id: params[:id])
  		redirect_to :back
  	else
  		flash[:errors]=vehicle.errors.full_messages
      	redirect_to :back
   	end
  end

   def update
   	vehicle=Vehicle.new(params[:id], vehicle_type: params[:vehicle_type], call_sign: params[:call_sign], serial_number: params[:serial_number], order_of_movement: params[:order_of_movement], bumper_number: params[:bumper_number])
   	if vehicle.valid?
  		Vehicle.update(params[:id], vehicle_type: params[:vehicle_type], call_sign: params[:call_sign], serial_number: params[:serial_number], order_of_movement: params[:order_of_movement], bumper_number: params[:bumper_number])
  		redirect_to :back
  	else 
  		flash[:errors]=vehicle.errors.full_messages
      	redirect_to :back
     end
  end
end
