# A small Rails server playbook for Ansible

**Bastardised from https://github.com/dodecaphonic/ansible-rails-app**

It installs:

- Ruby 2.1
- PostgreSQL
- nginx
- Puma (jungle)

1. Change the app name and deploy directory in <code>vars/defaults.yml</code>.
2. Rename `hosts.example` to `hosts` and change it to your hosts.

To run:

    $ ansible-playbook -i hosts ruby-webapp.yml -t deploy,postgresql,nginx
    $ <deploy your app>
    $ ansible-playbook -i hosts ruby-webapp.yml -t puma

There is an example Capistrano `deploy.rb` in this repository that you can use too.

