module Concerns
    module Findable
        def find_by_name(name)
            self.all.detect {|entity| entity.name == name}
        end

        def find_or_create_by_name(name)
            if self.find_by_name(name) == nil
                return self.create(name)
            end
            self.find_by_name(name)
        end
    end
end