require 'spec_helper'

describe 'ntp' do
  platforms = {
    'debian6' =>
      {
        osfamily:            'Debian',
        operatingsystem:     'Debian',
        release:             '6',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/ntp.drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
    'el5' =>
      {
        osfamily:            'RedHat',
        operatingsystem:     'RedHat',
        release:             '5',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'present',
        service_name:        'ntpd',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/ntp.drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
    'el6' =>
      {
        osfamily:            'RedHat',
        operatingsystem:     'RedHat',
        release:             '6',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'present',
        service_name:        'ntpd',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/ntp.drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
    'el7' =>
      {
        osfamily:            'RedHat',
        operatingsystem:     'RedHat',
        release:             '7',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'present',
        service_name:        'ntpd',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
    'suse9' =>
      {
        osfamily:            'Suse',
        operatingsystem:     'SLES',
        release:             '9',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['xntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift/ntp.drift',
        keys:                '',
        enable_tinker:       true,
      },
    'suse10' =>
      {
        osfamily:            'Suse',
        operatingsystem:     'SLES',
        release:             '10',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['xntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift/ntp.drift',
        keys:                '',
        enable_tinker:       true,
      },
    'suse11' =>
      {
        osfamily:            'Suse',
        operatingsystem:     'SLES',
        release:             '11',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift/ntp.drift',
        keys:                '',
        enable_tinker:       true,
      },
    'suse12' =>
      {
        osfamily:            'Suse',
        operatingsystem:     'SLES',
        release:             '12',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntpd',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift/ntp.drift',
        keys:                '',
        enable_tinker:       true,
      },
    'opensuse12' =>
      {
        osfamily:            'Suse',
        operatingsystem:     'OpenSuSE',
        release:             '12',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/drift/ntp.drift',
        keys:                '',
        enable_tinker:       true,
      },
    'solaris9' =>
      {
        osfamily:            'Solaris',
        operatingsystem:     'Solaris',
        release:             '5.9',
        kernel:              'SunOS',
        virtual:             'physical',
        package_name:        ['SUNWntp4r', 'SUNWntp4u'],
        package_noop:        true,
        package_source:      '/var/spool/pkg',
        package_adminfile:   '/var/sadm/install/admin/puppet-ntp',
        restrict_options:    [ 'default noserve noquery' ],
        restrict_localhost:  [ '127.0.0.1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp4',
        config_file:         '/etc/inet/ntp.conf',
        driftfile:           '/var/ntp/ntp.drift',
        keys:                '/etc/inet/ntp.keys',
        enable_tinker:       false,
      },
    'solaris10' =>
      {
        osfamily:            'Solaris',
        operatingsystem:     'Solaris',
        release:             '5.10',
        kernel:              'SunOS',
        virtual:             'physical',
        package_name:        ['SUNWntp4r', 'SUNWntp4u'],
        package_noop:        true,
        package_source:      '/var/spool/pkg',
        package_adminfile:   '/var/sadm/install/admin/puppet-ntp',
        restrict_options:    [ 'default noserve noquery' ],
        restrict_localhost:  [ '127.0.0.1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp4',
        config_file:         '/etc/inet/ntp.conf',
        driftfile:           '/var/ntp/ntp.drift',
        keys:                '/etc/inet/ntp.keys',
        enable_tinker:       false,
      },
    'solaris11' =>
      {
        osfamily:            'Solaris',
        operatingsystem:     'Solaris',
        release:             '5.11',
        kernel:              'SunOS',
        virtual:             'physical',
        package_name:        ['network/ntp'],
        package_noop:        true,
        package_source:      '/var/spool/pkg',
        package_adminfile:   '/var/sadm/install/admin/puppet-ntp',
        restrict_options:    [ 'default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp4',
        config_file:         '/etc/inet/ntp.conf',
        driftfile:           '/var/ntp/ntp.drift',
        keys:                '/etc/inet/ntp.keys',
        enable_tinker:       false,
      },
    'ubuntu1204' =>
      {
        osfamily:            'Debian',
        operatingsystem:     'Ubuntu',
        release:             '12.04',
        kernel:              'Linux',
        virtual:             'physical',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'absent',
        service_name:        'ntp',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/ntp.drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
    'xenu' =>
      {
        osfamily:            'RedHat',
        operatingsystem:     'RedHat',
        release:             '5',
        kernel:              'Linux',
        virtual:             'xenu',
        package_name:        ['ntp'],
        package_noop:        false,
        package_source:      nil,
        package_adminfile:   nil,
        restrict_options:    [ '-4 default kod notrap nomodify nopeer noquery', '-6 default kod notrap nomodify nopeer noquery' ],
        restrict_localhost:  [ '127.0.0.1', '::1' ],
        step_tickers_ensure: 'present',
        service_name:        'ntpd',
        config_file:         '/etc/ntp.conf',
        driftfile:           '/var/lib/ntp/ntp.drift',
        keys:                '/etc/ntp/keys',
        enable_tinker:       true,
      },
  }

  peers = {
    'ntp1' =>
      {
        'host'    => 'ntp1.example.com',
        'options' => 'true',
        'comment' => 'ntp1'
      },
    'ntp2' =>
      {
        'host'    => 'ntp2.example.com',
        'options' => 'true',
        'comment' => 'ntp2',
      },
  }

  describe 'with default values for parameters on' do
    platforms.sort.each do |k, v|
      context k.to_s do
        if v[:osfamily] == 'Solaris'
          let :facts do
            {

              os: {
                family:  v[:osfamily],
                name:    v[:operatingsystem],
                release: {
                  full:  v[:release],
                },
              },
              kernelrelease:   v[:release],
              kernel:          v[:kernel],
              virtual:         v[:virtual],
            }
          end
        else
          let :facts do
            {
              os: {
                family:  v[:osfamily],
                name:    v[:operatingsystem],
                release: {
                  full:  v[:release],
                },
              },
              kernel:                 v[:kernel],
              virtual:                v[:virtual],
            }
          end
        end

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('ntp') }

        v[:package_name].each do |pkg|
          it {
            is_expected.to contain_package(pkg).with(
              {
                'ensure'    => 'present',
                'noop'      => v[:package_noop],
                'source'    => v[:package_source],
                'adminfile' => v[:package_adminfile],
                'before'    => 'File[ntp_conf]',
              },
            )
          }
        end

        it {
          is_expected.to contain_file('ntp_conf').with(
            {
              'ensure' => 'file',
              'path'   => v[:config_file],
              'owner'  => 'root',
              'group'  => 'root',
              'mode'   => '0644',
            },
          )
        }

        if v[:driftfile] != ''
          it { is_expected.to contain_file('ntp_conf').with_content(%r{driftfile #{Regexp.escape(v[:driftfile])}}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{driftfile}) }
        end
        if v[:enable_tinker]
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^tinker panic 0$}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{^tinker panic 0$}) }
        end
        it { is_expected.to contain_file('ntp_conf').with_content(%r{# Statistics are not being logged$}) }
        it { is_expected.to contain_file('ntp_conf').with_content(%r{server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org}) }
        it { is_expected.to contain_file('ntp_conf').with_content(%r{^disable monitor$}) }
        it { is_expected.to contain_file('ntp_conf').without_content(%r{^\s*peer}) }
        if v[:keys] != ''
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^keys #{Regexp.escape(v[:keys])}$}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{^\s*keys }) }
        end
        it { is_expected.to contain_file('ntp_conf').with_content(%r{fudge  127.127.1.0 stratum 10$}) }
        v[:restrict_options].each do |restrict_options|
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict #{restrict_options}$}) }
        end
        v[:restrict_localhost].each do |restrict_localhost|
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict #{restrict_localhost}$}) }
        end

        if v[:step_tickers_ensure] == 'present'

          it { is_expected.to contain_common__mkdir_p('/etc/ntp') }

          it {
            is_expected.to contain_file('step_tickers_dir').with(
              {
                'ensure' => 'directory',
                'path'   => '/etc/ntp',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0644',
                'require' => 'Common::Mkdir_p[/etc/ntp]',
              },
            )
          }

          it {
            is_expected.to contain_file('step-tickers').with(
              {
                'ensure' => 'present',
                'path'   => '/etc/ntp/step-tickers',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0644',
                'require' => ['Package[ntp]', 'File[step_tickers_dir]'],
              },
            )
          }

          it { is_expected.to contain_file('step-tickers').with_content(%r{server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org}) }

        elsif v[:step_tickers_ensure] == 'absent'

          it { is_expected.not_to contain_exec('mkdir_p-/etc/ntp') }

          it { is_expected.not_to contain_file('step_tickers_dir') }

          it { is_expected.not_to contain_file('step-tickers') }
        end

        if v[:package_adminfile]
          it {
            is_expected.to contain_file('admin_file').with(
              {
                'ensure' => 'present',
                'path'   => v[:package_adminfile],
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0644',
              },
            )
          }
        else
          it { is_expected.not_to contain_file('admin_file') }
        end

        it {
          is_expected.to contain_service('ntp_service').with(
            {
              'ensure' => 'running',
              'name'   => v[:service_name],
              'enable' => 'true',
            },
          )
        }

        if v[:virtual] == 'xenu' && v[:kernel] == 'Linux'
          it {
            is_expected.to contain_exec('xen_independent_wallclock').with(
              {
                'path'    => '/bin:/usr/bin',
                'command' => 'echo 1 > /proc/sys/xen/independent_wallclock',
                'unless'  => 'grep ^1 /proc/sys/xen/independent_wallclock',
                'onlyif'  => 'test -f /proc/sys/xen/independent_wallclock',
              },
            )
          }
        else
          it { is_expected.not_to contain_exec('xen_independent_wallclock') }
        end
      end
    end
  end

  describe 'with driftfile set to' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        virtual:                'physical',
        kernel:                 'Linux',
      }
    end

    [ '', '/var/lib/ntp/ntp.drift', '/etc/ntp/drift'].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { driftfile: value } }

        if value != ''
          it { is_expected.to contain_file('ntp_conf').with_content(%r{driftfile #{Regexp.escape(value)}}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{driftfile}) }
        end
      end
    end

    ['../invalid/path', 3, 2.42, ['array'], { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { driftfile: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  describe 'with enable_stats' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    content = <<-END.gsub(%r{^\s+\|}, '')
      |statsdir /var/log/ntpstats/
      |statistics loopstats peerstats clockstats
      |filegen loopstats file loopstats type day enable
      |filegen peerstats file peerstats type day enable
      |filegen clockstats file clockstats type day enable
    END

    context 'specified as true' do
      let(:params) { { enable_stats: true } }

      regex_content = Regexp.new(Regexp.escape(content.strip), Regexp::MULTILINE)
      it { is_expected.to contain_file('ntp_conf').with_content(regex_content) }
    end

    context 'specified as false' do
      let(:params) { { enable_stats: false } }

      regex_content = Regexp.new(Regexp.escape(content.strip), Regexp::MULTILINE)
      it { is_expected.to contain_file('ntp_conf').without_content(regex_content) }
    end

    context 'as an invalid type (non-boolean)' do
      let :facts do
        {
          os: {
            family:  'RedHat',
            name:    'RedHat',
            release: {
              full:  '6.0',
            },
          },
          kernel:                 'Linux',
          virtual:                'physical',
        }
      end
      let(:params) { { enable_stats: ['not', 'a', 'boolean'] } }

      it do
        expect {
          is_expected.to contain_class('ntp')
        }.to raise_error(Puppet::Error, %r{expects a Boolean})
      end
    end
  end

  describe 'with statsdir' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'specified as a valid path' do
      context 'with enable_stats as true' do
        let(:params) do
          {
            enable_stats: true,
            statsdir:     '/path/to/statsdir',
          }
        end

        it { is_expected.to contain_file('ntp_conf').with_content(%r{statsdir /path/to/statsdir}) }
      end

      context 'with enable_stats as false' do
        let(:params) do
          {
            enable_stats: false,
            statsdir:     '/path/to/statsdir',
          }
        end

        it { is_expected.to contain_file('ntp_conf').without_content(%r{statsdir}) }
      end
    end

    context 'specified as an invalid path' do
      let(:params) { { statsdir: 'invalid/path' } }

      it do
        expect {
          is_expected.to contain_class('ntp')
        }.to raise_error(Puppet::Error, %r{expects a Stdlib::Absolutepath})
      end
    end
  end

  describe 'with keys set to' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    [ '', '/var/lib/ntp/keys', '/etc/ntp/keysfile'].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { keys: value } }

        if value != ''
          it { is_expected.to contain_file('ntp_conf').with_content(%r{keys #{Regexp.escape(value)}}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{keys}) }
        end
      end
    end

    ['../invalid/path', 3, 2.42, ['array'], { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { keys: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  describe 'with peers param set' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'to a hash' do
      let(:params) { { peers: peers } }

      it { is_expected.to contain_class('ntp') }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^peer ntp1.example.com true # ntp1$}) }
      it { is_expected.to contain_file('ntp_conf').with_content(%r{^peer ntp2.example.com true # ntp2$}) }
    end

    context 'to an array' do
      let(:params) { { peers: [ 'ntp1.example.com', 'ntp2.example.com' ] } }

      it { is_expected.to contain_class('ntp') }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^peer ntp1.example.com$}) }
      it { is_expected.to contain_file('ntp_conf').with_content(%r{^peer ntp2.example.com$}) }
    end

    context 'to a string' do
      let(:params) { { peers: 'ntp1.example.com' } }

      it { is_expected.to contain_class('ntp') }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^peer ntp1.example.com$}) }
    end

    context 'to an invalid type (boolean)' do
      let(:params) { { peers: true } }

      it do
        expect {
          is_expected.to contain_class('ntp')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'on osfamily Solaris release 11' do
    context 'with no package_adminfile' do
      let :facts do
        {
          os: {
            family:  'Solaris',
          },
          kernel:        'SunOS',
          kernelrelease: '5.11',
          virtual:       'physical',
        }
      end

      let(:params) { { package_adminfile: '' } }

      it { is_expected.to contain_class('ntp') }

      it {
        is_expected.to contain_package('network/ntp').with(
          {
            'ensure'    => 'present',
            'adminfile' => '',
          },
        )
      }

      it { is_expected.not_to contain_file('admin_file') }
    end

    context 'with package_adminfile specified' do
      let :facts do
        {
          os: {
            family:  'Solaris',
          },
          kernel:        'SunOS',
          kernelrelease: '5.11',
          virtual:       'physical',
        }
      end

      let(:params) { { package_adminfile: '/tmp/admin' } }

      it {
        is_expected.to contain_package('network/ntp').with(
          {
            'ensure'    => 'present',
            'adminfile' => '/tmp/admin',
          },
        )
      }

      it {
        is_expected.to contain_file('admin_file').with(
          {
            'ensure' => 'present',
            'path'   => '/tmp/admin',
            'owner'  => 'root',
            'group'  => 'root',
            'mode'   => '0644',
          },
        )
      }
    end
  end

  context 'on unsupported SuSE platform is_expected.to fail' do
    let :facts do
      {
        os: {
          family:  'Suse',
          name:    'Suse',
          release: {
            full:  '1.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error, %r{The ntp module supports Suse like systems with major releases 9 to 12 and you have.})
    end
  end

  context 'on unsupported Solaris platform is_expected.to fail' do
    let :facts do
      {
        os: {
          family:  'Solaris',
        },
        operatingsystem: 'Solaris',
        kernelrelease:   '5.8',
        kernel:          'SunOS',
        virtual:         'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error, %r{The ntp module supports Solaris kernel release 5.9, 5.10 and 5.11.})
    end
  end

  context 'on unsupported platform is_expected.to fail' do
    let :facts do
      {
        os: {
          family:  'Slackware',
          name:    'Slackware',
          release: {
            full:  '1.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error, %r{The ntp module is supported by OS Families Debian, RedHat, Suse, and Solaris.})
    end
  end

  context 'with invalid value for step_tickers_ensure param' do
    let(:params) { { step_tickers_ensure: 'invalid' } }
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error, %r{ntp::step_tickers_ensure must be 'present' or 'absent'. Detected value is <invalid>.})
    end
  end

  context 'with invalid path for step_tickers_path param' do
    let(:params) { { step_tickers_path: 'invalid/path' } }
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'with ignore_local_clock set to valid true' do
    let(:params) { { ignore_local_clock: true } }
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it { is_expected.to contain_file('ntp_conf').without_content(%r{^server\s+127.127.1.0}) }
    it { is_expected.to contain_file('ntp_conf').without_content(%r{^fudge\s+127.127.1.0 stratum 10}) }
  end

  context 'with invalid ignore_local_clock 1' do
    let(:params) { { ignore_local_clock: ['bad', 'input'] } }
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'with invalid ignore_local_clock 2' do
    let(:params) { { ignore_local_clock: 'nottrue' } }
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it do
      expect {
        is_expected.to contain_class('ntp')
      }.to raise_error(Puppet::Error)
    end
  end

  context 'on Linux physical machine' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    it { is_expected.not_to contain_exec('xen_independent_wallclock') }
  end

  context 'on Linux Xen guest' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'xenu',
      }
    end

    it { is_expected.to contain_exec('xen_independent_wallclock') }
  end

  context 'on non-Linux Xen guest' do
    let :facts do
      {
        os: {
          family:  'Solaris',
        },
        kernelrelease: '5.11',
        virtual:       'xenu',
        kernel:        'Solaris',
      }
    end

    it { is_expected.not_to contain_exec('xen_independent_wallclock') }
  end

  describe 'with package_name set' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'to an array' do
      let(:params) { { package_name: ['ntp', 'ntphelper'] } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('ntp') }

      it {
        is_expected.to contain_package('ntp').with(
          {
            'ensure' => 'present',
          },
        )
      }

      it {
        is_expected.to contain_package('ntphelper').with(
          {
            'ensure' => 'present',
          },
        )
      }
    end

    context 'to a string' do
      let(:params) { { package_name: 'myntp' } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('ntp') }

      it {
        is_expected.to contain_package('myntp').with(
          {
            'ensure' => 'present',
          },
        )
      }
    end

    context 'to an invalid type (boolean)' do
      let(:params) { { package_name: true } }

      it do
        expect {
          is_expected.to contain_class('ntp')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with restrict_options set' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'to valid \'default kod notrap\'' do
      let(:params) { { restrict_options: 'default kod notrap' } }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict -4 default kod notrap$}) }
      it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict -6 default kod notrap$}) }
    end

    context 'to valid [ \'\', ]' do
      let(:params) { { restrict_options: [ '' ] } }

      it { is_expected.to contain_file('ntp_conf').without_content(%r{^restrict$}) }
    end

    [true, false, 3, 2.42, { 'ha' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { restrict_options: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  describe 'with restrict_localhost set' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'to valid [ \'10.0.0.0\', \'127.0.0.2\' ]' do
      let(:params) { { restrict_localhost: [ '10.0.0.0', '127.0.0.2' ] } }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict 10.0.0.0$}) }
      it { is_expected.to contain_file('ntp_conf').with_content(%r{^restrict 127.0.0.2$}) }
    end

    context 'to valid [ \'\' ]' do
      let(:params) { { restrict_localhost: [ '' ] } }

      it { is_expected.to contain_file('ntp_conf').without_content(%r{^restrict$}) }
    end

    ['true', true, false, 1, 2.42, { 'ha' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { restrict_localhost: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  describe 'with servers set' do
    let(:facts) do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    context 'to valid [ \'ntp1.example.com\', \'ntp2.example.com\', ]' do
      let(:params) { { servers: [ 'ntp1.example.com', 'ntp2.example.com' ] } }

      it { is_expected.to contain_file('ntp_conf').with_content(%r{^server ntp1.example.com$}) }
      it { is_expected.to contain_file('ntp_conf').with_content(%r{^server ntp2.example.com$}) }
    end

    context 'to valid [ \'\', ]' do
      let(:params) { { servers: [ '' ] } }

      it { is_expected.to contain_file('ntp_conf').without_content(%r{^server$}) }
    end

    ['true', true, false, 1, 2.42, { 'a' => 'sh' }].each do |value|
      context "to invalid #{value} as #{value.class}" do
        let(:params) { { servers: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error, %r{expects an Array})
        end
      end
    end
  end

  describe 'with disable_monitor set' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    [true, false].each do |value|
      context "to #{value} as #{value.class}" do
        let(:params) { { disable_monitor: value } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('ntp') }

        if value == true
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^disable monitor$}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{^disable monitor$}) }
        end
      end
    end

    context 'to invalid type' do
      let(:params) { { disable_monitor: [ 'invalid', 'type' ] } }

      it do
        expect {
          is_expected.to contain_class('ntp')
        }.to raise_error(Puppet::Error, %r{expects a Boolean})
      end
    end
  end

  describe 'with enable_tinker set to' do
    let :facts do
      {
        os: {
          family:  'RedHat',
          name:    'RedHat',
          release: {
            full:  '6.0',
          },
        },
        kernel:                 'Linux',
        virtual:                'physical',
      }
    end

    [true, false].each do |value|
      context "valid #{value} as #{value.class}" do
        let(:params) { { enable_tinker: value } }

        if [true, 'true'].include?(value)
          it { is_expected.to contain_file('ntp_conf').with_content(%r{^tinker panic 0$}) }
        else
          it { is_expected.to contain_file('ntp_conf').without_content(%r{^tinker panic 0$}) }
        end
      end
    end

    ['invalid', 3, 2.42, ['array'], { 'ha' => 'sh' }].each do |value|
      context "invalid #{value} as #{value.class}" do
        let(:params) { { enable_tinker: value } }

        it do
          expect {
            is_expected.to contain_class('ntp')
          }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  platforms = {
    'debian6' =>
      {
        kernel:                 'Linux',
        osfamily:               'Debian',
        operatingsystem:        'Debian',
        operatingsystemrelease: '6',
        sysconffixture:         'sysconfig.debian',
        sysconfig_options:      '-g -x',
      },
    'ubuntu1204' =>
      {
        kernel:                 'Linux',
        osfamily:               'Debian',
        operatingsystem:        'Debian',
        operatingsystemrelease: '12.04',
        sysconffixture:         'sysconfig.debian',
        sysconfig_options:      '-g -x',
      },
    'rhel5' =>
      {
        kernel:                 'Linux',
        osfamily:               'RedHat',
        operatingsystem:        'RedHat',
        operatingsystemrelease: '5.0',
        sysconffixture:         'sysconfig.rhel5',
        sysconfig_options:      '-u ntp:ntp -p /var/run/ntpd.pid -x',
      },
    'rhel6' =>
      {
        kernel:                 'Linux',
        osfamily:               'RedHat',
        operatingsystem:        'RedHat',
        operatingsystemrelease: '6.0',
        sysconffixture:         'sysconfig.rhel6',
        sysconfig_options:      '-u ntp:ntp -p /var/run/ntpd.pid -g -x',
      },
    'rhel7' =>
      {
        kernel:                 'Linux',
        osfamily:               'RedHat',
        operatingsystem:        'RedHat',
        operatingsystemrelease: '7.0',
        sysconffixture:         'sysconfig.rhel7',
        sysconfig_options:      '-g -x',
      },
    'suse9' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '9.0',
        sysconffixture:         'sysconfig.suse9',
        sysconfig_options:      '',
      },
    'suse10' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '10.0',
        sysconffixture:         'sysconfig.suse10',
        sysconfig_options:      '-u ntp -x',
      },
    'suse11.0' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '11.0',
        sysconffixture:         'sysconfig.suse11.0',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
    'suse11.1' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '11.1',
        sysconffixture:         'sysconfig.suse11.1',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
    'suse11.2' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '11.2',
        sysconffixture:         'sysconfig.suse11.2',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
    'suse11.3' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '11.3',
        sysconffixture:         'sysconfig.suse11.3',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
    'suse11.4' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '11.4',
        sysconffixture:         'sysconfig.suse11.4',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
    'suse12' =>
      {
        kernel:                 'Linux',
        osfamily:               'Suse',
        operatingsystem:        'Suse',
        operatingsystemrelease: '12.0',
        sysconffixture:         'sysconfig.suse12',
        sysconfig_options:      '-g -u ntp:ntp -x',
      },
  }

  describe 'sysconfig file with default values for parameters on' do
    platforms.sort.each do |k, v|
      context k.to_s do
        let(:facts) do
          {
            os: {
              family:  v[:osfamily],
              name:    v[:operatingsystem],
              release: {
                full:  v[:operatingsystemrelease],
              },
            },
            kernel:                 v[:kernel],
            virtual:                'physical',
          }
        end

        sysconfig_fixture = File.read(fixtures(v[:sysconffixture].to_s))
        it {
          is_expected.to contain_file('ntp_sysconfig').with_content(sysconfig_fixture)
        }
      end
    end
  end

  describe 'sysconfig file with non-default values for parameters on' do
    platforms.sort.each do |k, v|
      context k.to_s do
        let(:facts) do
          {
            os: {
              family:  v[:osfamily],
              name:    v[:operatingsystem],
              release: {
                full:  v[:operatingsystemrelease],
              },
            },
            kernel:                 v[:kernel],
            virtual:                'physical',
          }
        end
        let(:params) { { sysconfig_options: v[:sysconfig_options] } }

        it {
          is_expected.to contain_file('ntp_sysconfig').with_content(%r{#{v[:sysconfig_options]}})
        }
      end
    end
  end
end
