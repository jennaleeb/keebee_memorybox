class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# Check if a user is an admin user
	def admin_user?
		return self.user_category == "admin"
	end

	def patient_count
		patients = Patient.all.where(user_id: self.id)
		return patients.count
	end

	def has_patients?
		patients = Patient.all.where(user_id: self.id)

		if patients.count > 0
			return true
		end
	end

	def patient_label
		patient = Patient.all.find_by(user_id: self.id)
		return patient
	end

	def patient_list
		patients = Patient.all.where(user_id: self.id)
		if self.has_patients?

		end
	end
end
