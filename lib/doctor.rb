require 'pry'

class Doctor
    attr_reader :name, :patient, :appointment
    @@all_doc = []

    def initialize(name)
        @name = name
        @@all_doc << self
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |appointment_instance|
            appointment_instance.doctor == self
        end
    end

    def patients
        appointments.map do |docs_appointment|
            docs_appointment.patient
        end
    end

    def self.all
        @@all_doc
    end

end


# The Doctor class needs an instance method, #patients, that iterates over that doctor's Appointments and 
# collects the patient that belongs to each Appointments.