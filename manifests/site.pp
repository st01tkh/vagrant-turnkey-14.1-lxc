node default {
  manageusers::create_account { user01:
    name       => "user01",
    uid        => "16400",
    password   => '$6$H.7Mn19f$KSeA/tkkC.OFwDB1rUB4MnA9eAUrIj0Rwnf.sv4niRoSHlY4msyBCJw6pE4jL8ocolyHpBURNnx5MySgnRYWq1',
    shell      => "/bin/bash",
    groups     => ['sudo'],
    sshkeytype => "ssh-rsa",
    sshkey     => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5FJI9Cn0//s1d8JLCt1sLsjx7TRz9L/g+YJG8Pz+IjipBPXDdwRxkwIffhF5wxNIzseBmawdsGpGUlQTH3j7Aju3CAzXdKTpqyegHDWeM8Onjrzv7MUpE27oeEe2aWYh1Ws4XbSGq2yjk2G2GL467nqUNmZzJJJVrb464meexXk7PEM21WXby9wMxVLfstoAXfsdOuplPbBOrms6T8XFjtNMPlHf/Djtsm4Dl2qIxl4nLot8cphDEwpDyv998vDTx5G92lHqCt+2fDmmILQzQWcgbprE57LxWldcWqu0tTxQuXuUduDq57Pf9gz/EFeCU4iyWWGt4F53J1l742GQMgO1JejsOrZACZoyb1xempLoiStZivRtw0CYzkZ7Ll+KKQAwyji/UNxQMCTbk6GCuFqp5ypChC1ZXFWhVqT/RcK9XgFhUB5bvzRlpurrfJUEYwPp0sJxhlkSFiHesUOVk1z3A9HWCavO5XxArY7biSmYnFXDwMwO4+B6y/zCDHKR7tORIqIV1xiIW9Jn3htJ6/RfYkLBN9dgX7GdmaZEZM1EcmfrzP73kmlmTlJzwOfdqJVd9pTXE+G3N0WBvAAA+wtRclW1VlxQffIU+Ii7o+SunDpQmAouBhadd3aJJx7sXfS7GXnp9Xt/7tO+aRVuUr1IOQYcDN95mN15S02V/4Q== user01",
  }

  file {"/home/user01/.vimrc":
    content => "filetype plugin indent on\nset tabstop=4\nset shiftwidth=4\nset expandtab\n",
    ensure => 'file',
    owner => 'user01',
    group => 'users',
    mode => 'ug=rw,o=r',
  }

  file {"/home/user01/.ssh":
    ensure => 'directory',
    owner => 'user01',
    group => 'users',
    mode => '0700',
  }

  file {"/home/user01/.ssh/config":
    content => "Host st01tkh.github.com\nHostname github.com\nUser git\n",
    ensure => 'file',
    owner => 'user01',
    group => 'users',
    mode => '0600',
  }
  File["/home/user01/.ssh"]->
  File["/home/user01/.ssh/config"]
}
