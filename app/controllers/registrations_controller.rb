class RegistrationsController < Devise::RegistrationsController
	protected
		def update_resource(resource, params)
			resource.update_without_password(params) #allows users to update profile page without password
		end
end