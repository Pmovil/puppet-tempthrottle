require 'spec_helper'
describe 'tempthrottle' do

  context 'with defaults for all parameters' do
    it { should contain_class('tempthrottle') }
  end
end
