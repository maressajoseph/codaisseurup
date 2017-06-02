class Api::EventsController < ApplicationController
  def index
    render status: :ok, json: {
      events: Event.all
    }.to_json
  end
end
