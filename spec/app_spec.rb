require 'spec_helper'
require_relative '../app'

describe App do
  it "returns hello message" do
    get '/'
    expect(last_response.body).to eq("Hello Deployment!")
  end
end
