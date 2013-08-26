require 'spec_helper'

describe 'amavis', :type => :class do
  let(:facts) { {:operatingsystem => 'Debian', :operatingsystemrelease => '7.1'} }
  it { should contain_package('amavisd-new') }
  it { should contain_service('amavis') }
  it { should contain_exec('amavis') }
  context 'with spamassassin => true' do
    let(:params) { {:spamassassin => true} }

    it { should contain_package('spamassassin') }
  end
  context 'with spamassassin => false' do
    let(:params) { {:spamassassin => false} }

    it { should_not contain_package('spamassassin') }
  end
end

