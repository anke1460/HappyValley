module ShowVersion
  extend ActiveSupport::Concern

  included do
    # show all object changed records
    def self.versions
      VestalVersions::Version.where(versioned_type: self.name)
    end

    # overwite default callback to fix tracking destroy
    before_destroy :create_destroyed_version
    private

    def create_destroyed_version
      create_version({:modifications => attributes, :number => last_version + 1, :tag => 'deleted'})
    end
  end
end
