class FixRfidColName < ActiveRecord::Migration
	def change
	    rename_column :patients, :RFID, :rfid_number
	 end
end
