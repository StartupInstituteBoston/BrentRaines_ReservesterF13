require 'spec_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
    @uploader = PhotoUploader.new(@restaurant, :photo)
    @uploader.store!
  end

  after do
    Photouploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down to be exactly 300 by 250 pixels" do
      @uploader.thumb.should have_dimensions(300, 250)
    end
  end

  context 'the regular version' do
    it "should scale down to 600 by 500 pixels" do
      @uploader.should have_dimensions(600, 500)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end

end