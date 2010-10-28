class ServerLog < ActiveRecord::Base
  attr_accessible :log_format, :filename

  belongs_to :website

  validates :filename,
    :presence => true
  validates :website,
    :presence => true

  after_create :rename
  after_destroy :delete_file

  private
    def rename
      connect_to_s3!

      key = "/logs/#{website.id}/#{Time.now.to_i}_#{filename}"

      begin
        S3Object.rename( filename, key, S3SwfUpload::S3Config.bucket )
        self.s3_key = key
        save!
      rescue 
        S3Object.rename( key, filename, S3SwfUpload::S3Config.bucket )
      end
    end

    def delete_file
      connect_to_s3!

      S3Object.delete( filename, S3SwfUpload::S3Config.bucket )
    end

    def connect_to_s3!
      AWS::S3::Base.establish_connection!(
        :access_key_id     => S3SwfUpload::S3Config.access_key_id,
        :secret_access_key => S3SwfUpload::S3Config.secret_access_key
      )
    end
end
