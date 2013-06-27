require 'spec_helper'
describe 'ntp' do
  describe 'class ntp' do
    context 'on debian platform with default class options' do
      let :facts do
      {
        :osfamily => 'debian',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'present',
          'path'   => '/etc/ntp/step-tickers',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end
    context 'on Ubuntu platform with default class options' do
      let :facts do
      {
        :osfamily        => 'debian',
        :operatingsystem => 'Ubuntu',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

      it {
        should contain_package('ntp_package').with({
          'name'   => 'ntp',
          'ensure' => 'present',
        })
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'absent',
          'path'   => '/etc/ntp/step-tickers',
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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end

    context 'on EL platform with default class options' do
      let :facts do
      {
        :osfamily => 'RedHat',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'present',
          'path'   => '/etc/ntp/step-tickers',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntpd',
          'enable' => 'true',
        })
      }

    end

    context 'on solaris platform with default class options' do
      let :facts do
      {
        :osfamily => 'solaris',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

      it {
        should contain_package('ntp_package').with({
          'name'   => 'network/ntp',
          'ensure' => 'present',
        })
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'absent',
          'path'   => '/etc/ntp/step-tickers',
        })
      }

      it {
        should contain_file('ntp_conf').with({
          'ensure' => 'file',
          'path'   => '/etc/inet/ntp.conf',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/driftfile \/var\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end

    context 'on suse 9 platform with default class options' do
      let :facts do
      {
        :osfamily => 'suse',
        :lsbmajdistrelease => '9',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'present',
          'path'   => '/etc/ntp/step-tickers',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end

    context 'on suse 10 platform with default class options' do
      let :facts do
      {
        :osfamily => 'suse',
        :lsbmajdistrelease => '10',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'present',
          'path'   => '/etc/ntp/step-tickers',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end

    context 'on suse 11 platform with default class options' do
      let :facts do
      {
        :osfamily => 'suse',
        :lsbmajdistrelease => '11',
      }
      end

      it { should include_class('ntp')}
      it { should include_class('ntp::data')}

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
        should contain_file('ntp_conf').with_content(/driftfile \/var\/lib\/ntp\/ntp.drift/)
        should contain_file('ntp_conf').with_content(/# Statistics are not being logged/)
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
        should contain_file('ntp_conf').with_content(/fudge  127.127.1.0 stratum 10/)
      }

      it {
        should contain_file('step-tickers').with({
          'ensure' => 'present',
          'path'   => '/etc/ntp/step-tickers',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        should contain_file('ntp_conf').with_content(/server 0.us.pool.ntp.org\nserver 1.us.pool.ntp.org\nserver 2.us.pool.ntp.org/)
      }

      it {
        should contain_service('ntp_service').with({
          'ensure' => 'running',
          'name'   => 'ntp',
          'enable' => 'true',
        })
      }

    end

    context 'on unsupported SuSE platform should fail' do
      let :facts do
      {
        :osfamily => 'suse',
      }
      end

      it do
        expect {
          should include_class('ntp')
        }.to raise_error(Puppet::Error,/The ntp module is supported by release 9, 10 and 11 of the Suse OS Family./)
      end
    end

    context 'on unsupported platform should fail' do
      it do
        expect {
          should include_class('ntp')
        }.to raise_error(Puppet::Error,/The ntp module is supported by OS Families Debian, Redhat, Suse, and Solaris./)
      end
    end
  end
end
