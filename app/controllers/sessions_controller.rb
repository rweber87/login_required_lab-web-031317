class SessionsController < ApplicationController

	def new
	end

	def create
	    return redirect_to(controller: 'sessions',
	                       action: 'new') if !params[:name] || params[:name].empty?
	    session[:name] = params[:name]
	    redirect_to '/welcome'
  	end

	def destroy
		session.delete :name
		render 'sessions/new'
	end

	private

	def require_login
		return head(:forbidden) unless session.include? :name
	end
end