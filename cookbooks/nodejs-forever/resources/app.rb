actions :install,:start,:stop,:restart,:enable,:disable

attribute :name, :kind_of => String, :name_attribute => true
attribute :script_dir, :kind_of => String
attribute :script_file, :kind_of => String
attribute :user, :kind_of => String, :default => "root"
attribute :args, :kind_of => String, :default => ""
