class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    @not_received = Delivery.all.where({ :received => false })
    @received = Delivery.all.where({ :received => true })

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    the_delivery.details = params.fetch("query_details")
    the_delivery.delivery_id = params.fetch("query_delivery_id")
    the_delivery.received = params.fetch("query_received")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Added to list" })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    # the_delivery.description = params.fetch("query_description")
    # the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    # the_delivery.details = params.fetch("query_details")
    # the_delivery.delivery_id = params.fetch("query_delivery_id")
    the_delivery.received = params.fetch("query_received")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Deleted."} )
  end
end
