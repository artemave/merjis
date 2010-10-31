class ServerLog < ActiveRecord::Base
  attr_accessible :log_format, :filename

  belongs_to :website
  #has_one :process_result # for example

  validates :filename,
    :presence => true
  validates :website,
    :presence => true

  after_create :rename, :process!
  after_destroy :delete_file

  private
    def rename
      connect_to_s3!

      key = generate_key

      begin
        AWS::S3::S3Object.rename( filename, key, S3SwfUpload::S3Config.bucket )
        self.s3_key = key
        save!
      rescue 
        AWS::S3::S3Object.rename( key, filename, S3SwfUpload::S3Config.bucket )
        false
      end
    end

    def process!
      #TODO hook in log processing here
      #something like this:
      #delay.create_process_result MegaAnalizer.sift(self)
    end

    def delete_file
      connect_to_s3!

      AWS::S3::S3Object.delete( s3_key, S3SwfUpload::S3Config.bucket )
    end

    def connect_to_s3!
      AWS::S3::Base.establish_connection!(
        :access_key_id     => S3SwfUpload::S3Config.access_key_id,
        :secret_access_key => S3SwfUpload::S3Config.secret_access_key
      )
    end

    def generate_key
      "/logs/#{website.id}/#{Time.now.to_i}_#{filename}"
    end
end
