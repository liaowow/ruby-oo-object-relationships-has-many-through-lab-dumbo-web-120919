require 'pry'
class Patient
    attr_reader :name, :doctor, :appointment
    @@all_pat = []

    def initialize(name)
        @name = name
        @@all_pat << self
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    # The Patient class needs an instance method, #appointments, that iterates through the Appointments array and 
    # returns Appointments that belong to the patient.
    def appointments
        Appointment.all.select do |appointment_instance|
            appointment_instance.patient == self
        end
    end

    # The Patient class needs an instance method, #doctors, that iterates over that patient's Appointments and 
    # collects the doctor that belongs to each Appointment.
    def doctors
        appointments.map do |patients_appointment|
            patients_appointment.doctor
        end
    end

    def self.all
        @@all_pat
    end
end