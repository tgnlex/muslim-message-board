namespace :custom do
  desc 'Re-Creates fixtures for testing for a model'

  task :dump_fixtures, [:model] => [:environment] do |t, args|
    class ActiveRecord::Base
      def dump_fixture
        fixture_file = "#{Rails.root}/test/fixtures/#{self.class.table_name}.yml"
        File.open(fixture_file, "a+") do |f|
          f.puts({"#{self.class.table_name.singularize}_#{id}" => attributes}.
              to_yaml.sub!(/---\s?/, "\n"))
        end
      end
    end

    begin 
        model = args[:model].constantize
        model.all.map(&:dump_fixture)
        puts "OK: Created Fixture for Model \"#{args[:model]}\"."
    rescue 
      puts "ERROR: Model \"#{args[:model]}\" not found. "
    end

  end
end
