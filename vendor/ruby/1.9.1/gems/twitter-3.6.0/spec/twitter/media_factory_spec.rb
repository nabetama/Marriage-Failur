require 'helper'

describe Twitter::MediaFactory do

  describe ".new" do
    it "generates a Photo" do
      media = Twitter::MediaFactory.fetch_or_new(:id => 1, :type => 'photo')
      media.should be_a Twitter::Media::Photo
    end
    it "raises an ArgumentError when type is not specified" do
      lambda do
        Twitter::MediaFactory.fetch_or_new
      end.should raise_error(ArgumentError, "argument must have :type key")
    end
  end

end
