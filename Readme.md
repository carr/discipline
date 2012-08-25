# Discipline

Discipline is a tool to help you stop procrastinating by blocking distracting online content like Facebook, Twitter and other websites.

# Install

To install discipline, run this command:

    gem install discipline

# Usage

To block unwanted online content, run this command in your terminal:

    sudo discipline on
    
To unblock unwanted online content, run the inverse command in your terminal:

    sudo discipline off

The "sudo" mode of operation is required because discipline works by modifying your <tt>/etc/hosts/</tt> file, which requires root access.
    
# Configuration

Create a <tt>~/.discipline_config.yml</tt> file with the following configuration

    ---
    - youtube.com
    - www.youtube.com
    - techcrunch.com
    - facebook.com
    - www.facebook.com
    - www.twitter.com
    - twitter.com
    - api.twitter.com
    - linkedin.com
    - www.linkedin.com
    
# Supported platforms

I've tested this only on the OSX operating system, so I have no idea how it behaves on other platforms. It should work on Linux, for Windows I wouldn't get my hopes up.
 
# Author

Copyright © 2012 Tomislav Car, [Infinum](http://www.infinum.hr)
