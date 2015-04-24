require 'spec_helper'

describe 'ntp' do

  platforms = {
    'debian6' =>
      { :osfamily            => 'Debian',
        :operatingsystem     => 'Debian',
        :release             => '6',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/ntp.drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
    'el5' =>
      { :osfamily            => 'RedHat',
        :operatingsystem     => 'RedHat',
        :release             => '5',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'present',
        :service_name        => 'ntpd',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/ntp.drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
    'el6' =>
      { :osfamily            => 'RedHat',
        :operatingsystem     => 'RedHat',
        :release             => '6',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'present',
        :service_name        => 'ntpd',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/ntp.drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
    'el7' =>
      { :osfamily            => 'RedHat',
        :operatingsystem     => 'RedHat',
        :release             => '7',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'present',
        :service_name        => 'ntpd',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
    'suse9' =>
      { :osfamily            => 'Suse',
        :operatingsystem     => 'SLES',
        :release             => '9',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['xntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/drift/ntp.drift',
        :keys                => '',
        :enable_tinker       => true,
      },
    'suse10' =>
      { :osfamily            => 'Suse',
        :operatingsystem     => 'SLES',
        :release             => '10',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['xntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/drift/ntp.drift',
        :keys                => '',
        :enable_tinker       => true,
      },
    'suse11' =>
      { :osfamily            => 'Suse',
        :operatingsystem     => 'SLES',
        :release             => '11',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/drift/ntp.drift',
        :keys                => '',
        :enable_tinker       => true,
      },
    'suse12' =>
      { :osfamily            => 'Suse',
        :operatingsystem     => 'SLES',
        :release             => '12',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/drift/ntp.drift',
        :keys                => '',
        :enable_tinker       => true,
      },
    'solaris9' =>
      { :osfamily            => 'Solaris',
        :operatingsystem     => 'Solaris',
        :release             => '5.9',
        :kernel              => 'SunOS',
        :virtual             => 'physical',
        :package_name        => ['SUNWntp4r','SUNWntp4u'],
        :package_noop        => true,
        :package_source      => '/var/spool/pkg',
        :package_adminfile   => '/var/sadm/install/admin/puppet-ntp',
        :restrict_options    => [ 'default noserve noquery', ],
        :restrict_localhost  => [ '127.0.0.1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp4',
        :config_file         => '/etc/inet/ntp.conf',
        :driftfile           => '/var/ntp/ntp.drift',
        :keys                => '/etc/inet/ntp.keys',
        :enable_tinker       => false,
      },
    'solaris10' =>
      { :osfamily            => 'Solaris',
        :operatingsystem     => 'Solaris',
        :release             => '5.10',
        :kernel              => 'SunOS',
        :virtual             => 'physical',
        :package_name        => ['SUNWntp4r','SUNWntp4u'],
        :package_noop        => true,
        :package_source      => '/var/spool/pkg',
        :package_adminfile   => '/var/sadm/install/admin/puppet-ntp',
        :restrict_options    => [ 'default noserve noquery', ],
        :restrict_localhost  => [ '127.0.0.1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp4',
        :config_file         => '/etc/inet/ntp.conf',
        :driftfile           => '/var/ntp/ntp.drift',
        :keys                => '/etc/inet/ntp.keys',
        :enable_tinker       => false,
      },
    'solaris11' =>
      { :osfamily            => 'Solaris',
        :operatingsystem     => 'Solaris',
        :release             => '5.11',
        :kernel              => 'SunOS',
        :virtual             => 'physical',
        :package_name        => ['network/ntp'],
        :package_noop        => true,
        :package_source      => '/var/spool/pkg',
        :package_adminfile   => '/var/sadm/install/admin/puppet-ntp',
        :restrict_options    => [ 'default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp4',
        :config_file         => '/etc/inet/ntp.conf',
        :driftfile           => '/var/ntp/ntp.drift',
        :keys                => '/etc/inet/ntp.keys',
        :enable_tinker       => false,
      },
    'ubuntu1204' =>
      { :osfamily            => 'Debian',
        :operatingsystem     => 'Ubuntu',
        :release             => '12.04',
        :kernel              => 'Linux',
        :virtual             => 'physical',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'absent',
        :service_name        => 'ntp',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/ntp.drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
    'xenu' =>
      { :osfamily            => 'RedHat',
        :operatingsystem     => 'RedHat',
        :release             => '5',
        :kernel              => 'Linux',
        :virtual             => 'xenu',
        :package_name        => ['ntp'],
        :package_noop        => false,
        :package_source      => nil,
        :package_adminfile   => nil,
        :restrict_options    => [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery', ],
        :restrict_localhost  => [ '127.0.0.1', '::1', ],
        :step_tickers_ensure => 'present',
        :service_name        => 'ntpd',
        :config_file         => '/etc/ntp.conf',
        :driftfile           => '/var/lib/ntp/ntp.drift',
        :keys                => '/etc/ntp/keys',
        :enable_tinker       => true,
      },
  }

  peers = {
    'ntp1' => { 'host'    => 'ntp1.example.com',
                'options' => 'true',
                'comment' => 'ntp1' },
    'ntp2' => { 'host'    => 'ntp2.example.com',
                'options' => 'true',
                'comment' => 'ntp2' },
  }

  describe 'with default values for parameters on' do
    platforms.sort.each do |k,v|
      context "#{k}" do
        if v[:osfamily] == 'Solaris'
          let :facts do
            { :osfamily        => v[:osfamily],
              :operatingsystem => v[:operatingsystem],
              :kernelrelease   => v[:release],
              :kernel          => v[:kernel],
              :virtual         => v[:virtual],
            }
          end
        else
          let :facts do
            { :osfamily          => v[:osfamily],
              :operatingsystem   => v[:operatingsystem],
              :lsbmajdistrelease => v[:release],
              :kernel            => v[:kernel],
              :virtual           => v[:virtual],
            }
          end
        end

        it { should compile.with_all_deps }

        it { should contain_class('ntp')}

        if v[:package_name].class == Array
          package_require = Array.new

          v[:package_name].each do |pkg|
            it {
              should contain_package(pkg).with({
                'ensure'    => 'present',
                'noop'      => v[:package_noop],
                'source'    => v[:package_source],
                'adminfile' => v[:package_adminfile],
              })
            }
            package_require << "Package[#{pkg}]"
          end
        else
          it {
            should contain_package(v[:package_name]).with({
              'ensure'   => 'present',
              'noop'      => v[:package_noop],
              'source'    => v[:package_source],
              'adminfile' => v[:package_adminfile],
            })
          }

          package_require = "Package[#{v[:package_name]}]"
        end

        it {
          should contain_file('ntp_conf').with({
            'ensure' => 'file',
            'path'   => v[:config_file],
            'owner'  => 'root',
            'group'  => 'root',
            'mode'   => '0644',
            'require' => package_require,
          })
        }

        if v[:driftfile] != ''
          it { should contain_file('ntp_conf').with_content(/driftfile #{Regexp.escape(v[:driftfile])}/) }
        else
          it { should contain_file('ntp_conf').without_content(/driftfile/) }
        end
        if v[:enable_tinker]
          it { should contain_file('ntp_conf').with_content(/^tinker panic 0$/) }
        else
          it { should contain_file('ntp_conf').without_content(/^tinker panic 0$/) }
        end
        it { should contain_file('ntp_conf').with_content(/# Statistics are not being logged$/) }
        it { should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }
        it { should contain_file('ntp_conf').without_content(/^\s*peer/) }
        if v[:keys] != ''
          it { should contain_file('ntp_conf').with_content(/^keys #{Regexp.escape(v[:keys])}$/) }
        else
          it { should contain_file('ntp_conf').without_content(/^\s*keys /) }
        end
        it { should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10$/) }
        v[:restrict_options].each do |restrict_options|
          it { should contain_file('ntp_conf').with_content(/^restrict #{restrict_options}$/) }
        end
        v[:restrict_localhost].each do |restrict_localhost|
          it { should contain_file('ntp_conf').with_content(/^restrict #{restrict_localhost}$/) }
        end

        if v[:step_tickers_ensure] == 'present'

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
              'require' => ['Package[ntp]', 'File[step_tickers_dir]'],
            })
          }

          it { should contain_file('step-tickers').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/) }

        elsif v[:step_tickers_ensure] == 'absent'

          it { should_not contain_exec('mkdir_p-/etc/ntp') }

          it { should_not contain_file('step_tickers_dir') }

          it { should_not contain_file('step-tickers') }
        end

        if v[:package_adminfile]
          it {
            should contain_file('admin_file').with({
              'ensure' => 'present',
              'path'   => v[:package_adminfile],
              'owner'  => 'root',
              'group'  => 'root',
              'mode'   => '0644',
            })
          }
        else
          it { should_not contain_file('admin_file') }
        end

        it {
          should contain_service('ntp_service').with({
            'ensure' => 'running',
            'name'   => v[:service_name],
            'enable' => 'true',
          })
        }

        if v[:virtual] == 'xenu' and v[:kernel] == 'Linux'
          it {
            should contain_exec('xen_independent_wallclock').with({
              'path'    => '/bin:/usr/bin',
              'command' => 'echo 1 > /proc/sys/xen/independent_wallclock',
              'unless'  => 'grep ^1 /proc/sys/xen/independent_wallclock',
              'onlyif'  => 'test -f /proc/sys/xen/independent_wallclock',
            })
          }
        else
          it { should_not contain_exec('xen_independent_wallclock') }
        end
      end
    end
  end

  describe 'with driftfile set to' do
    let(:facts) { { :osfamily => 'RedHat' } }

    [ '', '/var/lib/ntp/ntp.drift','/etc/ntp/drift'].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { :driftfile => value } }

        if value != ''
          it { should contain_file('ntp_conf').with_content(/driftfile #{Regexp.escape(value)}/) }
        else
          it { should contain_file('ntp_conf').without_content(/driftfile/) }
        end
      end
    end

    ['../invalid/path',3,2.42,['array'],a = { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { :driftfile => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/is not an absolute path/)
        end
      end
    end
  end

  describe 'with enable_stats' do
    let(:facts) { { :osfamily => 'RedHat' } }

    ['true',true].each do |value|
      context "specified as #{value}" do
        let(:params) { { :enable_stats => value } }

        it { should contain_file('ntp_conf').with_content(/^statsdir \/var\/log\/ntpstats\/$/) }
      end
    end

    ['false',false].each do |value|
      context "specified as #{value}" do
        let(:params) { { :enable_stats => value } }

        it { should_not contain_file('ntp_conf').with_content(/^\s*statsdir/) }
      end
    end

    context 'as an invalid type (non-boolean)' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :enable_stats => ['not','a','boolean'] } }

      it do
        expect {
          should contain_class('ntp')
        }.to raise_error(Puppet::Error,/\["not", "a", "boolean"\] is not a boolean/)
      end
    end
  end

  describe 'with statsdir' do
    context 'specified as a valid path' do
      context 'with enable_stats as true' do
        let(:facts) { { :osfamily => 'RedHat' } }
        let(:params) do
          {
            :enable_stats => true,
            :statsdir     => '/path/to/statsdir',
          }
        end

        it { should contain_file('ntp_conf').with_content(/^statsdir \/path\/to\/statsdir$/) }
      end

      context 'with enable_stats as false' do
        let(:facts) { { :osfamily => 'RedHat' } }
        let(:params) do
          {
            :enable_stats => false,
            :statsdir     => '/path/to/statsdir',
          }
        end

        it { should_not contain_file('ntp_conf').with_content(/^\s*statsdir/) }
      end
    end

    context 'specified as an invalid path' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :statsdir => 'invalid/path' } }

      it do
        expect {
          should contain_class('ntp')
        }.to raise_error(Puppet::Error,/^"invalid\/path" is not an absolute path/)
      end
    end
  end

  describe 'with keys set to' do
    let(:facts) { { :osfamily => 'RedHat' } }

    [ '', '/var/lib/ntp/keys','/etc/ntp/keysfile'].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { :keys => value } }

        if value != ''
          it { should contain_file('ntp_conf').with_content(/keys #{Regexp.escape(value)}/) }
        else
          it { should contain_file('ntp_conf').without_content(/keys/) }
        end
      end
    end

    ['../invalid/path',3,2.42,['array'],a = { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { :keys => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/is not an absolute path/)
        end
      end
    end
  end

  describe 'with peers param set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'to a hash' do
      let(:params) { { :peers => peers } }

      it { should contain_class('ntp')}

      it { should contain_file('ntp_conf').with_content(/^peer ntp1.example.com true # ntp1$/) }
      it { should contain_file('ntp_conf').with_content(/^peer ntp2.example.com true # ntp2$/) }
    end

    context 'to an array' do
      let(:params) { { :peers => [ 'ntp1.example.com', 'ntp2.example.com' ] } }

      it { should contain_class('ntp')}

      it { should contain_file('ntp_conf').with_content(/^peer ntp1.example.com$/) }
      it { should contain_file('ntp_conf').with_content(/^peer ntp2.example.com$/) }
    end

    context 'to a string' do
      let(:params) { { :peers => 'ntp1.example.com' } }

      it { should contain_class('ntp')}

      it { should contain_file('ntp_conf').with_content(/^peer ntp1.example.com$/) }
    end

    context 'to an invalid type (boolean)' do
      let(:params) { { :peers => true } }

      it do
        expect {
          should contain_class('ntp')
        }.to raise_error(Puppet::Error, /ntp::peers must be a string or an array or an hash./)
      end
    end
  end

  describe 'on osfamily Solaris release 11' do
    context 'with no package_adminfile' do
      let :facts do
        {
          :osfamily      => 'Solaris',
          :kernelrelease => '5.11',
        }
      end

      let(:params) { { :package_adminfile => '' } }

      it { should contain_class('ntp')}

      it {
        should contain_package('network/ntp').with({
          'ensure'    => 'present',
          'adminfile' => '',
        })
      }

      it { should_not contain_file('admin_file') }
    end

    context 'with package_adminfile specified' do
      let :facts do
        {
          :osfamily      => 'Solaris',
          :kernelrelease => '5.11',
        }
      end

      let(:params) { { :package_adminfile => '/tmp/admin' } }

      it {
        should contain_package('network/ntp').with({
          'ensure'    => 'present',
          'adminfile' => '/tmp/admin',
        })
      }

      it {
        should contain_file('admin_file').with({
          'ensure' => 'present',
          'path'   => '/tmp/admin',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
      }
    end
  end

  context 'on unsupported SuSE platform should fail' do
    let :facts do
      { :osfamily => 'Suse' }
    end

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error,/The ntp module is supported by release 9, 10, 11 and 12 of the Suse OS Family./)
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

  [true,'true'].each do |value|
    context "with ignore_local_clock set to #{value}" do
      let(:params) { { :ignore_local_clock => value } }
      let(:facts) { { :osfamily => 'RedHat' } }

      it { should contain_file('ntp_conf').without_content(/^server\s+127.127.1.0/) }
      it { should contain_file('ntp_conf').without_content(/^fudge\s+127.127.1.0 stratum 10/) }
    end
  end

  context 'with invalid ignore_local_clock 1' do
    let(:params) { { :ignore_local_clock => ['bad','input'] } }
    let(:facts) { { :osfamily => 'RedHat' } }

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'with invalid ignore_local_clock 2' do
    let(:params) { { :ignore_local_clock => 'nottrue' } }
    let(:facts) { { :osfamily => 'RedHat' } }

    it do
      expect {
        should contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'on Linux physical machine' do
    let :facts do
      { :osfamily => 'RedHat',
        :virtual  => 'physical',
	      :kernel   => 'Linux'
      }
    end

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  context 'on Linux Xen guest' do
    let :facts do
      { :osfamily => 'RedHat',
        :virtual  => 'xenu',
        :kernel   => 'Linux'
      }
    end

    it { should contain_exec('xen_independent_wallclock') }
  end

  context 'on non-Linux Xen guest' do
    let :facts do
      { :osfamily      => 'Solaris',
        :kernelrelease => '5.11',
        :virtual       => 'xenu',
        :kernel        => 'Solaris'
      }
    end

    it { should_not contain_exec('xen_independent_wallclock') }
  end

  describe 'with package_name set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'to an array' do
      let(:params) { { :package_name => ['ntp','ntphelper'] } }

      it { should compile.with_all_deps }
      it { should contain_class('ntp') }

      it {
        should contain_package('ntp').with({
          'ensure' => 'present',
        })
      }

      it {
        should contain_package('ntphelper').with({
          'ensure' => 'present',
        })
      }
    end

    context 'to a string' do
      let(:params) { { :package_name => 'myntp' } }

      it { should compile.with_all_deps }
      it { should contain_class('ntp') }

      it {
        should contain_package('myntp').with({
          'ensure' => 'present',
        })
      }
    end

    context 'to an invalid type (boolean)' do
      let(:params) { { :package_name => true } }

      it do
        expect {
          should contain_class('ntp')
        }.to raise_error(Puppet::Error,/ntp::package_name must be a string or an array./)
      end
    end
  end

  describe 'with restrict_options set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'to valid \'default kod notrap\'' do
      let(:params) { { :restrict_options => 'default kod notrap' } }

      it { should contain_file('ntp_conf').with_content(/^restrict -4 default kod notrap$/) }
      it { should contain_file('ntp_conf').with_content(/^restrict -6 default kod notrap$/) }
    end

    context 'to valid [ \'\', ]' do
      let(:params) { { :restrict_options => [ '', ] } }

      it { should contain_file('ntp_conf').without_content(/^restrict$/) }
    end

    [true,false,3,2.42,a = { 'ha' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { :restrict_options => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/restrict_options must be an array \(prefered\) or a string \(will be deprecated\)/)
        end
      end
    end
  end

  describe 'with restrict_localhost set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'to valid [ \'10.0.0.0\', \'127.0.0.2\', ]' do
      let(:params) { { :restrict_localhost => [ '10.0.0.0', '127.0.0.2', ] } }

      it { should contain_file('ntp_conf').with_content(/^restrict 10.0.0.0$/) }
      it { should contain_file('ntp_conf').with_content(/^restrict 127.0.0.2$/) }
    end

    context 'to valid [ \'\', ]' do
      let(:params) { { :restrict_localhost => [ '', ] } }

      it { should contain_file('ntp_conf').without_content(/^restrict$/) }
    end

    ['true',true,false,1,2.42,h = { 'a' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { :restrict_localhost => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/restrict_localhost must be an array or the string \'USE_DEFAULTS\'./)
        end
      end
    end
  end

  describe 'with servers set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'to valid [ \'ntp1.example.com\', \'ntp2.example.com\', ]' do
      let(:params) { { :servers => [ 'ntp1.example.com', 'ntp2.example.com', ] } }

      it { should contain_file('ntp_conf').with_content(/^server ntp1.example.com$/) }
      it { should contain_file('ntp_conf').with_content(/^server ntp2.example.com$/) }
    end

    context 'to valid [ \'\', ]' do
      let(:params) { { :servers => [ '', ] } }

      it { should contain_file('ntp_conf').without_content(/^server$/) }
    end

    ['true',true,false,1,2.42,h = { 'a' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { :servers => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/is not an Array./)
        end
      end
    end
  end

  describe 'with disable_monitor set' do
    let(:facts) { { :osfamily => 'RedHat' } }

    [true,'true',false,'false'].each do |value|
      context "to #{value} as #{value.class}" do
        let(:params) { { :disable_monitor => value } }

        it { should compile.with_all_deps }
        it { should contain_class('ntp') }

        if value == true or value == 'true'
          it { should contain_file('ntp_conf').with_content(/^disable monitor$/) }
        else
          it { should contain_file('ntp_conf').without_content(/^disable monitor$/) }
        end

      end
    end

    context 'to invalid type' do
      let(:params) { { :disable_monitor => [ 'invalid', 'type' ] } }

      it do
        expect {
          should contain_class('ntp')
        }.to raise_error(Puppet::Error,/str2bool/)
      end
    end
  end

  describe 'with enable_tinker set to' do
    let(:facts) { { :osfamily => 'RedHat' } }

    [true,'true',false,'false'].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { :enable_tinker => value } }

        if value == true or value == 'true'
          it { should contain_file('ntp_conf').with_content(/^tinker panic 0$/) }
        else
          it { should contain_file('ntp_conf').without_content(/^tinker panic 0$/) }
        end

      end
    end

    ['invalid',3,2.42,['array'],a = { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { :enable_tinker => value } }

        it do
          expect {
            should contain_class('ntp')
          }.to raise_error(Puppet::Error,/str2bool/)
        end
      end
    end
  end

end
