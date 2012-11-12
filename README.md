
euare_test
==========

## Description

Run through euare-* commands on CLC

## Procedure

1. Push test scripts to remote client
2. Run the euaretest.pl script on the remote machine

[TEST_CASE]: >>>>> make sure 'eucalyptus' account exist <<<<<
[TEST_CASE]: >>>>> Add an account <<<<<
[TEST_CASE]: >>>>> Delete an account <<<<<
[TEST_CASE]: >>>>> create a new account and switch credential to the account's admin <<<<<
[TEST_CASE]: >>>>> make sure 'admin' of account exist <<<<<
[TEST_CASE]: >>>>> create a new user <<<<<
[TEST_CASE]: >>>>> test list user by path <<<<<
[TEST_CASE]: >>>>> get user attributes <<<<<
[TEST_CASE]: >>>>> change user attributes <<<<<
[TEST_CASE]: >>>>> update user info <<<<<
[TEST_CASE]: >>>>> update user login profile <<<<<
[TEST_CASE]: >>>>> update user access key <<<<<
[TEST_CASE]: >>>>> Add a user key <<<<<
[TEST_CASE]: >>>>> Check that key is active <<<<<
[TEST_CASE]: >>>>> Deactivate the key <<<<<
[TEST_CASE]: >>>>> Delete the key <<<<<
[TEST_CASE]: >>>>> create user certificate <<<<<
[TEST_CASE]: >>>>> Check that certificate exists <<<<<
[TEST_CASE]: >>>>> Check that cert is active <<<<<
[TEST_CASE]: >>>>> Deactivate Cert <<<<<
[TEST_CASE]: >>>>> Delete cert <<<<<
[TEST_CASE]: >>>>> Add user certificate from file <<<<<
[TEST_CASE]: >>>>> Check that certificate exists <<<<<
[TEST_CASE]: >>>>> Check that cert is active <<<<<
[TEST_CASE]: >>>>> Deactivate Cert <<<<<
[TEST_CASE]: >>>>> Delete cert <<<<<
[TEST_CASE]: >>>>> Create a new group <<<<<
[TEST_CASE]: >>>>> Test list group by path <<<<<
[TEST_CASE]: >>>>> Change group attributes <<<<<
[TEST_CASE]: >>>>> Add user to groups <<<<<
[TEST_CASE]: >>>>> Check groups for users <<<<<
[TEST_CASE]: >>>>> Check users for groups <<<<<
[TEST_CASE]: >>>>> Add user to second group <<<<<
[TEST_CASE]: >>>>> Check user for group 2 <<<<<
[TEST_CASE]: >>>>> Check user for group 1 <<<<<
[TEST_CASE]: >>>>> Remove user from both groups <<<<<
[TEST_CASE]: >>>>> Add a user policy <<<<<
[TEST_CASE]: >>>>> Check policy is active <<<<<
[TEST_CASE]: >>>>> Check that policy is same as original <<<<<
[TEST_CASE]: >>>>> Delete policy <<<<<
[TEST_CASE]: >>>>> Add a group policy <<<<<
[TEST_CASE]: >>>>> Check policy is active <<<<<
[TEST_CASE]: >>>>> Check that policy is same as original <<<<<
[TEST_CASE]: >>>>> Delete policy <<<<<
[TEST_CASE]: >>>>> Add an account policy <<<<<
[TEST_CASE]: >>>>> Check policy is active <<<<<
[TEST_CASE]: >>>>> Check that policy is same as original <<<<<
[TEST_CASE]: >>>>> Delete policy <<<<<
[TEST_CASE]: >>>>> test allow all policy for user <<<<<
[TEST_CASE]: >>>>> test allow policy for user <<<<<
[TEST_CASE]: >>>>> test deny policy for user <<<<<
[TEST_CASE]: >>>>> test group policy <<<<<
[TEST_CASE]: >>>>> test account quota policy <<<<<
[TEST_CASE]: >>>>> clean up accounts and users <<<<<


<hr><hr><hr>

# Eucalyptus Testunit Framework

Eucalyptus Testunit Framework is designed to run a list of test scripts written by Eucalyptus developers.



## How to Set Up Testunit Environment

On **Ubuntu** Linux Distribution,

### 1. UPDATE THE IMAGE

<code>
apt-get -y update
</code>

### 2. BE SURE THAT THE CLOCK IS IN SYNC

<code>
apt-get -y install ntp
</code>

<code>
date
</code>

### 3. INSTALL DEPENDENCIES
<note>
YOUR TESTUNIT **MIGHT NOT** NEED ALL THE PACKAGES BELOW; CHECK THE TESTUNIT DESCRIPTION.
</note>

<code>
apt-get -y install git-core bzr gcc make ruby libopenssl-ruby curl rubygems swig help2man libssl-dev python-dev libright-aws-ruby nfs-common openjdk-6-jdk zip libdigest-hmac-perl libio-pty-perl libnet-ssh-perl euca2ools
</code>

### 4. CLONE test_share DIRECTORY FOR TESTUNIT
<note>
YOUR TESTUNIT **MIGHT NOT** NEED test_share DIRECTORY. CHECK THE TESTUNIT DESCRIPTION.
</note>

<code>
git clone git://github.com/eucalyptus-qa/test_share.git
</code>

### 4.1. CREATE /home/test-server/test_share DIRECTORY AND LINK IT TO THE CLONED test_share

<code>
mkdir -p /home/test-server
</code>

<code>
ln -s ~/test_share/ /home/test-server/.
</code>

### 5. CLONE TESTUNIT OF YOUR CHOICE

<code>
git clone git://github.com/eucalyptus-qa/**testunit_of_your_choice**
</code>

### 6. CHANGE DIRECTORY

<code>
cd ./**testunit_of_your_choice**
</code>

### 7. CREATE 2b_tested.lst FILE in ./input DIRECTORY

<code>
vim ./input/2b_tested.lst
</code>

### 7.1. TEMPLATE OF 2b_tested.lst, SEPARATED BY TAB

<sample>
192.168.51.85	CENTOS	6.3	64	REPO	[CC00 UI CLC SC00 WS]

192.168.51.86	CENTOS	6.3	64	REPO	[NC00]
</sample>

### 7.2. BE SURE THAT YOUR MACHINE's id_rsa.pub KEY IS INCLUDED THE CLC's authorized_keys LIST

ON **YOUR TEST MACHINE**:

<code>
cat ~/.ssh/id_rsa.pub
</code>

ON **CLC MACHINE**:

<code>
vim ~/.ssh/authorized_keys
</code>

### 8. RUN THE TEST

<code>
./run_test.pl **testunit_of_your_choice.conf**
</code>


## How to Examine the Test Result

### 1. GO TO THE artifacts DIRECTORY

<code>
cd ./artifacts
</code>

### 2. CHECK OUT THE RESULT FILES

<code>
ls -l
</code>


## How to Rerun the Testunit

### 1. CLEAN UP THE ARTIFACTS

<code>
./cleanup_test.pl
</code>

### 2. RERUN THE TEST

<code>
./run_test.pl **testunit_of_your_choice.conf**
</code>


