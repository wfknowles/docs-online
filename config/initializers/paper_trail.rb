PaperTrail.config.track_associations = false
#PaperTrail::Version.delete_all ["created_at < ?", 1.week.ago]
PaperTrail::Rails::Engine.eager_load!
PaperTrail.config.version_limit = 3
module PaperTrail
  class Version < ActiveRecord::Base
   # attr_accessible :ip
  end
end