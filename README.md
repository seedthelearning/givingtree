```
  ________.__      .__             ___________
 /  _____/|__|__  _|__| ____    ___\__    ___/______   ____   ____
/   \  ___|  \  \/ /  |/    \  / ___\|    |  \_  __ \_/ __ \_/ __ \
\    \_\  \  |\   /|  |   |  \/ /_/  >    |   |  | \/\  ___/\  ___/
 \______  /__| \_/ |__|___|  /\___  /|____|   |__|    \___  >\___  >
        \/                 \//_____/                      \/     \/
```
__==== Hungry Academy Project #7 - a Project for DonorsChoose.org ====__

```
git clone git://github.com/seedthelearning/givingtree.git
cd givingtree
```
Trust the .rvmrc file
```
bundle
mkdir config/secret
echo "STRIPE_TEST_SECRET = 'oDusEP1ECiTzNoh4LFYpHslWJwfQXWRA'; STRIPE_TEST_PUBLIC = 'pk_dqkXc3OX98bXpsQiGfHwvUOtO664W'" > config/secret/stripe_keys.rb
rake db:create
rake db:migrate
rake db:test:prepare
rails s
```

Note that this application requires git://github.com/seedthelearning/granary.git
running on port 3001.
