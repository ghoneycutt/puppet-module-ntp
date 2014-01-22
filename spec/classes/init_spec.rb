require 'spec_helper'

describe 'ntp' do
  context 'on osfamily Debian with default class options' do
    let :facts do
      { :osfamily => 'Debian' }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'ntp',
        'ensure' => 'present',
      })
    }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('step-tickers') }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Ubuntu with default class options' do
    let :facts do
    {
      :osfamily        => 'Debian',
      :operatingsystem => 'Ubuntu',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'ntp',
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily EL with default class options' do
    let :facts do
      { :osfamily => 'RedHat' }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'ntp',
        'ensure' => 'present',
      })
    }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it {
      should contain_exec('mkdir_p-/etc/ntp').with({
        'command' => 'mkdir -p /etc/ntp',
        'unless'  => 'test -d /etc/ntp',
      })
    }

    it {
      should contain_file('step_tickers_dir').with({
        'ensure' => 'directory',
        'path'   => '/etc/ntp',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'require' => 'Common::Mkdir_p[/etc/ntp]',
      })
    }

    it {
      should contain_file('step-tickers').with({
        'ensure' => 'present',
        'path'   => '/etc/ntp/step-tickers',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'require' => ['Package[ntp_package]', 'File[step_tickers_dir]'],
      })
    }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntpd',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily Solaris release 9 with default class options' do
    let :facts do
    {
      :osfamily      => 'Solaris',
      :kernelrelease => '5.9',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => [ 'SUNWntp4r', 'SUNWntp4u' ],
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/inet/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/inet\/ntp.keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it {
      should contain_file('admin_file').with({
        'ensure' => 'present',
        'path'   => '/var/sadm/install/admin/puppet-ntp',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp4',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily Solaris release 10 with default class options' do
    let :facts do
    {
      :osfamily      => 'Solaris',
      :kernelrelease => '5.10',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => [ 'SUNWntp4r', 'SUNWntp4u' ],
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/inet/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/inet\/ntp.keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it {
      should contain_file('admin_file').with({
        'ensure' => 'present',
        'path'   => '/var/sadm/install/admin/puppet-ntp',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp4',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily Solaris release 11 with default class options' do
    let :facts do
    {
      :osfamily      => 'Solaris',
      :kernelrelease => '5.11',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'network/ntp',
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/inet/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/inet\/ntp.keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it {
      should contain_file('admin_file').with({
        'ensure' => 'present',
        'path'   => '/var/sadm/install/admin/puppet-ntp',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp4',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily Solaris release 11 with no package_adminfile' do
    let :facts do
      {
        :osfamily      => 'Solaris',
        :kernelrelease => '5.11',
      }
    end

    let(:params) { { :package_adminfile => '' } }

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'network/ntp',
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/inet/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/inet\/ntp.keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp4',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on osfamily Solaris release 11 with package_adminfile specified' do
    let :facts do
      {
        :osfamily      => 'Solaris',
        :kernelrelease => '5.11',
      }
    end

    let(:params) { { :package_adminfile => '/tmp/admin' } }

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'network/ntp',
        'ensure' => 'present',
      })
    }

    it { should_not contain_file('step-tickers') }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/inet/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should contain_file('ntp_conf').with_content(/^keys \/etc\/inet\/ntp.keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it {
      should contain_file('admin_file').with({
        'ensure' => 'present',
        'path'   => '/tmp/admin',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp4',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Suse 9 with default class options' do
    let :facts do
    {
      :osfamily => 'Suse',
      :lsbmajdistrelease => '9',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'xntp',
        'ensure' => 'present',
      })
    }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should_not contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('step-tickers') }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Suse 10 with default class options' do
    let :facts do
    {
      :osfamily => 'Suse',
      :lsbmajdistrelease => '10',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'xntp',
        'ensure' => 'present',
      })
    }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should_not contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('step-tickers') }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp',
        'enable' => 'true',
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Suse 11 with default class options' do
    let :facts do
    {
      :osfamily => 'Suse',
      :lsbmajdistrelease => '11',
    }
    end

    it { should contain_class('ntp')}

    it {
      should contain_package('ntp_package').with({
        'name'   => 'ntp',
        'ensure' => 'present',
      })
    }

    it {
      should contain_file('ntp_conf').with({
        'ensure' => 'file',
        'path'   => '/etc/ntp.conf',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }

    it { should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/) }
    it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged/) }
    it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
    it { should_not contain_file('ntp_conf').with_content(/^keys \/etc\/ntp\/keys$/) }
    it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/) }

    it { should_not contain_file('step-tickers') }

    it { should_not contain_file('admin_file') }

    it {
      should contain_service('ntp_service').with({
        'ensure' => 'running',
        'name'   => 'ntp',
        'enable' => true,
      })
    }

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on unsupported SuSE platform should fail' do
    let :facts do
      { :osfamily => 'Suse' }
    end

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error,/The ntp module is supported by release 9, 10 and 11 of the Suse OS Family./)
    end
  end

  context 'on unsupported Solaris platform should fail' do
    let :facts do
      { :osfamily => 'Solaris' }
    end

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error,/The ntp module supports Solaris kernel release 5.9, 5.10 and 5.11./)
    end
  end

  context 'on unsupported platform should fail' do
    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error,/The ntp module is supported by OS Families Debian, RedHat, Suse, and Solaris./)
    end
  end

  context 'with invalid value for step_tickers_ensure param' do
    let(:params) { { :step_tickers_ensure => 'invalid' } }
    let(:facts) { { :osfamily => 'RedHat' } }

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error,/ntp::step_tickers_ensure must be 'present' or 'absent'. Detected value is <invalid>./)
    end
  end

  context 'with invalid path for step_tickers_path param' do
    let(:params) { { :step_tickers_path => 'invalid/path' } }
    let(:facts) { { :osfamily => 'RedHat' } }

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'with invalid path for keys param' do
    let(:params) { { :keys => 'invalid/path' } }
    let(:facts) { { :osfamily => 'RedHat' } }

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'on physical machine' do
    let :facts do
      {
        :osfamily => 'RedHat',
        :virtual  => 'physical'
      }
    end

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Xen guest' do
    let :facts do
      {
        :osfamily => 'RedHat',
        :virtual  => 'xenu',
	:kernel   => 'Linux'
      }
    end

    it { should contain_exec('xen_independent_wallclock') }
  end

end
